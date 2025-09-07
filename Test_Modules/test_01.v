`timescale 1ns / 1ps
module test_01(
input clk_i,
input rstn,
input [6:0] in_x,
input [2:0] shift_mag,
output [6:0] out_x
    );
 wire [6:0] tmp_x;
 assign tmp_x = {in_x[0], in_x[1], in_x[2], in_x[3], in_x[4], in_x[5], in_x[6]};
 reg [6:0] shftd_x;
 
 always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        shftd_x <= 0;
    end
    else begin
        shftd_x <= tmp_x >>> shift_mag; 
    end
 end
 
 assign out_x = {shftd_x[0], shftd_x[1], shftd_x[2], shftd_x[3], shftd_x[4], shftd_x[5], shftd_x[6]};
endmodule
