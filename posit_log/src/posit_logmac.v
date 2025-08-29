`timescale 1ns/1ps
module posit_logmac #(
parameter WIDTH = 8,          // Bitwidth of inputs                      
parameter K  = 9, 
parameter EXP = 2       // Number of exponent bits                 
)( // revised from '$clog2(WIDTH_A)' to '$clog2(2*BIAS+1)'
input clk_i,
input rstn,
(* IOB = "TRUE" *) input vld_i, 
(* IOB = "TRUE" *) input signed [WIDTH-1:0] win, 
(* IOB = "TRUE" *) input signed [WIDTH-1:0] din, 
(* IOB = "TRUE" *) output[WIDTH-1:0] acc_o,
(* IOB = "TRUE" *) output  vld_o
);

localparam WK = $clog2(K);
localparam REGI = $clog2(WIDTH)+1;      // Number of regime bits   
localparam MTS = WIDTH-3-EXP;       // Maximum number of mantissa bits  
localparam USEED = 2**(2**EXP);  // max = useed^(width-2) = 16777216, min = useed^(-width+2)                
localparam BIAS = 2**(EXP+1)*(WIDTH-2);                   
localparam WIDTH_A = WK + 2*BIAS + 2;
localparam WZC = $clog2(WIDTH_A);
localparam WTMP = 3*WIDTH - EXP - 4;

wire sign_w;
wire sign_d;
wire [REGI-1:0] regi_w;
wire [REGI-1:0] regi_d;
wire [EXP-1:0] exp_w;
wire [EXP-1:0] exp_d;
wire [MTS-1:0] mts_w;
wire [MTS-1:0] mts_d;
wire [1:0] vld_o_w;
wire [1:0] vld_o_d;
wire decode_w;
wire decode_d;

reg signed [REGI+EXP+MTS:0] log_mul;
reg sign_m;

(* use_dsp = "yes" *) reg [REGI+EXP+1:0] sf_bias;
(* use_dsp = "yes" *) reg signed [MTS+1:0] mts_ms;
reg signed [WIDTH_A-1:0] mts_fx;

reg [WK:0] counter;
reg acc_rdy;
(* use_dsp = "yes" *) reg signed [WIDTH_A-1:0] acc; // bit configuration: WIDTH_A = BIAS + 2 + BIAS

reg sign_q;
(* use_dsp = "yes" *) reg [WIDTH_A-1:0] acc_mag;
wire [WIDTH_A-1:0] acc_mag_oh;
wire [WZC:0] zc;
//wire vld;

(* use_dsp = "yes" *) reg signed [REGI+EXP:0] sf_q;
reg [WIDTH_A-1:0] mts_tmp;
wire [REGI+EXP:0] sf_q_us;

reg [2*(MTS+1)-1:0] mts_q;
wire nzero;
reg sign_sf;
(* use_dsp = "yes" *) reg [REGI:0] regi_sf;
reg [EXP-1:0] exp_sf;
wire ovf_sf;
wire ovf_p;

reg [REGI-1:0] regi_p;
reg [EXP-1:0] exp_p;

reg signed [WTMP-1:0] tmp_pos;
reg signed [WTMP-1:0] tmp_neg;
reg [REGI-2:0] shift_pos;
(* use_dsp = "yes" *) reg [REGI-2:0] shift_neg;

reg [WTMP-1:0] tmp;
wire lsb_bit;
wire guard_bit;
wire sticky_bit;
wire round_val;
wire [WIDTH-2:0] tmp_for_round;
(* use_dsp = "yes" *) reg [WIDTH-2:0] acc_o_tmp;

reg [WIDTH-1:0] acc_o_fin;

reg vld_o_tmp;
reg [14:0] vld_d;

//-------------------------------------------------
// Decode & Multiplication
//-------------------------------------------------

decoder #(.in_s(WIDTH), .exp_s(EXP)) u_decode_w(.clk_i(clk_i), .rstn(rstn), .in(win), .vld_i(vld_i), .sign(sign_w), .regi(regi_w), .exp(exp_w), .mts(mts_w), .vld_o_type(vld_o_w), .vld_o(decode_w));
decoder #(.in_s(WIDTH), .exp_s(EXP)) u_decode_d(.clk_i(clk_i), .rstn(rstn), .in(din), .vld_i(vld_i), .sign(sign_d), .regi(regi_d), .exp(exp_d), .mts(mts_d), .vld_o_type(vld_o_d), .vld_o(decode_d));

always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        log_mul <= 0;
        sign_m <= 0;
    end
    else if (decode_w && decode_d) begin
        if (vld_o_w[0] && vld_o_d[0]) begin // both valid
            log_mul <= $signed({regi_w, exp_w, mts_w}) + $signed({regi_d, exp_d, mts_d});
            sign_m <= sign_w ^ sign_d;
        end
        else if ((vld_o_w==0) || (vld_o_d==0)) begin
            log_mul <= 0;
            sign_m <= 0;
        end
    end
end

//-------------------------------------------------
// Conversion to Fixed-Point
//-------------------------------------------------

always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        sf_bias <= 0;
        mts_ms <= 0;
        
        mts_fx <= 0;
    end
    else begin
        if (vld_d[3]) sf_bias <= $unsigned($signed(log_mul[REGI+EXP+MTS:MTS]) + BIAS - MTS);
        
        if (log_mul == 0) mts_ms <= {{(MTS+2){1'b0}}};
        else if (sign_m) mts_ms <= $signed(~({1'b0, 1'b1, log_mul[MTS-1:0]}) + 1);
        else mts_ms <= $signed({1'b0, 1'b1, log_mul[MTS-1:0]});
        
        if (vld_d[4]) mts_fx <= (mts_ms << sf_bias);
    end
end

//-------------------------------------------------
// Accumulation
//-------------------------------------------------


always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        counter <= 0;
        acc_rdy <= 0;
        acc <= 0;
    end
    else if (vld_d == 0) begin
        counter <= 0;
        acc_rdy <= 0;
        acc <= 0;
    end
    else if (vld_d[5] & counter < K) begin 
        counter <= counter + 1;
        acc_rdy <= 0;
        acc <= $signed(acc) + $signed(mts_fx); // bit configuration: WIDTH_A = BIAS + 2 + BIAS
    end
    else if (counter == K) acc_rdy <= 1;
    else ;
end

//-------------------------------------------------
// Convertion to Posit: Fraction & SF Extraction
//-------------------------------------------------

reg zc_i;

always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        sign_q <= 0;
        acc_mag <= 0;
        zc_i <= 0;
    end
    else if (vld_d == 0) begin
        sign_q <= 0;
        acc_mag <= 0;
        zc_i <= 0;
    end
    else if (acc_rdy) begin
        sign_q <= acc[WIDTH_A-1];
        if (acc[WIDTH_A-1]) acc_mag <= $unsigned(~(acc) + 1);
        else acc_mag <= $unsigned(acc);
        zc_i <= 1'b1;
    end
end

//LZD #(.in_s(WIDTH_A)) u_lzd(.in(acc_mag), .out(zc));
// Instance of DW_lzd
DW_lzd #(WIDTH_A) U_LZD0 ( .a(acc_mag), .dec(acc_mag_oh), .enc(zc) );
 
always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        sf_q <= 0;
        mts_tmp <= 0;
        
        mts_q <= 0;
    end   
    else if (vld_d == 0) begin
        sf_q <= 0;
        mts_tmp <= 0;
        
        mts_q <= 0;
    end 
    else if (acc_rdy & zc_i) begin
        sf_q <= (acc_mag == 0) ? $signed($unsigned(WK) + $unsigned(BIAS) + 1'b1 - $unsigned(WIDTH_A)) : $signed($unsigned(WK) + $unsigned(BIAS) + 1'b1 - zc); // 1 <= zc <= 2*BIAS+2 // -BIAS-1 <= sf_q <= BIAS
        mts_tmp <= acc_mag << zc;
        
        mts_q <= mts_tmp[WIDTH_A-1:WIDTH_A-1-(2*(MTS+1)-1)]; // 1.f format
    end
end

//-------------------------------------------------
// Convertion to Posit: NOrmalization
//-------------------------------------------------

assign nzero = |mts_q; // 1 for non-zero (1.f format)
assign sf_q_us = $unsigned(sf_q);

always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        sign_sf <= 0;
        regi_sf <= 0;
        exp_sf <= 0;
    end
    else if (vld_d == 0) begin
        sign_sf <= 0;
        regi_sf <= 0;
        exp_sf <= 0;
    end
    else if (acc_rdy & zc_i) begin    
        sign_sf <= sf_q_us[REGI+EXP];
        if (sf_q_us[REGI+EXP]) regi_sf <= ~(sf_q_us[REGI+EXP:EXP]) + 1;
        else regi_sf <= sf_q_us[REGI+EXP:EXP];
        exp_sf <= sf_q_us[EXP-1:0];
    end
end

assign ovf_sf = sign_sf; //regi_sf[REGI]; // overflow: quire regime mag = 1xxxx
assign ovf_p = regi_sf[REGI-1] || ((!regi_sf[REGI-1]) && (&regi_sf[REGI-2:0])); // overflow: output posit regime mag = 0111

always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        regi_p <= 0;
        exp_p <= 0;
    end
    else if (vld_d == 0) begin
        regi_p <= 0;
        exp_p <= 0;    
    end
    else if (acc_rdy & zc_i) begin    
        if (ovf_p) begin
            regi_p <= regi_sf;
            exp_p <= {EXP{1'b0}};
        end
        else begin
            regi_p <= regi_sf;
            if (!nzero) exp_p <= {EXP{1'b0}};
            else exp_p <= exp_sf;
        end
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
        if (vld_d[11]) begin    
            tmp_pos <= $signed({nzero, 1'b0, exp_p, mts_q[2*MTS:0], {(WIDTH-1){1'b0}}});
            tmp_neg <= $signed({1'b0, nzero, exp_p, mts_q[2*MTS:0], {(WIDTH-1){1'b0}}});
            shift_pos <= regi_p;
            shift_neg <= regi_p - 1;
        end
        if (vld_d[12]) begin  
            if (sign_sf) tmp <= $unsigned(tmp_neg >>> shift_neg);
            else tmp <= $unsigned(tmp_pos >>> shift_pos);
        end
    end 
end

assign lsb_bit = tmp[WTMP-1-(WIDTH-2)];
assign guard_bit = tmp[WTMP-1-(WIDTH-1)];
assign sticky_bit = |tmp[WTMP-1-(WIDTH):0];
assign round_val = (ovf_p) ? 1'b0 : (guard_bit & (lsb_bit | sticky_bit));
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
    else if (acc_rdy & zc_i) begin
        acc_o_tmp <= tmp_for_round + round_val;
        
        if (vld_d[14] && (~|vld_d[13:0])) begin
            vld_o_tmp <= 1'b1;
            if (!ovf_p) begin
                if (sign_q) acc_o_fin <= {sign_q, (~(acc_o_tmp)+1)};
                else acc_o_fin <= {sign_q, acc_o_tmp};
            end
            else if (ovf_sf && ovf_p) acc_o_fin <= {WIDTH{1'b0}}; // underflow -> zero
            else if (!ovf_sf && ovf_p) begin// NaR -> max
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
		vld_d <= {vld_d[14-1:0], vld_i};
    end
end

assign vld_o = vld_o_tmp; // ON for 1 clock period
assign acc_o = acc_o_fin;

endmodule
