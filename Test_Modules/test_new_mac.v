`timescale 1ns/1ps
module test_new_mac #(
parameter WIDTH = 8,          // Bitwidth of inputs                      
parameter K  = 9,
parameter EXP = 1       // Number of exponent bits                 
)( // revised from '$clog2(WIDTH_A)' to '$clog2(2*BIAS+1)'
input clk_i,
input rstn,
input vld_i, 
input [WIDTH-1:0] win, 
input [WIDTH-1:0] din, 
output[WIDTH-1:0] acc_o,
output  vld_o
);

localparam WK = $clog2(K);
localparam REGI = $clog2(WIDTH)+1;      // Number of regime bits   
localparam MTS = WIDTH-3-EXP;       // Maximum number of mantissa bits  
localparam USEED = 2**(2**EXP);  // max = useed^(width-2) = 16777216, min = useed^(-width+2)                
localparam BIAS = 2**(EXP+1)*(WIDTH-2);                   
localparam ACC_HEAD = WK + 2;
localparam ACC = (2**EXP)*(WIDTH-2);
localparam WZC = $clog2(WIDTH-1);
localparam ACCZC = $clog2(ACC);
localparam WTMP = 3*WIDTH - EXP - 4;

// Decode --------------------------
wire signed [2*(WIDTH-2):0] regi_ext;
wire sign_s;
wire sign_l;
wire [REGI-1:0] regi_s;
wire [REGI-1:0] regi_l;
wire [EXP-1:0] exp_s;
wire [EXP-1:0] exp_l;
wire [MTS-1:0] mts_s;
wire [MTS-1:0] mts_l;
wire [1:0] vld_o_w;
wire [1:0] vld_o_d;
wire decode;

// Multiplication ----------------
wire [2*(WIDTH-2):0] regi_acc;
wire [REGI-1:0] shift_mag;
wire sign_m;
wire [EXP:0] exp_m;
wire [2*(MTS+1)-1:0] mts_m;

// Accumulation ------------------
wire [ACC_HEAD-1:0] acc_100_c;
wire [ACC-1:0] acc_000_c;
wire [ACC-1:0] acc_001_c;
wire [ACC-1:0] acc_010_c;
wire [ACC-1:0] acc_011_c;

wire acc_rdy;

// Fraction & SF Extraction -----
wire sign_q;
wire ovf;
wire udf;
wire nzero;

wire signed [REGI+EXP:0] sf_q;
wire [2*MTS+1:0] mts_q;

// Encode with Rounding & Normalization ----
wire [WIDTH-1:0] acc_o_fin;

wire vld_o_tmp;
reg [11:0] vld_d;

//-------------------------------------------------
// Decode
//-------------------------------------------------

test_decoder #(.WIDTH(WIDTH), .EXP(EXP)) u_test_decoder(
               .clk_i(clk_i), .rstn(rstn), .vld_i(vld_i), .win(win), .din(din), 
               .regi_ext(regi_ext), .sign_s(sign_s), .sign_l(sign_l),
               .regi_s(regi_s), .regi_l(regi_l), .exp_s(exp_s), .exp_l(exp_l),
               .mts_s(mts_s), .mts_l(mts_l), .vld_o_w(vld_o_w), .vld_o_d(vld_o_d), .decode(decode)); 
               
//-------------------------------------------------
// Multiplication
//-------------------------------------------------

test_mult #(.WIDTH(WIDTH), .EXP(EXP), .REGI(REGI), .MTS(MTS)) u_test_mult (
        .clk_i(clk_i), .rstn(rstn),
        .vld_d(vld_d), 
        .regi_ext(regi_ext), .sign_s(sign_s), .sign_l(sign_l),
        .regi_s(regi_s), .regi_l(regi_l),
        .exp_s(exp_s), .exp_l(exp_l),
        .mts_s(mts_s), .mts_l(mts_l),
        .vld_o_w(vld_o_w), .vld_o_d(vld_o_d),
        .regi_acc(regi_acc), .sign_m(sign_m), .exp_m(exp_m), .mts_m(mts_m)
    );

//-------------------------------------------------
// Conversion to Fixed-Point & Accumulation
//-------------------------------------------------

test_accumulate #(.WIDTH(WIDTH), .K(K), .EXP(EXP), .MTS(MTS), .ACC(ACC), .ACC_HEAD(ACC_HEAD)) u_test_accumulate (
        .clk_i(clk_i), .rstn(rstn),
        .vld_d(vld_d),
        .regi_acc(regi_acc), .sign_m(sign_m), .exp_m(exp_m), .mts_m(mts_m),
        .acc_rdy(acc_rdy),
        .acc_100_c(acc_100_c), .acc_000_c(acc_000_c), .acc_001_c(acc_001_c),
        .acc_010_c(acc_010_c), .acc_011_c(acc_011_c)
    );

//-------------------------------------------------
// Convertion to Posit: Fraction & SF Extraction
//-------------------------------------------------

test_frac_sf #(.WIDTH(WIDTH), .K(K), .EXP(EXP), .ACC(ACC), .MTS(MTS), .REGI(REGI), .ACC_HEAD(ACC_HEAD)) u_test_frac_sf (
        .clk_i(clk_i), .rstn(rstn),
        .vld_d(vld_d),
        .acc_rdy(acc_rdy), 
        .acc_100_c(acc_100_c), 
        .acc_000_c(acc_000_c), .acc_001_c(acc_001_c),
        .acc_010_c(acc_010_c), .acc_011_c(acc_011_c),
        .sign_q(sign_q), .ovf(ovf), .udf(udf), .nzero(nzero), 
        .sf_q(sf_q), .mts_q(mts_q)
    );

//----------------------------------------------------------
// Convertion to Posit: Encode with Rounding & Normalization
//----------------------------------------------------------
 
test_encode #(.WIDTH(WIDTH), .EXP(EXP), .REGI(REGI), .MTS(MTS)) u_test_encode (
        .clk_i(clk_i), .rstn(rstn),
        .vld_d(vld_d),
        .acc_rdy(acc_rdy), 
        .ovf(ovf), .udf(udf), .nzero(nzero),
        .sign_q(sign_q), .sf_q(sf_q), .mts_q(mts_q),
        .acc_o_fin(acc_o_fin), .vld_o_tmp(vld_o_tmp)
    );
 
//////////////////////////////////////// 

always@(posedge clk_i or negedge rstn) begin
	if(~rstn) begin
		vld_d <= 0;
	end
	else begin
		vld_d <= {vld_d[11-1:0], vld_i};
    end
end

assign vld_o = vld_o_tmp; // ON for 1 clock period
assign acc_o = acc_o_fin;

endmodule
