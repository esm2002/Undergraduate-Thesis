`timescale 1ns/1ps
module fx_mac #(
parameter WIDTH = 8,          // Bitwidth of inputs
parameter K  = 8,             // # of multiplications
parameter WK = $clog2(K),     
parameter FRACTION = 4,       // Number of fractional bits
parameter WIDTH_A = WK + 2*WIDTH + 2)(
input clk,
input rstn,
//input vld_i, 
input signed [WIDTH-1:0] win, 
input signed [WIDTH-1:0] din, 
output[WIDTH-1:0] acc_o
//output  vld_o
);

(* use_dsp = "yes" *) reg signed [2*WIDTH-1:0] mult;
(* use_dsp = "yes" *) reg signed [WIDTH_A-1:0] acc;
(* use_dsp = "yes" *) reg signed [WIDTH_A-1:0] acc_rc;

//reg [K:0] vld_d;

//-------------------------------------------------
// Multiplication
//-------------------------------------------------

always @(posedge clk, negedge rstn) begin
    if (~rstn)
        mult <= 0;
    else
        mult <= win * din;
end

//-------------------------------------------------
// Accumulation
//-------------------------------------------------

always @(posedge clk, negedge rstn) begin
    if (~rstn)
        acc <= 0;
    else
        acc <= acc + mult;
end

//-------------------------------------------------
// Rounding & Clipping
//-------------------------------------------------
//localparam signed [WIDTH_A-1:0] MAX_OVF = {{(WIDTH_A - WIDTH - FRACTION){1'b0}}, {(WIDTH + FRACTION){1'b1}}};
//localparam signed [WIDTH_A-1:0] MIN_OVF = {{(WIDTH_A - WIDTH - FRACTION){1'b1}}, 1'b1, {(WIDTH + FRACTION - 1){1'b0}}};
//localparam signed [WIDTH_A-1:0] MAX_VAL = {{(WIDTH_A - WIDTH - FRACTION){1'b0}}, 1'b0, {(WIDTH - 1){1'b1}}, {(FRACTION){1'b0}}};
//localparam signed [WIDTH_A-1:0] MIN_VAL = {{(WIDTH_A - WIDTH - FRACTION){1'b1}}, 1'b1, {(WIDTH + FRACTION - 1){1'b0}}};

wire guard_bit = acc[FRACTION-1];
wire round_bit = acc[FRACTION-2];
wire sticky_bit = |acc[FRACTION-3:0];

wire round_up = guard_bit & (round_bit | sticky_bit);
wire [WIDTH_A-1:0] round_val = round_up << FRACTION; //{{(WIDTH_A - 1 - FRACTION){1'b0}}, round_up, {FRACTION{1'b0}}};

always @(posedge clk, negedge rstn) begin
    if (~rstn)
        acc_rc <= 0;
    else if ((~acc[WIDTH_A-1])&(|acc[(WIDTH_A-1)-1 : WIDTH+FRACTION]))
        acc_rc <= {{(WIDTH_A - WIDTH - FRACTION + 1){1'b0}}, {(WIDTH-1){1'b1}}, {FRACTION{1'b0}}};  //set max pos. value 
    else if (acc[WIDTH_A-1]&(~(&acc[(WIDTH_A-1)-1 : WIDTH+FRACTION-1])))
        acc_rc <= {{(WIDTH_A - WIDTH - FRACTION + 1){1'b1}}, {(WIDTH-1){1'b0}}, {FRACTION{1'b0}}};  //set min neg. value
    else
        acc_rc <= acc + round_val; //rounding
//    else if (acc > MAX_OVF)
//        acc_rc <= MAX_VAL;  //set max pos. value 
//    else if (acc < MIN_OVF) //set min neg. value 
//        acc_rc <= MIN_VAL;
//    else
//        acc_rc <= acc + round_val;
end

//-------------------------------------------------
// Normalization & Output
//-------------------------------------------------

//always@(posedge clk, negedge rstn) begin
//	if(~rstn) begin
//		vld_d <= 0;
//	end
//	else begin
//		vld_d <= {vld_d[K-1:0], vld_i};
//    end
//end

//assign vld_o = (&vld_d[K:1])&(~vld_d[0]); // ON for 1 clock period

// Shift right by FRACTION bits & Slice to maintain fixed-point scale
assign acc_o = acc_rc[WIDTH + FRACTION -1:FRACTION];

endmodule


