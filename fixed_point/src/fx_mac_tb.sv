`timescale 1ns/1ps

class FxMacModel #(
    parameter int WIDTH_P    = 8,
    parameter int FRACT_P    = 4,
    parameter int K_P        = 9,
    localparam int WK_P         = $clog2(K_P),
    localparam int WIDTH_A_P    = WK_P + 2*WIDTH_P + 2
  );

    localparam int CK_ZERO    = 0;
    localparam int CK_MAXMAX  = 1;
    localparam int CK_MINMIN  = 2;
    localparam int CK_MAXMIN  = 3;
    localparam int CK_POSNEG  = 4;  // +/− alternate
    localparam int CK_HALFLSB = 5;
    localparam int CK_RANDOM  = 6;

    rand bit signed [WIDTH_P-1:0] win[K_P];
    rand bit signed [WIDTH_P-1:0] din[K_P];

    int                           kind_q[$];
    bit signed [WIDTH_P-1:0]      golden_q[$];
    bit signed [WIDTH_A_P-1:0]    acc_wide_q[$];
    bit signed [WIDTH_A_P-1:0]    acc_shft_q[$];

    bit signed [WIDTH_P-1:0] MAXV =  (1<<(WIDTH_P-1))-1;
    bit signed [WIDTH_P-1:0] MINV = -(1<<(WIDTH_P-1));
    bit signed [WIDTH_P-1:0] ONE  =  1;
    bit signed [WIDTH_P-1:0] NEG1 = -1;
    bit signed [WIDTH_P-1:0] base = (1 <<< FRACT_P);       // 1.0 in Q(F)
    bit signed [WIDTH_P-1:0] half = (1 <<< (FRACT_P-1));   // 0.5 LSB
    
    bit guard_bit, round_bit, sticky_bit, round_up;
    bit signed [WIDTH_A_P-1:0] round_val;
    bit signed [WIDTH_A_P-1:0] acc_round;

    // golden MAC function : generates the expected output
    function automatic bit signed [WIDTH_P-1:0]
      golden_mac(input bit signed [WIDTH_P-1:0] w[K_P],
                 input bit signed [WIDTH_P-1:0] d[K_P],
                 output bit signed [WIDTH_A_P-1:0] acc_wide,
                 output bit signed [WIDTH_A_P-1:0] acc_shft);
      acc_wide = 0;
      for (int i=0; i<K_P; i++) begin
        bit signed [2*WIDTH_P-1:0] prod = $signed(w[i]) * $signed(d[i]);
        acc_wide += prod; //$signed({{(WIDTH_A_P-2*WIDTH_P){|prod[2*WIDTH_P-1:2*WIDTH_P-2]}}, prod});
      end
      
      guard_bit  = (FRACT_P >= 1) ? acc_wide[FRACT_P-1] : 1'b0;
      round_bit  = (FRACT_P >= 2) ? acc_wide[FRACT_P-2] : 1'b0;
      sticky_bit = (FRACT_P >= 3) ? |acc_wide[FRACT_P-3:0] : 1'b0;
    
      round_up   = guard_bit & (round_bit | sticky_bit);
    
      // round_val = round_up << FRACTION (폭 = WIDTH_A_P)
      round_val = round_up ? (1 << FRACT_P) : {(FRACT_P+1){1'b0}};

      acc_round = acc_wide + round_val;
      acc_shft = acc_round >>> FRACT_P;
      
      if (acc_shft > MAXV) return MAXV;
      if (acc_shft < MINV) return MINV;
      return acc_shft[WIDTH_P-1:0];
    endfunction

  // ------------------------------------------------------------
  // Methods
  // ------------------------------------------------------------
    bit signed [WIDTH_A_P-1:0] aw, as;
    bit signed [WIDTH_P-1:0] g;

    function void make_random();
      foreach (win[i]) begin
        win[i] = $urandom_range(-(1<<(WIDTH_P-1)), (1<<(WIDTH_P-1))-1);
        din[i] = $urandom_range(-(1<<(WIDTH_P-1)), (1<<(WIDTH_P-1))-1);
      end
      g = golden_mac(win, din, aw, as);
      kind_q.push_back(CK_RANDOM);
      golden_q.push_back(g);
      acc_wide_q.push_back(aw);
      acc_shft_q.push_back(as);
    endfunction

    function void make_corner(int kind_id);
      foreach (win[i]) begin
        case (kind_id)
          CK_ZERO   : begin win[i]=0;            din[i]=0;            end
          CK_MAXMAX : begin win[i]=MAXV;         din[i]=MAXV;         end
          CK_MINMIN : begin win[i]=MINV;         din[i]=MINV;         end
          CK_MAXMIN : begin win[i]=(i%2)?MAXV:MINV; din[i]=(i%2)?MINV:MAXV; end
          CK_POSNEG  : begin win[i]=(i%2)?ONE:NEG1;  din[i]=(i%2)?NEG1:ONE;  end
          CK_HALFLSB: begin win[i]=(i%2)?(base+half-1):(base+half); din[i]=1; end
          default   : begin win[i]=0;            din[i]=0;            end
        endcase
      end
      g = golden_mac(win, din, aw, as);
      kind_q.push_back(kind_id);
      golden_q.push_back(g);
      acc_wide_q.push_back(aw);
      acc_shft_q.push_back(as);
    endfunction

endclass

module fx_mac_tb();

  // ------------------------------------------------------------
  // Parameters & Corner ID
  // ------------------------------------------------------------
  parameter int WIDTH      = 8;        // 8-bit 
  parameter int FRACTION   = 4;        // Q(FRACTION)
  parameter int K          = 9;        // The number of samples (K)
  parameter int  NumTests  = 100;
  parameter int  Debug_test = 11;
  parameter int  unsigned RstCycle  = 10;
  parameter int  unsigned MaxCycle  = 100000;
  parameter time CyclTime  = 10ns;
  parameter time ApplTime  = 2ns;

  localparam int WK         = $clog2(K); 
  localparam int WIDTH_A    = WK + 2*WIDTH + 2; // Bit width of accumulator (acc_o)
  localparam bit  Debug_corner = (Debug_test/10) % 10;
  localparam bit  Debug_random = (Debug_test    ) % 10;

  localparam int CK_ZERO    = 0;
  localparam int CK_MAXMAX  = 1;
  localparam int CK_MINMIN  = 2;
  localparam int CK_MAXMIN  = 3;
  localparam int CK_POSNEG  = 4;  // +/− alternate
  localparam int CK_HALFLSB = 5;
  localparam int CK_RANDOM  = 6;

  // ------------------------------------------------------------
  // Class Instance
  // ------------------------------------------------------------

  FxMacModel #(
    .WIDTH_P   (WIDTH),
    .FRACT_P   (FRACTION),
    .K_P       (K)
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
    @(negedge clk); 
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
  fx_mac #(
    .WIDTH   (WIDTH),
    .K       (K),
    //.WK      (WK),
    .FRACTION(FRACTION)
    //.WIDTH_A (WIDTH_A)
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
      bins maxmax  = {CK_MAXMAX};
      bins minmin  = {CK_MINMIN};
      bins maxmin  = {CK_MAXMIN};
      bins pmalt   = {CK_POSNEG};
      bins halflsb = {CK_HALFLSB};
      bins random  = {CK_RANDOM};
    }
  endgroup

  cg_kind cov = new();

  // ------------------------------------------------------------
  // Scoreboard & Assertion (comparison at vld_o timing)
  // ------------------------------------------------------------
  int pass_cnt, fail_cnt;
  
  property p_no_xz_inputs;
    @(posedge clk) disable iff (!rstn)
      !$isunknown({vld_i, win, din});
  endproperty
  a_no_xz_inputs: assert property (p_no_xz_inputs)
    else $error("[%0t] X/Z detected on inputs: VLD_I=%0d, WIN=%0d, DIN=%0d",
                 $time, vld_i, win, din);

  property p_no_xz_outputs;
    @(posedge clk) disable iff (!rstn)
      !$isunknown({vld_o, acc_o});
  endproperty
  a_no_xz_outputs: assert property (p_no_xz_outputs)
    else $error("[%0t] X/Z detected on outputs: VLD_O=%0d, ACC_O=%0d", 
                $time, vld_o, acc_o);

  bit signed [WIDTH_A-1:0] maxv;
  bit signed [WIDTH_A-1:0] minv;

  function automatic bit model_overflow (input bit signed [WIDTH_A-1:0] acc_shft);
    maxv =  (1<<<(WIDTH-1)) - 1;
    minv = -(1<<<(WIDTH-1));
    return (acc_shft > maxv) || (acc_shft < minv);
  endfunction

  // result monitoring
  always @(posedge clk) begin
    if (rstn && vld_o) begin
      if (sw_mac.golden_q.size() == 0) begin
        $display("[%0t] WARN: vld_o but empty golden_q", $time);
      end else begin
        int                    e_kind;
        bit signed [WIDTH-1:0] e_golden;
        bit signed [WIDTH_A-1:0] e_wide, e_shft;
        logic signed [WIDTH-1:0] dut_s;

        e_kind   = sw_mac.kind_q.pop_front();
        e_golden = sw_mac.golden_q.pop_front();
        e_wide   = sw_mac.acc_wide_q.pop_front();
        e_shft   = sw_mac.acc_shft_q.pop_front();
        
        $display("[%0t] GOLDEN=%0d, WIDE=%0d, SHFT=%0d",
             $time, e_golden, e_wide, e_shft);

        // overflow detection
        assert (!model_overflow(e_shft))
          else $error("[%0t] OVERFLOW: acc>>>F=%0d out of [%0d,%0d]",
                      $time, e_shft, -(1<<<(WIDTH-1)), (1<<<(WIDTH-1))-1);

        // value comparison
        dut_s = $signed(acc_o);
        if (dut_s === e_golden) begin
          pass_cnt++;
        end else begin
          fail_cnt++;
          $display("[%0t] FAIL(kind=%0d): dut=%0d(0x%0h) exp=%0d(0x%0h)  acc=%0d acc>>>F=%0d",
                   $time, e_kind, dut_s, dut_s, e_golden, e_golden, e_wide, e_shft);
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
    int kinds[$] = '{CK_ZERO, CK_MAXMAX, CK_MINMIN, CK_MAXMIN, CK_POSNEG, CK_HALFLSB};
    foreach (kinds[idx]) begin
      sw_mac.make_corner(kinds[idx]);
      COVER_BUMP(kinds[idx]);
      DRIVE_VEC(sw_mac.win, sw_mac.din);
      repeat (K + 4) @(posedge clk);
    end
  endtask

  task TASK_MAC_RANDOM;
    for (int t=0; t<NumTests; t++) begin
      sw_mac.make_random();
      COVER_BUMP(CK_RANDOM);
      DRIVE_VEC(sw_mac.win, sw_mac.din);
      repeat (K + 4) @(posedge clk);
    end
  endtask

  // ------------------------------------------------------------
  // Main (dump→reset→run→report)
  // ------------------------------------------------------------

  initial begin : MAIN
    $fsdbDumpfile("fx_mac.fsdb");
    $fsdbDumpvars("+all", "+parameter");
    $fsdbDumpMDA(1);

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
    $display("   MAXMAX : %0d", cov_cnt[CK_MAXMAX]);
    $display("   MINMIN : %0d", cov_cnt[CK_MINMIN]);
    $display("   MAXMIN : %0d", cov_cnt[CK_MAXMIN]);
    $display("   POSNEG : %0d", cov_cnt[CK_POSNEG]);
    $display("   HALFLSB: %0d", cov_cnt[CK_HALFLSB]);
    $display("   RANDOM : %0d", cov_cnt[CK_RANDOM]);
    $display("======================================================");

    $finish;
  end

endmodule
