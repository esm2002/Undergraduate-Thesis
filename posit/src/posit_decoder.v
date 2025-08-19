`timescale 1ns / 1ps
module decoder#(
parameter in_s = 8,
parameter exp_s = 2,
localparam reg_s = $clog2(in_s)+1,
localparam mts_s = in_s-3-exp_s,
localparam WZC = $clog2(in_s))(
input clk_i,
input rstn,
input [in_s-1:0] in,
input vld_i,
output sign,
output [reg_s-1:0] regi,
output [exp_s-1:0] exp,
output [mts_s-1:0] mts,
output [1:0] vld_o_type,
output vld_o
);

reg in_sign_tmp;
reg [in_s-2:0] in_mag_tmp;
reg vld_i_tmp;

reg [in_s-2:0] in_lzd;
reg in_sign;
reg [in_s-2:0] in_mag;
reg vld_iz;

wire [WZC-1:0] zc;
wire vld;

reg in_sign_o;
reg [in_s-2:0] in_mag_o;
reg [in_s-2:0] in_tmp;
reg [WZC-1:0] zc_o;
reg [1:0] out_type;
reg out_vld;

LZD #(.in_s(in_s-1), .out_s(WZC)) u_lzd(.in(in_lzd), .vld_i(vld_iz), .out(zc), .vld_o(vld));

always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        in_sign_tmp <= 0;
        in_mag_tmp <= 0;
        vld_i_tmp <= 0;
        
        in_lzd <= 0;
        in_sign <= 0;
        in_mag <= 0;
        vld_iz <= 0;
        
        in_sign_o <= 0;
        in_mag_o <= 0;
        in_tmp <= 0;
        zc_o <= 0;
        out_type <= 0;
        out_vld <= 0;
    end
    else begin
        if (vld_i) begin
            in_sign_tmp <= in[in_s-1];
            if (in[in_s-1]) in_mag_tmp <= ~in[in_s-2:0] + 1; 
            else in_mag_tmp <= in[in_s-2:0];
            vld_i_tmp <= vld_i;
        end
        else vld_i_tmp <= 0;
    
        if (in_mag_tmp[in_s-2]) in_lzd <= ~in_mag_tmp;
        else in_lzd <= in_mag_tmp;
        in_sign <= in_sign_tmp;
        in_mag <= in_mag_tmp;
        vld_iz <= vld_i_tmp;
        
        if (vld) begin
            in_sign_o <= in_sign;
            in_mag_o <= in_mag;
            if ((in_s-2-zc) < exp_s) in_tmp <= (in_mag << (zc+1)) >> (exp_s-(in_s-2-zc));
            else in_tmp <= in_mag << (zc+1);
            zc_o <= zc;
            if (!in_sign & (in_mag == 0)) out_type <= 2'b00; //zero
            else if (in_sign & (in_mag==0)) out_type <= 2'b10; //infinite
            else out_type <= 2'b01; //valid
            out_vld <= 1;
        end
    end
end

assign sign = in_sign_o;
assign regi = in_mag_o[in_s-2] ? {1'b0, (zc_o-1)} : (~{1'b0, zc_o}+1);
assign exp = in_tmp[in_s-2:in_s-1-exp_s];
assign mts = in_tmp[in_s-2-exp_s:in_s-1-exp_s-mts_s];
assign vld_o_type = out_type;
assign vld_o = out_vld;

endmodule
