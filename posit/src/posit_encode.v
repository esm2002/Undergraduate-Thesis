`timescale 1ns / 1ps
module encode #(
parameter WIDTH = 8,
parameter EXP=2,
parameter REGI=$clog2(WIDTH)+1, 
parameter MTS = WIDTH-3-EXP) (
    input clk_i, input rstn,
    input [14:0] vld_d,
    input acc_rdy,
    input sign_q,
    input zc_i,
    input signed [REGI+EXP:0] sf_q,
    input [2*(MTS+1)-1:0] mts_q,
    output reg [WIDTH-1:0] acc_o_fin,
    output reg vld_o_tmp
);

localparam WTMP = 3*WIDTH - EXP - 4;

wire [REGI+EXP:0] sf_q_us;
wire nzero;

reg sign_sf;
reg [REGI:0] regi_sf;
reg [EXP-1:0] exp_sf;
wire ovf_sf;
wire ovf_p;

reg [REGI-1:0] regi_p;
reg [EXP-1:0] exp_p;

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

endmodule


