`timescale 1ns/1ps

// ============================================================
// Mini-FP spec (1 sign, EXP_P exponent, MTS_P fraction)
//   exp==0      : subnormal or zero (E = 1-BIAS, no hidden 1)
//   0<exp<max   : normal (E = exp-BIAS, hidden 1.x)
//   exp==all1   : Inf (frac=0) / NaN (frac!=0, MSB frac=1→qNaN)
// Rounding: nearest-ties-to-even
// ============================================================

class FpMacModel #(
    parameter int WIDTH_P    = 8,
    parameter int K_P        = 1,   
    parameter int EXP_P      = 4,     
    parameter int MTS_P      = 3,       
    parameter int BIAS_P     = 7,  // 2^(EXP-1)-1   
    parameter int clog2_MAXMIN_P = 17, 

    localparam int E_MAX_P      = (1<<EXP_P)-1,
    localparam int EXP_MAX_P    = (1<<EXP_P)-2,
    localparam int WK_P         = $clog2(K_P),
    localparam int WIDTH_A_P    = WK_P + 2*clog2_MAXMIN_P + 2,
    localparam int WZC_P        = $clog2(2*BIAS_P+1)
  );

    localparam int FP_ZERO    = 0;
    localparam int FP_SUB     = 1;
    localparam int FP_NORM    = 2;
    localparam int FP_INF     = 3;
    localparam int FP_NAN     = 4;
    
    localparam int CK_ZERO    = 5;
    localparam int CK_OVF     = 6;
    localparam int CK_UDF     = 7; 
    localparam int CK_RANDOM  = 8;

    rand bit signed [WIDTH_P-1:0] win[K_P];
    rand bit signed [WIDTH_P-1:0] din[K_P];

    int                           kind_q[$];
    bit signed [WIDTH_P-1:0]      golden_q[$];
    real                          acc_real_q[$];
    bit [2:0]                     flag_q[$];

//    bit signed [WIDTH_P-1:0] MAXV = (1<<(WIDTH_P-2))-1;
//    bit signed [WIDTH_P-1:0] MINV = {{(WIDTH_P-1){1'b0}}, 1'b1};

  // ------------------------------------------------------------
  // Function : Floating-point Unpack
  // ------------------------------------------------------------

    function automatic void 
        fp_unpack(input  logic [WIDTH_P-1:0] x,
                  output bit sign, output int unsigned exp,
                  output int unsigned mts, output int type_id);
        sign = x[WIDTH_P-1];
        exp  = x[MTS_P +: EXP_P];
        mts  = x[0 +: MTS_P];
    
        if (exp==0) begin
          if (mts==0) type_id = FP_ZERO;
          else        type_id = FP_SUB;
        end
        else if (exp==E_MAX_P) begin
          if (mts==0) type_id = FP_INF;
          else        type_id = FP_NAN;
        end
        else type_id = FP_NORM;
    endfunction
    
  // ------------------------------------------------------------
  // Function : N-bit Floating-point -> Real (64-bit floating-point)
  // ------------------------------------------------------------    
    
    bit s; 
    int unsigned e, f; 
    int t;
    real frac, val;
    int exp;
    
    function automatic real fp_to_real(input logic [WIDTH_P-1:0] x);
        fp_unpack(x, s, e, f, t);
        case (t)
          FP_ZERO:  return s ? -0.0 : 0.0;
          FP_INF :  return s ? -1.0/0.0 : 1.0/0.0;
          FP_NAN :  return 0.0/0.0;
          FP_SUB : begin
            // value = (-1)^s * (f / 2^MTS) * 2^(1-BIAS)
            frac = f / real'(1<<MTS_P);
            val  = frac * $pow(2.0, 1-BIAS_P);
            return s ? -val : val;
          end
          default /*NORM*/: begin
            frac = 1.0 + (f / real'(1<<MTS_P));
            exp  = int'(e) - BIAS_P;
            val  = frac * $pow(2.0, exp);
            return s ? -val : val;
          end
        endcase
    endfunction
    
  // ------------------------------------------------------------
  // Function : Real (64-bit floating-point) -> N-bit Floating-point
  // ------------------------------------------------------------     
    
    logic [WIDTH_P-1:0] out;
    real m;
    int Emin, Emax, E;
    
    real sub, fl, diff;
    int frac_i;
    real sigN, flN, diffN;
    int fracN_i, exp_enc;
    
    function automatic logic [WIDTH_P-1:0] real_to_fp(input real r);
        // NaN/Inf/Zero detection
        if (r == 0.0) begin out = {1'b0, {EXP_P{1'b0}}, {MTS_P{1'b0}}}; return out; end
//        if (r ==  E_MAX_P) begin out = {1'b0, {EXP_P{1'b1}}, {MTS_P{1'b0}}}; return out; end //+Inf
//        if (r == -E_MAX_P) begin out = {1'b1, {EXP_P{1'b1}}, {MTS_P{1'b0}}}; return out; end //-Inf
//        if ((r > E_MAX_P) || (r < (-E_MAX_P))) begin out = {1'b0, {EXP_P{1'b1}}, {MTS_P{1'b1}}}; return out; end // NaN
    
        m = (r < 0.0) ? -r : r;
    
        // target format's exponential range
        Emin = 1 - BIAS_P;
        Emax =  EXP_MAX_P - BIAS_P;
    
        // normalization: magnitude of r = m * 2^E, 1 <= m < 2
        E = 0;
        if (m >= 2.0)      while (m >= 2.0) begin m = m/2.0; E++; end
        else if (m < 1.0)  while (m < 1.0)  begin m = m*2.0; E--; end
    
        // overflow → Max
        if (E > Emax) begin
          out = {{(r < 0.0 ? 1'b1 : 1'b0)}, {{(EXP_P-1){1'b1}}, 1'b0}, {MTS_P{1'b1}}};
          return out;
        end
        
        // underflow → Min
        if (E < Emin-1) begin
          out = {{(r < 0.0 ? 1'b1 : 1'b0)}, {EXP_P{1'b0}}, {{(MTS_P-1){1'b0}}, 1'b1}};
          return out;
        end
    
        // subnormal
        if (E == Emin-1) begin
          // m in [1,2), target fraction = m * 2^MTS >> 1
          sub  = m * $pow(2.0, (MTS_P-1));
          // nearest-even
          fl   = $floor(sub);
          diff = sub - fl;
          frac_i = int'(fl);
          if (diff >= 0.5) frac_i++;
          if (fl >= (1<<MTS_P)) frac_i = (1<<MTS_P)-1; // clamp
          out = {{(r < 0.0 ? 1'b1 : 1'b0)}, {EXP_P{1'b0}}, frac_i[MTS_P-1:0]};
          return out;
        end
    
        // normal
        // fraction bits from (m - 1) * 2^MTS with nearest-even
        sigN = (m - 1.0) * $pow(2.0, MTS_P);
        flN  = $floor(sigN);
        diffN= sigN - flN;
        fracN_i = int'(flN);
        if (diffN >= 0.5) begin
          fracN_i++;
          if (flN >= (1<<MTS_P)) begin
            // carry → 1.0 -> 10.0, exponent +1
            fracN_i = 0;
            E++;
            if (E > Emax) begin
              out = {{(r < 0.0 ? 1'b1 : 1'b0)}, {{(EXP_P-1){1'b1}}, 1'b0}, {MTS_P{1'b1}}}; // overflow -> max
              return out;
            end
          end
        end
        exp_enc = E + BIAS_P;
        out = {{(r < 0.0 ? 1'b1 : 1'b0)}, exp_enc[EXP_P-1:0], fracN_i[MTS_P-1:0]};
        return out;
    endfunction

  // ------------------------------------------------------------
  // Function : golden MAC generates the expected output
  // ------------------------------------------------------------ 

    int tw, td;
    bit sw; int unsigned ew, fw;
    bit sd; int unsigned ed, fd;
    bit is_zero; //, is_inf, is_nan; 
    real rw, rd, rp;
    bit [WIDTH_P-1:0] acc_fp;
    int tf;
    bit sf; int unsigned ef, ff; 

    function automatic bit signed [WIDTH_P-1:0]
      golden_mac(input bit signed [WIDTH_P-1:0] w[K_P],
                 input bit signed [WIDTH_P-1:0] d[K_P],
                 output real acc_real,
                 output bit ovf_f, udf_f, inv_f);
      acc_real = 0.0;
      ovf_f = 0; udf_f = 0; inv_f = 0;
      
      for (int i=0; i<K_P; i++) begin
        fp_unpack(w[i], sw, ew, fw, tw);
        fp_unpack(d[i], sd, ed, fd, td);
        
        is_zero = (tw==FP_ZERO)||(td==FP_ZERO);
//        is_inf  = (tw==FP_INF )||(td==FP_INF);
//        is_nan  = (tw==FP_NAN )||(td==FP_NAN);
        rw = fp_to_real(w[i]);
        rd = fp_to_real(d[i]);
        rp = rw * rd; 
//        if ((is_inf && is_zero) || is_nan) begin // invalid: Inf * 0
//            acc_real = 0.0/0.0;
//            inv_f = 1;
//            break;
//        end
        
        if (is_zero) ;
        else acc_real += rp;             // accumulate
      end
      
      acc_fp = real_to_fp(acc_real);
      fp_unpack(acc_fp,sf,ef,ff,tf);
      if (tf==FP_INF && (acc_real!=1.0/0.0 && acc_real!=-1.0/0.0)) ovf_f = 1;
      if ( acc_real > 0.0 && acc_real < (1.0 / $pow(2.0, MTS_P))) udf_f = 1;
      if ( acc_real < 0.0 && acc_real > (-1.0 / $pow(2.0, MTS_P))) udf_f = 1;
    
      return acc_fp;
    endfunction

  // ------------------------------------------------------------
  // Methods
  // ------------------------------------------------------------

    real acc_r;
    bit ovf_r, udf_r, inv_r;
    bit signed [WIDTH_P-1:0] g;

    function void make_random();
      bit           sgn  = $urandom_range(0,1);
      int unsigned  expu = $urandom_range(0, (1<<EXP_P)-2);
      int unsigned  frcu = $urandom_range(0, (1<<MTS_P)-1); 
      foreach (win[i]) begin 
        win[i] = {sgn, expu[EXP_P-1:0], frcu[MTS_P-1:0]};
        din[i] = {sgn, expu[EXP_P-1:0], frcu[MTS_P-1:0]};
      end
      g = golden_mac(win, din, acc_r, ovf_r, udf_r, inv_r);
      kind_q.push_back(CK_RANDOM);
      golden_q.push_back(g);
      acc_real_q.push_back(acc_r);
      flag_q.push_back({ovf_r, udf_r, inv_r});
    endfunction

    function void make_corner(int kind_id);
      bit           sgn  = $urandom_range(0,1);
      int unsigned  expu = $urandom_range(0, (1<<EXP_P)-2);
      int unsigned  frcu = $urandom_range(0, (1<<MTS_P)-1); 
      foreach (win[i]) begin
        case (kind_id)
          CK_ZERO   : begin win[i]=0;            din[i]=0;            end
          CK_OVF    : begin 
                        win[i]={sgn, {{(EXP_P-1){1'b1}}, 1'b0}, {MTS_P{1'b1}}};
                        din[i]={sgn, {{(EXP_P-1){1'b1}}, 1'b0}, {MTS_P{1'b1}}};
                      end
          CK_UDF    : begin 
                        win[i]={sgn, {EXP_P{1'b0}}, frcu[MTS_P-1:0]};         
                        din[i]={sgn, {EXP_P{1'b0}}, frcu[MTS_P-1:0]};      
                      end
          default   : begin win[i]=0;            din[i]=0;            end
        endcase
      end
      g = golden_mac(win, din, acc_r, ovf_r, udf_r, inv_r);
      kind_q.push_back(kind_id);
      golden_q.push_back(g);
      acc_real_q.push_back(acc_r);
      flag_q.push_back({ovf_r, udf_r, inv_r});
    endfunction

endclass

module fp_mac_tb();

  // ------------------------------------------------------------
  // Parameters & Corner ID
  // ------------------------------------------------------------
  parameter int WIDTH      = 8;        // 8-bit 
  parameter int K          = 1;        // The number of samples (K)
  parameter int EXP        = 4;     
  parameter int MTS        = 3;       
  parameter int BIAS       = 7;        // 2^(EXP-1)-1
  parameter int clog2_MAXMIN = 17;
  parameter int  NumTests  = 10;
  parameter int  Debug_test = 11;
  parameter int  unsigned RstCycle  = 10;
  parameter int  unsigned MaxCycle  = 100000;
  parameter time CyclTime  = 10ns;
  parameter time ApplTime  = 2ns;

  localparam int E_MAX      = (1<<EXP)-1;
  localparam int EXP_MAX    = (1<<EXP)-2;
  localparam int WK         = $clog2(K); 
  localparam int WIDTH_A    = WK + 2*clog2_MAXMIN + 2; // Bit width of accumulator (acc_o)
  localparam int WZC        = $clog2(2*BIAS+1);
  localparam bit  Debug_corner = (Debug_test/10) % 10;
  localparam bit  Debug_random = (Debug_test    ) % 10;

  localparam int FP_ZERO    = 0;
  localparam int FP_SUB     = 1;
  localparam int FP_NORM    = 2;
  localparam int FP_INF     = 3;
  localparam int FP_NAN     = 4;
    
  localparam int CK_ZERO    = 5;
  localparam int CK_OVF     = 6;
  localparam int CK_UDF     = 7; 
  localparam int CK_RANDOM  = 8;

  // ------------------------------------------------------------
  // Class Instance
  // ------------------------------------------------------------

  FpMacModel #(
    .WIDTH_P   (WIDTH),
    .K_P       (K),
    .EXP_P     (EXP),     
    .MTS_P     (MTS),       
    .BIAS_P    (BIAS),     
    .clog2_MAXMIN_P (clog2_MAXMIN)
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
  fp_mac #(
    .WIDTH        (WIDTH),
    .K            (K),
    .WK           (WK),
    .EXP          (EXP),
    .MTS          (MTS),
    .BIAS         (BIAS),
    .clog2_MAXMIN (clog2_MAXMIN),
    .WIDTH_A      (WIDTH_A),
    .WZC          (WZC)
  ) DUT (
    .clk   (clk),
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

  int cov_cnt [0:8];
  int cov_curr_kind;

  task automatic COVER_BUMP(int kind_id);
    cov_cnt[kind_id]++;
    cov_curr_kind = kind_id;
  endtask

  covergroup cg_kind @(posedge clk iff (rstn && vld_o));
    cp_kind : coverpoint cov_curr_kind {
      bins zero    = {CK_ZERO};
      bins ovf     = {CK_OVF};
      bins udf     = {CK_UDF};
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
        bit      e_ovf, e_udf, e_inv;
 
        e_kind   = sw_mac.kind_q.pop_front();
        e_golden = sw_mac.golden_q.pop_front();
        e_real   = sw_mac.acc_real_q.pop_front();
        {e_ovf, e_udf, e_inv}   = sw_mac.flag_q.pop_front();
        
        $display("[%0t] GOLDEN=%0d, REAL=%0f",
             $time, e_golden, e_real);

        // exception detection
        assert (!e_ovf && !e_udf && !e_inv)
          else $error("[%0t] OVERFLOW:%0d, UNDERFLOW:%0d, INVALID:%0d",
                      $time, e_ovf, e_udf, e_inv);

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
    int kinds[$] = '{CK_ZERO, CK_OVF, CK_UDF};
    foreach (kinds[idx]) begin
      sw_mac.make_corner(kinds[idx]);
      COVER_BUMP(kinds[idx]);
      DRIVE_VEC(sw_mac.win, sw_mac.din);
      repeat (K + 9) @(posedge clk);
    end
  endtask

  task TASK_MAC_RANDOM;
    for (int t=0; t<NumTests; t++) begin
      sw_mac.make_random();
      COVER_BUMP(CK_RANDOM);
      DRIVE_VEC(sw_mac.win, sw_mac.din);
      repeat (K + 9) @(posedge clk);
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
    $display("   OVF    : %0d", cov_cnt[CK_OVF   ]);
    $display("   UDF    : %0d", cov_cnt[CK_UDF   ]);
    $display("   RANDOM : %0d", cov_cnt[CK_RANDOM]);
    $display("======================================================");

    $finish;
  end

endmodule
