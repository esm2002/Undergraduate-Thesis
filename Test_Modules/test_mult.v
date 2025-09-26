`timescale 1ns / 1ps
module test_mult #(
parameter WIDTH=8, 
parameter EXP=2,
parameter REGI = $clog2(WIDTH)+1,      // Number of regime bits   
parameter MTS = WIDTH-3-EXP) (
    input clk_i, input rstn,
    input [11:0] vld_d,
    input signed [2*(WIDTH-2):0] regi_ext,
    input sign_s, 
    input sign_l,
    input signed [REGI-1:0] regi_s, 
    input signed [REGI-1:0] regi_l,
    input [EXP-1:0] exp_s, 
    input [EXP-1:0] exp_l,
    input [MTS-1:0] mts_s,
    input [MTS-1:0] mts_l,
    input [1:0] vld_o_w,
    input [1:0] vld_o_d,
    output reg signed [2*(WIDTH-2):0] regi_acc,
    output reg sign_m,
    output reg [EXP:0] exp_m,
    output reg [2*(MTS+1)-1:0] mts_m
);

function [2*(WIDTH-2):0] lshift_lsb_ext(input [2*(WIDTH-2):0] x, input [REGI-1:0] s);
  integer k;
  begin
    lshift_lsb_ext = x << s;
    for (k = 0; k <= 2*(WIDTH-2); k = k+1)
      if (k < s) lshift_lsb_ext[k] = x[0];
  end
endfunction
wire [REGI-1:0] shift_mag;
wire [MTS:0] mts_s_iso;
wire [MTS:0] mts_l_iso;

assign shift_mag = regi_s[REGI-1] ? $unsigned(~regi_s+1) : $unsigned(regi_s);

assign mts_s_iso = {(MTS+1){(vld_o_w[0] & vld_o_d[0])}} & {1'b1, mts_s};
assign mts_l_iso = {(MTS+1){(vld_o_w[0] & vld_o_d[0])}} & {1'b1, mts_l};

always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        regi_acc <= 0;
        sign_m <= 0;
        exp_m <= 0;
        mts_m <= 0;
    end
    else begin
        if (vld_d[0] && vld_o_w[0] && vld_o_d[0]) begin // both valid
            if (regi_l[REGI-1] ^ regi_s[REGI-1]) regi_acc <= lshift_lsb_ext($unsigned(regi_ext), shift_mag);
            else regi_acc <= $unsigned(regi_ext >>> shift_mag); 
            sign_m <= sign_s ^ sign_l;
            exp_m <= {1'b0, exp_s} + {1'b0, exp_l};
            mts_m <= mts_s_iso * mts_l_iso; // 01.xxxx or 10.xxxx
        end
        else begin
            sign_m <= 0;
            exp_m <= 0;
            mts_m <= 0;
        end
    end
end

endmodule
