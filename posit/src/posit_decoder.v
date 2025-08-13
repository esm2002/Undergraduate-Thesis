`timescale 1ns / 1ps
module decoder#(
parameter in_s = 8,
parameter reg_s = $clog2(in_s)+1,
parameter exp_s = 2,
parameter mts_s = in_s-3-exp_s,
parameter WZC = $clog2(in_s))(
input clk,
input rstn,
input [in_s-1:0] in,
input vld_i,
output sign,
output [reg_s-1:0] regi,
output [exp_s-1:0] exp,
output [mts_s-1:0] mts,
output [1:0] vld_o
);

reg in_sign;

reg [in_s-2:0] in_mag;
reg vld_i_tmp;

reg [in_s-2:0] in_lzd;
reg vld_iz;
wire [WZC-1:0] zc;
wire vld;

reg [in_s-2:0] in_tmp;
reg [1:0] out_vld;

LZD #(.in_s(in_s-1), .out_s(WZC)) u_lzd(.in(in_lzd), .vld_i(vld_iz), .out(zc), .vld_o(vld));

always @(posedge clk, negedge rstn) begin
    if (~rstn) begin
        in_sign <= 0;
        in_mag <= 0;
        vld_i_tmp <= 0;
        
        in_lzd <= 0;
        vld_iz <= 0;
        
        in_tmp <= 0;
        out_vld <= 0;
    end
    else if (vld_i) begin
        in_sign <= in[in_s-1];
        if (in[in_s-1]) in_mag = ~in[in_s-2:0] + 1; 
        else in_mag = in[in_s-2:0];
        vld_i_tmp <= vld_i;
    end
    else begin
        vld_i_tmp <= 0;
        if (in_mag[in_s-2]) in_lzd <= ~in_mag;
        else in_lzd <= in_mag;
        vld_iz <= vld_i_tmp;
        
        if (vld) begin
            in_tmp <= in_mag << (zc+1);
            if (!in_sign & (in_mag == 0)) out_vld <= 2'b00; //zero
            else if (in_sign & (in_mag==0)) out_vld <= 2'b10; //infinite
            else out_vld <= 2'b01; //valid
        end
    end
end

assign sign = in_sign;
assign regi = in_mag[in_s-2] ? {1'b0, (zc-1)} : (~{1'b0, zc}+1);
assign exp = in_tmp[in_s-2:in_s-1-exp_s];
assign mts = in_tmp[in_s-2-exp_s:in_s-1-exp_s-mts_s];
assign vld_o = out_vld;

endmodule
