`timescale 1ns / 1ps
module test_frac_sf #(
parameter WIDTH = 8,          // Bitwidth of inputs                      
parameter K  = 9,
parameter EXP = 2,
parameter ACC=(2**EXP)*(WIDTH-2), 
parameter MTS=WIDTH-3-EXP, 
parameter REGI=$clog2(WIDTH)+1, 
parameter ACC_HEAD = $clog2(K) + 2) (
    input clk_i, input rstn,
    input [11:0] vld_d,
    input acc_rdy,
    input [ACC_HEAD-1:0] acc_100_c,
    input [ACC+2-1:0] acc_000_c, acc_001_c, acc_010_c, acc_011_c,
    output reg sign_q,
    output reg ovf,
    output reg udf,
    output reg nzero,
    output reg signed [REGI+EXP:0] sf_q,
    output reg [2*MTS+1:0] mts_q
);

localparam ACCZC = $clog2(ACC);

wire [ACC_HEAD+4*ACC-1:0] mag_concat;
wire [ACC_HEAD+4*ACC-1:0] mag_acc;

wire [ACC-1:0] mag_000_wo_c;
wire [ACC-1:0] mag_001_wo_c;
wire [ACC-1:0] mag_010_wo_c;
wire [ACC-1:0] mag_011_wo_c;
wire [ACC_HEAD-1:0] mag_100_c;

assign mag_concat = {acc_100_c, acc_000_c[ACC-1:0], acc_001_c[ACC-1:0], acc_010_c[ACC-1:0], acc_011_c[ACC-1:0]};
assign mag_acc = acc_100_c[ACC_HEAD-1] ? (~mag_concat + 1'b1) : mag_concat;

assign mag_011_wo_c = mag_acc[(ACC-1)-:ACC];
assign mag_010_wo_c = mag_acc[(2*ACC-1)-:ACC];
assign mag_001_wo_c = mag_acc[(3*ACC-1)-:ACC];
assign mag_000_wo_c = mag_acc[(4*ACC-1)-:ACC];
assign mag_100_c = mag_acc[(ACC_HEAD+4*ACC-1)-:ACC_HEAD];

reg [ACC-1:0] acc_regi;
wire [ACC-1:0] acc_regi_oh;
wire [ACCZC:0] acc_zc;

reg [ACC-1:0] mts_q_tmp1;
reg [ACC-1:0] mts_q_tmp2;

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
        casez ({(mag_100_c!=0), (mag_000_wo_c!=0), (mag_001_wo_c!=0), (mag_010_wo_c!=0), (mag_011_wo_c!=0)})
            5'b1????: begin // max or overflow
                acc_regi <= 0;
                ovf <= 1'b1;
                udf <= 0;
                nzero <= 1'b1;
            end
            5'b01???: begin // max or overflow
                acc_regi <= 0;
                ovf <= 1'b1;
                udf <= 0;
                nzero <= 1'b1;
            end
            5'b001??: begin // positive scale factor
                acc_regi <= mag_001_wo_c; 
                ovf <= 0;
                udf <= 0;
                nzero <= 1'b1;
            end
            5'b0001?: begin // negative scale factor 
                acc_regi <= mag_010_wo_c; 
                ovf <= 0;
                udf <= 0;
                nzero <= 1'b1;
            end
            5'b00001: begin // underflow
                acc_regi <= 0; 
                ovf <= 0;
                udf <= 1'b1;
                nzero <= 1'b1;
            end
            5'b00000: begin // 0 for zero
                acc_regi <= 0; 
                ovf <= 0;
                udf <= 1'b1;
                nzero <= 0;
            end
        endcase
//        if ((mag_100_c != 0) || (mag_000_wo_c != 0)) begin
//            acc_regi <= 0; // max or overflow
//            ovf <= 1'b1;
//        end else if ((mag_001_wo_c == 0) && (mag_010_wo_c == 0)) begin
//            acc_regi <= 0; // underflow
//            udf <= 1'b1;
//            if (mag_011_wo_c == 0) nzero <= 0; // 0 for zero
//        end else if (mag_001_wo_c != 0) acc_regi <= mag_001_wo_c;// positive scale factor
//        else acc_regi <= mag_010_wo_c;// negative scale factor 
    end
end

//LZD #(.in_s(ACC)) u_regi_lzd(.in(acc_regi), .out(acc_zc));
// Instance of DW_lzd
DW_lzd #(ACC) U_LZD3 (.a(acc_regi), .dec(acc_regi_oh), .enc(acc_zc));
 
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

endmodule
