`timescale 1ns / 1ps
//customized LZD
module test_decoder #(
parameter WIDTH = 8,          // Bitwidth of inputs    
parameter EXP = 2       // Number of exponent bits                 
)(
input clk_i,
input rstn,
input vld_i, 
input [WIDTH-1:0] win, 
input [WIDTH-1:0] din, 
output reg signed [2*(WIDTH-2):0] regi_ext,
output reg sign_s,
output reg sign_l,
output reg signed [$clog2(WIDTH):0] regi_s,
output reg signed [$clog2(WIDTH):0] regi_l,
output reg [EXP-1:0] exp_s,
output reg [EXP-1:0] exp_l,
output reg [WIDTH-3-EXP-1:0] mts_s,
output reg [WIDTH-3-EXP-1:0] mts_l,
output reg [1:0] vld_o_w,
output reg [1:0] vld_o_d,
output reg decode);

localparam REGI = $clog2(WIDTH)+1;      // Number of regime bits   
localparam MTS = WIDTH-3-EXP;       // Maximum number of mantissa bits  
localparam USEED = 2**(2**EXP);  // max = useed^(width-2) = 16777216, min = useed^(-width+2)                
localparam BIAS = 2**(EXP+1)*(WIDTH-2);    
localparam ACC = 1 + (2**EXP)*(WIDTH-2);
localparam WZC = $clog2(WIDTH-1);
localparam ACCZC = $clog2(ACC-1);
localparam WTMP = 3*WIDTH - EXP - 4;

wire [WIDTH-2:0] win_tmp;
wire [WIDTH-2:0] din_tmp;

wire [WIDTH-2:0] win_ext_tmp;
wire [WIDTH-2:0] win_ext;
wire [WIDTH-2:0] din_ext_tmp;
wire [WIDTH-2:0] din_ext;

wire [WIDTH-2:0] nor_ext_tmp;

reg [WIDTH-2:0] in_long;
reg [WIDTH-2:0] in_short;

reg [WIDTH-2:0] in_lzd;
wire [WZC:0] in_zc;

reg sign_s_tmp;
reg sign_l_tmp;
reg signed [REGI-1:0] regi_s_tmp;
reg signed [REGI-1:0] regi_l_tmp;
reg [WIDTH-2:0] exp_mts_s_tmp;
reg [WIDTH-2:0] exp_mts_l_tmp;
reg [WZC-1:0] idx_s;
reg [WZC-1:0] idx_l;

reg signed [2*(WIDTH-2):0] r_regi_ext;
reg r_sign_s;
reg r_sign_l;
reg signed [REGI-1:0] r_regi_s;
reg signed [REGI-1:0] r_regi_l;
reg [EXP-1:0] r_exp_s;
reg [EXP-1:0] r_exp_l;
reg [MTS-1:0] r_mts_s;
reg [MTS-1:0] r_mts_l;
reg [1:0] r_vld_o_w;
reg [1:0] r_vld_o_d;
reg r_decode;

//-------------------------------------------------
// Functions
//-------------------------------------------------

function [1:0] get_vld(input [WIDTH-1:0] in);
  if (~|in) get_vld = 2'b00; //zero
  else if (in[WIDTH-1] & ~|in[WIDTH-2:0]) get_vld = 2'b10; //infinite
  else get_vld = 2'b01; //valid
endfunction

//-------------------------------------------------
// Decode
//-------------------------------------------------

assign win_tmp = win[WIDTH-1] ? ~win[WIDTH-2:0]+1 : win[WIDTH-2:0];
assign din_tmp = din[WIDTH-1] ? ~din[WIDTH-2:0]+1 : din[WIDTH-2:0];

assign win_ext_tmp[WIDTH-2] = 1'b0;  
assign din_ext_tmp[WIDTH-2] = 1'b0;  

genvar i;
generate
  for (i = WIDTH-2; i > 0; i = i - 1) begin
    assign win_ext_tmp[i-1] = win_ext_tmp[i] | (win_tmp[WIDTH-2] != win_tmp[i-1]);
    assign din_ext_tmp[i-1] = din_ext_tmp[i] | (din_tmp[WIDTH-2] != din_tmp[i-1]);
  end
endgenerate

assign win_ext = win_tmp[WIDTH-2] ? ~win_ext_tmp : win_ext_tmp; // for regime shift
assign din_ext = din_tmp[WIDTH-2] ? ~din_ext_tmp : din_ext_tmp; // for regime shift

assign nor_ext_tmp = ~(win_ext_tmp | din_ext_tmp);

integer j;
reg found_one_s;
reg found_one_l;

always @(*) begin
    found_one_s = 0;
    found_one_l = 0;
    regi_s_tmp = (WIDTH-2);
    regi_l_tmp = (WIDTH-2);
    exp_mts_s_tmp = 0;
    exp_mts_l_tmp = 0;
    idx_s = 0;
    idx_l = 0;
        for (j = WIDTH-2; j >= 0; j = j - 1) begin
            if (!found_one_l & !nor_ext_tmp[j]) begin
                if (!found_one_s) begin
                    if ((win_ext[WIDTH-2] == win_ext[j]) | ((win_ext_tmp[j] == din_ext_tmp[j]) & (win_ext[WIDTH-2] == 0))) begin
                        in_long  = win_tmp;
                        in_short = din_tmp;
                        sign_l_tmp = win[WIDTH-1];
                        sign_s_tmp = din[WIDTH-1];
                        in_lzd = win_ext_tmp;
                    end
                    else begin
                        in_long  = din_tmp;
                        in_short = win_tmp;
                        sign_l_tmp = din[WIDTH-1];
                        sign_s_tmp = win[WIDTH-1];
                        in_lzd = din_ext_tmp;
                    end
        
                    regi_s_tmp = in_short[WIDTH-2] ? (WIDTH-3-j) : -(WIDTH-2-j);
                    exp_mts_s_tmp = in_short << ($unsigned(WIDTH)-1-$unsigned(j));
        
                    found_one_s = 1'b1;
                    idx_s = j;
                end
                if (found_one_s & !found_one_l) begin
                    if (in_lzd[j]) begin
                        regi_l_tmp = in_long[WIDTH-2] ? (WIDTH-3-j) : -(WIDTH-2-j);
                        exp_mts_l_tmp = in_long << ($unsigned(WIDTH)-1-$unsigned(j));
                        
                        found_one_l = 1'b1;
                        idx_l = j;
                    end 
                end
            end
        end
end


always @(posedge clk_i or negedge rstn) begin
   if (~rstn) begin
        regi_ext <= 0;
        sign_s <= 0;
        regi_s <= 0;
        exp_s <= 0;
        mts_s <= 0;
        vld_o_w <= 0;
        sign_l <= 0;
        regi_l <= 0;
        exp_l <= 0;
        mts_l <= 0;
        vld_o_d <= 0;  
        decode <= 0; 
   end
   else begin
       regi_ext <= (in_long == din_tmp) ? $signed({din_ext, {(WIDTH-2){~din_ext[WIDTH-2]}}}) : $signed({win_ext, {(WIDTH-2){~win_ext[WIDTH-2]}}});
       sign_s <= sign_s_tmp;
       regi_s <= regi_s_tmp;
       exp_s <= (idx_s == 1) ? {1'b0, exp_mts_s_tmp[WIDTH-2]} : exp_mts_s_tmp[WIDTH-2-:EXP];
       mts_s <= exp_mts_s_tmp[WIDTH-2-EXP-:MTS];
       vld_o_w <= get_vld(win);
       sign_l <= sign_l_tmp;
       regi_l <= regi_l_tmp;
       exp_l <= (idx_l == 1) ? {1'b0, exp_mts_l_tmp[WIDTH-2]} : exp_mts_l_tmp[WIDTH-2-:EXP];
       mts_l <= exp_mts_l_tmp[WIDTH-2-EXP-:MTS];
       vld_o_d <= get_vld(din);
       decode <= 1'b1;
   end
end

endmodule
