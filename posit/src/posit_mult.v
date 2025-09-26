`timescale 1ns / 1ps
module mult #(
parameter WIDTH=8, 
parameter EXP=2,
parameter REGI = $clog2(WIDTH)+1,      // Number of regime bits   
parameter MTS = WIDTH-3-EXP) (
    input clk_i, input rstn,
    input [14:0] vld_d,
    input sign_w, 
    input sign_d,
    input [REGI-1:0] regi_w, 
    input [REGI-1:0] regi_d,
    input [EXP-1:0] exp_w, 
    input [EXP-1:0] exp_d,
    input [MTS-1:0] mts_w,
    input [MTS-1:0] mts_d,
    input [1:0] vld_o_w,
    input [1:0] vld_o_d,
    input decode_w,
    input decode_d,
    output reg signed [REGI+EXP-1:0] sf_w,
    output reg signed [REGI+EXP-1:0] sf_d,
    output reg sign_m,
    output reg [2*(MTS+1)-1:0] mts_m
);

always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        sf_w <= 0;
        sf_d <= 0;
        sign_m <= 0;
        mts_m <= 0;
    end
    else if (decode_w && decode_d) begin
        if (vld_o_w[0] && vld_o_d[0]) begin // both valid
            sf_w <= $signed({regi_w, exp_w});
            sf_d <= $signed({regi_d, exp_d});
            sign_m <= sign_w ^ sign_d;
            mts_m <= {1'b1, mts_w} * {1'b1, mts_d}; // 01.xxxx or 10.xxxx
        end
        else if ((vld_o_w==0) || (vld_o_d==0)) begin
            sf_w <= 0;
            sf_d <= 0;
            sign_m <= 0;
            mts_m <= 0;
        end
    end
end

endmodule
