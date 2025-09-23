`timescale 1ns/1ps
module test_new_mac #(
parameter WIDTH = 8,          // Bitwidth of inputs                      
parameter K  = 9,
parameter EXP = 2       // Number of exponent bits                 
)( // revised from '$clog2(WIDTH_A)' to '$clog2(2*BIAS+1)'
input clk_i,
input rstn,
input vld_i, 
input [WIDTH-1:0] win, 
input [WIDTH-1:0] din, 
output[WIDTH-1:0] acc_o,
output  vld_o
);

localparam WK = $clog2(K);
localparam REGI = $clog2(WIDTH)+1;      // Number of regime bits   
localparam MTS = WIDTH-3-EXP;       // Maximum number of mantissa bits  
localparam USEED = 2**(2**EXP);  // max = useed^(width-2) = 16777216, min = useed^(-width+2)                
localparam BIAS = 2**(EXP+1)*(WIDTH-2);                   
localparam ACC_HEAD = WK + 2;
localparam ACC = (2**EXP)*(WIDTH-2);
localparam WZC = $clog2(WIDTH-1);
localparam ACCZC = $clog2(ACC);
localparam WTMP = 3*WIDTH - EXP - 4;

wire signed [2*(WIDTH-2):0] regi_ext;
wire sign_s;
wire sign_l;
wire signed [REGI-1:0] regi_s;
wire signed [REGI-1:0] regi_l;
wire [EXP-1:0] exp_s;
wire [EXP-1:0] exp_l;
wire [MTS-1:0] mts_s;
wire [MTS-1:0] mts_l;
wire [1:0] vld_o_w;
wire [1:0] vld_o_d;
wire decode;

reg [2*(WIDTH-2):0] regi_acc;
wire [REGI-1:0] shift_mag;

reg sign_m;
reg [EXP:0] exp_m;
(* use_dsp = "yes" *) reg [2*(MTS+1)-1:0] mts_m;

reg [2:0] acc_num;
reg [WIDTH-3:0] acc_lzd;
reg [EXP:0] bias_exp;
wire [WIDTH-3:0] acc_lzd_oh;
wire [WZC:0] bias_zc;
(* use_dsp = "yes" *) reg signed [2*(MTS+1):0] mts_ms;
wire [REGI+EXP-1:0] acc_bias;

reg [ACC_HEAD-1:0] acc_100;
reg [ACC+ACC_HEAD-1:0] acc_000;
reg [ACC+ACC_HEAD-1:0] acc_001;
reg [ACC+ACC_HEAD-1:0] acc_010;
reg [ACC+ACC_HEAD-1:0] acc_011;

reg [ACC_HEAD-1:0] acc_100_c;
reg [ACC+ACC_HEAD-1:0] acc_000_c;
reg [ACC+ACC_HEAD-1:0] acc_001_c;
reg [ACC+ACC_HEAD-1:0] acc_010_c;
reg [ACC+ACC_HEAD-1:0] acc_011_c;

reg [WK:0] counter;
reg acc_rdy;

wire [ACC_HEAD-1:0] mag_100;
wire [ACC+ACC_HEAD-1:0] mag_000;
wire [ACC+ACC_HEAD-1:0] mag_001;
wire [ACC+ACC_HEAD-1:0] mag_010;
wire [ACC+ACC_HEAD-1:0] mag_011;

reg [ACC_HEAD-1:0] mag_100_c;
reg [ACC+ACC_HEAD-1:0] mag_000_c;
reg [ACC+ACC_HEAD-1:0] mag_001_c;
reg [ACC+ACC_HEAD-1:0] mag_010_c;
reg [ACC+ACC_HEAD-1:0] mag_011_c;

wire [ACC-1:0] mag_000_wo_c;
wire [ACC-1:0] mag_001_wo_c;
wire [ACC-1:0] mag_010_wo_c;
wire [ACC-1:0] mag_011_wo_c;

reg sign_q;
reg [ACC-1:0] acc_regi;
wire [ACC-1:0] acc_regi_oh;
wire [ACCZC:0] acc_zc;
reg ovf;
reg udf;
reg nzero;

reg signed [REGI+EXP:0] sf_q;
reg [ACC-1:0] mts_q_tmp1;
reg [ACC-1:0] mts_q_tmp2;

reg [2*MTS+1:0] mts_q;

reg sign_sf;
reg [REGI-1:0] regi_q;
reg [EXP-1:0] exp_q;

reg signed [WTMP-1:0] tmp_pos;
reg signed [WTMP-1:0] tmp_neg;
reg [REGI-2:0] shift_pos;
reg [REGI-2:0] shift_neg;

reg [WTMP-1:0] tmp;
wire lsb_bit;
wire guard_bit;
wire sticky_bit;
wire round_val;
wire [WIDTH-2:0] tmp_for_round;
reg [WIDTH-2:0] acc_o_tmp;

reg [WIDTH-1:0] acc_o_fin;

reg vld_o_tmp;
reg [11:0] vld_d;

//-------------------------------------------------
// Functions
//-------------------------------------------------

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

test_decoder #(.WIDTH(WIDTH), .EXP(EXP)) u_test_decoder(
               .clk_i(clk_i), .rstn(rstn), .vld_i(vld_i), .win(win), .din(din), 
               .regi_ext(regi_ext), .sign_s(sign_s), .sign_l(sign_l),
               .regi_s(regi_s), .regi_l(regi_l), .exp_s(exp_s), .exp_l(exp_l),
               .mts_s(mts_s), .mts_l(mts_l), .vld_o_w(vld_o_w), .vld_o_d(vld_o_d), .decode(decode)); 
               
//-------------------------------------------------
// Multiplication
//-------------------------------------------------

assign shift_mag = regi_s[REGI-1] ? $unsigned(~regi_s+1) : $unsigned(regi_s);
wire [MTS:0] mts_s_iso;
wire [MTS:0] mts_l_iso;
assign mts_s_iso = (vld_o_w[0] && vld_o_d[0]) ? {1'b1, mts_s} : 0;
assign mts_l_iso = (vld_o_w[0] && vld_o_d[0]) ? {1'b1, mts_l} : 0;

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

//-------------------------------------------------
// Conversion to Fixed-Point & Accumulation
//-------------------------------------------------

LZD #(.in_s(WIDTH-2)) u_acc_lzd(.in(acc_lzd), .out(bias_zc)); //, .out_s(WZC+1)
// Instance of DW_lzd
//DW_lzd #(WIDTH-2) U_LZD2 ( .a(acc_lzd), .dec(acc_lzd_oh), .enc(bias_zc) );

assign acc_bias = acc_num[1] 
    ? ({ (WIDTH-2 - bias_zc), {EXP{1'b0}} } + bias_exp) 
    : ({ bias_zc, {EXP{1'b0}} } + bias_exp);
    
reg [ACCZC-1:0] shift_amt_l;  
reg [ACCZC-1:0] shift_amt_r;         
reg signed [ACC-1:0] shift_o_left;       
reg signed [ACC-1:0] shift_o_right;        
wire [1:0] shift_sel;
wire [ACC-1:0] shift_left;       
wire [ACC-1:0] shift_right;    

assign shift_sel = (acc_bias >= ($unsigned(ACC)-1)) ? 2'b00 :
                   (acc_bias < 2*$unsigned(MTS))    ? 2'b01 :
                                                      2'b10 ;
assign shift_left = $unsigned(shift_o_left);
assign shift_right = $unsigned(shift_o_right);

always @(*) begin
    shift_amt_l  = 0;
    shift_amt_r  = 0;
    shift_o_left = 0;
    shift_o_right = 0;

    case (shift_sel)   
        2'b00: begin // shift_val2,3 
            shift_amt_l = (acc_bias-$unsigned(ACC)+3);
            shift_amt_r = (2*$unsigned(MTS)-acc_bias+$unsigned(ACC));
        end
        2'b01: begin // shift_val1,5
            shift_amt_l = (acc_bias+3);
            shift_amt_r = (2*$unsigned(MTS)-acc_bias);
        end
        2'b10: begin // shift_val4
            shift_amt_l = (acc_bias-2*$unsigned(MTS));
        end
        default: ;
    endcase
    shift_o_left = shift_sel[1] ? (mts_ms << shift_amt_l) 
                                : $signed({mts_ms << shift_amt_l, {($unsigned(ACC)-2*$unsigned(MTS)-3){1'b0}}});
    shift_o_right = mts_ms >>> shift_amt_r;
end

always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        acc_num <= 0;
        acc_lzd <= 0;
        mts_ms <= 0;
        bias_exp <= 0;
    end else if (vld_d[1]) begin
            if (regi_acc == {(2*WIDTH-3){1'b1}}) begin
                acc_num <= 3'b100;
            end else if (regi_acc[(WIDTH-2)+:(WIDTH-1)] == {(WIDTH-1){1'b1}}) begin
                acc_num <= 3'b000;
                acc_lzd <= ~regi_acc[0+:(WIDTH-2)];
            end else if (regi_acc[0+:(WIDTH-1)] == {(WIDTH-1){1'b0}}) begin   
                acc_num <= 3'b001;
                acc_lzd <= ~regi_acc[(WIDTH-2)+:(WIDTH-2)]; // excluding MSB bit
            end else if (regi_acc[0+:(WIDTH-1)] == {(WIDTH-1){1'b1}}) begin    
                acc_num <= 3'b010;
                acc_lzd <= regi_acc[(WIDTH-1)+:(WIDTH-2)];
            end else begin
                acc_num <= 3'b011;
                acc_lzd <= regi_acc[1+:(WIDTH-2)]; // excluding LSB bit
            end 
            
            if (sign_m) mts_ms <= $signed(~({1'b0, mts_m}) + 1);
            else mts_ms <= $signed({1'b0, mts_m});
            bias_exp <= exp_m;
    end
end

always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        acc_100 <= 0;
        acc_000 <= 0;
        acc_001 <= 0;
        acc_010 <= 0;
        acc_011 <= 0;
    end else if (vld_d == 0) begin
        acc_100 <= 0;
        acc_000 <= 0;
        acc_001 <= 0;
        acc_010 <= 0;
        acc_011 <= 0;
    end else if (vld_d[2]) begin
//            acc_100 <= acc_100_c;
//            acc_000 <= acc_000_c;
//            acc_001 <= acc_001_c;
//            acc_010 <= acc_010_c;
//            acc_011 <= acc_011_c;
            
            case (shift_sel)                       
                2'b00: begin //if (acc_bias >= ($unsigned(ACC)-1))
                    case (acc_num)
                        3'b100: begin
                                    acc_100 <= acc_100 + shift_right[0+:ACC_HEAD];
                                    acc_000 <= acc_000 + shift_left;
                                end
                        3'b000: begin
                                    acc_100 <= acc_100 + shift_right[0+:ACC_HEAD];
                                    acc_000 <= acc_000 + shift_left;
                                end
                        3'b001: begin
                                    acc_100 <= acc_100 + {(ACC_HEAD){mts_ms[2*(MTS+1)]}};
                                    acc_000 <= acc_000 + shift_right;
                                    acc_001 <= acc_001 + shift_left;
                                end
                        3'b010: begin
                                    acc_100 <= acc_100 + {(ACC_HEAD){mts_ms[2*(MTS+1)]}};
                                    acc_000 <= acc_000 + {{(ACC_HEAD){1'b0}}, {(ACC){mts_ms[2*(MTS+1)]}}};
                                    acc_001 <= acc_001 + shift_right;
                                    acc_010 <= acc_010 + shift_left;
                                end
                        3'b011: begin
                                    acc_100 <= acc_100 + {(ACC_HEAD){mts_ms[2*(MTS+1)]}};
                                    acc_000 <= acc_000 + {{(ACC_HEAD){1'b0}}, {(ACC){mts_ms[2*(MTS+1)]}}};
                                    acc_001 <= acc_001 + {{(ACC_HEAD){1'b0}}, {(ACC){mts_ms[2*(MTS+1)]}}};
                                    acc_010 <= acc_010 + shift_right;
                                    acc_011 <= acc_011 + shift_left;
                                end
                        default: ;
                    endcase
                end 
                2'b01: begin //else if (acc_bias < 2*$unsigned(MTS)) begin
                    case (acc_num)
                        3'b100: begin
                                    acc_100 <= acc_100 + shift_right[0+:ACC_HEAD];
                                    acc_000 <= acc_000 + shift_left;
                                end
                        3'b000: begin
                                    acc_100 <= acc_100 + {(ACC_HEAD){mts_ms[2*(MTS+1)]}};
                                    acc_000 <= acc_000 + shift_right;
                                    acc_001 <= acc_001 + shift_left;
                                end
                        3'b001: begin
                                    acc_100 <= acc_100 + {(ACC_HEAD){mts_ms[2*(MTS+1)]}};
                                    acc_000 <= acc_000 + {{(ACC_HEAD){1'b0}}, {(ACC){mts_ms[2*(MTS+1)]}}};
                                    acc_001 <= acc_001 + shift_right;
                                    acc_010 <= acc_010 + shift_left;
                                end
                        3'b010: begin
                                    acc_100 <= acc_100 + {(ACC_HEAD){mts_ms[2*(MTS+1)]}};
                                    acc_000 <= acc_000 + {{(ACC_HEAD){1'b0}}, {(ACC){mts_ms[2*(MTS+1)]}}};
                                    acc_001 <= acc_001 + {{(ACC_HEAD){1'b0}}, {(ACC){mts_ms[2*(MTS+1)]}}};
                                    acc_010 <= acc_010 + shift_right;
                                    acc_011 <= acc_011 + shift_left;
                                end
                        default: ;
                    endcase 
                end 
                2'b10: begin //else begin
                    case (acc_num)
                        3'b000: begin
                                    acc_100 <= acc_100 + {(ACC_HEAD){mts_ms[2*(MTS+1)]}};
                                    acc_000 <= acc_000 + shift_left;
                                end
                        3'b001: begin
                                    acc_100 <= acc_100 + {(ACC_HEAD){mts_ms[2*(MTS+1)]}};
                                    acc_000 <= acc_000 + {{(ACC_HEAD){1'b0}}, {(ACC){mts_ms[2*(MTS+1)]}}};
                                    acc_001 <= acc_001 + shift_left;
                                end
                        3'b010: begin
                                    acc_100 <= acc_100 + {(ACC_HEAD){mts_ms[2*(MTS+1)]}};
                                    acc_000 <= acc_000 + {{(ACC_HEAD){1'b0}}, {(ACC){mts_ms[2*(MTS+1)]}}};
                                    acc_001 <= acc_001 + {{(ACC_HEAD){1'b0}}, {(ACC){mts_ms[2*(MTS+1)]}}};
                                    acc_010 <= acc_010 + shift_left;
                                end
                        3'b011: begin
                                    acc_100 <= acc_100 + {(ACC_HEAD){mts_ms[2*(MTS+1)]}};
                                    acc_000 <= acc_000 + {{(ACC_HEAD){1'b0}}, {(ACC){mts_ms[2*(MTS+1)]}}};
                                    acc_001 <= acc_001 + {{(ACC_HEAD){1'b0}}, {(ACC){mts_ms[2*(MTS+1)]}}};
                                    acc_010 <= acc_010 + {{(ACC_HEAD){1'b0}}, {(ACC){mts_ms[2*(MTS+1)]}}};
                                    acc_011 <= acc_011 + shift_left;
                                end
                        default: ;
                    endcase
                end
                default: ;
           endcase    
    end
end

//-------------------------------------------------
// Accumulation (carry)
//-------------------------------------------------

integer k;

task carry_propagation (input [ACC_HEAD-1:0] acc_100, 
                        input [ACC+ACC_HEAD-1:0] acc_000, acc_001, acc_010, acc_011, 
                        output [ACC_HEAD-1:0] acc_100_c, 
                        output [ACC+ACC_HEAD-1:0] acc_000_c, acc_001_c, acc_010_c, acc_011_c);
	reg [ACC_HEAD-1:0] acc_100_tmp;
	reg [ACC+ACC_HEAD-1:0] acc_000_tmp;
	reg [ACC+ACC_HEAD-1:0] acc_001_tmp;
	reg [ACC+ACC_HEAD-1:0] acc_010_tmp;
	reg [ACC+ACC_HEAD-1:0] acc_011_tmp;
	begin
	    acc_100_tmp = $unsigned(acc_100);
        acc_000_tmp = $unsigned(acc_000);
        acc_001_tmp = $unsigned(acc_001);
        acc_010_tmp = $unsigned(acc_010);
        acc_011_tmp = $unsigned(acc_011);
		
		acc_010_tmp = acc_010_tmp + {{(ACC){1'b0}}, acc_011_tmp[ACC+ACC_HEAD-1-:ACC_HEAD]};
		acc_001_tmp = acc_001_tmp + {{(ACC){1'b0}}, acc_010_tmp[ACC+ACC_HEAD-1-:ACC_HEAD]};
		acc_000_tmp = acc_000_tmp + {{(ACC){1'b0}}, acc_001_tmp[ACC+ACC_HEAD-1-:ACC_HEAD]};
		acc_100_tmp = acc_100_tmp + {{(ACC){1'b0}}, acc_000_tmp[ACC+ACC_HEAD-1-:ACC_HEAD]};
        acc_011_tmp[ACC+ACC_HEAD-1-:ACC_HEAD] = {(ACC_HEAD){1'b0}};
        acc_010_tmp[ACC+ACC_HEAD-1-:ACC_HEAD] = {(ACC_HEAD){1'b0}};
        acc_001_tmp[ACC+ACC_HEAD-1-:ACC_HEAD] = {(ACC_HEAD){1'b0}};
        acc_000_tmp[ACC+ACC_HEAD-1-:ACC_HEAD] = {(ACC_HEAD){1'b0}};
        
        acc_100_c = acc_100_tmp;
        acc_000_c = acc_000_tmp;
        acc_001_c = acc_001_tmp;
        acc_010_c = acc_010_tmp;
        acc_011_c = acc_011_tmp;
	end
endtask

always @(*) begin
    if (vld_d == 0 || counter == K) begin
        carry_propagation (acc_100, acc_000, acc_001, acc_010, acc_011, 
                           acc_100_c, acc_000_c, acc_001_c, acc_010_c, acc_011_c);
    end
    if (acc_rdy) begin
        carry_propagation (mag_100, mag_000, mag_001, mag_010, mag_011, 
                           mag_100_c, mag_000_c, mag_001_c, mag_010_c, mag_011_c);
    end
end

always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        counter <= 0;
        acc_rdy <= 0;
    end
    else if (vld_d == 0) begin
        counter <= 0;
        acc_rdy <= 0;
    end
    else if (vld_d[3] & counter < K) begin 
        counter <= counter + 1;
        acc_rdy <= 0;
    end
    else if (counter == K) acc_rdy <= 1;
    else ;
end

//-------------------------------------------------
// Convertion to Posit: Fraction & SF Extraction
//-------------------------------------------------

// if it is negative, mag_xxx is 1 less than real mag
assign mag_011 = acc_100_c[ACC_HEAD-1] ? {{(ACC_HEAD){1'b0}}, ~acc_011_c[ACC-1:0]}+1 : acc_011_c;
assign mag_010 = acc_100_c[ACC_HEAD-1] ? {{(ACC_HEAD){1'b0}}, ~acc_010_c[ACC-1:0]} : acc_010_c;
assign mag_001 = acc_100_c[ACC_HEAD-1] ? {{(ACC_HEAD){1'b0}}, ~acc_001_c[ACC-1:0]} : acc_001_c;
assign mag_000 = acc_100_c[ACC_HEAD-1] ? {{(ACC_HEAD){1'b0}}, ~acc_000_c[ACC-1:0]} : acc_000_c;
assign mag_100 = acc_100_c[ACC_HEAD-1] ? ~acc_100_c : acc_100_c;

assign mag_000_wo_c = mag_000_c[ACC-1:0];
assign mag_001_wo_c = mag_001_c[ACC-1:0];
assign mag_010_wo_c = mag_010_c[ACC-1:0];
assign mag_011_wo_c = mag_011_c[ACC-1:0];

always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        sign_q <= 0;
        acc_regi <= 0;
        ovf <= 0;
        udf <= 0;
        nzero <= 1'b1;
    end
    else if (vld_d == 0) begin
        sign_q <= 0;
        acc_regi <= 0;
        ovf <= 0;
        udf <= 0;
        nzero <= 1'b1;
    end
    else if (acc_rdy) begin // vld_d[4]
        sign_q <= acc_100_c[ACC_HEAD-1];
        if ((mag_100_c != 0) || (mag_000_wo_c != 0)) begin
            acc_regi <= 0; // max or overflow
            ovf <= 1'b1;
        end else if ((mag_100_c == 0) && (mag_000_wo_c == 0) && (mag_001_wo_c == 0) && (mag_010_wo_c == 0)) begin
            acc_regi <= 0; // underflow
            udf <= 1'b1;
            if (mag_011_wo_c == 0) nzero <= 0; // 0 for zero
        end else if (mag_001_wo_c != 0) acc_regi <= mag_001_wo_c;// positive scale factor
        else acc_regi <= mag_010_wo_c;// negative scale factor 
    end
end

LZD #(.in_s(ACC)) u_regi_lzd(.in(acc_regi), .out(acc_zc));
// Instance of DW_lzd
//DW_lzd #(ACC) U_LZD3 (.a(acc_regi), .dec(acc_regi_oh), .enc(acc_zc));
 
wire [ACC-1:0] mts_src1;
wire [ACC-1:0] mts_src2; 

assign mts_src1 = (mag_001_wo_c != 0) ? mag_001_wo_c : mag_010_wo_c;
assign mts_src2 = (mag_001_wo_c != 0) ? mag_010_wo_c : mag_011_wo_c;
 
always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        sf_q <= 0;
        mts_q_tmp1 <= 0;
        mts_q_tmp2 <= 0;
        
        mts_q <= 0;
    end   
    else if (vld_d == 0) begin
        sf_q <= 0;
        mts_q_tmp1 <= 0;
        mts_q_tmp2 <= 0;
        
        mts_q <= 0;
    end 
    else if (acc_rdy) begin // vld_d[5], vld_d[6]
        if (mag_001_wo_c != 0) sf_q <= $signed($unsigned(ACC)-$unsigned(acc_zc)-1); // positive scale factor  
        else sf_q <= $signed(~($unsigned(acc_zc)+1)+1); // negative scale factor 
        
        mts_q_tmp1 <= mts_src1 << acc_zc;
        
        if (acc_zc > $unsigned(ACC)-2*$unsigned(MTS)-2) mts_q_tmp2 <= mts_src2 >> ($unsigned(ACC)-$unsigned(acc_zc));
        else mts_q_tmp2 <= {(ACC){1'b0}};
        
        mts_q <= mts_q_tmp1[(ACC-1)-:2*MTS+2] + mts_q_tmp2[(ACC-1)-:2*MTS+2]; // 1.f format
    end
end

//-------------------------------------------------
// Convertion to Posit: Normalization
//-------------------------------------------------

wire [REGI+EXP:0] sf_q_us;
assign sf_q_us = $unsigned(sf_q);

always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        sign_sf <= 0;
        regi_q <= 0;
        exp_q <= 0;
    end
    else if (vld_d == 0) begin
        sign_sf <= 0;
        regi_q <= 0;
        exp_q <= 0;    
    end
    else if (acc_rdy) begin // vld_d[7]
        sign_sf <= sf_q_us[REGI+EXP];
        if (sf_q_us[REGI+EXP]) regi_q <= ~(sf_q_us[REGI+EXP:EXP]) + 1;
        else regi_q <= sf_q_us[REGI+EXP:EXP];
        if (ovf || udf || !nzero) exp_q <= {EXP{1'b0}};
        else exp_q <= sf_q_us[EXP-1:0];
    end
end

//-------------------------------------------------
// Convertion to Posit: Encode & Round
//-------------------------------------------------

always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        tmp_pos <= 0;
        tmp_neg <= 0;
        shift_pos <= 0;
        shift_neg <= 0;
        
        tmp <= 0;
    end
    else if (vld_d == 0) begin
        tmp_pos <= 0;
        tmp_neg <= 0;
        shift_pos <= 0;
        shift_neg <= 0;
        
        tmp <= 0;
    end
    else if (acc_rdy) begin
        if (vld_d[8]) begin    
            tmp_pos <= $signed({nzero, 1'b0, exp_q, mts_q[2*MTS:0], {(WIDTH-1){1'b0}}});
            tmp_neg <= $signed({1'b0, nzero, exp_q, mts_q[2*MTS:0], {(WIDTH-1){1'b0}}});
            shift_pos <= regi_q;
            shift_neg <= regi_q - 1;
        end
        if (vld_d[9]) begin  
            if (sign_sf) tmp <= $unsigned(tmp_neg >>> shift_neg);
            else tmp <= $unsigned(tmp_pos >>> shift_pos);
        end
    end 
end

assign lsb_bit = tmp[WTMP-1-(WIDTH-2)];
assign guard_bit = tmp[WTMP-1-(WIDTH-1)];
assign sticky_bit = |tmp[WTMP-1-(WIDTH):0];
assign round_val = (ovf || udf) ? 1'b0 : (guard_bit & (lsb_bit | sticky_bit));
assign tmp_for_round = tmp[WTMP-1:WTMP-1-(WIDTH-2)];

always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        acc_o_tmp <= 0;
        
        vld_o_tmp <= 0;
        acc_o_fin <= 0;
    end
    else if (vld_d == 0) begin
        acc_o_tmp <= 0;
        
        vld_o_tmp <= 0;
        acc_o_fin <= 0;
    end
    else if (acc_rdy) begin
        acc_o_tmp <= tmp_for_round + round_val;
        
        if (vld_d[11] && (~|vld_d[10:0])) begin
            vld_o_tmp <= 1'b1;
            if (!ovf && !udf) begin
                if (sign_q) acc_o_fin <= {sign_q, (~(acc_o_tmp)+1)};
                else acc_o_fin <= {sign_q, acc_o_tmp};
            end
            else if (udf) acc_o_fin <= {WIDTH{1'b0}}; // underflow -> zero
            else if (ovf) begin// NaR -> max
                if (sign_q) acc_o_fin <= $unsigned((1 << (WIDTH-1))+1); 
                else acc_o_fin <= $unsigned((1 << (WIDTH-1))-1);
            end
        end
    end
end
 
//////////////////////////////////////// 

always@(posedge clk_i or negedge rstn) begin
	if(~rstn) begin
		vld_d <= 0;
	end
	else begin
		vld_d <= {vld_d[11-1:0], vld_i};
    end
end

assign vld_o = vld_o_tmp; // ON for 1 clock period
assign acc_o = acc_o_fin;

endmodule
