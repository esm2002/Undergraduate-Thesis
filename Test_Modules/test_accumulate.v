`timescale 1ns / 1ps
module test_accumulate #(
parameter WIDTH=8, 
parameter K=9,
parameter EXP=2, 
parameter MTS=WIDTH-3-EXP,
parameter ACC=(2**EXP)*(WIDTH-2), 
parameter ACC_HEAD=$clog2(K)+2) (
    input clk_i, input rstn,
    input [11:0] vld_d,
    input [2*(WIDTH-2):0] regi_acc,
    input sign_m,
    input [EXP:0] exp_m,
    input [2*(MTS+1)-1:0] mts_m,
    output reg acc_rdy,
    output reg [ACC_HEAD-1:0] acc_100_c,
    output reg [ACC-1:0] acc_000_c,
    output reg [ACC-1:0] acc_001_c,
    output reg [ACC-1:0] acc_010_c,
    output reg [ACC-1:0] acc_011_c
);
localparam WK = $clog2(K);
localparam REGI = $clog2(WIDTH)+1; 
localparam WZC = $clog2(WIDTH-1);
localparam ACCZC = $clog2(ACC);

reg [2:0] acc_num;
reg [WIDTH-3:0] acc_lzd;
reg [EXP:0] bias_exp;
reg signed [2*(MTS+1):0] mts_ms;
wire [WIDTH-3:0] acc_lzd_oh;
wire [WZC:0] bias_zc;
wire [REGI+EXP-1:0] acc_bias;

reg [ACC_HEAD-1:0] acc_100;
reg [ACC:0] acc_000;
reg [ACC:0] acc_001;
reg [ACC:0] acc_010;
reg [ACC:0] acc_011;

reg [WK:0] counter;

//LZD #(.in_s(WIDTH-2)) u_acc_lzd(.in(acc_lzd), .out(bias_zc)); //, .out_s(WZC+1)
// Instance of DW_lzd
DW_lzd #(WIDTH-2) U_LZD2 ( .a(acc_lzd), .dec(acc_lzd_oh), .enc(bias_zc) );

assign acc_bias = acc_num[1] 
    ? (acc_lzd == 0 ? bias_exp : ({ ($unsigned(WIDTH)-2 - bias_zc), {$unsigned(EXP){1'b0}} } + bias_exp)) 
    : (acc_lzd == 0 ? ({ $unsigned(WIDTH)-2, {$unsigned(EXP){1'b0}} } + bias_exp) : ({ bias_zc, {$unsigned(EXP){1'b0}} } + bias_exp));
    
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
                acc_lzd <= ~regi_acc[0+:(WIDTH-2)];
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
            acc_100 <= acc_100_c;
            acc_000 <= acc_000_c;
            acc_001 <= acc_001_c;
            acc_010 <= acc_010_c;
            acc_011 <= acc_011_c;
            
            case (shift_sel)                       
                2'b00: begin //if (acc_bias >= ($unsigned(ACC)-2))
                    case (acc_num)
                        3'b100: begin
                                    acc_100 <= acc_100_c + shift_right[0+:ACC_HEAD];
                                    acc_000 <= acc_000_c + shift_left;
                                end
                        3'b000: begin
                                    acc_100 <= acc_100_c + shift_right[0+:ACC_HEAD];
                                    acc_000 <= acc_000_c + shift_left;
                                end
                        3'b001: begin
                                    acc_100 <= acc_100_c + {(ACC_HEAD){mts_ms[2*(MTS+1)]}};
                                    acc_000 <= acc_000_c + shift_right;
                                    acc_001 <= acc_001_c + shift_left;
                                end
                        3'b010: begin
                                    acc_100 <= acc_100_c + {(ACC_HEAD){mts_ms[2*(MTS+1)]}};
                                    acc_000 <= acc_000_c + {1'b0, {(ACC){mts_ms[2*(MTS+1)]}}};
                                    acc_001 <= acc_001_c + shift_right;
                                    acc_010 <= acc_010_c + shift_left;
                                end
                        3'b011: begin
                                    acc_100 <= acc_100_c + {(ACC_HEAD){mts_ms[2*(MTS+1)]}};
                                    acc_000 <= acc_000_c + {1'b0, {(ACC){mts_ms[2*(MTS+1)]}}};
                                    acc_001 <= acc_001_c + {1'b0, {(ACC){mts_ms[2*(MTS+1)]}}};
                                    acc_010 <= acc_010_c + shift_right;
                                    acc_011 <= acc_011_c + shift_left;
                                end
                        default: ;
                    endcase
                end 
                2'b01: begin //else if (acc_bias < 2*$unsigned(MTS)) begin
                    case (acc_num)
                        3'b100: begin
                                    acc_100 <= acc_100_c + shift_right[0+:ACC_HEAD];
                                    acc_000 <= acc_000_c + shift_left;
                                end
                        3'b000: begin
                                    acc_100 <= acc_100_c + {(ACC_HEAD){mts_ms[2*(MTS+1)]}};
                                    acc_000 <= acc_000_c + shift_right;
                                    acc_001 <= acc_001_c + shift_left;
                                end
                        3'b001: begin
                                    acc_100 <= acc_100_c + {(ACC_HEAD){mts_ms[2*(MTS+1)]}};
                                    acc_000 <= acc_000_c + {1'b0, {(ACC){mts_ms[2*(MTS+1)]}}};
                                    acc_001 <= acc_001_c + shift_right;
                                    acc_010 <= acc_010_c + shift_left;
                                end
                        3'b010: begin
                                    acc_100 <= acc_100_c + {(ACC_HEAD){mts_ms[2*(MTS+1)]}};
                                    acc_000 <= acc_000_c + {1'b0, {(ACC){mts_ms[2*(MTS+1)]}}};
                                    acc_001 <= acc_001_c + {1'b0, {(ACC){mts_ms[2*(MTS+1)]}}};
                                    acc_010 <= acc_010_c + shift_right;
                                    acc_011 <= acc_011_c + shift_left;
                                end
                        default: ;
                    endcase 
                end 
                2'b10: begin //else begin
                    case (acc_num)
                        3'b000: begin
                                    acc_100 <= acc_100_c + {(ACC_HEAD){mts_ms[2*(MTS+1)]}};
                                    acc_000 <= acc_000_c + shift_left;
                                end
                        3'b001: begin
                                    acc_100 <= acc_100_c + {(ACC_HEAD){mts_ms[2*(MTS+1)]}};
                                    acc_000 <= acc_000_c + {1'b0, {(ACC){mts_ms[2*(MTS+1)]}}};
                                    acc_001 <= acc_001_c + shift_left;
                                end
                        3'b010: begin
                                    acc_100 <= acc_100_c + {(ACC_HEAD){mts_ms[2*(MTS+1)]}};
                                    acc_000 <= acc_000_c + {1'b0, {(ACC){mts_ms[2*(MTS+1)]}}};
                                    acc_001 <= acc_001_c + {1'b0, {(ACC){mts_ms[2*(MTS+1)]}}};
                                    acc_010 <= acc_010_c + shift_left;
                                end
                        3'b011: begin
                                    acc_100 <= acc_100_c + {(ACC_HEAD){mts_ms[2*(MTS+1)]}};
                                    acc_000 <= acc_000_c + {1'b0, {(ACC){mts_ms[2*(MTS+1)]}}};
                                    acc_001 <= acc_001_c + {1'b0, {(ACC){mts_ms[2*(MTS+1)]}}};
                                    acc_010 <= acc_010_c + {1'b0, {(ACC){mts_ms[2*(MTS+1)]}}};
                                    acc_011 <= acc_011_c + shift_left;
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
                        input [ACC:0] acc_000, acc_001, acc_010, acc_011, 
                        output [ACC_HEAD-1:0] acc_100_c, 
                        output [ACC-1:0] acc_000_c, acc_001_c, acc_010_c, acc_011_c);
	reg [ACC_HEAD-1:0] acc_100_tmp;
	reg [ACC:0] acc_000_tmp;
	reg [ACC:0] acc_001_tmp;
	reg [ACC:0] acc_010_tmp;
	reg [ACC:0] acc_011_tmp;
	begin
        acc_011_tmp = acc_011;
		acc_010_tmp = acc_010 + {{(ACC){1'b0}}, acc_011_tmp[ACC]};
		acc_001_tmp = acc_001 + {{(ACC){1'b0}}, acc_010_tmp[ACC]};
		acc_000_tmp = acc_000 + {{(ACC){1'b0}}, acc_001_tmp[ACC]};
		acc_100_tmp = acc_100 + {{(ACC){1'b0}}, acc_000_tmp[ACC]};
        
        acc_100_c = acc_100_tmp;
        acc_000_c = acc_000_tmp[ACC-1:0];
        acc_001_c = acc_001_tmp[ACC-1:0];
        acc_010_c = acc_010_tmp[ACC-1:0];
        acc_011_c = acc_011_tmp[ACC-1:0];
	end
endtask


always @(*) begin
    carry_propagation (acc_100, acc_000, acc_001, acc_010, acc_011, 
                       acc_100_c, acc_000_c, acc_001_c, acc_010_c, acc_011_c);
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
    else if (counter == K) begin
        acc_rdy <= 1;
    end
    else ;
end

endmodule
