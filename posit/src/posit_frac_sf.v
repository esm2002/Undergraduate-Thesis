`timescale 1ns / 1ps
module frac_sf #(
parameter WIDTH = 8,          // Bitwidth of inputs                      
parameter K  = 9,
parameter EXP = 2,
parameter MTS=WIDTH-3-EXP, 
parameter REGI=$clog2(WIDTH)+1, 
parameter WK = $clog2(K),
parameter BIAS = 2**(EXP+1)*(WIDTH-2),
parameter WIDTH_A = WK + 2*BIAS + 2) (
    input clk_i, input rstn,
    input [14:0] vld_d,
    input acc_rdy,
    input signed [WIDTH_A-1:0] acc,
    output reg sign_q,
    output reg zc_i,
    output reg signed [REGI+EXP:0] sf_q,
    output reg [2*(MTS+1)-1:0] mts_q
);

localparam WZC = $clog2(WIDTH_A);

reg [WIDTH_A-1:0] acc_mag;

wire [WIDTH_A-1:0] acc_mag_oh;
wire [WZC:0] zc;

reg [WIDTH_A-1:0] mts_tmp;

always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        sign_q <= 0;
        acc_mag <= 0;
        zc_i <= 0;
    end
    else if (vld_d == 0) begin
        sign_q <= 0;
        acc_mag <= 0;
        zc_i <= 0;
    end
    else if (acc_rdy) begin
        sign_q <= acc[WIDTH_A-1];
        if (acc[WIDTH_A-1]) acc_mag <= $unsigned(~(acc) + 1);
        else acc_mag <= $unsigned(acc);
        zc_i <= 1'b1;
    end
end

LZD #(.in_s(WIDTH_A)) u_lzd(.in(acc_mag), .vld_i(zc_i), .out(zc), .vld_o(vld));
// Instance of DW_lzd
//DW_lzd #(WIDTH_A) U_LZD0 ( .a(acc_mag), .dec(acc_mag_oh), .enc(zc) );
 
always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        sf_q <= 0;
        mts_tmp <= 0;
        
        mts_q <= 0;
    end   
    else if (vld_d == 0) begin
        sf_q <= 0;
        mts_tmp <= 0;
        
        mts_q <= 0;
    end 
    else if (acc_rdy & zc_i) begin
        sf_q <= (acc_mag == 0) ? $signed($unsigned(WK) + $unsigned(BIAS) + 1'b1 - $unsigned(WIDTH_A)) : $signed($unsigned(WK) + $unsigned(BIAS) + 1'b1 - zc); // 1 <= zc <= 2*BIAS+2 // -BIAS-1 <= sf_q <= BIAS
        mts_tmp <= acc_mag << zc;
        
        mts_q <= mts_tmp[WIDTH_A-1:WIDTH_A-1-(2*(MTS+1)-1)]; // 1.f format
    end
end

endmodule
