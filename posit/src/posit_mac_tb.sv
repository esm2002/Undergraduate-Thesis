`timescale 1ns/1ps

// ============================================================
// Posit TB (n-bit, es=EXP)
//  - Special: zero = all 0, NaR = 1 followed by all 0
//  - Decode: sign → (if neg then two's complement) → regime (run-length) → exponent(es) → fraction(rest)
//  - Value : (-1)^sign * useed^k * 2^e * (1.fraction)
//  - Rounding: nearest-ties-to-even on encode
// ============================================================

class PositMacModel #( 
    parameter int WIDTH_P    = 8,
    parameter int K_P        = 1,    
    parameter int EXP_P      = 2,        
    
    localparam int WK_P         = $clog2(K_P),
    localparam int REGI_P       = $clog2(WIDTH_P)+1,
    localparam int MTS_P        = WIDTH_P-3-EXP_P,
    localparam int USEED_P      = 2**(2**EXP_P), // useed = 2^(2^exp)  // max = useed^(width-2) = 16777216, min = useed^(-width+2)          
    localparam int BIAS_P       = (2**(EXP_P+1))*(WIDTH_P-2),  // bias = 2^(EXP+1)*(width-2) 
    localparam int WIDTH_A_P    = WK_P+2*BIAS_P+2,
    localparam int WZC_P        = $clog2(WIDTH_A_P),
    localparam int WTMP_P       = 3*WIDTH_P-EXP_P-4
  );

    localparam int PS_ZERO    = 0;
    localparam int PS_NORM    = 1;
    localparam int PS_INF     = 2;
    
    localparam int CK_ZERO    = 3;
    localparam int CK_MINPOS  = 4;
    localparam int CK_MAXPOS  = 5;
    localparam int CK_RANDOM  = 6;

    rand bit signed [WIDTH_P-1:0] win[K_P];
    rand bit signed [WIDTH_P-1:0] din[K_P];

    int                           kind_q[$];
    bit signed [WIDTH_P-1:0]      golden_q[$];
    real                          acc_real_q[$];
    bit                           flag_q[$];
   
  // ------------------------------------------------------------
  // Function : N-bit Posit -> Real (64-bit floating-point)
  // ------------------------------------------------------------    
    bit [WIDTH_P-1:0] x_2s; bit sign;
    bit regbit; int i, k, regi;
    int idx, ebits, e, fbits, f;
    int unsigned e, f;
    real scale, val;
    
    function automatic real ps_to_real(input logic [WIDTH_P-1:0] x);
        sign = x[WIDTH_P-1];
        x_2s = sign ? (~x + 1'b1) : x;
        
        regbit = x_2s[WIDTH_P-2];
        k = 1;
        for (i=WIDTH_P-3; i>=0; i--) begin
          if (x_2s[i] == regbit) k++;
          else break;
        end
        // regime value
        regi = regbit ? (k-1) : (-k);
        
        idx = (WIDTH_P-1) - (k+1); // index of last regime bit
        if (idx < 0) idx = 0;
        
        // exponent: up to EXP_P bits
        ebits = (idx >= EXP_P) ? EXP_P : idx;
        e = 0;
        for (i=0; i<ebits; i++) begin
          e = (e << 1) | x_2s[idx-1 - i];
        end
        idx -= ebits;
    
        // fraction: remaining idx bits; implicit 1.
        fbits = idx;
        f = 1.0;
        for (i=0; i<fbits; i++) begin
          if (x_2s[idx-1 - i]) f += 1.0 / (2.0**(i+1));
        end
        
        scale = (USEED_P ** regi) * (2.0 ** e);
        val   = f * scale;
        return sign ? -val : val;
    endfunction
    
  // ------------------------------------------------------------
  // Function : Real (64-bit floating-point) -> N-bit Posit
  // ------------------------------------------------------------     
    
    logic [WIDTH_P-1:0] out;
    int MIN, MAX;
    real m;
    bit [WIDTH_P-1:0] tmp;
    int K, E, IDX;
    
    real F, q, fl, diff;
    int frac_i;
    
    function automatic logic [WIDTH_P-1:0] real_to_ps(input real r);
        MIN = USEED_P ** (-WIDTH_P+2);
        MAX = USEED_P ** (WIDTH_P-2);
        // NaR/Zero detection
        if (r == 0.0) begin out = '0; return out; end
        if ((r > MAX) || (r < MIN)) begin out = (r > 0.0) ? (1 << (WIDTH_P-1))-1 : (1 << (WIDTH_P-1))+1; return out; end //+Inf
  
        m = (r < 0.0) ? -r : r;
        // pull by useed
        if (m >= 1.0) begin
          K = 0;
          while (m >= USEED_P && K < (WIDTH_P-2)) begin m /= USEED_P; K++; end
        end else begin
          K = 0;
          while (m < 1.0 && K > (-WIDTH_P+2)) begin m *= USEED_P; K--; end
        end
        
        tmp = '0;
        IDX = WIDTH_P-2;
        //regime
        if (K >= 0) begin
          for (int i=0; i<(K+1) && IDX>=0; i++) tmp[IDX--] = 1'b1;
          if (IDX>=0) tmp[IDX--] = 1'b0;
        end else begin
          for (int i=0; i<(-K) && IDX>=0; i++) tmp[IDX--] = 1'b0;
          if (IDX>=0) tmp[IDX--] = 1'b1;
        end

        // pull by 2^e to bring m in [1,2)
        if (m >= 2.0) begin
          E = 0; while (m >= 2.0) begin m /= 2.0; E++; end
        end else if (m < 1.0) begin
          E = 0; while (m < 1.0)  begin m *= 2.0; E--; end
        end else E = 0;
        
        // exponent (EXP_P bits or until space runs out)
        for (int i=EXP_P-1; i>=0 && IDX>=0; i--) begin
          tmp[IDX--] = (E >> i) & 1;
        end
        
        // fraction: pack from m in [1,2) with rounding to nearest-even
        F = m - 1.0; // in [0,1)
        q = F * (2.0 ** (IDX+1));
        fl = $floor(q);
        diff = q - fl;
        frac_i = int'(fl);
        
        // round to nearest ties-even
        if (diff > 0.5) frac_i++;
        else if (diff == 0.5 && frac_i[0]) frac_i++;
        
        // overflow carry from rounding → bumps exponent/regime; we approximate by saturating to maxpos
        if (frac_i >= (1 << (IDX+1))) begin
          tmp = tmp + frac_i;
        end else begin
          for (int i=0; i<(IDX+1); i++) begin
            tmp[i] = (frac_i >> i) & 1;
          end
        end
    
        // apply sign via two's complement
        out = (r < 0.0) ? (~tmp + 1'b1) : tmp;
        out[WIDTH_P-1] = (r < 0.0);
        return out;
    endfunction

  // ------------------------------------------------------------
  // Function : golden MAC generates the expected output
  // ------------------------------------------------------------ 

    real acc;

    function automatic bit signed [WIDTH_P-1:0]
      golden_mac(input bit signed [WIDTH_P-1:0] w[K_P],
                 input bit signed [WIDTH_P-1:0] d[K_P],
                 output real acc_real,
                 output bit nar_f);
      acc_real = 0.0;
      nar_f = 0;
      acc = 0.0;
      for (int i=0; i<K_P; i++) begin
          if ((w[i]!='0) && (d[i]!='0) && (w[i]!=(1 << (WIDTH_P-1))) && (d[i]!=(1 << (WIDTH_P-1)))) begin
            acc += ps_to_real(w[i]) * ps_to_real(d[i]);
          end
      end
      acc_real = acc;
      if (real_to_ps(acc) == (1 << (WIDTH_P-1))) nar_f = 1'b1;
      return real_to_ps(acc);
    endfunction

  // ------------------------------------------------------------
  // Methods
  // ------------------------------------------------------------

    real acc_r;
    bit nar_r;
    bit signed [WIDTH_P-1:0] g;

    function void make_random();
      real r1 = ($urandom_range(0,1)? 1.0 : -1.0) * (2.0 ** ($urandom_range(-(WIDTH_P-2),WIDTH_P-2)));
      real r2 = ($urandom_range(0,1)? 1.0 : -1.0) * (2.0 ** ($urandom_range(-(WIDTH_P-2),WIDTH_P-2)));      
      foreach (win[i]) begin 
        win[i] = real_to_ps(r1);
        din[i] = real_to_ps(r2);
      end
      g = golden_mac(win, din, acc_r, nar_r);
      kind_q.push_back(CK_RANDOM);
      golden_q.push_back(g);
      acc_real_q.push_back(acc_r);
      flag_q.push_back(nar_r);
    endfunction

    function void make_corner(int kind_id);
      real minpos = 1.0 * (USEED_P ** (-WIDTH_P+2));
      real maxpos = 1.0 * (USEED_P ** (WIDTH_P-2));
      foreach (win[i]) begin
        case (kind_id)
          CK_ZERO   : begin win[i]='0;            din[i]='0;            end
          CK_MINPOS : begin 
                        win[i]=real_to_ps(minpos);
                        din[i]=real_to_ps(minpos);
                      end
          CK_MAXPOS : begin 
                        win[i]=real_to_ps(maxpos);        
                        din[i]=real_to_ps(maxpos);     
                      end
          default   : begin win[i]='0;            din[i]='0;            end
        endcase
      end
      g = golden_mac(win, din, acc_r, nar_r);
      kind_q.push_back(kind_id);
      golden_q.push_back(g);
      acc_real_q.push_back(acc_r);
      flag_q.push_back(nar_r);
    endfunction
endclass

module posit_mac_tb();

  // ------------------------------------------------------------
  // Parameters & Corner ID
  // ------------------------------------------------------------
  parameter int WIDTH      = 8;
  parameter int K          = 1;    
  parameter int EXP        = 2;        
  parameter int  NumTests  = 300;
  parameter int  Debug_test = 11;
  parameter int  unsigned RstCycle  = 11;
  parameter int  unsigned MaxCycle  = 100000;
  parameter time CyclTime  = 10ns;
  parameter time ApplTime  = 2ns;

  localparam int WK           = $clog2(K);
  localparam int REGI         = $clog2(WIDTH)+1;
  localparam int USEED        = 2**(2**EXP); // useed = 2^(2^exp)  // max = useed^(width-2) = 16777216, min = useed^(-width+2)          
  localparam int BIAS         = (2**(EXP+1))*(WIDTH-2); // bias = 2^(EXP+1)*(width-2) 
  localparam int MTS          = WIDTH-3-EXP;
  localparam int WIDTH_A      = WK+2*BIAS+2;
  localparam int WZC          = $clog2(WIDTH_A);
  localparam int WTMP         = 3*WIDTH-EXP-4;  
  localparam bit  Debug_corner = (Debug_test/10) % 10;
  localparam bit  Debug_random = (Debug_test    ) % 10;

  localparam int PS_ZERO    = 0;
  localparam int PS_NORM    = 1;
  localparam int PS_INF     = 2;
    
  localparam int CK_ZERO    = 3;
  localparam int CK_MINPOS  = 4;
  localparam int CK_MAXPOS  = 5;
  localparam int CK_RANDOM  = 6;

  // ------------------------------------------------------------
  // Class Instance
  // ------------------------------------------------------------

  PositMacModel #(
    .WIDTH_P   (WIDTH),
    .K_P       (K),
    .EXP_P     (EXP)
  ) sw_mac;

  // ------------------------------------------------------------
  // DUT I/O
  // ------------------------------------------------------------
  logic                      clk, rstn;
  logic                      vld_i;
  logic signed [WIDTH-1:0]   win;
  logic signed [WIDTH-1:0]   din;
  logic        [WIDTH-1:0]   acc_o;  // DUT 출력은 unsigned 포트. 비교 시 $signed 캐스팅 권장
  logic                      vld_o;

  // ------------------------------------------------------------
  // Clock & Reset
  // ------------------------------------------------------------
  initial begin
    clk = 1'b0;
    forever #(CyclTime/2) clk = ~clk;
  end

  initial begin
    rstn = 1'b0;
    repeat (RstCycle) @(posedge clk);
    rstn = 1'b1;
  end

  // ------------------------------------------------------------
  // Testbench Quit
  // ------------------------------------------------------------
  event testbench_finish;
  initial #(CyclTime*MaxCycle) -> testbench_finish;
  always @(testbench_finish) begin
    $display("The testbench force quit");
    $finish;
  end

  // ------------------------------------------------------------
  // DUT Instance
  // ------------------------------------------------------------
  posit_mac #(
    .WIDTH        (WIDTH),
    .K            (K),
    .EXP          (EXP)
  ) DUT (
    .clk_i (clk),
    .rstn  (rstn),
    .vld_i (vld_i),
    .win   (win),
    .din   (din),
    .acc_o (acc_o),
    .vld_o (vld_o)
  );

  // ------------------------------------------------------------
  // Coverage (count & covergroup)
  // ------------------------------------------------------------

  int cov_cnt [0:6];
  int cov_curr_kind;

  task automatic COVER_BUMP(int kind_id);
    cov_cnt[kind_id]++;
    cov_curr_kind = kind_id;
  endtask

  covergroup cg_kind @(posedge clk iff (rstn && vld_o));
    cp_kind : coverpoint cov_curr_kind {
      bins zero    = {CK_ZERO};
      bins minpos  = {CK_MINPOS};
      bins maxpos  = {CK_MAXPOS};
      bins random  = {CK_RANDOM};
    }
  endgroup

  cg_kind cov = new();

  // ------------------------------------------------------------
  // Scoreboard & Assertion (comparison at vld_o timing)
  // ------------------------------------------------------------
  int pass_cnt, fail_cnt;

  property p_no_xz_outputs;
    @(posedge clk) disable iff (!rstn)
      !$isunknown({vld_o, acc_o});
  endproperty
  a_no_xz_outputs: assert property (p_no_xz_outputs)
    else $error("[%0t] X/Z detected on outputs", $time);

  // result monitoring
  always @(posedge clk) begin
    if (rstn && vld_o) begin
      if (sw_mac.golden_q.size() == 0) begin
        $display("[%0t] WARN: vld_o but empty golden_q", $time);
      end else begin
        int                    e_kind;
        bit signed [WIDTH-1:0] e_golden;
        real                   e_real;
        bit                    e_nar;
 
        e_kind   = sw_mac.kind_q.pop_front();
        e_golden = sw_mac.golden_q.pop_front();
        e_real   = sw_mac.acc_real_q.pop_front();
        e_nar    = sw_mac.flag_q.pop_front();
        
        $display("[%0t] GOLDEN=%0d, REAL=%0f",
             $time, e_golden, e_real);

        // exception detection
        assert (!e_nar)
          else $error("[%0t] NaR:%0d",
                      $time, e_nar);

        // value comparison
        if (acc_o === e_golden) begin
          pass_cnt++;
        end else begin
          fail_cnt++;
          $display("[%0t] FAIL(kind=%0d): dut=%0d(0x%0h) exp=%0d(0x%0h)  acc_real=%0f",
                   $time, e_kind, acc_o, acc_o, e_golden, e_golden, e_real);
        end
      end
    end
  end

  // ------------------------------------------------------------
  // Tasks
  // ------------------------------------------------------------
  task RESET;
    vld_i <= #ApplTime 1'b0;
    win   <= #ApplTime '0;
    din   <= #ApplTime '0;
    pass_cnt = 0; fail_cnt = 0;
    foreach (cov_cnt[i]) cov_cnt[i]=0;
  endtask

  // K-sample stream 1-vector drive
  task DRIVE_VEC(input bit signed [WIDTH-1:0] w[K],
                 input bit signed [WIDTH-1:0] d[K]);
    for (int i=0; i<K; i++) begin
      @(negedge clk);
      vld_i <= #ApplTime 1'b1;
      win   <= #ApplTime w[i];
      din   <= #ApplTime d[i];
      @(posedge clk);
    end
    @(negedge clk);
    vld_i <= #ApplTime 1'b0;
    win   <= #ApplTime '0;
    din   <= #ApplTime '0;
  endtask

  task TASK_MAC_CORNERS;
    int kinds[$] = '{CK_ZERO, CK_MINPOS, CK_MAXPOS};
    foreach (kinds[idx]) begin
      sw_mac.make_corner(kinds[idx]);
      COVER_BUMP(kinds[idx]);
      DRIVE_VEC(sw_mac.win, sw_mac.din);
      repeat (K + 14) @(posedge clk);
    end
  endtask

  task TASK_MAC_RANDOM;
    for (int t=0; t<NumTests; t++) begin
      sw_mac.make_random();
      COVER_BUMP(CK_RANDOM);
      DRIVE_VEC(sw_mac.win, sw_mac.din);
      repeat (K + 14) @(posedge clk);
    end
  endtask

  // ------------------------------------------------------------
  // Main (dump→reset→run→report)
  // ------------------------------------------------------------

  initial begin : MAIN
//    $fsdbDumpfile("fx_mac.fsdb");
//    $fsdbDumpvars("+all", "+parameter");
//    $fsdbDumpMDA(1);

    @(posedge rstn);
    RESET;
    repeat (10) @(posedge clk);

    sw_mac = new();

    if (Debug_corner)  TASK_MAC_CORNERS;
    if (Debug_random)  TASK_MAC_RANDOM;

    // time delay for final checks
    repeat (20) @(posedge clk);

    // report results
    $display("======================================================");
    $display(" fx_mac TB Result: PASS=%0d, FAIL=%0d", pass_cnt, fail_cnt);
    $display(" Corner coverage counts:");
    $display("   ZERO   : %0d", cov_cnt[CK_ZERO  ]);
    $display("   MINPOS : %0d", cov_cnt[CK_MINPOS]);
    $display("   MAXPOS : %0d", cov_cnt[CK_MAXPOS]);
    $display("   RANDOM : %0d", cov_cnt[CK_RANDOM]);
    $display("======================================================");

    $finish;
  end

endmodule
