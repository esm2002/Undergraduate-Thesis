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
output reg [$clog2(WIDTH):0] regi_s,
output reg [$clog2(WIDTH):0] regi_l,
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
wire [WIDTH-2:0] win_tmp_z;
wire [WIDTH-2:0] din_tmp_z;
wire [WIDTH-2:0] nor_tmp_z;

reg found_one_s;
reg found_one_l;
reg win_long;
reg [WIDTH-2:0] long_ext;
reg [WIDTH-2:0] in_lzd;
reg [WZC-1:0] idx_s;
reg [WZC-1:0] idx_l;

wire [WIDTH-2:0] exp_mts_s_tmp;
wire [WIDTH-2:0] exp_mts_l_tmp;

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

function [WIDTH-2:0] sign_mag(input [WIDTH-1:0] x);
  sign_mag = x[WIDTH-1] ? (~x[WIDTH-2:0] + 1'b1) : x[WIDTH-2:0];
endfunction

assign win_tmp = sign_mag(win);
assign din_tmp = sign_mag(din);

function [WIDTH-2:0] bit_inv(input [WIDTH-2:0] x);
  bit_inv = x[WIDTH-2] ? ~x : x;
endfunction

// Let MSB start with 0
assign win_tmp_z = bit_inv(win_tmp);
assign din_tmp_z = bit_inv(din_tmp);

assign nor_tmp_z = ~(win_tmp_z | din_tmp_z);

integer j;

always @(*) begin
    found_one_s = 0;
    found_one_l = 0;
    idx_s = ($unsigned(WIDTH)-1);
    idx_l = ($unsigned(WIDTH)-1);
    win_long = 0;
    long_ext = 0;
    
    for (j = WIDTH-2; j >= 0; j = j - 1) begin
        if (!found_one_l) begin
            if (!found_one_s  & !nor_tmp_z[j]) begin
                if ((win_tmp_z[WIDTH-2] == win_tmp_z[j]) | ((win_tmp_z[j] == din_tmp_z[j]) & (~win_tmp[WIDTH-2]))) begin
                    win_long = 1'b1;
                    in_lzd = win_tmp_z;
                end
                else begin
                    win_long = 0;
                    in_lzd = din_tmp_z;
                end 
                found_one_s = 1'b1;
                idx_s = ($unsigned(WIDTH)-2-$unsigned(j));
            end
            if (found_one_s  & !found_one_l) begin
                if (in_lzd[j]) begin
                    found_one_l = 1'b1;
                    idx_l = ($unsigned(WIDTH)-2-$unsigned(j));
                    long_ext[j] = 1'b1;
                end
                else ;
            end
        end 
        else begin
            long_ext[j] = 1'b1;        
        end
    end
end

//wire [EXP-1:0] w_exp_s;
//wire [EXP-1:0] w_exp_l;

//generate
//  if (EXP == 2) begin
//    assign w_exp_s = (idx_s == 1'b1) ? {1'b0, exp_mts_s_tmp[WIDTH-2]} : exp_mts_s_tmp[WIDTH-2-:EXP];
//    assign w_exp_l = (idx_l == 1'b1) ? {1'b0, exp_mts_l_tmp[WIDTH-2]} : exp_mts_l_tmp[WIDTH-2-:EXP];
//  end else if (EXP == 1) begin
//    assign w_exp_s = exp_mts_s_tmp[WIDTH-2-:EXP];
//    assign w_exp_l = exp_mts_l_tmp[WIDTH-2-:EXP];
//  end
//endgenerate

assign exp_mts_s_tmp = (win_long) ? din_tmp << (idx_s+1) : win_tmp << (idx_s+1);
assign exp_mts_l_tmp = (win_long) ? win_tmp << (idx_l+1) : din_tmp << (idx_l+1);

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
       if (win_long) begin 
           regi_ext <= win_tmp[WIDTH-2] ? 
                       $signed({~long_ext, {(WIDTH-2){long_ext[WIDTH-2]}}}) : 
                       $signed({long_ext, {(WIDTH-2){~long_ext[WIDTH-2]}}});
           sign_s <= din[WIDTH-1]; 
           regi_s <= din_tmp[WIDTH-2] ? (idx_s-1) : (~idx_s)+1;
           sign_l <= win[WIDTH-1];
           regi_l <= win_tmp[WIDTH-2] ? (idx_l-1) : (~idx_l)+1;
       end
       else begin
           regi_ext <= din_tmp[WIDTH-2] ? 
                       $signed({~long_ext, {(WIDTH-2){long_ext[WIDTH-2]}}}) : 
                       $signed({long_ext, {(WIDTH-2){~long_ext[WIDTH-2]}}});
           sign_s <= win[WIDTH-1];
           regi_s <= win_tmp[WIDTH-2] ? (idx_s-1) : (~idx_s)+1;
           sign_l <= din[WIDTH-1];
           regi_l <= din_tmp[WIDTH-2] ? (idx_l-1) : (~idx_l)+1;
       end
       exp_s <= (idx_s == 1'b1 && $unsigned(EXP) == 2'd2) ? {1'b0, exp_mts_s_tmp[WIDTH-2]} : exp_mts_s_tmp[WIDTH-2-:EXP];
       exp_l <= (idx_l == 1'b1 && $unsigned(EXP) == 2'd2) ? {1'b0, exp_mts_l_tmp[WIDTH-2]} : exp_mts_l_tmp[WIDTH-2-:EXP];
       mts_s <= exp_mts_s_tmp[WIDTH-2-EXP-:MTS];
       mts_l <= exp_mts_l_tmp[WIDTH-2-EXP-:MTS];
       vld_o_w <= get_vld(win);
       vld_o_d <= get_vld(din);
       decode <= 1'b1;
   end
end

endmodule
