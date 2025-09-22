`timescale 1ns / 1ps

module test_decoder #(
parameter WIDTH = 8,          // Bitwidth of inputs    
parameter EXP = 2       // Number of exponent bits                 
)(
input clk_i,
input rstn,
input vld_i, 
input [WIDTH-1:0] win, 
input [WIDTH-1:0] din, 
output signed [2*(WIDTH-2):0] regi_ext,
output sign_s,
output sign_l,
output signed [$clog2(WIDTH):0] regi_s,
output signed [$clog2(WIDTH):0] regi_l,
output [EXP-1:0] exp_s,
output [EXP-1:0] exp_l,
output [WIDTH-3-EXP-1:0] mts_s,
output [WIDTH-3-EXP-1:0] mts_l,
output [1:0] vld_o_w,
output [1:0] vld_o_d,
output decode);

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
wire [WIDTH-2:0] in_lzd_oh;
wire [WZC:0] in_zc;

reg sign_s_tmp;
reg sign_l_tmp;
reg signed [REGI-1:0] regi_tmp;
reg [EXP-1:0] exp_tmp;
reg [MTS-1:0] mts_tmp;

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

function [1:0] get_exp(input [WIDTH-2:0] in, input [3:0] i);
  case (i)
    4'b0111: get_exp = 2'd0;
    4'b0110: get_exp = 2'd0;
    4'b0101: get_exp = {1'b0, in[0]};
    default: get_exp = in[($unsigned(WIDTH)-3-i)-:2];
  endcase
endfunction
  
function [2:0] get_mts(input [WIDTH-2:0] in, input [3:0] i);
  case (i)
    4'b0011: get_mts = {in[$unsigned(WIDTH)-5-i], {2{1'b0}}};
    4'b0010: get_mts = {in[$unsigned(WIDTH)-5-i], in[$unsigned(WIDTH)-6-i], 1'b0};
    4'b0001: get_mts = {in[$unsigned(WIDTH)-5-i], in[$unsigned(WIDTH)-6-i], in[$unsigned(WIDTH)-7-i]};
    default: get_mts = 3'd0;
  endcase
endfunction

function [1:0] get_vld(input [WIDTH-1:0] in);
  if (in == 0) get_vld = 2'b00; //zero
  else if (in[WIDTH-1] && (in[WIDTH-2:0] == 0)) get_vld = 2'b10; //infinite
  else get_vld = 2'b01; //valid
endfunction

function [2*(WIDTH-2):0] lshift_lsb_ext(input [2*(WIDTH-2):0] x, input [REGI-1:0] s);
  integer k;
  begin
    lshift_lsb_ext = x << s;
    for (k = 0; k <= 2*(WIDTH-2); k = k+1)
      if (k < s) lshift_lsb_ext[k] = x[0];
  end
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
  for (i = 3; i <= WIDTH; i = i + 1) begin : gen_inv
    assign win_ext_tmp[WIDTH-i] =
        win_ext_tmp[WIDTH-i+1] | (win_tmp[WIDTH-2] != win_tmp[WIDTH-i]);
    assign din_ext_tmp[WIDTH-i] =
        din_ext_tmp[WIDTH-i+1] | (din_tmp[WIDTH-2] != din_tmp[WIDTH-i]);
  end
endgenerate

assign win_ext = win_tmp[WIDTH-2] ? ~win_ext_tmp : win_ext_tmp; // for regime shift
assign din_ext = din_tmp[WIDTH-2] ? ~din_ext_tmp : din_ext_tmp; // for regime shift

assign nor_ext_tmp = ~(win_ext_tmp | din_ext_tmp);

integer j;
reg found_one;

always @(*) begin
    found_one = 0;
        for (j = WIDTH-2; j >= 0; j = j - 1) begin
            if (!(found_one || nor_ext_tmp[j])) begin
                if (win_ext[WIDTH-2] == win_ext[j]) begin
                    in_long  = win_tmp;
                    in_short = din_tmp;
                    sign_l_tmp = win[WIDTH-1];
                    sign_s_tmp = din[WIDTH-1];
                    in_lzd = win_ext_tmp;
                end
                else if (din_ext[WIDTH-2] == din_ext[j]) begin
                    in_long  = din_tmp;
                    in_short = win_tmp;
                    sign_l_tmp = din[WIDTH-1];
                    sign_s_tmp = win[WIDTH-1];
                    in_lzd = din_ext_tmp;
                end
                else if (win_ext[WIDTH-2] == 0) begin
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
    
                regi_tmp   = in_short[WIDTH-2] ? (WIDTH-3-j) : -(WIDTH-2-j);
                exp_tmp    = get_exp(in_short, $unsigned(WIDTH)-2-$unsigned(j));
                mts_tmp    = get_mts(in_short, $unsigned(WIDTH)-2-$unsigned(j));
    
                found_one  = 1'b1;
            end
        end
end

LZD #(.in_s(WIDTH-1)) u_lzd(.in(in_lzd), .out(in_zc)); //, .out_s(WZC+1)
// Instance of DW_lzd
//DW_lzd #(WIDTH-1) U_LZD1 ( .a(in_lzd), .dec(in_lzd_oh), .enc(in_zc) );

always @(posedge clk_i or negedge rstn) begin
   if (~rstn) begin
        r_regi_ext <= 0;
        r_sign_s <= 0;
        r_regi_s <= 0;
        r_exp_s <= 0;
        r_mts_s <= 0;
        r_vld_o_w <= 0;
        r_sign_l <= 0;
        r_regi_l <= 0;
        r_exp_l <= 0;
        r_mts_l <= 0;
        r_vld_o_d <= 0;  
        r_decode <= 0; 
   end
   else begin
       r_regi_ext <= (in_long == din_tmp) ? $signed({din_ext, {(WIDTH-2){~din_ext[WIDTH-2]}}}) : $signed({win_ext, {(WIDTH-2){~win_ext[WIDTH-2]}}});
       r_sign_s <= sign_s_tmp;
       r_regi_s <= regi_tmp;
       r_exp_s <= exp_tmp;
       r_mts_s <= mts_tmp;
       r_vld_o_w <= get_vld(win);
       r_sign_l <= sign_l_tmp;
       r_regi_l <= in_long[WIDTH-2] ? $signed(in_zc-1) : $signed(~in_zc+1);
       r_exp_l <= get_exp(in_long, $unsigned(in_zc));
       r_mts_l <= get_mts(in_long, $unsigned(in_zc));
       r_vld_o_d <= get_vld(din);
       r_decode <= 1'b1;
   end
end

assign regi_ext = r_regi_ext;
assign sign_s = r_sign_s;
assign sign_l = r_sign_l;
assign regi_s = r_regi_s;
assign regi_l = r_regi_l;
assign exp_s = r_exp_s;
assign exp_l = r_exp_l;
assign mts_s = r_mts_s;
assign mts_l = r_mts_l;
assign vld_o_w = r_vld_o_w;
assign vld_o_d = r_vld_o_d;
assign decode = r_decode;

endmodule

