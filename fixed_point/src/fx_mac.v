`timescale 1ns/1ps
module fx_mac #(
parameter WIDTH = 8,          // Bitwidth of inputs
parameter K  = 9,             // # of multiplications   
parameter FRACTION = 4       // Number of fractional bits
)(
input clk_i,
input rstn,
input vld_i, 
input [WIDTH-1:0] win, 
input [WIDTH-1:0] din, 
output [WIDTH-1:0] acc_o,
output vld_o
);

localparam WK = $clog2(K);
localparam WIDTH_A = WK + 2*WIDTH + 2;

reg signed [2*WIDTH-1:0] mult;

reg [WK:0] counter;
reg acc_rdy;
reg signed [WIDTH_A-1:0] acc;
reg [WIDTH_A-1:0] acc_rc;
reg vld_o_tmp;

reg [4:0] vld_d;

//-------------------------------------------------
// Multiplication
//-------------------------------------------------
wire [WIDTH-1:0] w_abs; 
wire [WIDTH-1:0] d_abs;
assign w_abs = win[WIDTH-1] ? (~win+1) : win;
assign d_abs = din[WIDTH-1] ? (~din+1) : din;

(* use_dsp = "yes" *) wire [2*WIDTH-1:0] mult_tmp;
assign mult_tmp = w_abs * d_abs;

always @(posedge clk_i or negedge rstn) begin
    if (~rstn)
        mult <= 0;
    else
        mult <= (win[WIDTH-1] ^ din[WIDTH-1]) ? $signed(~mult_tmp+1) : $signed(mult_tmp);
end

//-------------------------------------------------
// Accumulation
//-------------------------------------------------

always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        counter <= 0;
        acc_rdy <= 0;
        acc <= {WIDTH_A{1'b0}};
    end
    else if (vld_d == 0) begin
        counter <= 0;
        acc_rdy <= 0;
        acc <= {WIDTH_A{1'b0}};
    end
    else if (vld_d[0] & counter < K) begin
        counter <= counter + 1;
        acc_rdy <= 0;
        acc <= $signed(acc) + $signed(mult);
    end
    else if (counter == K) acc_rdy <= 1;
    else; 
end

//-------------------------------------------------
// Rounding & Clipping
//-------------------------------------------------
//localparam signed [WIDTH_A-1:0] MAX_OVF = {{(WIDTH_A - WIDTH - FRACTION){1'b0}}, {(WIDTH + FRACTION){1'b1}}};
//localparam signed [WIDTH_A-1:0] MIN_OVF = {{(WIDTH_A - WIDTH - FRACTION){1'b1}}, 1'b1, {(WIDTH + FRACTION - 1){1'b0}}};
//localparam signed [WIDTH_A-1:0] MAX_VAL = {{(WIDTH_A - WIDTH - FRACTION){1'b0}}, 1'b0, {(WIDTH - 1){1'b1}}, {(FRACTION){1'b0}}};
//localparam signed [WIDTH_A-1:0] MIN_VAL = {{(WIDTH_A - WIDTH - FRACTION){1'b1}}, 1'b1, {(WIDTH + FRACTION - 1){1'b0}}};

wire [WIDTH_A-1:0] acc_u = $unsigned(acc);
wire guard_bit = acc_u[FRACTION-1];
wire round_bit = acc_u[FRACTION-2];
wire sticky_bit = |acc_u[FRACTION-3:0];

wire round_up = guard_bit & (round_bit | sticky_bit);
wire [WIDTH_A-1:0] round_val = round_up << FRACTION; //{{(WIDTH_A - 1 - FRACTION){1'b0}}, round_up, {FRACTION{1'b0}}};

always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        vld_o_tmp <= 0;
        acc_rc <= {WIDTH_A{1'b0}};
    end
    else if (vld_d == 0) begin
        vld_o_tmp <= 0;
        acc_rc <= {WIDTH_A{1'b0}};
    end
    else if (acc_rdy && vld_d[4] && (~|vld_d[3:0])) begin
        vld_o_tmp <= 1'b1;
        if ((~acc_u[WIDTH_A-1])&(|acc_u[(WIDTH_A-1)-1 : WIDTH+FRACTION-1]))
            acc_rc <= {{(WIDTH_A - WIDTH - FRACTION + 1){1'b0}}, {(WIDTH-1){1'b1}}, {FRACTION{1'b0}}};  //set max pos. value 
        else if (acc_u[WIDTH_A-1]&(~(&acc_u[(WIDTH_A-1)-1 : WIDTH+FRACTION-1])))
            acc_rc <= {{(WIDTH_A - WIDTH - FRACTION + 1){1'b1}}, {(WIDTH-1){1'b0}}, {FRACTION{1'b0}}};  //set min neg. value
        else
            acc_rc <= acc_u + $unsigned(round_val); //rounding
    end
    else ;
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

always@(posedge clk_i or negedge rstn) begin
	if(~rstn) begin
		vld_d <= 0;
	end
	else begin
		vld_d <= {vld_d[4-1:0], vld_i};
    end
end

assign vld_o = vld_o_tmp;//acc_rdy & vld_d[4]; // ON for 1 clock period

// Shift right by FRACTION bits & Slice to maintain fixed-point scale
assign acc_o = acc_rc[WIDTH + FRACTION -1:FRACTION];

endmodule
