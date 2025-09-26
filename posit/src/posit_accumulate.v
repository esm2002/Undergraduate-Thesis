`timescale 1ns / 1ps
module accumulate #(
parameter WIDTH=8, 
parameter K=9,
parameter EXP=2, 
parameter MTS=WIDTH-3-EXP,
parameter REGI = $clog2(WIDTH)+1,
parameter BIAS = 2**(EXP+1)*(WIDTH-2),
parameter WK = $clog2(K),
parameter WIDTH_A = WK + 2*BIAS + 2) (
    input clk_i, input rstn,
    input [14:0] vld_d,
    input signed [REGI+EXP-1:0] sf_w,
    input signed [REGI+EXP-1:0] sf_d,
    input sign_m,
    input [2*(MTS+1)-1:0] mts_m,
    output reg acc_rdy,
    output reg signed [WIDTH_A-1:0] acc // bit configuration: WIDTH_A = BIAS + 2 + BIAS
);

wire ovf_m;
wire signed [REGI+EXP:0] sf_m;
wire [2*(MTS+1):0] norm_mts_m;

reg [REGI+EXP+1:0] sf_bias;
reg signed [2*(MTS+1):0] mts_ms;
reg signed [WIDTH_A-1:0] mts_fx;

reg [WK:0] counter;

assign ovf_m = mts_m[2*(MTS+1)-1]; // 1 for overflow
assign sf_m = sf_w + sf_d - $signed(ovf_m);
assign norm_mts_m = ovf_m ? {1'b0, mts_m[2*(MTS+1)-1:0]} : {mts_m, 1'b0}; // always msb bit = 0

always @(posedge clk_i or negedge rstn) begin
    if (~rstn) begin
        sf_bias <= 0;
        mts_ms <= 0;
        
        mts_fx <= 0;
    end
    else begin
        if (vld_d[3]) sf_bias <= $unsigned(sf_m + BIAS - 2*MTS - 1);
        
        if (sign_m) mts_ms <= $signed(~(norm_mts_m) + 1);
        else mts_ms <= $signed(norm_mts_m);
        
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

endmodule
