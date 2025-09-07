`timescale 1ns / 1ps
module test_02(
input clk_i,
input rstn,
input [6:0] in_x,
input [2:0] shift_mag,
output [6:0] out_x
    );
 reg [6:0] shftd_x;
 
 always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        shftd_x <= 0;
    end
    else begin
        shftd_x <= in_x <<< shift_mag; 
    end
 end
 
 assign out_x = shftd_x;
endmodule
