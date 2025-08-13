`timescale 1ns/1ps
module fp_mac #(
parameter WIDTH = 8,          // Bitwidth of inputs                      //32(FP32)
parameter K  = 1,   
parameter EXP = 4,        // Number of exponent bits                     //8(FP32)
parameter MTS = 3       // Number of mantissa bits                      //23(FP32)
)( // revised from '$clog2(WIDTH_A)' to '$clog2(2*BIAS+1)'
input clk,
input rstn,
input vld_i, 
(* IOB = "TRUE" *) input signed [WIDTH-1:0] win, 
(* IOB = "TRUE" *) input signed [WIDTH-1:0] din, 
(* IOB = "TRUE" *) output[WIDTH-1:0] acc_o,
output  vld_o
);

localparam WK = $clog2(K);
localparam BIAS = 2**(EXP-1)-1;  //127(FP32)
localparam EXP_MAX = 2**EXP-2;  //254(FP32)
localparam clog2_MAXMIN = EXP_MAX+MTS; // max/min = 2^(exp_max-1)*(2^(mts+1)-1)    //277(FP32)
localparam WIDTH_A = WK + 2*clog2_MAXMIN + 2;
localparam WZC = $clog2(2*BIAS+1);

reg sign_wd;
reg [EXP-1:0] exp_w;
reg [EXP-1:0] exp_d;
reg [MTS-1:0] mts_w_tmp;
reg [MTS-1:0] mts_d_tmp;
wire zero_w;
wire zero_d;
wire [1:0] zero_wd;

reg sign_fp_tmp;
(* use_dsp = "yes" *) reg [EXP:0] exp_fp_tmp;
reg [MTS:0] mts_w;
reg [MTS:0] mts_d;

reg sign_fp;
(* use_dsp = "yes" *) reg [EXP:0] exp_fp;
(* use_dsp = "yes" *) reg [2*MTS+1:0] mts_fp;
wire signed [2*MTS+2:0] mts_fx; 
wire signed [WIDTH_A-1:0] mts_fxs;

(* use_dsp = "yes" *) reg [WK:0] counter;
reg acc_rdy;
(* use_dsp = "yes" *) reg signed [WIDTH_A-1:0] acc; // bit configuration: WIDTH_A = 1 + 2BIAS + (3 + 2MTS) + (2BIAS - 2)

wire ovf; //overflow flag
wire udf; //underflow flag
wire [WZC-1:0] zc;
wire vld;

wire guard_bit;
wire round_bit;
wire sticky_bit;
wire round_val;

reg signed sign_r;
reg [WIDTH_A-1:0] acc_mag;

(* use_dsp = "yes" *) reg signed [EXP-1:0] exp_r;
reg [WIDTH_A-1:0] mts_tmp;

(* use_dsp = "yes" *) reg [MTS+1:0] mts_r;
reg [WIDTH-1:0] acc_rc;

reg vld_o_tmp;
reg [9:0] vld_d;

//-------------------------------------------------
// Extraction & Subnormal Detection
//-------------------------------------------------

always @(posedge clk, negedge rstn) begin
    if (~rstn) begin
        sign_wd <= 0;
        exp_w <= 0;
        exp_d <= 0;
        mts_w_tmp <= 0;
        mts_d_tmp <= 0;
    end
    else if (vld_i) begin
        sign_wd <= win[WIDTH-1] ^ din[WIDTH-1];
        exp_w <= win[EXP + MTS - 1: MTS];
        exp_d <= din[EXP + MTS - 1: MTS];
        mts_w_tmp <= win[MTS - 1: 0];
        mts_d_tmp <= din[MTS - 1: 0];
    end
end

assign zero_w = |exp_w; // 0 for zero 
assign zero_d = |exp_d; // 0 for zero 
assign zero_wd = (|exp_w) + (|exp_d);

always @(posedge clk, negedge rstn) begin
    if (~rstn) begin
        sign_fp_tmp <= 0;
        exp_fp_tmp <= 0;
        mts_w <= 0; // 0.f for subnormal
        mts_d <= 0; // 0.f for subnormal
    end
    else begin
        sign_fp_tmp <= sign_wd;
        exp_fp_tmp <= exp_w + exp_d - zero_wd;
        mts_w <= {zero_w, mts_w_tmp}; // 0.f for subnormal
        mts_d <= {zero_d, mts_d_tmp}; // 0.f for subnormal
    end
end

//-------------------------------------------------
// Multiplication & Conversion to Fixed-Point
//-------------------------------------------------

always @(posedge clk, negedge rstn) begin
    if (~rstn) begin
        sign_fp <= 0;
        exp_fp <= 0;
        mts_fp <= 0;
    end
    else begin
        sign_fp <= sign_fp_tmp;
        exp_fp <= exp_fp_tmp;
        mts_fp <= mts_w * mts_d;
    end // (1)biased_ex1!=0, biased_ex2!=0 : exp_fp = biased_ex1 + biased_ex2 +    0    +    0    + 1 - 3 = ex1 + ex2 + 2BIAS - 2
end     // (2)biased_ex1 =0, biased_ex2!=0 : exp_fp =     0      + biased_ex2 + ~zero_1 +    0    + 1 - 3 = ex2 + BIAS - 1
        // (3)biased_ex1 =0, biased_ex2 =0 : exp_fp =     0      +      0     + ~zero_1 + ~zero_2 + 1 - 3 = 0

assign mts_fx = sign_fp ? ~({1'b0, mts_fp}) + 1 : {1'b0, mts_fp};
assign mts_fxs = mts_fx << exp_fp;

//-------------------------------------------------
// Accumulation
//-------------------------------------------------

always @(posedge clk, negedge rstn) begin
    if (~rstn) begin
        counter <= 0;
        acc_rdy <= 0;
        acc <= 0;
    end
    else if (vld_d == 0) begin
        counter <= 0;
        acc_rdy <= 0;
        acc <= 0;
    end
    else if (vld_d[2] & counter < K) begin
        counter <= counter + 1;
        acc_rdy <= 0;
        acc <= acc + mts_fxs; // bit configuration: WIDTH_A = 1 + (2BIAS) + (1 + 2 + 2MTS) + (2BIAS - 2) 
    end
    else if (counter == K) acc_rdy <= 1;
    else ;
end

//-------------------------------------------------
// Convertion to Floating-Point: 2's Comp & Normalization & Rounding
//-------------------------------------------------

reg [2*BIAS:0] acc_mag_zc;
reg zc_tmp;
reg zc_i;

always @(posedge clk, negedge rstn) begin
    if (~rstn) begin
        sign_r <= 0;
        acc_mag <= 0;
        acc_mag_zc <= 0;
        zc_tmp <= 0;
        zc_i <= 0;
    end
    else if (vld_d == 0) begin
        sign_r <= 0;
        acc_mag <= 0;
        acc_mag_zc <= 0;
        zc_tmp <= 0;
        zc_i <= 0;
    end
    else if (acc_rdy) begin
        sign_r <= acc[WIDTH_A-1];
        if (acc[WIDTH_A-1]) acc_mag <= ~(acc) + 1;
        else acc_mag <= acc;
        acc_mag_zc <= acc_mag[(WIDTH_A-WK-BIAS-4)-:2*BIAS+1];
        zc_tmp <= 1'b1;
        zc_i <= zc_tmp;
    end
end

assign ovf = |acc_mag[(WIDTH_A-2)-:WK+BIAS+2];
assign udf = (~|acc_mag[(WIDTH_A-2)-:WK+3*BIAS+3]) & |acc_mag[2*MTS+BIAS-3:0];

// don't count zeros in overflow region: (BIAS+3) bits from MSB
// use essential part of acc_mag in zero counting: [BIAS] ~ [0].[-1] ~ [-BIAS] 
// 0 <= zc <= 2*BIAS
LZD #(.in_s(2*BIAS+1), .out_s(WZC)) u_lzd(.in(acc_mag_zc), .vld_i(zc_i), .out(zc), .vld_o(vld));
 
function sticky(input [WIDTH_A-1:0] mts_tmp);
    integer i;
    begin
        sticky = 0;
        for (i = 0; i < WIDTH_A - 1 - MTS - 2; i = i + 1)
            sticky = sticky | mts_tmp[i];
    end
endfunction 

assign guard_bit = mts_tmp[WIDTH_A-1-MTS-1];
assign round_bit = mts_tmp[WIDTH_A-1-MTS-2]; 
assign sticky_bit = sticky(mts_tmp); // |acc_mag[WIDTH_A-1-(BIAS+3+zc)-MTS-3:0]
assign round_val = guard_bit && (round_bit || sticky_bit);

always @(posedge clk, negedge rstn) begin
    if (~rstn) begin
        exp_r <= 0;
        mts_tmp <= 0;
        
        mts_r <= 0;
    end
    else if (vld_d == 0) begin
        exp_r <= 0;
        mts_tmp <= 0;
        
        mts_r <= 0;
    end    
    else if (acc_rdy & vld) begin
        exp_r <= EXP_MAX - zc; // 0 ~ 2*BIAS // -1 for zero
        mts_tmp <= acc_mag << (WK+BIAS+3+zc);
        
        mts_r <= {1'b0, mts_tmp[WIDTH_A-1:WIDTH_A-1-MTS]} + round_val; // 1.f format // add rounding value
    end
end

//-------------------------------------------------
// Convertion to Floating-Point: Clip & Output
//-------------------------------------------------

always @(posedge clk, negedge rstn) begin
    if (~rstn) begin
        vld_o_tmp <= 0;
        acc_rc <= 0;
    end
    else if (vld_d == 0) begin
        vld_o_tmp <= 0;
        acc_rc <= 0;
    end
    else if (acc_rdy && vld_d[9] && (~|vld_d[8:0])) begin    
        vld_o_tmp <= 1'b1;
        if (ovf) //overflow
            acc_rc <= {sign_r, {{(EXP-1){1'b1}}, 1'b0}, {MTS{1'b1}}}; //set max mag value 
        else if (udf) //underflow
            acc_rc <= {sign_r, {EXP{1'b0}}, {{(MTS-1){1'b0}}, 1'b1}};  //set min mag value
        else if (zc == 2*BIAS+1) //zero
            acc_rc <= {sign_r, {EXP{1'b0}}, {MTS{1'b0}}}; // zero
        else
            if (mts_r[MTS+1]) //consider a carry by adding round_val 
                if (exp_r == EXP_MAX) //overflow by rounding
                    acc_rc <= {sign_r, {{(EXP-1){1'b1}}, 1'b0}, {MTS{1'b1}}};
                else
                    acc_rc <= {sign_r, exp_r + 1, mts_r[MTS:1]};
            else
                acc_rc <= {sign_r, exp_r, mts_r[MTS-1:0]};
    end
end


always@(posedge clk, negedge rstn) begin
	if(~rstn) begin
		vld_d <= 0;
	end
	else begin
		vld_d <= {vld_d[9-1:0], vld_i};
    end
end

assign vld_o = vld_o_tmp; // ON for 1 clock period
assign acc_o = acc_rc; //consider a carry by adding round_val 

endmodule


