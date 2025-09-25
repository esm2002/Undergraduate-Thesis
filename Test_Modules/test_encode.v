`timescale 1ns / 1ps
module test_encode #(
parameter WIDTH = 8,
parameter EXP=2,
parameter REGI=$clog2(WIDTH)+1, 
parameter MTS = WIDTH-3-EXP) (
    input clk_i, input rstn,
    input [11:0] vld_d,
    input acc_rdy,
    input ovf, udf, nzero,
    input sign_q, 
    input signed [REGI+EXP:0] sf_q,
    input [2*MTS+1:0] mts_q,
    output reg [WIDTH-1:0] acc_o_fin,
    output reg vld_o_tmp
);

localparam WTMP = 3*WIDTH - EXP - 4;

reg sign_sf;
reg [REGI-1:0] regi_q;
reg [EXP-1:0] exp_q;

reg signed [WTMP-1:0] tmp_bf_sft;
reg [REGI-2:0] shift_val;

reg [WTMP-1:0] tmp;
wire lsb_bit;
wire guard_bit;
wire sticky_bit;
wire round_val;
wire [WIDTH-2:0] tmp_for_round;
reg [WIDTH-2:0] acc_o_tmp;

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

always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        tmp_bf_sft <= 0;
        shift_val <= 0;
        
        tmp <= 0;
    end
    else if (vld_d == 0) begin
        tmp_bf_sft <= 0;
        shift_val <= 0;
        
        tmp <= 0;
    end
    else if (acc_rdy) begin
        if (vld_d[8]) begin    
            tmp_bf_sft <= $signed({(~sign_sf & nzero), (sign_sf & nzero), exp_q, mts_q[2*MTS:0], {(WIDTH-1){1'b0}}});
            shift_val <= (sign_sf) ? regi_q-1 : regi_q;
        end
        if (vld_d[9]) begin  
            tmp <= $unsigned(tmp_bf_sft >>> shift_val);
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

endmodule


