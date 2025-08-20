/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in topographical mode
// Version   : V-2023.12-SP5-3
// Date      : Wed Aug 20 14:07:30 2025
/////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module SNPS_CLOCK_GATE_HIGH_decoder_0_3 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  C8T28SOI_LRP_CNHLSX4_P16 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_decoder_0_2 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  C8T28SOI_LRP_CNHLSX4_P16 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module decoder_1 ( clk_i, rstn, in, vld_i, sign, regi, exp, mts, vld_o_type, 
        vld_o );
  input [7:0] in;
  output [3:0] regi;
  output [1:0] exp;
  output [2:0] mts;
  output [1:0] vld_o_type;
  input clk_i, rstn, vld_i;
  output sign, vld_o;
  wire   in_sign, vld_iz, in_sign_tmp, vld_i_tmp, in_mag_o_6_, n31, n32, n33,
         n34, n35, n36, n46, n47, n48, n49, n50, n51, n95, n96, n97, n98, n99,
         n100, n101, n102, n107, n108, net3265, net3271, n75, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n24, n25, n26, n27, n28, n29, n30, n37, n38, n39, n40,
         n41, n42, n43, n44, n45;
  wire   [6:0] in_lzd;
  wire   [6:0] in_mag_tmp;
  wire   [6:0] in_mag;
  wire   [2:0] zc_o;

  SNPS_CLOCK_GATE_HIGH_decoder_0_3 clk_gate_out_vld_reg_0 ( .CLK(clk_i), .EN(
        vld_iz), .ENCLK(net3265), .TE(in_lzd[6]) );
  SNPS_CLOCK_GATE_HIGH_decoder_0_2 clk_gate_in_mag_tmp_reg ( .CLK(clk_i), .EN(
        vld_i), .ENCLK(net3271), .TE(in_lzd[6]) );
  C8T28SOI_LR_DFPRQX4_P0 in_sign_tmp_reg ( .D(in[7]), .CP(net3271), .RN(rstn), 
        .Q(in_sign_tmp) );
  C8T28SOI_LR_DFPRQX4_P0 vld_i_tmp_reg ( .D(vld_i), .CP(clk_i), .RN(rstn), .Q(
        vld_i_tmp) );
  C8T28SOI_LR_DFPRQX4_P0 in_tmp_reg_6_ ( .D(n99), .CP(net3265), .RN(rstn), .Q(
        exp[1]) );
  C8T28SOI_LR_DFPRQX4_P0 in_tmp_reg_5_ ( .D(n98), .CP(net3265), .RN(rstn), .Q(
        exp[0]) );
  C8T28SOI_LR_DFPRQX4_P0 in_sign_reg ( .D(in_sign_tmp), .CP(clk_i), .RN(rstn), 
        .Q(in_sign) );
  C8T28SOI_LR_DFPRQX4_P0 in_sign_o_reg ( .D(in_sign), .CP(net3265), .RN(rstn), 
        .Q(sign) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_tmp_reg_5_ ( .D(n35), .CP(net3271), .RN(rstn), 
        .Q(in_mag_tmp[5]) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_tmp_reg_4_ ( .D(n34), .CP(net3271), .RN(rstn), 
        .Q(in_mag_tmp[4]) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_tmp_reg_3_ ( .D(n33), .CP(net3271), .RN(rstn), 
        .Q(in_mag_tmp[3]) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_tmp_reg_2_ ( .D(n32), .CP(net3271), .RN(rstn), 
        .Q(in_mag_tmp[2]) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_tmp_reg_1_ ( .D(n31), .CP(net3271), .RN(rstn), 
        .Q(in_mag_tmp[1]) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_tmp_reg_0_ ( .D(in[0]), .CP(net3271), .RN(rstn), .Q(in_mag_tmp[0]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_iz_reg ( .D(vld_i_tmp), .CP(clk_i), .RN(rstn), 
        .Q(vld_iz) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_tmp_reg_6_ ( .D(n36), .CP(net3271), .RN(rstn), 
        .Q(in_mag_tmp[6]) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_reg_5_ ( .D(in_mag_tmp[5]), .CP(clk_i), .RN(
        rstn), .Q(in_mag[5]) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_reg_4_ ( .D(in_mag_tmp[4]), .CP(clk_i), .RN(
        rstn), .Q(in_mag[4]) );
  C8T28SOI_LR_DFPRQX4_P0 out_vld_reg ( .D(n75), .CP(net3265), .RN(rstn), .Q(
        vld_o) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_reg_6_ ( .D(in_mag_tmp[6]), .CP(clk_i), .RN(
        rstn), .Q(in_mag[6]) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_reg_3_ ( .D(in_mag_tmp[3]), .CP(clk_i), .RN(
        rstn), .Q(in_mag[3]) );
  C8T28SOI_LR_DFPRQX4_P0 zc_o_reg_1_ ( .D(n101), .CP(net3265), .RN(rstn), .Q(
        zc_o[1]) );
  C8T28SOI_LR_DFPRQX4_P0 zc_o_reg_2_ ( .D(n102), .CP(net3265), .RN(rstn), .Q(
        zc_o[2]) );
  C8T28SOI_LR_DFPRQX4_P0 out_type_reg_1_ ( .D(n108), .CP(net3265), .RN(rstn), 
        .Q(vld_o_type[1]) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_reg_0_ ( .D(in_mag_tmp[0]), .CP(clk_i), .RN(
        rstn), .Q(in_mag[0]) );
  C8T28SOI_LR_DFPRQX4_P0 zc_o_reg_0_ ( .D(n100), .CP(net3265), .RN(rstn), .Q(
        zc_o[0]) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_o_reg_6_ ( .D(in_mag[6]), .CP(net3265), .RN(
        rstn), .Q(in_mag_o_6_) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_reg_1_ ( .D(in_mag_tmp[1]), .CP(clk_i), .RN(
        rstn), .Q(in_mag[1]) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_reg_2_ ( .D(in_mag_tmp[2]), .CP(clk_i), .RN(
        rstn), .Q(in_mag[2]) );
  C8T28SOI_LR_DFPRQX4_P0 in_lzd_reg_5_ ( .D(n51), .CP(clk_i), .RN(rstn), .Q(
        in_lzd[5]) );
  C8T28SOI_LR_DFPRQX4_P0 out_type_reg_0_ ( .D(n107), .CP(net3265), .RN(rstn), 
        .Q(vld_o_type[0]) );
  C8T28SOI_LR_DFPRQX4_P0 in_lzd_reg_4_ ( .D(n50), .CP(clk_i), .RN(rstn), .Q(
        in_lzd[4]) );
  C8T28SOI_LR_DFPRQX4_P0 in_lzd_reg_3_ ( .D(n49), .CP(clk_i), .RN(rstn), .Q(
        in_lzd[3]) );
  C8T28SOI_LR_DFPRQX4_P0 in_lzd_reg_1_ ( .D(n47), .CP(clk_i), .RN(rstn), .Q(
        in_lzd[1]) );
  C8T28SOI_LR_DFPRQX4_P0 in_lzd_reg_0_ ( .D(n46), .CP(clk_i), .RN(rstn), .Q(
        in_lzd[0]) );
  C8T28SOI_LR_DFPRQX4_P0 in_lzd_reg_2_ ( .D(n48), .CP(clk_i), .RN(rstn), .Q(
        in_lzd[2]) );
  C8T28SOI_LR_DFPRQX4_P0 in_tmp_reg_4_ ( .D(n97), .CP(net3265), .RN(rstn), .Q(
        mts[2]) );
  C8T28SOI_LR_DFPRQX4_P0 in_tmp_reg_2_ ( .D(n95), .CP(net3265), .RN(rstn), .Q(
        mts[0]) );
  C8T28SOI_LR_DFPRQX4_P0 in_tmp_reg_3_ ( .D(n96), .CP(net3265), .RN(rstn), .Q(
        mts[1]) );
  C8T28SOI_LR_CNNAND2X8_P16 U7 ( .A(in[0]), .B(in[7]), .Z(n1) );
  C8T28SOI_LRS_XNOR2X3_P0 U8 ( .A(in[1]), .B(n1), .Z(n31) );
  C8T28SOI_LR_OAI12X3_P0 U9 ( .A(in[0]), .B(in[1]), .C(in[7]), .Z(n2) );
  C8T28SOI_LRS_XNOR2X3_P0 U10 ( .A(in[2]), .B(n2), .Z(n32) );
  C8T28SOI_LR_OR3X5_P0 U11 ( .A(in[2]), .B(in[0]), .C(in[1]), .Z(n4) );
  C8T28SOI_LR_CNNAND2X8_P16 U12 ( .A(in[7]), .B(n4), .Z(n3) );
  C8T28SOI_LRS_XNOR2X3_P0 U13 ( .A(in[3]), .B(n3), .Z(n33) );
  C8T28SOI_LR_CNXOR2X9_P16 U14 ( .A(in_mag_tmp[6]), .S(in_mag_tmp[0]), .Z(n46)
         );
  C8T28SOI_LR_CNXOR2X9_P16 U15 ( .A(in_mag_tmp[6]), .S(in_mag_tmp[2]), .Z(n48)
         );
  C8T28SOI_LR_CNXOR2X9_P16 U16 ( .A(in_mag_tmp[6]), .S(in_mag_tmp[5]), .Z(n51)
         );
  C8T28SOI_LR_CNXOR2X9_P16 U17 ( .A(in_mag_tmp[6]), .S(in_mag_tmp[1]), .Z(n47)
         );
  C8T28SOI_LR_CNXOR2X9_P16 U18 ( .A(in_mag_tmp[6]), .S(in_mag_tmp[3]), .Z(n49)
         );
  C8T28SOI_LR_CNXOR2X9_P16 U19 ( .A(in_mag_tmp[6]), .S(in_mag_tmp[4]), .Z(n50)
         );
  C8T28SOI_LR_CNNOR2X8_P16 U20 ( .A(in[3]), .B(n4), .Z(n44) );
  C8T28SOI_LR_CNNAND2AX9_P16 U21 ( .A(in[4]), .B(n44), .Z(n8) );
  C8T28SOI_LR_CNNAND2X8_P16 U22 ( .A(in[7]), .B(n8), .Z(n5) );
  C8T28SOI_LRS_XNOR2X3_P0 U23 ( .A(in[5]), .B(n5), .Z(n35) );
  C8T28SOI_LR_CNIVX4_P16 U24 ( .A(in_mag[2]), .Z(n30) );
  C8T28SOI_LR_CNIVX4_P16 U25 ( .A(in_mag[1]), .Z(n24) );
  C8T28SOI_LR_NOR4CDX2_P0 U26 ( .C(n30), .D(n24), .A(in_mag[0]), .B(in_mag[6]), 
        .Z(n7) );
  C8T28SOI_LR_NOR3X3_P0 U27 ( .A(in_mag[3]), .B(in_mag[5]), .C(in_mag[4]), .Z(
        n6) );
  C8T28SOI_LR_NAND2X4_P0 U28 ( .A(n7), .B(n6), .Z(n107) );
  C8T28SOI_LR_NOR2AX4_P0 U29 ( .A(in_sign), .B(n107), .Z(n108) );
  C8T28SOI_LR_OAI12X3_P0 U30 ( .A(in[5]), .B(n8), .C(in[7]), .Z(n9) );
  C8T28SOI_LRS_XNOR2X3_P0 U31 ( .A(in[6]), .B(n9), .Z(n36) );
  C8T28SOI_LR_NOR3X3_P0 U32 ( .A(zc_o[2]), .B(zc_o[1]), .C(zc_o[0]), .Z(n10)
         );
  C8T28SOI_LRS_XNOR2X3_P0 U33 ( .A(in_mag_o_6_), .B(n10), .Z(regi[3]) );
  C8T28SOI_LR_CNNOR2X8_P16 U34 ( .A(zc_o[1]), .B(zc_o[0]), .Z(n12) );
  C8T28SOI_LR_CNXOR2X9_P16 U35 ( .A(in_mag_o_6_), .S(zc_o[2]), .Z(n11) );
  C8T28SOI_LRS_XNOR2X3_P0 U36 ( .A(n12), .B(n11), .Z(regi[2]) );
  C8T28SOI_LR_CNIVX4_P16 U37 ( .A(in_lzd[5]), .Z(n20) );
  C8T28SOI_LR_CNNOR2X8_P16 U38 ( .A(in_lzd[4]), .B(in_lzd[3]), .Z(n21) );
  C8T28SOI_LR_NAND2X4_P0 U39 ( .A(n20), .B(n21), .Z(n43) );
  C8T28SOI_LR_CNIVX4_P16 U40 ( .A(n43), .Z(n102) );
  C8T28SOI_LR_NOR2X4_P0 U41 ( .A(in_lzd[4]), .B(n30), .Z(n13) );
  C8T28SOI_LR_AOI22X2_P0 U42 ( .A(in_lzd[4]), .B(in_mag[3]), .C(in_lzd[3]), 
        .D(n13), .Z(n16) );
  C8T28SOI_LR_NAND3X3_P0 U43 ( .A(in_lzd[2]), .B(n102), .C(in_mag[1]), .Z(n15)
         );
  C8T28SOI_LR_CNNAND2X8_P16 U44 ( .A(in_mag[4]), .B(in_lzd[5]), .Z(n14) );
  C8T28SOI_LR_OAI211X3_P0 U45 ( .A(n16), .B(in_lzd[5]), .C(n15), .D(n14), .Z(
        n99) );
  C8T28SOI_LR_CNIVX4_P16 U46 ( .A(in_lzd[0]), .Z(n18) );
  C8T28SOI_LR_CNIVX4_P16 U47 ( .A(in_lzd[2]), .Z(n17) );
  C8T28SOI_LR_CBI4I6X3_P0 U48 ( .A(in_lzd[1]), .B(n18), .C(n17), .D(in_lzd[3]), 
        .Z(n19) );
  C8T28SOI_LR_OAI12X3_P0 U49 ( .A(in_lzd[4]), .B(n19), .C(n20), .Z(n100) );
  C8T28SOI_LR_CBI4I6X3_P0 U50 ( .A(in_lzd[2]), .B(in_lzd[1]), .C(n21), .D(
        in_lzd[5]), .Z(n101) );
  C8T28SOI_LR_OAI12X3_P0 U51 ( .A(n21), .B(n100), .C(n20), .Z(n39) );
  C8T28SOI_LR_CNIVX4_P16 U52 ( .A(n39), .Z(n22) );
  C8T28SOI_LR_CNIVX4_P16 U53 ( .A(n101), .Z(n28) );
  C8T28SOI_LR_CNNAND2X8_P16 U54 ( .A(in_mag[0]), .B(n28), .Z(n42) );
  C8T28SOI_LR_CNNOR2X8_P16 U55 ( .A(n22), .B(n42), .Z(n95) );
  C8T28SOI_LR_CNIVX4_P16 U56 ( .A(n100), .Z(n25) );
  C8T28SOI_LR_OAI22X3_P0 U57 ( .A(n100), .B(in_mag[0]), .C(in_mag[1]), .D(n25), 
        .Z(n40) );
  C8T28SOI_LR_CNNOR2X8_P16 U58 ( .A(n22), .B(n40), .Z(n96) );
  C8T28SOI_LR_CNIVX4_P16 U61 ( .A(n102), .Z(n37) );
  C8T28SOI_LR_CNNAND2X8_P16 U62 ( .A(n25), .B(n24), .Z(n26) );
  C8T28SOI_LR_OAI211X3_P0 U63 ( .A(n39), .B(in_mag[0]), .C(n37), .D(n26), .Z(
        n27) );
  C8T28SOI_LR_AOI12X3_P0 U64 ( .A(n28), .B(n30), .C(n27), .Z(n97) );
  C8T28SOI_LR_OAI12X3_P0 U65 ( .A(in_mag[3]), .B(n101), .C(n100), .Z(n29) );
  C8T28SOI_LR_OAI12X3_P0 U66 ( .A(n30), .B(n100), .C(n29), .Z(n38) );
  C8T28SOI_LR_OAI211AX3_P0 U67 ( .A(n40), .B(n39), .C(n38), .D(n37), .Z(n41)
         );
  C8T28SOI_LR_OAI12X3_P0 U68 ( .A(n43), .B(n42), .C(n41), .Z(n98) );
  C8T28SOI_LR_CNNOR2AX9_P16 U69 ( .A(in[7]), .B(n44), .Z(n45) );
  C8T28SOI_LR_CNXOR2X9_P16 U70 ( .A(in[4]), .S(n45), .Z(n34) );
  C8T28SOI_LR_CNXOR2X9_P16 U71 ( .A(in_mag_o_6_), .S(zc_o[0]), .Z(regi[0]) );
  C8T28SOI_LR_CNXOR2X9_P16 U72 ( .A(zc_o[1]), .S(regi[0]), .Z(regi[1]) );
  C8T28SOI_LR_TOLX5 U3 ( .TL(in_lzd[6]) );
  C8T28SOI_LR_TOHX5 U4 ( .TH(n75) );
endmodule


module SNPS_CLOCK_GATE_HIGH_decoder_0_0 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  C8T28SOI_LRP_CNHLSX4_P16 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_decoder_0_1 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  C8T28SOI_LRP_CNHLSX4_P16 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module decoder_0 ( clk_i, rstn, in, vld_i, sign, regi, exp, mts, vld_o_type, 
        vld_o );
  input [7:0] in;
  output [3:0] regi;
  output [1:0] exp;
  output [2:0] mts;
  output [1:0] vld_o_type;
  input clk_i, rstn, vld_i;
  output sign, vld_o;
  wire   in_sign, vld_iz, in_sign_tmp, vld_i_tmp, in_mag_o_6_, n31, n32, n33,
         n34, n35, n36, n46, n47, n48, n49, n50, n51, n95, n96, n97, n98, n99,
         n100, n101, n102, n107, n108, net3265, net3271, n76, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179;
  wire   [6:0] in_lzd;
  wire   [6:0] in_mag_tmp;
  wire   [6:0] in_mag;
  wire   [2:0] zc_o;

  SNPS_CLOCK_GATE_HIGH_decoder_0_0 clk_gate_out_vld_reg_0 ( .CLK(clk_i), .EN(
        vld_iz), .ENCLK(net3265), .TE(in_lzd[6]) );
  SNPS_CLOCK_GATE_HIGH_decoder_0_1 clk_gate_in_mag_tmp_reg ( .CLK(clk_i), .EN(
        vld_i), .ENCLK(net3271), .TE(in_lzd[6]) );
  C8T28SOI_LR_DFPRQX4_P0 in_sign_tmp_reg ( .D(in[7]), .CP(net3271), .RN(rstn), 
        .Q(in_sign_tmp) );
  C8T28SOI_LR_DFPRQX4_P0 vld_i_tmp_reg ( .D(vld_i), .CP(clk_i), .RN(rstn), .Q(
        vld_i_tmp) );
  C8T28SOI_LR_DFPRQX4_P0 in_tmp_reg_6_ ( .D(n99), .CP(net3265), .RN(rstn), .Q(
        exp[1]) );
  C8T28SOI_LR_DFPRQX4_P0 in_tmp_reg_5_ ( .D(n98), .CP(net3265), .RN(rstn), .Q(
        exp[0]) );
  C8T28SOI_LR_DFPRQX4_P0 in_sign_reg ( .D(in_sign_tmp), .CP(clk_i), .RN(rstn), 
        .Q(in_sign) );
  C8T28SOI_LR_DFPRQX4_P0 in_sign_o_reg ( .D(in_sign), .CP(net3265), .RN(rstn), 
        .Q(sign) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_tmp_reg_5_ ( .D(n35), .CP(net3271), .RN(rstn), 
        .Q(in_mag_tmp[5]) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_tmp_reg_4_ ( .D(n34), .CP(net3271), .RN(rstn), 
        .Q(in_mag_tmp[4]) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_tmp_reg_3_ ( .D(n33), .CP(net3271), .RN(rstn), 
        .Q(in_mag_tmp[3]) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_tmp_reg_2_ ( .D(n32), .CP(net3271), .RN(rstn), 
        .Q(in_mag_tmp[2]) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_tmp_reg_1_ ( .D(n31), .CP(net3271), .RN(rstn), 
        .Q(in_mag_tmp[1]) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_tmp_reg_0_ ( .D(in[0]), .CP(net3271), .RN(rstn), .Q(in_mag_tmp[0]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_iz_reg ( .D(vld_i_tmp), .CP(clk_i), .RN(rstn), 
        .Q(vld_iz) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_tmp_reg_6_ ( .D(n36), .CP(net3271), .RN(rstn), 
        .Q(in_mag_tmp[6]) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_reg_5_ ( .D(in_mag_tmp[5]), .CP(clk_i), .RN(
        rstn), .Q(in_mag[5]) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_reg_4_ ( .D(in_mag_tmp[4]), .CP(clk_i), .RN(
        rstn), .Q(in_mag[4]) );
  C8T28SOI_LR_DFPRQX4_P0 out_vld_reg ( .D(n76), .CP(net3265), .RN(rstn), .Q(
        vld_o) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_reg_6_ ( .D(in_mag_tmp[6]), .CP(clk_i), .RN(
        rstn), .Q(in_mag[6]) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_reg_3_ ( .D(in_mag_tmp[3]), .CP(clk_i), .RN(
        rstn), .Q(in_mag[3]) );
  C8T28SOI_LR_DFPRQX4_P0 zc_o_reg_1_ ( .D(n101), .CP(net3265), .RN(rstn), .Q(
        zc_o[1]) );
  C8T28SOI_LR_DFPRQX4_P0 zc_o_reg_2_ ( .D(n102), .CP(net3265), .RN(rstn), .Q(
        zc_o[2]) );
  C8T28SOI_LR_DFPRQX4_P0 out_type_reg_1_ ( .D(n108), .CP(net3265), .RN(rstn), 
        .Q(vld_o_type[1]) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_reg_0_ ( .D(in_mag_tmp[0]), .CP(clk_i), .RN(
        rstn), .Q(in_mag[0]) );
  C8T28SOI_LR_DFPRQX4_P0 zc_o_reg_0_ ( .D(n100), .CP(net3265), .RN(rstn), .Q(
        zc_o[0]) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_o_reg_6_ ( .D(in_mag[6]), .CP(net3265), .RN(
        rstn), .Q(in_mag_o_6_) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_reg_1_ ( .D(in_mag_tmp[1]), .CP(clk_i), .RN(
        rstn), .Q(in_mag[1]) );
  C8T28SOI_LR_DFPRQX4_P0 in_mag_reg_2_ ( .D(in_mag_tmp[2]), .CP(clk_i), .RN(
        rstn), .Q(in_mag[2]) );
  C8T28SOI_LR_DFPRQX4_P0 in_lzd_reg_5_ ( .D(n51), .CP(clk_i), .RN(rstn), .Q(
        in_lzd[5]) );
  C8T28SOI_LR_DFPRQX4_P0 out_type_reg_0_ ( .D(n107), .CP(net3265), .RN(rstn), 
        .Q(vld_o_type[0]) );
  C8T28SOI_LR_DFPRQX4_P0 in_lzd_reg_4_ ( .D(n50), .CP(clk_i), .RN(rstn), .Q(
        in_lzd[4]) );
  C8T28SOI_LR_DFPRQX4_P0 in_lzd_reg_3_ ( .D(n49), .CP(clk_i), .RN(rstn), .Q(
        in_lzd[3]) );
  C8T28SOI_LR_DFPRQX4_P0 in_lzd_reg_1_ ( .D(n47), .CP(clk_i), .RN(rstn), .Q(
        in_lzd[1]) );
  C8T28SOI_LR_DFPRQX4_P0 in_lzd_reg_0_ ( .D(n46), .CP(clk_i), .RN(rstn), .Q(
        in_lzd[0]) );
  C8T28SOI_LR_DFPRQX4_P0 in_lzd_reg_2_ ( .D(n48), .CP(clk_i), .RN(rstn), .Q(
        in_lzd[2]) );
  C8T28SOI_LR_DFPRQX4_P0 in_tmp_reg_2_ ( .D(n95), .CP(net3265), .RN(rstn), .Q(
        mts[0]) );
  C8T28SOI_LR_DFPRQX4_P0 in_tmp_reg_4_ ( .D(n97), .CP(net3265), .RN(rstn), .Q(
        mts[2]) );
  C8T28SOI_LR_DFPRQX4_P0 in_tmp_reg_3_ ( .D(n96), .CP(net3265), .RN(rstn), .Q(
        mts[1]) );
  C8T28SOI_LR_CNNAND2X8_P16 U7 ( .A(in[0]), .B(in[7]), .Z(n142) );
  C8T28SOI_LRS_XNOR2X3_P0 U8 ( .A(in[1]), .B(n142), .Z(n31) );
  C8T28SOI_LR_OAI12X3_P0 U9 ( .A(in[0]), .B(in[1]), .C(in[7]), .Z(n143) );
  C8T28SOI_LRS_XNOR2X3_P0 U10 ( .A(in[2]), .B(n143), .Z(n32) );
  C8T28SOI_LR_OR3X5_P0 U11 ( .A(in[2]), .B(in[0]), .C(in[1]), .Z(n145) );
  C8T28SOI_LR_CNNAND2X8_P16 U12 ( .A(in[7]), .B(n145), .Z(n144) );
  C8T28SOI_LRS_XNOR2X3_P0 U13 ( .A(in[3]), .B(n144), .Z(n33) );
  C8T28SOI_LR_CNXOR2X9_P16 U14 ( .A(in_mag_tmp[6]), .S(in_mag_tmp[2]), .Z(n48)
         );
  C8T28SOI_LR_CNXOR2X9_P16 U15 ( .A(in_mag_tmp[6]), .S(in_mag_tmp[1]), .Z(n47)
         );
  C8T28SOI_LR_CNXOR2X9_P16 U16 ( .A(in_mag_tmp[6]), .S(in_mag_tmp[3]), .Z(n49)
         );
  C8T28SOI_LR_CNXOR2X9_P16 U17 ( .A(in_mag_tmp[6]), .S(in_mag_tmp[4]), .Z(n50)
         );
  C8T28SOI_LR_CNXOR2X9_P16 U18 ( .A(in_mag_tmp[6]), .S(in_mag_tmp[5]), .Z(n51)
         );
  C8T28SOI_LR_CNXOR2X9_P16 U19 ( .A(in_mag_tmp[6]), .S(in_mag_tmp[0]), .Z(n46)
         );
  C8T28SOI_LR_CNNOR2X8_P16 U20 ( .A(in[3]), .B(n145), .Z(n178) );
  C8T28SOI_LR_CNNAND2AX9_P16 U21 ( .A(in[4]), .B(n178), .Z(n149) );
  C8T28SOI_LR_CNNAND2X8_P16 U22 ( .A(in[7]), .B(n149), .Z(n146) );
  C8T28SOI_LRS_XNOR2X3_P0 U23 ( .A(in[5]), .B(n146), .Z(n35) );
  C8T28SOI_LR_CNIVX4_P16 U24 ( .A(in_mag[2]), .Z(n170) );
  C8T28SOI_LR_CNIVX4_P16 U25 ( .A(in_mag[1]), .Z(n164) );
  C8T28SOI_LR_NOR4CDX2_P0 U26 ( .C(n170), .D(n164), .A(in_mag[0]), .B(
        in_mag[6]), .Z(n148) );
  C8T28SOI_LR_NOR3X3_P0 U27 ( .A(in_mag[3]), .B(in_mag[5]), .C(in_mag[4]), .Z(
        n147) );
  C8T28SOI_LR_NAND2X4_P0 U28 ( .A(n148), .B(n147), .Z(n107) );
  C8T28SOI_LR_NOR2AX4_P0 U29 ( .A(in_sign), .B(n107), .Z(n108) );
  C8T28SOI_LR_OAI12X3_P0 U30 ( .A(in[5]), .B(n149), .C(in[7]), .Z(n150) );
  C8T28SOI_LRS_XNOR2X3_P0 U31 ( .A(in[6]), .B(n150), .Z(n36) );
  C8T28SOI_LR_CNNOR2X8_P16 U32 ( .A(zc_o[1]), .B(zc_o[0]), .Z(n152) );
  C8T28SOI_LR_CNXOR2X9_P16 U33 ( .A(in_mag_o_6_), .S(zc_o[2]), .Z(n151) );
  C8T28SOI_LRS_XNOR2X3_P0 U34 ( .A(n152), .B(n151), .Z(regi[2]) );
  C8T28SOI_LR_NOR3X3_P0 U35 ( .A(zc_o[2]), .B(zc_o[1]), .C(zc_o[0]), .Z(n153)
         );
  C8T28SOI_LRS_XNOR2X3_P0 U36 ( .A(in_mag_o_6_), .B(n153), .Z(regi[3]) );
  C8T28SOI_LR_CNIVX4_P16 U37 ( .A(in_lzd[5]), .Z(n161) );
  C8T28SOI_LR_CNNOR2X8_P16 U38 ( .A(in_lzd[4]), .B(in_lzd[3]), .Z(n162) );
  C8T28SOI_LR_NAND2X4_P0 U39 ( .A(n161), .B(n162), .Z(n177) );
  C8T28SOI_LR_CNIVX4_P16 U40 ( .A(n177), .Z(n102) );
  C8T28SOI_LR_NOR2X4_P0 U41 ( .A(in_lzd[4]), .B(n170), .Z(n154) );
  C8T28SOI_LR_AOI22X2_P0 U42 ( .A(in_lzd[4]), .B(in_mag[3]), .C(in_lzd[3]), 
        .D(n154), .Z(n157) );
  C8T28SOI_LR_NAND3X3_P0 U43 ( .A(in_lzd[2]), .B(n102), .C(in_mag[1]), .Z(n156) );
  C8T28SOI_LR_CNNAND2X8_P16 U44 ( .A(in_mag[4]), .B(in_lzd[5]), .Z(n155) );
  C8T28SOI_LR_OAI211X3_P0 U45 ( .A(n157), .B(in_lzd[5]), .C(n156), .D(n155), 
        .Z(n99) );
  C8T28SOI_LR_CNIVX4_P16 U46 ( .A(in_lzd[0]), .Z(n159) );
  C8T28SOI_LR_CNIVX4_P16 U47 ( .A(in_lzd[2]), .Z(n158) );
  C8T28SOI_LR_CBI4I6X3_P0 U48 ( .A(in_lzd[1]), .B(n159), .C(n158), .D(
        in_lzd[3]), .Z(n160) );
  C8T28SOI_LR_OAI12X3_P0 U49 ( .A(in_lzd[4]), .B(n160), .C(n161), .Z(n100) );
  C8T28SOI_LR_CBI4I6X3_P0 U50 ( .A(in_lzd[2]), .B(in_lzd[1]), .C(n162), .D(
        in_lzd[5]), .Z(n101) );
  C8T28SOI_LR_OAI12X3_P0 U51 ( .A(n162), .B(n100), .C(n161), .Z(n173) );
  C8T28SOI_LR_CNIVX4_P16 U52 ( .A(n173), .Z(n163) );
  C8T28SOI_LR_CNIVX4_P16 U53 ( .A(n101), .Z(n168) );
  C8T28SOI_LR_NAND2X4_P0 U54 ( .A(in_mag[0]), .B(n168), .Z(n176) );
  C8T28SOI_LR_CNNOR2X8_P16 U55 ( .A(n163), .B(n176), .Z(n95) );
  C8T28SOI_LR_CNIVX4_P16 U56 ( .A(n100), .Z(n165) );
  C8T28SOI_LR_OAI22X3_P0 U57 ( .A(n100), .B(in_mag[0]), .C(in_mag[1]), .D(n165), .Z(n174) );
  C8T28SOI_LR_CNNOR2X8_P16 U58 ( .A(n163), .B(n174), .Z(n96) );
  C8T28SOI_LR_CNIVX4_P16 U61 ( .A(n102), .Z(n171) );
  C8T28SOI_LR_CNNAND2X8_P16 U62 ( .A(n165), .B(n164), .Z(n166) );
  C8T28SOI_LR_OAI211X3_P0 U63 ( .A(n173), .B(in_mag[0]), .C(n171), .D(n166), 
        .Z(n167) );
  C8T28SOI_LR_AOI12X3_P0 U64 ( .A(n168), .B(n170), .C(n167), .Z(n97) );
  C8T28SOI_LR_OAI12X3_P0 U65 ( .A(in_mag[3]), .B(n101), .C(n100), .Z(n169) );
  C8T28SOI_LR_OAI12X3_P0 U66 ( .A(n170), .B(n100), .C(n169), .Z(n172) );
  C8T28SOI_LR_OAI211AX3_P0 U67 ( .A(n174), .B(n173), .C(n172), .D(n171), .Z(
        n175) );
  C8T28SOI_LR_OAI12X3_P0 U68 ( .A(n177), .B(n176), .C(n175), .Z(n98) );
  C8T28SOI_LR_CNNOR2AX9_P16 U69 ( .A(in[7]), .B(n178), .Z(n179) );
  C8T28SOI_LR_CNXOR2X9_P16 U70 ( .A(in[4]), .S(n179), .Z(n34) );
  C8T28SOI_LR_CNXOR2X9_P16 U71 ( .A(in_mag_o_6_), .S(zc_o[0]), .Z(regi[0]) );
  C8T28SOI_LR_CNXOR2X9_P16 U72 ( .A(zc_o[1]), .S(regi[0]), .Z(regi[1]) );
  C8T28SOI_LR_TOLX5 U3 ( .TL(in_lzd[6]) );
  C8T28SOI_LR_TOHX5 U4 ( .TH(n76) );
endmodule


module SNPS_CLOCK_GATE_HIGH_posit_mac_0 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  C8T28SOI_LRP_CNHLSX4_P16 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_posit_mac_11 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  C8T28SOI_LRP_CNHLSX4_P16 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_posit_mac_10 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  C8T28SOI_LRP_CNHLSX4_P16 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_posit_mac_9 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  C8T28SOI_LRP_CNHLSX4_P16 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_posit_mac_12 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  C8T28SOI_LRP_CNHLSX4_P16 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_posit_mac_13 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  C8T28SOI_LRP_CNHLSX4_P16 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_posit_mac_14 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  C8T28SOI_LRP_CNHLSX4_P16 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_posit_mac_15 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  C8T28SOI_LRP_CNHLSX4_P16 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_posit_mac_16 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  C8T28SOI_LRP_CNHLSX4_P16 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module posit_mac ( clk_i, rstn, vld_i, win, din, acc_o, vld_o );
  input [7:0] win;
  input [7:0] din;
  output [7:0] acc_o;
  input clk_i, rstn, vld_i;
  output vld_o;
  wire   sign_w, decode_w, sign_d, decode_d, sign_m, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n97, n98, n99, n100, n101, n102, n103, n104, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         acc_rdy, n351, n352, n354, n355, n356, n357, n360, n361, n362, n363,
         n364, n365, n366, n367, n368, n369, n370, n371, n372, n373, n374,
         n375, n376, n377, n378, n379, n380, n381, n382, n383, n384, n385,
         n386, n387, n388, n389, n390, n391, n392, n393, n394, n395, n396,
         n397, n398, n399, n400, n401, n402, n403, n404, n405, n406, n407,
         n408, n409, n410, n411, n412, n413, n414, n415, n416, n417, n418,
         n419, n420, n421, n422, n423, n424, n425, n426, n427, n428, n429,
         n430, n431, n432, n433, n434, n435, n436, n437, n438, n439, n440,
         n441, n442, n443, n444, n445, n446, n447, n448, n449, n450, n451,
         n452, n453, n454, n455, n456, n457, n458, n459, n460, n461, sign_q,
         zc_i, n779, n780, n782, n783, n784, n785, n786, n787, n788, n789,
         n790, n791, n792, n793, n794, n795, n796, n797, n798, n799, n800,
         n801, n802, n803, n804, n805, n806, n807, n808, n809, n810, n811,
         n812, n813, n814, n815, n816, n817, n818, n819, n820, n821, n822,
         n823, n824, n825, n826, n827, n828, n829, n830, n831, n832, n833,
         n834, n835, n836, n837, n838, n839, n840, n841, n842, n843, n844,
         n845, n846, n847, n848, n849, n850, n851, n852, n853, n854, n855,
         n856, n857, n858, n859, n860, n861, n862, n863, n864, n865, n866,
         n867, n868, n869, n870, n871, n872, n873, n874, n875, n876, n877,
         n878, n879, n880, n881, n882, n883, n915, n916, n917, n918, n919,
         n920, n921, n922, n923, n924, n925, n926, n927, n928, n929, n930,
         n931, n932, n933, n934, n935, n936, n937, sign_sf, n960, n961, n962,
         n963, n964, n965, n966, n979, n980, n981, n982, n983, n1051, n1052,
         n1053, n1054, n1055, n1056, n1057, n1058, n1059, n1060, n1071, n1072,
         n1073, n1074, n1075, n1076, n1078, n1079, n1080, n1081, n1082, n1083,
         n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1091, n1092, n1093,
         n1094, n1095, n1150, n1151, n1152, n1153, n1154, n1155, n1156, n1159,
         n1160, n1161, n1162, n1163, n1164, n1165, n1166, net3192, net3198,
         net3203, net3208, n2342, n2343, n2344, n2345, n2346, n2347, n2348,
         n2349, n2350, n2351, intadd_0_SUM_99_, intadd_0_SUM_98_,
         intadd_0_SUM_97_, intadd_0_SUM_96_, intadd_0_SUM_95_,
         intadd_0_SUM_94_, intadd_0_SUM_93_, intadd_0_SUM_92_,
         intadd_0_SUM_91_, intadd_0_SUM_90_, intadd_0_SUM_89_,
         intadd_0_SUM_88_, intadd_0_SUM_87_, intadd_0_SUM_86_,
         intadd_0_SUM_85_, intadd_0_SUM_84_, intadd_0_SUM_83_,
         intadd_0_SUM_82_, intadd_0_SUM_81_, intadd_0_SUM_80_,
         intadd_0_SUM_79_, intadd_0_SUM_78_, intadd_0_SUM_77_,
         intadd_0_SUM_76_, intadd_0_SUM_75_, intadd_0_SUM_74_,
         intadd_0_SUM_73_, intadd_0_SUM_72_, intadd_0_SUM_71_,
         intadd_0_SUM_70_, intadd_0_SUM_69_, intadd_0_SUM_68_,
         intadd_0_SUM_67_, intadd_0_SUM_66_, intadd_0_SUM_65_,
         intadd_0_SUM_64_, intadd_0_SUM_63_, intadd_0_SUM_62_,
         intadd_0_SUM_61_, intadd_0_SUM_60_, intadd_0_SUM_59_,
         intadd_0_SUM_58_, intadd_0_SUM_57_, intadd_0_SUM_56_,
         intadd_0_SUM_55_, intadd_0_SUM_54_, intadd_0_SUM_53_,
         intadd_0_SUM_52_, intadd_0_SUM_51_, intadd_0_SUM_50_,
         intadd_0_SUM_49_, intadd_0_SUM_48_, intadd_0_SUM_47_,
         intadd_0_SUM_46_, intadd_0_SUM_45_, intadd_0_SUM_44_,
         intadd_0_SUM_43_, intadd_0_SUM_42_, intadd_0_SUM_41_,
         intadd_0_SUM_40_, intadd_0_SUM_39_, intadd_0_SUM_38_,
         intadd_0_SUM_37_, intadd_0_SUM_36_, intadd_0_SUM_35_,
         intadd_0_SUM_34_, intadd_0_SUM_33_, intadd_0_SUM_32_,
         intadd_0_SUM_31_, intadd_0_SUM_30_, intadd_0_SUM_29_,
         intadd_0_SUM_28_, intadd_0_SUM_27_, intadd_0_SUM_26_,
         intadd_0_SUM_25_, intadd_0_SUM_24_, intadd_0_SUM_23_,
         intadd_0_SUM_22_, intadd_0_SUM_21_, intadd_0_SUM_20_,
         intadd_0_SUM_19_, intadd_0_SUM_18_, intadd_0_SUM_17_,
         intadd_0_SUM_16_, intadd_0_SUM_15_, intadd_0_SUM_14_,
         intadd_0_SUM_13_, intadd_0_SUM_12_, intadd_0_SUM_11_,
         intadd_0_SUM_10_, intadd_0_SUM_9_, intadd_0_SUM_8_, intadd_0_SUM_7_,
         intadd_0_SUM_6_, intadd_0_SUM_5_, intadd_0_SUM_4_, intadd_0_SUM_3_,
         intadd_0_SUM_2_, intadd_0_SUM_1_, intadd_0_n100, intadd_0_n99,
         intadd_0_n98, intadd_0_n97, intadd_0_n96, intadd_0_n95, intadd_0_n94,
         intadd_0_n93, intadd_0_n92, intadd_0_n91, intadd_0_n90, intadd_0_n89,
         intadd_0_n88, intadd_0_n87, intadd_0_n86, intadd_0_n85, intadd_0_n84,
         intadd_0_n83, intadd_0_n82, intadd_0_n81, intadd_0_n80, intadd_0_n79,
         intadd_0_n78, intadd_0_n77, intadd_0_n76, intadd_0_n75, intadd_0_n74,
         intadd_0_n73, intadd_0_n72, intadd_0_n71, intadd_0_n70, intadd_0_n69,
         intadd_0_n68, intadd_0_n67, intadd_0_n66, intadd_0_n65, intadd_0_n64,
         intadd_0_n63, intadd_0_n62, intadd_0_n61, intadd_0_n60, intadd_0_n59,
         intadd_0_n58, intadd_0_n57, intadd_0_n56, intadd_0_n55, intadd_0_n54,
         intadd_0_n53, intadd_0_n52, intadd_0_n51, intadd_0_n50, intadd_0_n49,
         intadd_0_n48, intadd_0_n47, intadd_0_n46, intadd_0_n45, intadd_0_n44,
         intadd_0_n43, intadd_0_n42, intadd_0_n41, intadd_0_n40, intadd_0_n39,
         intadd_0_n38, intadd_0_n37, intadd_0_n36, intadd_0_n35, intadd_0_n34,
         intadd_0_n33, intadd_0_n32, intadd_0_n31, intadd_0_n30, intadd_0_n29,
         intadd_0_n28, intadd_0_n27, intadd_0_n26, intadd_0_n25, intadd_0_n24,
         intadd_0_n23, intadd_0_n22, intadd_0_n21, intadd_0_n20, intadd_0_n19,
         intadd_0_n18, intadd_0_n17, intadd_0_n16, intadd_0_n15, intadd_0_n14,
         intadd_0_n13, intadd_0_n12, intadd_0_n11, intadd_0_n10, intadd_0_n9,
         intadd_0_n8, intadd_0_n7, intadd_0_n6, intadd_0_n5, intadd_0_n4,
         intadd_0_n3, intadd_0_n2, intadd_0_n1, intadd_1_A_5_, intadd_1_A_4_,
         intadd_1_A_3_, intadd_1_A_2_, intadd_1_B_5_, intadd_1_B_4_,
         intadd_1_B_3_, intadd_1_B_2_, intadd_1_B_1_, intadd_1_CI, intadd_1_n6,
         intadd_1_n5, intadd_1_n4, intadd_1_n3, intadd_1_n2, intadd_1_n1,
         n2358, n2359, n2360, n2361, n2362, n2363, n2364, n2365, n2366, n2367,
         n2368, n2369, n2370, n2371, n2372, n2373, n2374, n2375, n2376, n2377,
         n2378, n2379, n2380, n2381, n2382, n2383, n2384, n2385, n2386, n2387,
         n2388, n2389, n2390, n2391, n2392, n2393, n2394, n2395, n2396, n2397,
         n2398, n2399, n2400, n2401, n2402, n2403, n2404, n2405, n2406, n2407,
         n2408, n2409, n2410, n2411, n2412, n2413, n2414, n2415, n2416, n2417,
         n2418, n2419, n2420, n2421, n2422, n2423, n2424, n2425, n2426, n2427,
         n2428, n2429, n2430, n2431, n2432, n2433, n2434, n2435, n2436, n2437,
         n2438, n2439, n2440, n2442, n2443, n2444, n2445, n2446, n2447, n2448,
         n2449, n2450, n2451, n2452, n2453, n2454, n2455, n2456, n2457, n2458,
         n2460, n2461, n2462, n2463, n2464, n2465, n2466, n2467, n2468, n2469,
         n2470, n2471, n2472, n2473, n2474, n2475, n2476, n2477, n2478, n2479,
         n2480, n2481, n2483, n2484, n2485, n2486, n2487, n2488, n2489, n2490,
         n2491, n2492, n2493, n2494, n2495, n2496, n2497, n2500, n2501, n2502,
         n2503, n2504, n2505, n2506, n2507, n2508, n2509, n2510, n2511, n2512,
         n2513, n2514, n2515, n2516, n2517, n2518, n2519, n2520, n2522, n2523,
         n2524, n2525, n2526, n2527, n2528, n2529, n2530, n2531, n2532, n2533,
         n2534, n2535, n2536, n2537, n2538, n2539, n2540, n2541, n2542, n2543,
         n2544, n2545, n2546, n2548, n2549, n2550, n2551, n2552, n2553, n2554,
         n2555, n2556, n2557, n2558, n2559, n2560, n2561, n2562, n2563, n2564,
         n2565, n2566, n2567, n2568, n2569, n2570, n2571, n2572, n2573, n2574,
         n2575, n2576, n2577, n2578, n2579, n2580, n2582, n2584, n2585, n2586,
         n2587, n2588, n2589, n2590, n2591, n2592, n2593, n2594, n2595, n2596,
         n2598, n2599, n2601, n2602, n2603, n2604, n2605, n2606, n2607, n2608,
         n2609, n2610, n2611, n2612, n2613, n2614, n2615, n2616, n2617, n2618,
         n2619, n2620, n2621, n2622, n2623, n2624, n2625, n2626, n2627, n2628,
         n2629, n2630, n2631, n2632, n2633, n2634, n2635, n2636, n2637, n2638,
         n2639, n2640, n2641, n2642, n2643, n2644, n2645, n2646, n2647, n2648,
         n2649, n2650, n2651, n2652, n2653, n2654, n2655, n2656, n2657, n2658,
         n2659, n2660, n2661, n2662, n2663, n2664, n2665, n2666, n2667, n2668,
         n2669, n2670, n2671, n2672, n2673, n2674, n2675, n2676, n2677, n2678,
         n2679, n2680, n2681, n2682, n2683, n2684, n2685, n2686, n2687, n2688,
         n2689, n2690, n2691, n2692, n2693, n2694, n2695, n2696, n2697, n2698,
         n2699, n2700, n2702, n2703, n2704, n2705, n2706, n2707, n2708, n2709,
         n2710, n2711, n2712, n2713, n2714, n2715, n2716, n2717, n2718, n2719,
         n2720, n2721, n2722, n2723, n2724, n2725, n2726, n2727, n2728, n2729,
         n2730, n2731, n2732, n2733, n2734, n2735, n2736, n2737, n2738, n2739,
         n2740, n2741, n2742, n2743, n2744, n2745, n2746, n2747, n2748, n2749,
         n2750, n2751, n2752, n2753, n2754, n2755, n2756, n2757, n2758, n2759,
         n2760, n2761, n2762, n2763, n2764, n2765, n2766, n2767, n2768, n2769,
         n2770, n2771, n2772, n2773, n2774, n2775, n2776, n2777, n2778, n2779,
         n2780, n2781, n2782, n2783, n2784, n2785, n2786, n2787, n2788, n2789,
         n2790, n2791, n2792, n2793, n2794, n2795, n2796, n2797, n2798, n2799,
         n2800, n2801, n2802, n2803, n2804, n2805, n2806, n2807, n2808, n2810,
         n2811, n2812, n2813, n2814, n2815, n2817, n2818, n2819, n2820, n2821,
         n2822, n2823, n2824, n2825, n2826, n2827, n2828, n2829, n2830, n2831,
         n2832, n2833, n2834, n2835, n2836, n2837, n2838, n2839, n2840, n2841,
         n2842, n2843, n2844, n2845, n2846, n2847, n2848, n2849, n2850, n2851,
         n2852, n2853, n2854, n2855, n2856, n2857, n2858, n2859, n2860, n2861,
         n2862, n2863, n2864, n2865, n2866, n2867, n2868, n2869, n2870, n2871,
         n2872, n2873, n2874, n2875, n2876, n2877, n2878, n2879, n2880, n2881,
         n2882, n2883, n2884, n2885, n2889, n2890, n2891, n2892, n2894, n2895,
         n2896, n2897, n2898, n2899, n2900, n2901, n2902, n2903, n2904, n2905,
         n2907, n2910, n2911, n2912, n2913, n2914, n2915, n2916, n2917, n2918,
         n2919, n2920, n2922, n2923, n2925, n2926, n2927, n2928, n2929, n2931,
         n2932, n2933, n2934, n2935, n2936, n2937, n2938, n2939, n2940, n2941,
         n2942, n2943, n2944, n2945, n2946, n2947, n2948, n2949, n2950, n2951,
         n2952, n2953, n2954, n2955, n2956, n2957, n2958, n2959, n2960, n2961,
         n2962, n2963, n2964, n2965, n2966, n2967, n2968, n2969, n2970, n2971,
         n2972, n2973, n2974, n2975, n2976, n2977, n2978, n2979, n2980, n2981,
         n2982, n2983, n2984, n2985, n2986, n2987, n2988, n2989, n2990, n2991,
         n2992, n2993, n2994, n2995, n2996, n2997, n2998, n2999, n3000, n3001,
         n3002, n3003, n3004, n3005, n3006, n3007, n3008, n3009, n3010, n3011,
         n3012, n3013, n3014, n3015, n3016, n3017, n3018, n3019, n3020, n3023,
         n3024, n3025, n3026, n3027, n3028, n3029, n3030, n3031, n3032, n3033,
         n3034, n3035, n3036, n3037, n3038, n3039, n3040, n3041, n3042, n3043,
         n3044, n3045, n3046, n3048, n3049, n3050, n3051, n3052, n3053, n3054,
         n3055, n3056, n3057, n3058, n3059, n3060, n3061, n3062, n3063, n3064,
         n3065, n3066, n3067, n3068, n3069, n3070, n3071, n3072, n3073, n3074,
         n3075, n3078, n3079, n3081, n3082, n3083, n3084, n3085, n3086, n3087,
         n3088, n3089, n3090, n3091, n3092, n3093, n3094, n3095, n3096, n3097,
         n3098, n3099, n3100, n3102, n3103, n3104, n3105, n3106, n3107, n3108,
         n3109, n3110, n3111, n3113, n3114, n3115, n3116, n3117, n3118, n3119,
         n3120, n3121, n3122, n3123, n3124, n3125, n3126, n3127, n3128, n3129,
         n3130, n3131, n3132, n3133, n3134, n3135, n3136, n3137, n3138, n3139,
         n3140, n3141, n3142, n3143, n3144, n3145, n3146, n3147, n3148, n3149,
         n3150, n3151, n3152, n3153, n3154, n3155, n3156, n3157, n3158, n3160,
         n3161, n3162, n3163, n3164, n3165, n3166, n3168, n3169, n3170, n3171,
         n3172, n3173, n3174, n3175, n3176, n3177, n3178, n3179, n3180, n3181,
         n3183, n3184, n3185, n3186, n3187, n3188, n3189, n3190, n3191, n3192,
         n3193, n3194, n3195, n3196, n3197, n3198, n3199, n3200, n3201, n3202,
         n3203, n3204, n3205, n3206, n3207, n3208, n3209, n3210, n3211, n3212,
         n3213, n3214, n3215, n3216, n3219, n3220, n3221, n3223, n3224, n3225,
         n3226, n3227, n3228, n3229, n3230, n3231, n3232, n3233, n3234, n3235,
         n3236, n3237, n3238, n3239, n3240, n3241, n3242, n3243, n3244, n3245,
         n3246, n3247, n3248, n3249, n3250, n3251, n3252, n3253, n3254, n3255,
         n3257, n3258, n3259, n3261, n3262, n3263, n3264, n3265, n3266, n3267,
         n3268, n3269, n3270, n3272, n3273, n3275, n3283, n3284, n3285, n3286,
         n3287, n3288, n3289, n3290, n3291, n3292, n3293, n3294, n3295, n3296,
         n3297, n3298, n3299, n3300, n3301, n3302, n3303, n3304, n3305, n3306,
         n3307, n3308, n3309, n3310, n3311, n3312, n3314, n3315, n3317, n3318,
         n3320, n3321, n3322, n3323, n3324, n3325, n3326, n3327, n3328, n3329,
         n3330, n3331, n3332, n3333, n3334, n3335, n3336, n3337, n3338, n3339,
         n3340, n3341, n3342, n3343, n3344, n3345, n3347, n3348, n3349, n3350,
         n3351, n3353, n3355, n3356, n3357, n3358, n3359, n3360, n3361, n3363,
         n3364, n3365, n3366, n3367, n3368, n3369, n3370, n3371, n3372, n3373,
         n3374, n3375, n3376, n3377, n3378, n3379, n3380, n3381, n3382, n3383,
         n3384, n3385, n3386, n3387, n3388, n3389, n3390, n3391, n3392, n3393,
         n3394, n3395, n3396, n3397, n3398, n3399, n3400, n3401, n3402, n3403,
         n3404, n3405, n3406, n3407, n3408, n3409, n3410, n3411, n3412, n3413,
         n3414, n3415, n3416, n3417, n3418, n3419, n3420, n3421, n3422, n3423,
         n3424, n3425, n3426, n3427, n3428, n3429, n3430, n3431, n3432, n3433,
         n3434, n3435, n3436, n3437, n3438, n3439, n3440, n3441, n3442, n3443,
         n3444, n3445, n3446, n3447, n3448, n3449, n3450, n3451, n3452, n3453,
         n3454, n3455, n3456, n3457, n3458, n3459, n3460, n3461, n3462, n3463,
         n3464, n3465, n3466, n3467, n3468, n3469, n3470, n3471, n3472, n3473,
         n3474, n3475, n3476, n3477, n3478, n3481, n3482, n3483, n3484, n3485,
         n3486, n3489, n3490, n3491, n3492, n3495, n3496, n3498, n3499, n3500,
         n3501, n3503, n3504, n3505, n3506, n3507, n3508, n3510, n3511, n3513,
         n3514, n3515, n3516, n3517, n3518, n3519, n3520, n3521, n3522, n3523,
         n3524, n3527, n3528, n3531, n3532, n3534, n3536, n3537, n3538, n3541,
         n3542, n3543, n3544, n3546, n3547, n3552, n3553, n3554, n3555, n3556,
         n3557, n3558, n3559, n3560, n3561, n3562, n3563, n3564, n3565, n3566,
         n3567, n3568, n3569, n3570, n3571, n3572, n3573, n3574, n3576, n3577,
         n3578, n3579, n3580, n3581, n3582, n3583, n3584, n3585, n3586, n3587,
         n3588, n3589, n3590, n3591, n3592, n3593, n3594, n3596, n3597, n3598,
         n3600, n3601, n3602, n3603, n3604, n3606, n3607, n3608, n3609, n3610,
         n3611, n3612, n3613, n3614, n3615, n3616, n3617, n3618, n3619, n3620,
         n3621, n3622, n3623, n3625, n3626, n3627, n3628, n3629, n3630, n3631,
         n3632, n3633, n3634, n3635, n3636, n3637, n3638, n3639, n3640, n3641,
         n3642, n3643, n3644, n3645, n3646, n3647, n3648, n3649, n3650, n3652,
         n3653, n3654, n3656, n3657, n3658, n3659, n3660, n3661, n3662, n3663,
         n3664, n3665, n3666, n3667, n3668, n3669, n3670, n3671, n3672, n3673,
         n3674, n3675, n3676, n3677, n3678, n3679, n3680, n3681, n3682, n3683,
         n3684, n3685, n3686, n3687, n3688, n3689, n3690, n3691, n3692, n3693,
         n3694, n3695, n3696, n3697, n3698, n3699, n3700, n3701, n3702, n3703,
         n3704, n3705, n3706, n3707, n3708, n3709, n3710, n3711, n3712, n3714,
         n3715, n3716, n3717, n3718, n3719, n3720, n3721, n3722, n3723, n3724,
         n3725, n3726, n3727, n3728, n3729, n3730, n3731, n3732, n3733, n3734,
         n3735, n3736, n3737, n3738, n3739, n3740, n3741, n3742, n3743, n3744,
         n3745, n3746, n3747, n3748, n3749, n3750, n3751, n3752, n3753, n3754,
         n3755, n3756, n3757, n3758, n3759, n3760, n3761, n3762, n3763, n3764,
         n3765, n3766, n3767, n3768, n3770, n3771, n3773, n3775, n3776, n3777,
         n3778, n3779, n3780, n3781, n3782, n3783, n3784, n3785, n3787, n3788,
         n3789, n3790, n3791, n3792, n3793, n3794, n3795, n3796, n3797, n3798,
         n3799, n3800, n3801, n3834, n3837, n3838, n3839, n3840, n3841, n3842,
         n3843, n3844, n3845, n3846, n3847, n3848, n3850, n3852, n3854, n3856,
         n3857, n3858, n3859, n3861, n3862, n3863, n3864, n3865, n3867, n3868,
         n3869, n3870, n3871, n3872, n3873, n3875, n3877, n3879, n3880, n3882,
         n3883, n3884, n3885, n3886, n3888, n3889, n3890, n3891, n3892, n3893,
         n3894, n3895, n3897, n3899, n3901, n3902, n3903, n3905, n3906, n3907,
         n3908, n3909, n3910, n3911, n3912, n3914, n3915, n3916, n3917, n3918,
         n3919, n3920, n3922, n3923, SYNOPSYS_UNCONNECTED_1;
  wire   [3:0] regi_w;
  wire   [1:0] exp_w;
  wire   [2:0] mts_w;
  wire   [1:0] vld_o_w;
  wire   [3:0] regi_d;
  wire   [1:0] exp_d;
  wire   [2:0] mts_d;
  wire   [1:0] vld_o_d;
  wire   [5:0] sf_w;
  wire   [5:0] sf_d;
  wire   [7:0] mts_m;
  wire   [14:0] vld_d;
  wire   [7:0] sf_bias;
  wire   [8:0] mts_ms;
  wire   [101:0] mts_fx;
  wire   [3:0] counter;
  wire   [101:0] acc;
  wire   [101:0] acc_mag;
  wire   [6:0] sf_q;
  wire   [101:94] mts_tmp;
  wire   [7:0] mts_q;
  wire   [3:0] regi_sf;
  wire   [1:0] exp_sf;
  wire   [2:0] regi_p;
  wire   [1:0] exp_p;
  wire   [16:7] tmp_neg;
  wire   [2:0] shift_pos;
  wire   [2:0] shift_neg;
  wire   [17:0] tmp;
  wire   [6:0] acc_o_tmp;

  decoder_1 u_decode_w ( .clk_i(clk_i), .rstn(n3854), .in(win), .vld_i(vld_i), 
        .sign(sign_w), .regi(regi_w), .exp(exp_w), .mts(mts_w), .vld_o_type(
        vld_o_w), .vld_o(decode_w) );
  decoder_0 u_decode_d ( .clk_i(clk_i), .rstn(n3856), .in(din), .vld_i(vld_i), 
        .sign(sign_d), .regi(regi_d), .exp(exp_d), .mts(mts_d), .vld_o_type(
        vld_o_d), .vld_o(decode_d) );
  SNPS_CLOCK_GATE_HIGH_posit_mac_0 clk_gate_sign_m_reg ( .CLK(clk_i), .EN(n69), 
        .ENCLK(net3192), .TE(n357) );
  SNPS_CLOCK_GATE_HIGH_posit_mac_11 clk_gate_mts_fx_reg_0 ( .CLK(clk_i), .EN(
        vld_d[4]), .ENCLK(net3198), .TE(n357) );
  SNPS_CLOCK_GATE_HIGH_posit_mac_10 clk_gate_sf_bias_reg_0 ( .CLK(clk_i), .EN(
        vld_d[3]), .ENCLK(net3203), .TE(n357) );
  SNPS_CLOCK_GATE_HIGH_posit_mac_9 clk_gate_counter_reg ( .CLK(clk_i), .EN(
        n351), .ENCLK(net3208), .TE(n357) );
  SNPS_CLOCK_GATE_HIGH_posit_mac_12 clk_gate_zc_i_reg_1 ( .CLK(clk_i), .EN(
        n779), .ENCLK(n2346), .TE(n357) );
  SNPS_CLOCK_GATE_HIGH_posit_mac_13 clk_gate_acc_o_tmp_reg_1 ( .CLK(n2346), 
        .EN(n2350), .ENCLK(n2345), .TE(n357) );
  SNPS_CLOCK_GATE_HIGH_posit_mac_14 clk_gate_vld_o_tmp_reg ( .CLK(n2345), .EN(
        n2347), .ENCLK(n2344), .TE(n357) );
  SNPS_CLOCK_GATE_HIGH_posit_mac_15 clk_gate_tmp_pos_reg_1 ( .CLK(n2346), .EN(
        n2349), .ENCLK(n2343), .TE(n357) );
  SNPS_CLOCK_GATE_HIGH_posit_mac_16 clk_gate_tmp_reg_1 ( .CLK(n2346), .EN(
        n2348), .ENCLK(n2342), .TE(n357) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U100 ( .A0(mts_fx[2]), .B0(acc[2]), .CI(
        intadd_0_n100), .CO(intadd_0_n99), .S0(intadd_0_SUM_1_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U99 ( .A0(mts_fx[3]), .B0(acc[3]), .CI(
        intadd_0_n99), .CO(intadd_0_n98), .S0(intadd_0_SUM_2_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U98 ( .A0(mts_fx[4]), .B0(acc[4]), .CI(
        intadd_0_n98), .CO(intadd_0_n97), .S0(intadd_0_SUM_3_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U97 ( .A0(mts_fx[5]), .B0(acc[5]), .CI(
        intadd_0_n97), .CO(intadd_0_n96), .S0(intadd_0_SUM_4_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U96 ( .A0(mts_fx[6]), .B0(acc[6]), .CI(
        intadd_0_n96), .CO(intadd_0_n95), .S0(intadd_0_SUM_5_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U95 ( .A0(mts_fx[7]), .B0(acc[7]), .CI(
        intadd_0_n95), .CO(intadd_0_n94), .S0(intadd_0_SUM_6_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U94 ( .A0(mts_fx[8]), .B0(acc[8]), .CI(
        intadd_0_n94), .CO(intadd_0_n93), .S0(intadd_0_SUM_7_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U93 ( .A0(mts_fx[9]), .B0(acc[9]), .CI(
        intadd_0_n93), .CO(intadd_0_n92), .S0(intadd_0_SUM_8_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U92 ( .A0(mts_fx[10]), .B0(acc[10]), .CI(
        intadd_0_n92), .CO(intadd_0_n91), .S0(intadd_0_SUM_9_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U91 ( .A0(mts_fx[11]), .B0(acc[11]), .CI(
        intadd_0_n91), .CO(intadd_0_n90), .S0(intadd_0_SUM_10_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U90 ( .A0(mts_fx[12]), .B0(acc[12]), .CI(
        intadd_0_n90), .CO(intadd_0_n89), .S0(intadd_0_SUM_11_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U89 ( .A0(mts_fx[13]), .B0(acc[13]), .CI(
        intadd_0_n89), .CO(intadd_0_n88), .S0(intadd_0_SUM_12_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U88 ( .A0(mts_fx[14]), .B0(acc[14]), .CI(
        intadd_0_n88), .CO(intadd_0_n87), .S0(intadd_0_SUM_13_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U87 ( .A0(mts_fx[15]), .B0(acc[15]), .CI(
        intadd_0_n87), .CO(intadd_0_n86), .S0(intadd_0_SUM_14_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U86 ( .A0(mts_fx[16]), .B0(acc[16]), .CI(
        intadd_0_n86), .CO(intadd_0_n85), .S0(intadd_0_SUM_15_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U85 ( .A0(mts_fx[17]), .B0(acc[17]), .CI(
        intadd_0_n85), .CO(intadd_0_n84), .S0(intadd_0_SUM_16_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U84 ( .A0(mts_fx[18]), .B0(acc[18]), .CI(
        intadd_0_n84), .CO(intadd_0_n83), .S0(intadd_0_SUM_17_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U83 ( .A0(mts_fx[19]), .B0(acc[19]), .CI(
        intadd_0_n83), .CO(intadd_0_n82), .S0(intadd_0_SUM_18_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U82 ( .A0(mts_fx[20]), .B0(acc[20]), .CI(
        intadd_0_n82), .CO(intadd_0_n81), .S0(intadd_0_SUM_19_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U81 ( .A0(mts_fx[21]), .B0(acc[21]), .CI(
        intadd_0_n81), .CO(intadd_0_n80), .S0(intadd_0_SUM_20_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U80 ( .A0(mts_fx[22]), .B0(acc[22]), .CI(
        intadd_0_n80), .CO(intadd_0_n79), .S0(intadd_0_SUM_21_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U79 ( .A0(mts_fx[23]), .B0(acc[23]), .CI(
        intadd_0_n79), .CO(intadd_0_n78), .S0(intadd_0_SUM_22_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U77 ( .A0(mts_fx[25]), .B0(acc[25]), .CI(
        intadd_0_n77), .CO(intadd_0_n76), .S0(intadd_0_SUM_24_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U75 ( .A0(mts_fx[27]), .B0(acc[27]), .CI(
        intadd_0_n75), .CO(intadd_0_n74), .S0(intadd_0_SUM_26_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U73 ( .A0(mts_fx[29]), .B0(acc[29]), .CI(
        intadd_0_n73), .CO(intadd_0_n72), .S0(intadd_0_SUM_28_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U29 ( .A0(mts_fx[73]), .B0(acc[73]), .CI(
        intadd_0_n29), .CO(intadd_0_n28), .S0(intadd_0_SUM_72_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U27 ( .A0(mts_fx[75]), .B0(acc[75]), .CI(
        intadd_0_n27), .CO(intadd_0_n26), .S0(intadd_0_SUM_74_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U25 ( .A0(mts_fx[77]), .B0(acc[77]), .CI(
        intadd_0_n25), .CO(intadd_0_n24), .S0(intadd_0_SUM_76_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U23 ( .A0(mts_fx[79]), .B0(acc[79]), .CI(
        intadd_0_n23), .CO(intadd_0_n22), .S0(intadd_0_SUM_78_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U22 ( .A0(mts_fx[80]), .B0(acc[80]), .CI(
        intadd_0_n22), .CO(intadd_0_n21), .S0(intadd_0_SUM_79_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U21 ( .A0(mts_fx[81]), .B0(acc[81]), .CI(
        intadd_0_n21), .CO(intadd_0_n20), .S0(intadd_0_SUM_80_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U20 ( .A0(mts_fx[82]), .B0(acc[82]), .CI(
        intadd_0_n20), .CO(intadd_0_n19), .S0(intadd_0_SUM_81_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U19 ( .A0(mts_fx[83]), .B0(acc[83]), .CI(
        intadd_0_n19), .CO(intadd_0_n18), .S0(intadd_0_SUM_82_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U18 ( .A0(mts_fx[84]), .B0(acc[84]), .CI(
        intadd_0_n18), .CO(intadd_0_n17), .S0(intadd_0_SUM_83_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U17 ( .A0(mts_fx[85]), .B0(acc[85]), .CI(
        intadd_0_n17), .CO(intadd_0_n16), .S0(intadd_0_SUM_84_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U16 ( .A0(mts_fx[86]), .B0(acc[86]), .CI(
        intadd_0_n16), .CO(intadd_0_n15), .S0(intadd_0_SUM_85_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U15 ( .A0(mts_fx[87]), .B0(acc[87]), .CI(
        intadd_0_n15), .CO(intadd_0_n14), .S0(intadd_0_SUM_86_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U14 ( .A0(mts_fx[88]), .B0(acc[88]), .CI(
        intadd_0_n14), .CO(intadd_0_n13), .S0(intadd_0_SUM_87_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U13 ( .A0(mts_fx[89]), .B0(acc[89]), .CI(
        intadd_0_n13), .CO(intadd_0_n12), .S0(intadd_0_SUM_88_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U12 ( .A0(mts_fx[90]), .B0(acc[90]), .CI(
        intadd_0_n12), .CO(intadd_0_n11), .S0(intadd_0_SUM_89_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U11 ( .A0(mts_fx[91]), .B0(acc[91]), .CI(
        intadd_0_n11), .CO(intadd_0_n10), .S0(intadd_0_SUM_90_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U10 ( .A0(mts_fx[92]), .B0(acc[92]), .CI(
        intadd_0_n10), .CO(intadd_0_n9), .S0(intadd_0_SUM_91_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U9 ( .A0(mts_fx[93]), .B0(acc[93]), .CI(
        intadd_0_n9), .CO(intadd_0_n8), .S0(intadd_0_SUM_92_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U8 ( .A0(mts_fx[94]), .B0(acc[94]), .CI(
        intadd_0_n8), .CO(intadd_0_n7), .S0(intadd_0_SUM_93_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U7 ( .A0(mts_fx[95]), .B0(acc[95]), .CI(
        intadd_0_n7), .CO(intadd_0_n6), .S0(intadd_0_SUM_94_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U6 ( .A0(mts_fx[96]), .B0(acc[96]), .CI(
        intadd_0_n6), .CO(intadd_0_n5), .S0(intadd_0_SUM_95_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U5 ( .A0(mts_fx[97]), .B0(acc[97]), .CI(
        intadd_0_n5), .CO(intadd_0_n4), .S0(intadd_0_SUM_96_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U4 ( .A0(mts_fx[98]), .B0(acc[98]), .CI(
        intadd_0_n4), .CO(intadd_0_n3), .S0(intadd_0_SUM_97_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U3 ( .A0(mts_fx[99]), .B0(acc[99]), .CI(
        intadd_0_n3), .CO(intadd_0_n2), .S0(intadd_0_SUM_98_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U2 ( .A0(mts_fx[100]), .B0(acc[100]), .CI(
        intadd_0_n2), .CO(intadd_0_n1), .S0(intadd_0_SUM_99_) );
  C8T28SOI_LR_FA1X4_P0 intadd_1_U7 ( .A0(mts_m[7]), .B0(sf_w[0]), .CI(
        intadd_1_CI), .CO(intadd_1_n6), .S0(n97) );
  C8T28SOI_LR_FA1X4_P0 intadd_1_U6 ( .A0(sf_d[0]), .B0(intadd_1_B_1_), .CI(
        intadd_1_n6), .CO(intadd_1_n5), .S0(n98) );
  C8T28SOI_LR_FA1X4_P0 intadd_1_U5 ( .A0(intadd_1_A_2_), .B0(intadd_1_B_2_), 
        .CI(intadd_1_n5), .CO(intadd_1_n4), .S0(n99) );
  C8T28SOI_LR_FA1X4_P0 intadd_1_U4 ( .A0(intadd_1_A_3_), .B0(intadd_1_B_3_), 
        .CI(intadd_1_n4), .CO(intadd_1_n3), .S0(n100) );
  C8T28SOI_LR_FA1X4_P0 intadd_1_U3 ( .A0(intadd_1_A_4_), .B0(intadd_1_B_4_), 
        .CI(intadd_1_n3), .CO(intadd_1_n2), .S0(n101) );
  C8T28SOI_LR_FA1X4_P0 intadd_1_U2 ( .A0(intadd_1_A_5_), .B0(intadd_1_B_5_), 
        .CI(intadd_1_n2), .CO(intadd_1_n1), .S0(n102) );
  C8T28SOI_LR_DFPRQX4_P0 exp_sf_reg_0_ ( .D(n965), .CP(n2345), .RN(n3837), .Q(
        exp_sf[0]) );
  C8T28SOI_LR_DFPRQX4_P0 exp_sf_reg_1_ ( .D(n966), .CP(n2345), .RN(n3837), .Q(
        exp_sf[1]) );
  C8T28SOI_LR_DFPRQX4_P0 exp_p_reg_1_ ( .D(n983), .CP(n2345), .RN(n3837), .Q(
        exp_p[1]) );
  C8T28SOI_LR_DFPRQX4_P0 exp_p_reg_0_ ( .D(n982), .CP(n2345), .RN(n3837), .Q(
        exp_p[0]) );
  C8T28SOI_LR_DFPRQX4_P0 sf_q_reg_1_ ( .D(n916), .CP(n2345), .RN(n3846), .Q(
        sf_q[1]) );
  C8T28SOI_LR_DFPRQX4_P0 sf_q_reg_0_ ( .D(n915), .CP(n2345), .RN(n3846), .Q(
        sf_q[0]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_101_ ( .D(n929), .CP(n2345), .RN(n3846), 
        .Q(mts_tmp[101]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_100_ ( .D(n928), .CP(n2345), .RN(n3846), 
        .Q(mts_tmp[100]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_99_ ( .D(n927), .CP(n2345), .RN(n3837), 
        .Q(mts_tmp[99]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_98_ ( .D(n926), .CP(n2345), .RN(n3846), 
        .Q(mts_tmp[98]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_97_ ( .D(n925), .CP(n2345), .RN(n3837), 
        .Q(mts_tmp[97]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_96_ ( .D(n924), .CP(n2345), .RN(n3846), 
        .Q(mts_tmp[96]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_95_ ( .D(n923), .CP(n2345), .RN(n3837), 
        .Q(mts_tmp[95]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_94_ ( .D(n922), .CP(n2345), .RN(n3837), 
        .Q(mts_tmp[94]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_o_tmp_reg ( .D(n3889), .CP(n2344), .RN(n3841), 
        .Q(vld_o) );
  C8T28SOI_LR_DFPRQX4_P0 acc_o_fin_reg_0_ ( .D(n1159), .CP(n2344), .RN(n3834), 
        .Q(acc_o[0]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_o_fin_reg_1_ ( .D(n1160), .CP(n2344), .RN(n3834), 
        .Q(acc_o[1]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_o_fin_reg_2_ ( .D(n1161), .CP(n2344), .RN(n3834), 
        .Q(acc_o[2]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_o_fin_reg_3_ ( .D(n1162), .CP(n2344), .RN(n3834), 
        .Q(acc_o[3]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_o_fin_reg_4_ ( .D(n1163), .CP(n2344), .RN(n3834), 
        .Q(acc_o[4]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_o_fin_reg_5_ ( .D(n1164), .CP(n2344), .RN(n3834), 
        .Q(acc_o[5]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_o_fin_reg_6_ ( .D(n1165), .CP(n2344), .RN(n3834), 
        .Q(acc_o[6]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_o_fin_reg_7_ ( .D(n1166), .CP(n2344), .RN(n3834), 
        .Q(acc_o[7]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_reg_17_ ( .D(n1095), .CP(n2342), .RN(n3844), .Q(
        tmp[17]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_101_ ( .D(n234), .CP(net3198), .RN(n3847), 
        .Q(mts_fx[101]) );
  C8T28SOI_LR_DFPRQX4_P0 sf_q_reg_5_ ( .D(n920), .CP(n2345), .RN(n3846), .Q(
        sf_q[5]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_o_tmp_reg_6_ ( .D(n1156), .CP(n2345), .RN(n3844), 
        .Q(acc_o_tmp[6]) );
  C8T28SOI_LR_DFPRQX4_P0 regi_p_reg_2_ ( .D(n981), .CP(n2345), .RN(n3837), .Q(
        regi_p[2]) );
  C8T28SOI_LR_DFPRQX4_P0 regi_p_reg_1_ ( .D(n980), .CP(n2345), .RN(n3837), .Q(
        regi_p[1]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_reg_16_ ( .D(n1094), .CP(n2342), .RN(n3844), .Q(
        tmp[16]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_reg_3_ ( .D(n1081), .CP(n2342), .RN(n3843), .Q(
        tmp[3]) );
  C8T28SOI_LR_DFPRQX4_P0 regi_p_reg_0_ ( .D(n979), .CP(n2345), .RN(n3837), .Q(
        regi_p[0]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_reg_7_ ( .D(n1085), .CP(n2342), .RN(n3844), .Q(
        tmp[7]) );
  C8T28SOI_LR_DFPRQX4_P0 sf_q_reg_6_ ( .D(n921), .CP(n2345), .RN(n3846), .Q(
        sf_q[6]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_q_reg_7_ ( .D(n937), .CP(n2345), .RN(n3846), .Q(
        mts_q[7]) );
  C8T28SOI_LR_DFPRQX4_P0 sign_m_reg ( .D(n60), .CP(net3192), .RN(rstn), .Q(
        sign_m) );
  C8T28SOI_LR_DFPRQX4_P0 mts_q_reg_0_ ( .D(n930), .CP(n2345), .RN(n3837), .Q(
        mts_q[0]) );
  C8T28SOI_LR_DFPRQX4_P0 sf_q_reg_4_ ( .D(n919), .CP(n2345), .RN(n3846), .Q(
        sf_q[4]) );
  C8T28SOI_LR_DFPRQX4_P0 sf_q_reg_3_ ( .D(n918), .CP(n2345), .RN(n3846), .Q(
        sf_q[3]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_o_tmp_reg_5_ ( .D(n1155), .CP(n2345), .RN(n3844), 
        .Q(acc_o_tmp[5]) );
  C8T28SOI_LR_DFPRQX4_P0 sf_q_reg_2_ ( .D(n917), .CP(n2345), .RN(n3846), .Q(
        sf_q[2]) );
  C8T28SOI_LR_DFPRQX4_P0 sign_q_reg ( .D(n780), .CP(n2346), .RN(n3845), .Q(
        sign_q) );
  C8T28SOI_LR_DFPRQX4_P0 sf_d_reg_5_ ( .D(n59), .CP(net3192), .RN(rstn), .Q(
        sf_d[5]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_m_reg_6_ ( .D(n67), .CP(net3192), .RN(rstn), .Q(
        mts_m[6]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_reg_6_ ( .D(n1084), .CP(n2342), .RN(n3843), .Q(
        tmp[6]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_reg_1_ ( .D(n1079), .CP(n2342), .RN(n3843), .Q(
        tmp[1]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_o_tmp_reg_4_ ( .D(n1154), .CP(n2345), .RN(n3844), 
        .Q(acc_o_tmp[4]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_reg_15_ ( .D(n1093), .CP(n2342), .RN(n3844), .Q(
        tmp[15]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_neg_reg_7_ ( .D(n1051), .CP(n2343), .RN(n3837), 
        .Q(tmp_neg[7]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_neg_reg_8_ ( .D(n1052), .CP(n2343), .RN(n3837), 
        .Q(tmp_neg[8]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_q_reg_2_ ( .D(n932), .CP(n2345), .RN(n3837), .Q(
        mts_q[2]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_neg_reg_10_ ( .D(n1054), .CP(n2343), .RN(n3837), 
        .Q(tmp_neg[10]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_neg_reg_9_ ( .D(n1053), .CP(n2343), .RN(n3837), 
        .Q(tmp_neg[9]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_neg_reg_11_ ( .D(n1055), .CP(n2343), .RN(n3837), 
        .Q(tmp_neg[11]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_q_reg_1_ ( .D(n931), .CP(n2345), .RN(n3837), .Q(
        mts_q[1]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_neg_reg_12_ ( .D(n1056), .CP(n2343), .RN(n3837), 
        .Q(tmp_neg[12]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_neg_reg_16_ ( .D(n1060), .CP(n2343), .RN(n3837), 
        .Q(tmp_neg[16]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_neg_reg_13_ ( .D(n1057), .CP(n2343), .RN(n3837), 
        .Q(tmp_neg[13]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_reg_14_ ( .D(n1092), .CP(n2342), .RN(n3844), .Q(
        tmp[14]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_101_ ( .D(n461), .CP(net3208), .RN(n3845), 
        .Q(acc[101]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_neg_reg_14_ ( .D(n1058), .CP(n2343), .RN(n3843), 
        .Q(tmp_neg[14]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_neg_reg_15_ ( .D(n1059), .CP(n2343), .RN(n3843), 
        .Q(tmp_neg[15]) );
  C8T28SOI_LR_DFPRQX4_P0 sf_w_reg_5_ ( .D(n53), .CP(net3192), .RN(rstn), .Q(
        sf_w[5]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_m_reg_5_ ( .D(n66), .CP(net3192), .RN(n3848), .Q(
        mts_m[5]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_o_tmp_reg_3_ ( .D(n1153), .CP(n2345), .RN(n3844), 
        .Q(acc_o_tmp[3]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_q_reg_5_ ( .D(n935), .CP(n2345), .RN(n3837), .Q(
        mts_q[5]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_reg_4_ ( .D(n1082), .CP(n2342), .RN(n3843), .Q(
        tmp[4]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_reg_8_ ( .D(n1086), .CP(n2342), .RN(n3843), .Q(
        tmp[8]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_100_ ( .D(n233), .CP(net3198), .RN(n3842), 
        .Q(mts_fx[100]) );
  C8T28SOI_LR_DFPRQX4_P0 shift_neg_reg_1_ ( .D(n1075), .CP(n2343), .RN(n3843), 
        .Q(shift_neg[1]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_reg_0_ ( .D(n1078), .CP(n2342), .RN(n3843), .Q(
        tmp[0]) );
  C8T28SOI_LR_DFPRQX4_P0 shift_pos_reg_1_ ( .D(n1072), .CP(n2343), .RN(n3843), 
        .Q(shift_pos[1]) );
  C8T28SOI_LR_DFPRQX4_P0 shift_neg_reg_2_ ( .D(n1076), .CP(n2343), .RN(n3843), 
        .Q(shift_neg[2]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_reg_9_ ( .D(n1087), .CP(n2342), .RN(n3843), .Q(
        tmp[9]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_reg_5_ ( .D(n1083), .CP(n2342), .RN(n3843), .Q(
        tmp[5]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_reg_2_ ( .D(n1080), .CP(n2342), .RN(n3843), .Q(
        tmp[2]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_100_ ( .D(n460), .CP(net3208), .RN(n3845), 
        .Q(acc[100]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_q_reg_4_ ( .D(n934), .CP(n2345), .RN(n3837), .Q(
        mts_q[4]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_q_reg_3_ ( .D(n933), .CP(n2345), .RN(n3837), .Q(
        mts_q[3]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_q_reg_6_ ( .D(n936), .CP(n2345), .RN(n3846), .Q(
        mts_q[6]) );
  C8T28SOI_LR_DFPRQX4_P0 shift_neg_reg_0_ ( .D(n1074), .CP(n2343), .RN(n3843), 
        .Q(shift_neg[0]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_m_reg_4_ ( .D(n65), .CP(net3192), .RN(n3848), .Q(
        mts_m[4]) );
  C8T28SOI_LR_DFPRQX4_P0 sf_w_reg_4_ ( .D(n52), .CP(net3192), .RN(rstn), .Q(
        sf_w[4]) );
  C8T28SOI_LR_DFPRQX4_P0 sf_d_reg_4_ ( .D(n58), .CP(net3192), .RN(rstn), .Q(
        sf_d[4]) );
  C8T28SOI_LR_DFPRQX4_P0 shift_pos_reg_0_ ( .D(n1071), .CP(n2343), .RN(n3843), 
        .Q(shift_pos[0]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_reg_13_ ( .D(n1091), .CP(n2342), .RN(n3844), .Q(
        tmp[13]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_o_tmp_reg_1_ ( .D(n1151), .CP(n2345), .RN(n3844), 
        .Q(acc_o_tmp[1]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_o_tmp_reg_2_ ( .D(n1152), .CP(n2345), .RN(n3844), 
        .Q(acc_o_tmp[2]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_o_tmp_reg_0_ ( .D(n1150), .CP(n2345), .RN(n3844), 
        .Q(acc_o_tmp[0]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_m_reg_1_ ( .D(n62), .CP(net3192), .RN(rstn), .Q(
        mts_m[1]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_99_ ( .D(n232), .CP(net3198), .RN(n3847), 
        .Q(mts_fx[99]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_m_reg_3_ ( .D(n64), .CP(net3192), .RN(rstn), .Q(
        mts_m[3]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_m_reg_2_ ( .D(n63), .CP(net3192), .RN(rstn), .Q(
        mts_m[2]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_reg_12_ ( .D(n1090), .CP(n2342), .RN(n3844), .Q(
        tmp[12]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_m_reg_0_ ( .D(n61), .CP(net3192), .RN(rstn), .Q(
        mts_m[0]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_ms_reg_3_ ( .D(n127), .CP(clk_i), .RN(n3852), .Q(
        mts_ms[3]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_99_ ( .D(n459), .CP(net3208), .RN(n3845), .Q(
        acc[99]) );
  C8T28SOI_LR_DFPRQX4_P0 counter_reg_3_ ( .D(n356), .CP(net3208), .RN(n3841), 
        .Q(counter[3]) );
  C8T28SOI_LR_DFPRQX4_P0 sf_bias_reg_4_ ( .D(n101), .CP(net3203), .RN(rstn), 
        .Q(sf_bias[4]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_ms_reg_5_ ( .D(n129), .CP(clk_i), .RN(n3852), .Q(
        mts_ms[5]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_ms_reg_4_ ( .D(n128), .CP(clk_i), .RN(n3852), .Q(
        mts_ms[4]) );
  C8T28SOI_LR_DFPRQX4_P0 shift_pos_reg_2_ ( .D(n1073), .CP(n2343), .RN(n3843), 
        .Q(shift_pos[2]) );
  C8T28SOI_LR_DFPRQX4_P0 sign_sf_reg ( .D(n960), .CP(n2345), .RN(n3837), .Q(
        sign_sf) );
  C8T28SOI_LR_DFPRQX4_P0 sf_bias_reg_7_ ( .D(n104), .CP(net3203), .RN(n3852), 
        .Q(sf_bias[7]) );
  C8T28SOI_LR_DFPRQX4_P0 sf_w_reg_3_ ( .D(n51), .CP(net3192), .RN(rstn), .Q(
        sf_w[3]) );
  C8T28SOI_LR_DFPRQX4_P0 sf_d_reg_3_ ( .D(n57), .CP(net3192), .RN(rstn), .Q(
        sf_d[3]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_98_ ( .D(n231), .CP(net3198), .RN(n3847), 
        .Q(mts_fx[98]) );
  C8T28SOI_LR_DFPRQX4_P0 sf_bias_reg_6_ ( .D(n103), .CP(net3203), .RN(n3852), 
        .Q(sf_bias[6]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_98_ ( .D(n458), .CP(net3208), .RN(n3845), .Q(
        acc[98]) );
  C8T28SOI_LR_DFPRQX4_P0 sf_bias_reg_2_ ( .D(n99), .CP(net3203), .RN(n3852), 
        .Q(sf_bias[2]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_reg_11_ ( .D(n1089), .CP(n2342), .RN(n3844), .Q(
        tmp[11]) );
  C8T28SOI_LR_DFPRQX4_P0 sf_bias_reg_3_ ( .D(n100), .CP(net3203), .RN(n3852), 
        .Q(sf_bias[3]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_ms_reg_2_ ( .D(n126), .CP(clk_i), .RN(n3852), .Q(
        mts_ms[2]) );
  C8T28SOI_LR_DFPRQX4_P0 counter_reg_0_ ( .D(n352), .CP(net3208), .RN(n3841), 
        .Q(counter[0]) );
  C8T28SOI_LR_DFPRQX4_P0 counter_reg_2_ ( .D(n355), .CP(net3208), .RN(n3841), 
        .Q(counter[2]) );
  C8T28SOI_LR_DFPRQX4_P0 counter_reg_1_ ( .D(n354), .CP(net3208), .RN(n3841), 
        .Q(counter[1]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_ms_reg_1_ ( .D(n125), .CP(clk_i), .RN(n3852), .Q(
        mts_ms[1]) );
  C8T28SOI_LR_DFPRQX4_P0 tmp_reg_10_ ( .D(n1088), .CP(n2342), .RN(n3844), .Q(
        tmp[10]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_ms_reg_0_ ( .D(n124), .CP(clk_i), .RN(n3852), .Q(
        mts_ms[0]) );
  C8T28SOI_LR_DFPRQX4_P0 sf_d_reg_2_ ( .D(n56), .CP(net3192), .RN(rstn), .Q(
        sf_d[2]) );
  C8T28SOI_LR_DFPRQX4_P0 sf_w_reg_2_ ( .D(n50), .CP(net3192), .RN(rstn), .Q(
        sf_w[2]) );
  C8T28SOI_LR_DFPRQX4_P0 sf_bias_reg_5_ ( .D(n102), .CP(net3203), .RN(rstn), 
        .Q(sf_bias[5]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_ms_reg_8_ ( .D(n132), .CP(clk_i), .RN(rstn), .Q(
        mts_ms[8]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_97_ ( .D(n230), .CP(net3198), .RN(n3847), 
        .Q(mts_fx[97]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_ms_reg_7_ ( .D(n131), .CP(clk_i), .RN(n3852), .Q(
        mts_ms[7]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_ms_reg_6_ ( .D(n130), .CP(clk_i), .RN(n3852), .Q(
        mts_ms[6]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_97_ ( .D(n457), .CP(net3208), .RN(rstn), .Q(
        acc[97]) );
  C8T28SOI_LR_DFPRQX4_P0 regi_sf_reg_3_ ( .D(n964), .CP(n2345), .RN(n3837), 
        .Q(regi_sf[3]) );
  C8T28SOI_LR_DFPRQX4_P0 sf_d_reg_1_ ( .D(n55), .CP(net3192), .RN(rstn), .Q(
        sf_d[1]) );
  C8T28SOI_LR_DFPRQX4_P0 sf_w_reg_1_ ( .D(n49), .CP(net3192), .RN(rstn), .Q(
        sf_w[1]) );
  C8T28SOI_LR_DFPRQX4_P0 regi_sf_reg_0_ ( .D(n961), .CP(n2345), .RN(n3837), 
        .Q(regi_sf[0]) );
  C8T28SOI_LR_DFPRQX4_P0 regi_sf_reg_1_ ( .D(n962), .CP(n2345), .RN(n3837), 
        .Q(regi_sf[1]) );
  C8T28SOI_LR_DFPRQX4_P0 sf_w_reg_0_ ( .D(n48), .CP(net3192), .RN(rstn), .Q(
        sf_w[0]) );
  C8T28SOI_LR_DFPRQX4_P0 regi_sf_reg_2_ ( .D(n963), .CP(n2345), .RN(n3837), 
        .Q(regi_sf[2]) );
  C8T28SOI_LR_DFPRQX4_P0 sf_bias_reg_0_ ( .D(n97), .CP(net3203), .RN(rstn), 
        .Q(sf_bias[0]) );
  C8T28SOI_LR_DFPRQX4_P0 zc_i_reg ( .D(n3884), .CP(n2346), .RN(n3839), .Q(zc_i) );
  C8T28SOI_LR_DFPRQX4_P0 sf_d_reg_0_ ( .D(n54), .CP(net3192), .RN(rstn), .Q(
        sf_d[0]) );
  C8T28SOI_LR_DFPRQX4_P0 sf_bias_reg_1_ ( .D(n98), .CP(net3203), .RN(rstn), 
        .Q(sf_bias[1]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_96_ ( .D(n229), .CP(net3198), .RN(n3847), 
        .Q(mts_fx[96]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_m_reg_7_ ( .D(n68), .CP(net3192), .RN(rstn), .Q(
        mts_m[7]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_96_ ( .D(n456), .CP(net3208), .RN(rstn), .Q(
        acc[96]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_95_ ( .D(n228), .CP(net3198), .RN(n3847), 
        .Q(mts_fx[95]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_95_ ( .D(n455), .CP(net3208), .RN(rstn), .Q(
        acc[95]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_rdy_reg ( .D(n2351), .CP(clk_i), .RN(n3834), .Q(
        acc_rdy) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_94_ ( .D(n227), .CP(net3198), .RN(n3852), 
        .Q(mts_fx[94]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_94_ ( .D(n454), .CP(net3208), .RN(rstn), .Q(
        acc[94]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_14_ ( .D(vld_d[13]), .CP(clk_i), .RN(n3834), 
        .Q(vld_d[14]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_93_ ( .D(n226), .CP(net3198), .RN(rstn), 
        .Q(mts_fx[93]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_93_ ( .D(n453), .CP(net3208), .RN(n3848), .Q(
        acc[93]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_11_ ( .D(vld_d[10]), .CP(clk_i), .RN(n3834), 
        .Q(vld_d[11]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_12_ ( .D(vld_d[11]), .CP(clk_i), .RN(n3834), 
        .Q(vld_d[12]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_92_ ( .D(n225), .CP(net3198), .RN(rstn), 
        .Q(mts_fx[92]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_92_ ( .D(n452), .CP(net3208), .RN(n3848), .Q(
        acc[92]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_6_ ( .D(vld_d[5]), .CP(clk_i), .RN(n3834), 
        .Q(vld_d[6]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_5_ ( .D(vld_d[4]), .CP(clk_i), .RN(n3834), 
        .Q(vld_d[5]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_0_ ( .D(vld_i), .CP(clk_i), .RN(n3834), .Q(
        vld_d[0]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_7_ ( .D(vld_d[6]), .CP(clk_i), .RN(n3834), 
        .Q(vld_d[7]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_1_ ( .D(vld_d[0]), .CP(clk_i), .RN(n3834), 
        .Q(vld_d[1]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_4_ ( .D(vld_d[3]), .CP(clk_i), .RN(n3834), 
        .Q(vld_d[4]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_91_ ( .D(n224), .CP(net3198), .RN(n3852), 
        .Q(mts_fx[91]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_91_ ( .D(n451), .CP(net3208), .RN(n3848), .Q(
        acc[91]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_13_ ( .D(vld_d[12]), .CP(clk_i), .RN(n3834), 
        .Q(vld_d[13]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_100_ ( .D(n882), .CP(n2346), .RN(n3838), 
        .Q(acc_mag[100]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_101_ ( .D(n883), .CP(n2346), .RN(n3838), 
        .Q(acc_mag[101]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_9_ ( .D(vld_d[8]), .CP(clk_i), .RN(n3834), 
        .Q(vld_d[9]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_10_ ( .D(vld_d[9]), .CP(clk_i), .RN(n3834), 
        .Q(vld_d[10]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_3_ ( .D(vld_d[2]), .CP(clk_i), .RN(n3834), 
        .Q(vld_d[3]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_8_ ( .D(vld_d[7]), .CP(clk_i), .RN(n3834), 
        .Q(vld_d[8]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_2_ ( .D(vld_d[1]), .CP(clk_i), .RN(n3834), 
        .Q(vld_d[2]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_99_ ( .D(n881), .CP(n2346), .RN(n3838), 
        .Q(acc_mag[99]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_90_ ( .D(n223), .CP(net3198), .RN(n3852), 
        .Q(mts_fx[90]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_98_ ( .D(n880), .CP(n2346), .RN(n3838), 
        .Q(acc_mag[98]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_90_ ( .D(n450), .CP(net3208), .RN(n3848), .Q(
        acc[90]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_94_ ( .D(n876), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[94]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_95_ ( .D(n877), .CP(n2346), .RN(n3838), 
        .Q(acc_mag[95]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_91_ ( .D(n873), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[91]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_90_ ( .D(n872), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[90]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_89_ ( .D(n222), .CP(net3198), .RN(n3852), 
        .Q(mts_fx[89]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_93_ ( .D(n875), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[93]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_92_ ( .D(n874), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[92]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_96_ ( .D(n878), .CP(n2346), .RN(n3838), 
        .Q(acc_mag[96]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_97_ ( .D(n879), .CP(n2346), .RN(n3838), 
        .Q(acc_mag[97]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_89_ ( .D(n449), .CP(net3208), .RN(n3848), .Q(
        acc[89]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_87_ ( .D(n869), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[87]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_86_ ( .D(n868), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[86]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_89_ ( .D(n871), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[89]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_88_ ( .D(n870), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[88]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_82_ ( .D(n864), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[82]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_88_ ( .D(n221), .CP(net3198), .RN(rstn), 
        .Q(mts_fx[88]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_85_ ( .D(n867), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[85]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_84_ ( .D(n866), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[84]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_88_ ( .D(n448), .CP(net3208), .RN(n3848), .Q(
        acc[88]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_83_ ( .D(n865), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[83]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_80_ ( .D(n862), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[80]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_81_ ( .D(n863), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[81]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_79_ ( .D(n861), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[79]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_87_ ( .D(n220), .CP(net3198), .RN(rstn), 
        .Q(mts_fx[87]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_87_ ( .D(n447), .CP(net3208), .RN(rstn), .Q(
        acc[87]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_78_ ( .D(n860), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[78]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_76_ ( .D(n858), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[76]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_77_ ( .D(n859), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[77]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_86_ ( .D(n219), .CP(net3198), .RN(rstn), 
        .Q(mts_fx[86]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_75_ ( .D(n857), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[75]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_74_ ( .D(n856), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[74]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_86_ ( .D(n446), .CP(net3208), .RN(rstn), .Q(
        acc[86]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_73_ ( .D(n855), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[73]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_72_ ( .D(n854), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[72]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_70_ ( .D(n852), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[70]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_85_ ( .D(n218), .CP(net3198), .RN(rstn), 
        .Q(mts_fx[85]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_71_ ( .D(n853), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[71]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_85_ ( .D(n445), .CP(net3208), .RN(rstn), .Q(
        acc[85]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_68_ ( .D(n850), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[68]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_69_ ( .D(n851), .CP(n2346), .RN(n3850), 
        .Q(acc_mag[69]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_67_ ( .D(n849), .CP(n2346), .RN(n3838), 
        .Q(acc_mag[67]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_66_ ( .D(n848), .CP(n2346), .RN(n3838), 
        .Q(acc_mag[66]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_64_ ( .D(n846), .CP(n2346), .RN(n3838), 
        .Q(acc_mag[64]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_84_ ( .D(n217), .CP(net3198), .RN(rstn), 
        .Q(mts_fx[84]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_84_ ( .D(n444), .CP(net3208), .RN(rstn), .Q(
        acc[84]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_65_ ( .D(n847), .CP(n2346), .RN(n3838), 
        .Q(acc_mag[65]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_63_ ( .D(n845), .CP(n2346), .RN(n3838), 
        .Q(acc_mag[63]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_62_ ( .D(n844), .CP(n2346), .RN(n3838), 
        .Q(acc_mag[62]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_61_ ( .D(n843), .CP(n2346), .RN(n3838), 
        .Q(acc_mag[61]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_83_ ( .D(n216), .CP(net3198), .RN(rstn), 
        .Q(mts_fx[83]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_60_ ( .D(n842), .CP(n2346), .RN(n3838), 
        .Q(acc_mag[60]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_83_ ( .D(n443), .CP(net3208), .RN(rstn), .Q(
        acc[83]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_58_ ( .D(n840), .CP(n2346), .RN(n3838), 
        .Q(acc_mag[58]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_59_ ( .D(n841), .CP(n2346), .RN(n3838), 
        .Q(acc_mag[59]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_56_ ( .D(n838), .CP(n2346), .RN(n3838), 
        .Q(acc_mag[56]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_82_ ( .D(n215), .CP(net3198), .RN(rstn), 
        .Q(mts_fx[82]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_57_ ( .D(n839), .CP(n2346), .RN(n3838), 
        .Q(acc_mag[57]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_55_ ( .D(n837), .CP(n2346), .RN(n3838), 
        .Q(acc_mag[55]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_82_ ( .D(n442), .CP(net3208), .RN(rstn), .Q(
        acc[82]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_54_ ( .D(n836), .CP(n2346), .RN(n3838), 
        .Q(acc_mag[54]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_52_ ( .D(n834), .CP(n2346), .RN(n3838), 
        .Q(acc_mag[52]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_53_ ( .D(n835), .CP(n2346), .RN(n3838), 
        .Q(acc_mag[53]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_81_ ( .D(n214), .CP(net3198), .RN(rstn), 
        .Q(mts_fx[81]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_81_ ( .D(n441), .CP(net3208), .RN(rstn), .Q(
        acc[81]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_50_ ( .D(n832), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[50]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_51_ ( .D(n833), .CP(n2346), .RN(n3838), 
        .Q(acc_mag[51]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_49_ ( .D(n831), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[49]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_0_ ( .D(n782), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[0]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_48_ ( .D(n830), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[48]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_46_ ( .D(n828), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[46]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_80_ ( .D(n213), .CP(net3198), .RN(rstn), 
        .Q(mts_fx[80]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_80_ ( .D(n440), .CP(net3208), .RN(rstn), .Q(
        acc[80]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_47_ ( .D(n829), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[47]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_44_ ( .D(n826), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[44]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_45_ ( .D(n827), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[45]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_43_ ( .D(n825), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[43]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_42_ ( .D(n824), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[42]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_79_ ( .D(n212), .CP(net3198), .RN(rstn), 
        .Q(mts_fx[79]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_40_ ( .D(n822), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[40]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_79_ ( .D(n439), .CP(net3208), .RN(rstn), .Q(
        acc[79]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_41_ ( .D(n823), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[41]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_38_ ( .D(n820), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[38]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_39_ ( .D(n821), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[39]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_78_ ( .D(n211), .CP(net3198), .RN(rstn), 
        .Q(mts_fx[78]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_37_ ( .D(n819), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[37]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_78_ ( .D(n438), .CP(net3208), .RN(rstn), .Q(
        acc[78]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_34_ ( .D(n816), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[34]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_36_ ( .D(n818), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[36]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_35_ ( .D(n817), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[35]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_77_ ( .D(n210), .CP(net3198), .RN(rstn), 
        .Q(mts_fx[77]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_32_ ( .D(n814), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[32]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_77_ ( .D(n437), .CP(net3208), .RN(rstn), .Q(
        acc[77]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_33_ ( .D(n815), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[33]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_31_ ( .D(n813), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[31]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_30_ ( .D(n812), .CP(n2346), .RN(n3846), 
        .Q(acc_mag[30]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_28_ ( .D(n810), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[28]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_29_ ( .D(n811), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[29]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_76_ ( .D(n209), .CP(net3198), .RN(rstn), 
        .Q(mts_fx[76]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_76_ ( .D(n436), .CP(net3208), .RN(rstn), .Q(
        acc[76]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_26_ ( .D(n808), .CP(n2346), .RN(n3846), 
        .Q(acc_mag[26]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_27_ ( .D(n809), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[27]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_25_ ( .D(n807), .CP(n2346), .RN(n3846), 
        .Q(acc_mag[25]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_22_ ( .D(n804), .CP(n2346), .RN(n3846), 
        .Q(acc_mag[22]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_24_ ( .D(n806), .CP(n2346), .RN(n3846), 
        .Q(acc_mag[24]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_75_ ( .D(n208), .CP(net3198), .RN(rstn), 
        .Q(mts_fx[75]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_75_ ( .D(n435), .CP(net3208), .RN(rstn), .Q(
        acc[75]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_23_ ( .D(n805), .CP(n2346), .RN(n3846), 
        .Q(acc_mag[23]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_20_ ( .D(n802), .CP(n2346), .RN(n3846), 
        .Q(acc_mag[20]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_21_ ( .D(n803), .CP(n2346), .RN(n3846), 
        .Q(acc_mag[21]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_19_ ( .D(n801), .CP(n2346), .RN(n3846), 
        .Q(acc_mag[19]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_74_ ( .D(n207), .CP(net3198), .RN(rstn), 
        .Q(mts_fx[74]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_18_ ( .D(n800), .CP(n2346), .RN(n3846), 
        .Q(acc_mag[18]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_74_ ( .D(n434), .CP(net3208), .RN(rstn), .Q(
        acc[74]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_16_ ( .D(n798), .CP(n2346), .RN(n3846), 
        .Q(acc_mag[16]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_17_ ( .D(n799), .CP(n2346), .RN(n3846), 
        .Q(acc_mag[17]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_73_ ( .D(n206), .CP(net3198), .RN(rstn), 
        .Q(mts_fx[73]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_14_ ( .D(n796), .CP(n2346), .RN(n3846), 
        .Q(acc_mag[14]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_15_ ( .D(n797), .CP(n2346), .RN(n3846), 
        .Q(acc_mag[15]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_73_ ( .D(n433), .CP(net3208), .RN(rstn), .Q(
        acc[73]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_13_ ( .D(n795), .CP(n2346), .RN(n3846), 
        .Q(acc_mag[13]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_10_ ( .D(n792), .CP(n2346), .RN(n3837), 
        .Q(acc_mag[10]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_12_ ( .D(n794), .CP(n2346), .RN(n3846), 
        .Q(acc_mag[12]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_11_ ( .D(n793), .CP(n2346), .RN(n3837), 
        .Q(acc_mag[11]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_72_ ( .D(n205), .CP(net3198), .RN(rstn), 
        .Q(mts_fx[72]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_72_ ( .D(n432), .CP(net3208), .RN(rstn), .Q(
        acc[72]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_8_ ( .D(n790), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[8]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_9_ ( .D(n791), .CP(n2346), .RN(n3837), 
        .Q(acc_mag[9]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_7_ ( .D(n789), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[7]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_6_ ( .D(n788), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[6]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_4_ ( .D(n786), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[4]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_71_ ( .D(n204), .CP(net3198), .RN(rstn), 
        .Q(mts_fx[71]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_71_ ( .D(n431), .CP(net3208), .RN(n3848), .Q(
        acc[71]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_1_ ( .D(n783), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[1]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_3_ ( .D(n785), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[3]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_5_ ( .D(n787), .CP(n2346), .RN(n3839), 
        .Q(acc_mag[5]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_2_ ( .D(n784), .CP(n2346), .RN(n3844), 
        .Q(acc_mag[2]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_70_ ( .D(n203), .CP(net3198), .RN(rstn), 
        .Q(mts_fx[70]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_70_ ( .D(n430), .CP(net3208), .RN(n3848), .Q(
        acc[70]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_69_ ( .D(n202), .CP(net3198), .RN(rstn), 
        .Q(mts_fx[69]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_69_ ( .D(n429), .CP(net3208), .RN(n3848), .Q(
        acc[69]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_68_ ( .D(n201), .CP(net3198), .RN(rstn), 
        .Q(mts_fx[68]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_68_ ( .D(n428), .CP(net3208), .RN(n3848), .Q(
        acc[68]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_67_ ( .D(n200), .CP(net3198), .RN(n3847), 
        .Q(mts_fx[67]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_67_ ( .D(n427), .CP(net3208), .RN(n3848), .Q(
        acc[67]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_66_ ( .D(n199), .CP(net3198), .RN(n3852), 
        .Q(mts_fx[66]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_66_ ( .D(n426), .CP(net3208), .RN(n3848), .Q(
        acc[66]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_65_ ( .D(n198), .CP(net3198), .RN(n3847), 
        .Q(mts_fx[65]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_65_ ( .D(n425), .CP(net3208), .RN(rstn), .Q(
        acc[65]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_64_ ( .D(n197), .CP(net3198), .RN(n3847), 
        .Q(mts_fx[64]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_64_ ( .D(n424), .CP(net3208), .RN(rstn), .Q(
        acc[64]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_63_ ( .D(n196), .CP(net3198), .RN(n3847), 
        .Q(mts_fx[63]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_63_ ( .D(n423), .CP(net3208), .RN(rstn), .Q(
        acc[63]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_62_ ( .D(n195), .CP(net3198), .RN(n3847), 
        .Q(mts_fx[62]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_62_ ( .D(n422), .CP(net3208), .RN(rstn), .Q(
        acc[62]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_61_ ( .D(n194), .CP(net3198), .RN(n3847), 
        .Q(mts_fx[61]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_61_ ( .D(n421), .CP(net3208), .RN(rstn), .Q(
        acc[61]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_60_ ( .D(n193), .CP(net3198), .RN(n3847), 
        .Q(mts_fx[60]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_60_ ( .D(n420), .CP(net3208), .RN(rstn), .Q(
        acc[60]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_59_ ( .D(n192), .CP(net3198), .RN(n3852), 
        .Q(mts_fx[59]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_59_ ( .D(n419), .CP(net3208), .RN(rstn), .Q(
        acc[59]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_58_ ( .D(n191), .CP(net3198), .RN(n3847), 
        .Q(mts_fx[58]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_58_ ( .D(n418), .CP(net3208), .RN(rstn), .Q(
        acc[58]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_57_ ( .D(n190), .CP(net3198), .RN(n3852), 
        .Q(mts_fx[57]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_57_ ( .D(n417), .CP(net3208), .RN(rstn), .Q(
        acc[57]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_56_ ( .D(n189), .CP(net3198), .RN(n3847), 
        .Q(mts_fx[56]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_56_ ( .D(n416), .CP(net3208), .RN(n3845), .Q(
        acc[56]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_55_ ( .D(n188), .CP(net3198), .RN(n3847), 
        .Q(mts_fx[55]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_55_ ( .D(n415), .CP(net3208), .RN(n3845), .Q(
        acc[55]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_54_ ( .D(n187), .CP(net3198), .RN(n3847), 
        .Q(mts_fx[54]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_54_ ( .D(n414), .CP(net3208), .RN(n3845), .Q(
        acc[54]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_53_ ( .D(n186), .CP(net3198), .RN(n3842), 
        .Q(mts_fx[53]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_53_ ( .D(n413), .CP(net3208), .RN(n3845), .Q(
        acc[53]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_52_ ( .D(n185), .CP(net3198), .RN(n3842), 
        .Q(mts_fx[52]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_52_ ( .D(n412), .CP(net3208), .RN(n3845), .Q(
        acc[52]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_51_ ( .D(n184), .CP(net3198), .RN(n3842), 
        .Q(mts_fx[51]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_51_ ( .D(n411), .CP(net3208), .RN(n3845), .Q(
        acc[51]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_50_ ( .D(n183), .CP(net3198), .RN(n3842), 
        .Q(mts_fx[50]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_50_ ( .D(n410), .CP(net3208), .RN(n3845), .Q(
        acc[50]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_49_ ( .D(n182), .CP(net3198), .RN(n3847), 
        .Q(mts_fx[49]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_49_ ( .D(n409), .CP(net3208), .RN(n3845), .Q(
        acc[49]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_48_ ( .D(n181), .CP(net3198), .RN(n3842), 
        .Q(mts_fx[48]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_48_ ( .D(n408), .CP(net3208), .RN(n3845), .Q(
        acc[48]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_47_ ( .D(n180), .CP(net3198), .RN(n3847), 
        .Q(mts_fx[47]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_47_ ( .D(n407), .CP(net3208), .RN(n3845), .Q(
        acc[47]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_46_ ( .D(n179), .CP(net3198), .RN(n3842), 
        .Q(mts_fx[46]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_46_ ( .D(n406), .CP(net3208), .RN(n3845), .Q(
        acc[46]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_45_ ( .D(n178), .CP(net3198), .RN(n3842), 
        .Q(mts_fx[45]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_45_ ( .D(n405), .CP(net3208), .RN(n3845), .Q(
        acc[45]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_44_ ( .D(n177), .CP(net3198), .RN(n3842), 
        .Q(mts_fx[44]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_44_ ( .D(n404), .CP(net3208), .RN(n3839), .Q(
        acc[44]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_43_ ( .D(n176), .CP(net3198), .RN(n3842), 
        .Q(mts_fx[43]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_43_ ( .D(n403), .CP(net3208), .RN(n3842), .Q(
        acc[43]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_42_ ( .D(n175), .CP(net3198), .RN(n3842), 
        .Q(mts_fx[42]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_42_ ( .D(n402), .CP(net3208), .RN(n3839), .Q(
        acc[42]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_41_ ( .D(n174), .CP(net3198), .RN(n3842), 
        .Q(mts_fx[41]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_41_ ( .D(n401), .CP(net3208), .RN(n3842), .Q(
        acc[41]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_40_ ( .D(n173), .CP(net3198), .RN(n3842), 
        .Q(mts_fx[40]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_40_ ( .D(n400), .CP(net3208), .RN(n3844), .Q(
        acc[40]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_39_ ( .D(n172), .CP(net3198), .RN(n3842), 
        .Q(mts_fx[39]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_39_ ( .D(n399), .CP(net3208), .RN(n3842), .Q(
        acc[39]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_38_ ( .D(n171), .CP(net3198), .RN(n3842), 
        .Q(mts_fx[38]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_38_ ( .D(n398), .CP(net3208), .RN(n3844), .Q(
        acc[38]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_37_ ( .D(n170), .CP(net3198), .RN(n3842), 
        .Q(mts_fx[37]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_37_ ( .D(n397), .CP(net3208), .RN(n3844), .Q(
        acc[37]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_36_ ( .D(n169), .CP(net3198), .RN(n3842), 
        .Q(mts_fx[36]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_36_ ( .D(n396), .CP(net3208), .RN(n3844), .Q(
        acc[36]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_35_ ( .D(n168), .CP(net3198), .RN(n3844), 
        .Q(mts_fx[35]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_35_ ( .D(n395), .CP(net3208), .RN(n3844), .Q(
        acc[35]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_34_ ( .D(n167), .CP(net3198), .RN(n3841), 
        .Q(mts_fx[34]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_34_ ( .D(n394), .CP(net3208), .RN(n3844), .Q(
        acc[34]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_33_ ( .D(n166), .CP(net3198), .RN(n3841), 
        .Q(mts_fx[33]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_33_ ( .D(n393), .CP(net3208), .RN(n3844), .Q(
        acc[33]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_32_ ( .D(n165), .CP(net3198), .RN(n3841), 
        .Q(mts_fx[32]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_32_ ( .D(n392), .CP(net3208), .RN(n3844), .Q(
        acc[32]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_31_ ( .D(n164), .CP(net3198), .RN(n3841), 
        .Q(mts_fx[31]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_31_ ( .D(n391), .CP(net3208), .RN(n3841), .Q(
        acc[31]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_30_ ( .D(n163), .CP(net3198), .RN(n3841), 
        .Q(mts_fx[30]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_30_ ( .D(n390), .CP(net3208), .RN(n3841), .Q(
        acc[30]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_29_ ( .D(n162), .CP(net3198), .RN(n3841), 
        .Q(mts_fx[29]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_29_ ( .D(n389), .CP(net3208), .RN(n3841), .Q(
        acc[29]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_28_ ( .D(n161), .CP(net3198), .RN(n3841), 
        .Q(mts_fx[28]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_28_ ( .D(n388), .CP(net3208), .RN(n3844), .Q(
        acc[28]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_27_ ( .D(n160), .CP(net3198), .RN(n3841), 
        .Q(mts_fx[27]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_27_ ( .D(n387), .CP(net3208), .RN(n3841), .Q(
        acc[27]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_26_ ( .D(n159), .CP(net3198), .RN(n3841), 
        .Q(mts_fx[26]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_26_ ( .D(n386), .CP(net3208), .RN(n3843), .Q(
        acc[26]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_25_ ( .D(n158), .CP(net3198), .RN(n3840), 
        .Q(mts_fx[25]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_25_ ( .D(n385), .CP(net3208), .RN(n3843), .Q(
        acc[25]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_24_ ( .D(n157), .CP(net3198), .RN(n3840), 
        .Q(mts_fx[24]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_24_ ( .D(n384), .CP(net3208), .RN(n3840), .Q(
        acc[24]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_23_ ( .D(n156), .CP(net3198), .RN(n3840), 
        .Q(mts_fx[23]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_23_ ( .D(n383), .CP(net3208), .RN(n3840), .Q(
        acc[23]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_22_ ( .D(n155), .CP(net3198), .RN(n3840), 
        .Q(mts_fx[22]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_22_ ( .D(n382), .CP(net3208), .RN(n3840), .Q(
        acc[22]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_21_ ( .D(n154), .CP(net3198), .RN(n3840), 
        .Q(mts_fx[21]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_21_ ( .D(n381), .CP(net3208), .RN(n3843), .Q(
        acc[21]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_20_ ( .D(n153), .CP(net3198), .RN(n3843), 
        .Q(mts_fx[20]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_20_ ( .D(n380), .CP(net3208), .RN(n3843), .Q(
        acc[20]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_19_ ( .D(n152), .CP(net3198), .RN(n3840), 
        .Q(mts_fx[19]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_19_ ( .D(n379), .CP(net3208), .RN(n3840), .Q(
        acc[19]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_18_ ( .D(n151), .CP(net3198), .RN(n3840), 
        .Q(mts_fx[18]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_18_ ( .D(n378), .CP(net3208), .RN(n3840), .Q(
        acc[18]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_17_ ( .D(n150), .CP(net3198), .RN(n3840), 
        .Q(mts_fx[17]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_17_ ( .D(n377), .CP(net3208), .RN(n3840), .Q(
        acc[17]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_16_ ( .D(n149), .CP(net3198), .RN(n3840), 
        .Q(mts_fx[16]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_16_ ( .D(n376), .CP(net3208), .RN(n3840), .Q(
        acc[16]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_15_ ( .D(n148), .CP(net3198), .RN(n3840), 
        .Q(mts_fx[15]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_15_ ( .D(n375), .CP(net3208), .RN(n3840), .Q(
        acc[15]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_14_ ( .D(n147), .CP(net3198), .RN(n3840), 
        .Q(mts_fx[14]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_14_ ( .D(n374), .CP(net3208), .RN(n3840), .Q(
        acc[14]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_13_ ( .D(n146), .CP(net3198), .RN(n3840), 
        .Q(mts_fx[13]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_13_ ( .D(n373), .CP(net3208), .RN(n3840), .Q(
        acc[13]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_12_ ( .D(n145), .CP(net3198), .RN(n3840), 
        .Q(mts_fx[12]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_12_ ( .D(n372), .CP(net3208), .RN(n3840), .Q(
        acc[12]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_11_ ( .D(n144), .CP(net3198), .RN(n3840), 
        .Q(mts_fx[11]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_11_ ( .D(n371), .CP(net3208), .RN(n3840), .Q(
        acc[11]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_10_ ( .D(n143), .CP(net3198), .RN(n3840), 
        .Q(mts_fx[10]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_10_ ( .D(n370), .CP(net3208), .RN(n3841), .Q(
        acc[10]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_9_ ( .D(n142), .CP(net3198), .RN(n3841), 
        .Q(mts_fx[9]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_9_ ( .D(n369), .CP(net3208), .RN(n3841), .Q(
        acc[9]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_8_ ( .D(n141), .CP(net3198), .RN(n3841), 
        .Q(mts_fx[8]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_8_ ( .D(n368), .CP(net3208), .RN(n3841), .Q(
        acc[8]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_7_ ( .D(n140), .CP(net3198), .RN(n3841), 
        .Q(mts_fx[7]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_7_ ( .D(n367), .CP(net3208), .RN(n3841), .Q(
        acc[7]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_6_ ( .D(n139), .CP(net3198), .RN(n3841), 
        .Q(mts_fx[6]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_6_ ( .D(n366), .CP(net3208), .RN(n3841), .Q(
        acc[6]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_5_ ( .D(n138), .CP(net3198), .RN(n3841), 
        .Q(mts_fx[5]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_5_ ( .D(n365), .CP(net3208), .RN(n3841), .Q(
        acc[5]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_4_ ( .D(n137), .CP(net3198), .RN(n3841), 
        .Q(mts_fx[4]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_4_ ( .D(n364), .CP(net3208), .RN(n3841), .Q(
        acc[4]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_3_ ( .D(n136), .CP(net3198), .RN(n3841), 
        .Q(mts_fx[3]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_3_ ( .D(n363), .CP(net3208), .RN(n3841), .Q(
        acc[3]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_2_ ( .D(n135), .CP(net3198), .RN(n3841), 
        .Q(mts_fx[2]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_2_ ( .D(n362), .CP(net3208), .RN(n3841), .Q(
        acc[2]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_1_ ( .D(n134), .CP(net3198), .RN(n3842), 
        .Q(mts_fx[1]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_1_ ( .D(n361), .CP(net3208), .RN(n3841), .Q(
        acc[1]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fx_reg_0_ ( .D(n133), .CP(net3198), .RN(n3842), 
        .Q(mts_fx[0]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_0_ ( .D(n360), .CP(net3208), .RN(n3841), .Q(
        acc[0]) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U24 ( .A0(mts_fx[78]), .B0(acc[78]), .CI(
        intadd_0_n24), .CO(intadd_0_n23), .S0(intadd_0_SUM_77_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U26 ( .A0(mts_fx[76]), .B0(acc[76]), .CI(
        intadd_0_n26), .CO(intadd_0_n25), .S0(intadd_0_SUM_75_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U28 ( .A0(mts_fx[74]), .B0(acc[74]), .CI(
        intadd_0_n28), .CO(intadd_0_n27), .S0(intadd_0_SUM_73_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U30 ( .A0(mts_fx[72]), .B0(acc[72]), .CI(
        intadd_0_n30), .CO(intadd_0_n29), .S0(intadd_0_SUM_71_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U31 ( .A0(mts_fx[71]), .B0(acc[71]), .CI(
        intadd_0_n31), .CO(intadd_0_n30), .S0(intadd_0_SUM_70_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U32 ( .A0(mts_fx[70]), .B0(acc[70]), .CI(
        intadd_0_n32), .CO(intadd_0_n31), .S0(intadd_0_SUM_69_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U33 ( .A0(mts_fx[69]), .B0(acc[69]), .CI(
        intadd_0_n33), .CO(intadd_0_n32), .S0(intadd_0_SUM_68_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U34 ( .A0(mts_fx[68]), .B0(acc[68]), .CI(
        intadd_0_n34), .CO(intadd_0_n33), .S0(intadd_0_SUM_67_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U35 ( .A0(mts_fx[67]), .B0(acc[67]), .CI(
        intadd_0_n35), .CO(intadd_0_n34), .S0(intadd_0_SUM_66_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U36 ( .A0(mts_fx[66]), .B0(acc[66]), .CI(
        intadd_0_n36), .CO(intadd_0_n35), .S0(intadd_0_SUM_65_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U37 ( .A0(mts_fx[65]), .B0(acc[65]), .CI(
        intadd_0_n37), .CO(intadd_0_n36), .S0(intadd_0_SUM_64_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U38 ( .A0(mts_fx[64]), .B0(acc[64]), .CI(
        intadd_0_n38), .CO(intadd_0_n37), .S0(intadd_0_SUM_63_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U39 ( .A0(mts_fx[63]), .B0(acc[63]), .CI(
        intadd_0_n39), .CO(intadd_0_n38), .S0(intadd_0_SUM_62_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U40 ( .A0(mts_fx[62]), .B0(acc[62]), .CI(
        intadd_0_n40), .CO(intadd_0_n39), .S0(intadd_0_SUM_61_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U41 ( .A0(mts_fx[61]), .B0(acc[61]), .CI(
        intadd_0_n41), .CO(intadd_0_n40), .S0(intadd_0_SUM_60_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U42 ( .A0(mts_fx[60]), .B0(acc[60]), .CI(
        intadd_0_n42), .CO(intadd_0_n41), .S0(intadd_0_SUM_59_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U43 ( .A0(mts_fx[59]), .B0(acc[59]), .CI(
        intadd_0_n43), .CO(intadd_0_n42), .S0(intadd_0_SUM_58_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U44 ( .A0(mts_fx[58]), .B0(acc[58]), .CI(
        intadd_0_n44), .CO(intadd_0_n43), .S0(intadd_0_SUM_57_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U45 ( .A0(mts_fx[57]), .B0(acc[57]), .CI(
        intadd_0_n45), .CO(intadd_0_n44), .S0(intadd_0_SUM_56_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U46 ( .A0(mts_fx[56]), .B0(acc[56]), .CI(
        intadd_0_n46), .CO(intadd_0_n45), .S0(intadd_0_SUM_55_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U47 ( .A0(mts_fx[55]), .B0(acc[55]), .CI(
        intadd_0_n47), .CO(intadd_0_n46), .S0(intadd_0_SUM_54_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U49 ( .A0(mts_fx[53]), .B0(acc[53]), .CI(
        intadd_0_n49), .CO(intadd_0_n48), .S0(intadd_0_SUM_52_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U51 ( .A0(mts_fx[51]), .B0(acc[51]), .CI(
        intadd_0_n51), .CO(intadd_0_n50), .S0(intadd_0_SUM_50_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U53 ( .A0(mts_fx[49]), .B0(acc[49]), .CI(
        intadd_0_n53), .CO(intadd_0_n52), .S0(intadd_0_SUM_48_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U55 ( .A0(mts_fx[47]), .B0(acc[47]), .CI(
        intadd_0_n55), .CO(intadd_0_n54), .S0(intadd_0_SUM_46_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U57 ( .A0(mts_fx[45]), .B0(acc[45]), .CI(
        intadd_0_n57), .CO(intadd_0_n56), .S0(intadd_0_SUM_44_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U59 ( .A0(mts_fx[43]), .B0(acc[43]), .CI(
        intadd_0_n59), .CO(intadd_0_n58), .S0(intadd_0_SUM_42_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U61 ( .A0(mts_fx[41]), .B0(acc[41]), .CI(
        intadd_0_n61), .CO(intadd_0_n60), .S0(intadd_0_SUM_40_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U63 ( .A0(mts_fx[39]), .B0(acc[39]), .CI(
        intadd_0_n63), .CO(intadd_0_n62), .S0(intadd_0_SUM_38_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U65 ( .A0(mts_fx[37]), .B0(acc[37]), .CI(
        intadd_0_n65), .CO(intadd_0_n64), .S0(intadd_0_SUM_36_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U67 ( .A0(mts_fx[35]), .B0(acc[35]), .CI(
        intadd_0_n67), .CO(intadd_0_n66), .S0(intadd_0_SUM_34_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U69 ( .A0(mts_fx[33]), .B0(acc[33]), .CI(
        intadd_0_n69), .CO(intadd_0_n68), .S0(intadd_0_SUM_32_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U71 ( .A0(mts_fx[31]), .B0(acc[31]), .CI(
        intadd_0_n71), .CO(intadd_0_n70), .S0(intadd_0_SUM_30_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U48 ( .A0(mts_fx[54]), .B0(acc[54]), .CI(
        intadd_0_n48), .CO(intadd_0_n47), .S0(intadd_0_SUM_53_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U50 ( .A0(mts_fx[52]), .B0(acc[52]), .CI(
        intadd_0_n50), .CO(intadd_0_n49), .S0(intadd_0_SUM_51_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U52 ( .A0(mts_fx[50]), .B0(acc[50]), .CI(
        intadd_0_n52), .CO(intadd_0_n51), .S0(intadd_0_SUM_49_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U54 ( .A0(mts_fx[48]), .B0(acc[48]), .CI(
        intadd_0_n54), .CO(intadd_0_n53), .S0(intadd_0_SUM_47_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U56 ( .A0(mts_fx[46]), .B0(acc[46]), .CI(
        intadd_0_n56), .CO(intadd_0_n55), .S0(intadd_0_SUM_45_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U58 ( .A0(mts_fx[44]), .B0(acc[44]), .CI(
        intadd_0_n58), .CO(intadd_0_n57), .S0(intadd_0_SUM_43_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U60 ( .A0(mts_fx[42]), .B0(acc[42]), .CI(
        intadd_0_n60), .CO(intadd_0_n59), .S0(intadd_0_SUM_41_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U62 ( .A0(mts_fx[40]), .B0(acc[40]), .CI(
        intadd_0_n62), .CO(intadd_0_n61), .S0(intadd_0_SUM_39_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U64 ( .A0(mts_fx[38]), .B0(acc[38]), .CI(
        intadd_0_n64), .CO(intadd_0_n63), .S0(intadd_0_SUM_37_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U66 ( .A0(mts_fx[36]), .B0(acc[36]), .CI(
        intadd_0_n66), .CO(intadd_0_n65), .S0(intadd_0_SUM_35_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U68 ( .A0(mts_fx[34]), .B0(acc[34]), .CI(
        intadd_0_n68), .CO(intadd_0_n67), .S0(intadd_0_SUM_33_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U70 ( .A0(mts_fx[32]), .B0(acc[32]), .CI(
        intadd_0_n70), .CO(intadd_0_n69), .S0(intadd_0_SUM_31_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U72 ( .A0(mts_fx[30]), .B0(acc[30]), .CI(
        intadd_0_n72), .CO(intadd_0_n71), .S0(intadd_0_SUM_29_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U74 ( .A0(mts_fx[28]), .B0(acc[28]), .CI(
        intadd_0_n74), .CO(intadd_0_n73), .S0(intadd_0_SUM_27_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U76 ( .A0(mts_fx[26]), .B0(acc[26]), .CI(
        intadd_0_n76), .CO(intadd_0_n75), .S0(intadd_0_SUM_25_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U78 ( .A0(mts_fx[24]), .B0(acc[24]), .CI(
        intadd_0_n78), .CO(intadd_0_n77), .S0(intadd_0_SUM_23_) );
  C8T28SOI_LR_CNNOR2AX9_P16 U1293 ( .A(mts_m[0]), .B(n3857), .Z(n124) );
  C8T28SOI_LR_CNIVX4_P16 U1294 ( .A(mts_d[0]), .Z(n2435) );
  C8T28SOI_LR_CNIVX4_P16 U1295 ( .A(mts_w[0]), .Z(n2434) );
  C8T28SOI_LR_CNNOR2X8_P16 U1296 ( .A(n2435), .B(n2434), .Z(n2530) );
  C8T28SOI_LR_CNIVX4_P16 U1297 ( .A(n2530), .Z(n2358) );
  C8T28SOI_LR_CNNAND2X8_P16 U1298 ( .A(vld_o_d[0]), .B(vld_o_w[0]), .Z(n3790)
         );
  C8T28SOI_LR_CNNOR2X8_P16 U1299 ( .A(n2358), .B(n3790), .Z(n61) );
  C8T28SOI_LR_AND2X5_P0 U1301 ( .A(exp_w[0]), .B(n3873), .Z(n48) );
  C8T28SOI_LR_AND2X5_P0 U1302 ( .A(regi_w[3]), .B(n3873), .Z(n53) );
  C8T28SOI_LR_AND2X5_P0 U1303 ( .A(regi_d[2]), .B(n3873), .Z(n58) );
  C8T28SOI_LR_AND2X5_P0 U1304 ( .A(regi_d[0]), .B(n3873), .Z(n56) );
  C8T28SOI_LR_AND2X5_P0 U1305 ( .A(exp_w[1]), .B(n3873), .Z(n49) );
  C8T28SOI_LR_AND2X5_P0 U1306 ( .A(regi_w[2]), .B(n3873), .Z(n52) );
  C8T28SOI_LR_AND2X5_P0 U1307 ( .A(exp_d[0]), .B(n3873), .Z(n54) );
  C8T28SOI_LR_AND2X5_P0 U1308 ( .A(regi_d[1]), .B(n3873), .Z(n57) );
  C8T28SOI_LR_AND2X5_P0 U1309 ( .A(regi_d[3]), .B(n3873), .Z(n59) );
  C8T28SOI_LR_AND2X5_P0 U1310 ( .A(exp_d[1]), .B(n3873), .Z(n55) );
  C8T28SOI_LR_AND2X5_P0 U1311 ( .A(regi_w[0]), .B(n3873), .Z(n50) );
  C8T28SOI_LR_AND2X5_P0 U1312 ( .A(regi_w[1]), .B(n3873), .Z(n51) );
  C8T28SOI_LR_AOI22X2_P0 U1313 ( .A(mts_m[7]), .B(mts_m[2]), .C(mts_m[1]), .D(
        n3857), .Z(n2360) );
  C8T28SOI_LR_NAND2X4_P0 U1314 ( .A(mts_m[1]), .B(mts_m[7]), .Z(n3365) );
  C8T28SOI_LR_OAI12AX3_P0 U1315 ( .A(n3365), .B(mts_m[0]), .C(sign_m), .Z(
        n2359) );
  C8T28SOI_LR_CNXOR2X9_P16 U1316 ( .A(n2360), .S(n2359), .Z(n126) );
  C8T28SOI_LR_AOI22X2_P0 U1317 ( .A(mts_m[7]), .B(mts_m[3]), .C(mts_m[2]), .D(
        n3857), .Z(n2363) );
  C8T28SOI_LR_AOI211X2_P0 U1318 ( .A(mts_m[7]), .B(mts_m[2]), .C(mts_m[0]), 
        .D(mts_m[1]), .Z(n2364) );
  C8T28SOI_LR_CNIVX4_P16 U1319 ( .A(sign_m), .Z(n3359) );
  C8T28SOI_LR_NOR2X4_P0 U1320 ( .A(n2364), .B(n3359), .Z(n2361) );
  C8T28SOI_LRS_XNOR2X3_P0 U1321 ( .A(n2363), .B(n2361), .Z(n127) );
  C8T28SOI_LR_OAI22X3_P0 U1322 ( .A(vld_o_d[0]), .B(vld_o_d[1]), .C(vld_o_w[0]), .D(vld_o_w[1]), .Z(n2362) );
  C8T28SOI_LR_OA112X4_P0 U1323 ( .A(n3873), .B(n2362), .C(decode_d), .D(
        decode_w), .Z(n69) );
  C8T28SOI_LR_AOI22X2_P0 U1324 ( .A(mts_m[7]), .B(mts_m[4]), .C(mts_m[3]), .D(
        n3857), .Z(n2371) );
  C8T28SOI_LR_NAND2X4_P0 U1325 ( .A(n2364), .B(n2363), .Z(n2370) );
  C8T28SOI_LR_NAND2X4_P0 U1326 ( .A(n2370), .B(sign_m), .Z(n2365) );
  C8T28SOI_LR_CNXOR2X9_P16 U1327 ( .A(n2371), .S(n2365), .Z(n128) );
  C8T28SOI_LR_CNNOR2X8_P10 U1328 ( .A(sf_bias[6]), .B(sf_bias[7]), .Z(n2384)
         );
  C8T28SOI_LR_NAND2X4_P0 U1330 ( .A(n2384), .B(n3858), .Z(n3294) );
  C8T28SOI_LR_CNNOR2X8_P16 U1331 ( .A(sf_bias[3]), .B(sf_bias[2]), .Z(n2467)
         );
  C8T28SOI_LR_NAND2X4_P0 U1334 ( .A(n2467), .B(n3859), .Z(n2411) );
  C8T28SOI_LR_CNIVX4_P16 U1335 ( .A(sf_bias[0]), .Z(n2381) );
  C8T28SOI_LR_CNIVX4_P16 U1336 ( .A(sf_bias[1]), .Z(n2386) );
  C8T28SOI_LR_CNNOR2X8_P16 U1337 ( .A(n2381), .B(n2386), .Z(n2452) );
  C8T28SOI_LR_CNNOR2X8_P16 U1338 ( .A(sf_bias[0]), .B(sf_bias[1]), .Z(n2404)
         );
  C8T28SOI_LR_AOI22X2_P0 U1339 ( .A(n2452), .B(mts_ms[0]), .C(n2404), .D(
        mts_ms[3]), .Z(n2367) );
  C8T28SOI_LR_CNNOR2X8_P16 U1340 ( .A(sf_bias[0]), .B(n2386), .Z(n2406) );
  C8T28SOI_LR_CNNOR2X8_P16 U1341 ( .A(sf_bias[1]), .B(n2381), .Z(n2405) );
  C8T28SOI_LR_AOI22X2_P0 U1342 ( .A(n2406), .B(mts_ms[1]), .C(n2405), .D(
        mts_ms[2]), .Z(n2366) );
  C8T28SOI_LR_NAND2X4_P0 U1343 ( .A(n2367), .B(n2366), .Z(n2442) );
  C8T28SOI_LR_CNNAND2AX9_P16 U1344 ( .A(n2411), .B(n2442), .Z(n3308) );
  C8T28SOI_LR_NOR2X4_P0 U1345 ( .A(n3294), .B(n3308), .Z(n136) );
  C8T28SOI_LR_CNIVX4_P16 U1346 ( .A(mts_d[2]), .Z(n2486) );
  C8T28SOI_LR_CNNOR2X8_P16 U1347 ( .A(n2434), .B(n2486), .Z(n2368) );
  C8T28SOI_LR_NAND2X4_P0 U1348 ( .A(mts_w[1]), .B(mts_d[1]), .Z(n2484) );
  C8T28SOI_LR_CNIVX4_P16 U1349 ( .A(n2484), .Z(n2532) );
  C8T28SOI_LR_NAND3X3_P0 U1350 ( .A(mts_w[0]), .B(mts_d[2]), .C(n2532), .Z(
        n2488) );
  C8T28SOI_LR_OA12X5_P0 U1351 ( .A(n2368), .B(n2532), .C(n2488), .Z(n2433) );
  C8T28SOI_LR_NOR4CDX2_P0 U1352 ( .C(mts_w[1]), .D(mts_d[1]), .A(n2435), .B(
        n2434), .Z(n3792) );
  C8T28SOI_LR_CNIVX4_P16 U1353 ( .A(mts_w[2]), .Z(n2485) );
  C8T28SOI_LR_CNNOR2X8_P16 U1354 ( .A(n2435), .B(n2485), .Z(n2432) );
  C8T28SOI_LR_AND2X5_P0 U1355 ( .A(n2369), .B(n3873), .Z(n63) );
  C8T28SOI_LR_AOI22X2_P0 U1356 ( .A(mts_m[7]), .B(mts_m[5]), .C(mts_m[4]), .D(
        n3857), .Z(n2398) );
  C8T28SOI_LR_NOR2AX4_P0 U1357 ( .A(n2371), .B(n2370), .Z(n2399) );
  C8T28SOI_LR_NOR2X4_P0 U1358 ( .A(n2399), .B(n3359), .Z(n2372) );
  C8T28SOI_LRS_XNOR2X3_P0 U1359 ( .A(n2398), .B(n2372), .Z(n129) );
  C8T28SOI_LR_NAND2X4_P0 U1360 ( .A(n2404), .B(mts_ms[0]), .Z(n3288) );
  C8T28SOI_LR_CNIVX4_P16 U1361 ( .A(n3288), .Z(n2421) );
  C8T28SOI_LR_CNIVX4_P16 U1362 ( .A(sf_bias[7]), .Z(n2448) );
  C8T28SOI_LR_NAND2X4_P0 U1363 ( .A(n3858), .B(n2448), .Z(n3318) );
  C8T28SOI_LR_CNNAND2AX9_P16 U1364 ( .A(n3318), .B(sf_bias[6]), .Z(n3307) );
  C8T28SOI_LR_CNNOR2X8_P16 U1365 ( .A(n2411), .B(n3307), .Z(n2464) );
  C8T28SOI_LR_NAND2X4_P0 U1367 ( .A(n2460), .B(n3858), .Z(n3312) );
  C8T28SOI_LR_CNNAND2X8_P16 U1368 ( .A(n2384), .B(n3312), .Z(n3285) );
  C8T28SOI_LR_NOR2X4_P0 U1369 ( .A(mts_ms[8]), .B(sf_bias[4]), .Z(n3300) );
  C8T28SOI_LR_NOR2X4_P0 U1370 ( .A(n3285), .B(n3300), .Z(n3303) );
  C8T28SOI_LR_AOI22X2_P0 U1371 ( .A(n2452), .B(mts_ms[1]), .C(n2404), .D(
        mts_ms[4]), .Z(n2374) );
  C8T28SOI_LR_AOI22X2_P0 U1372 ( .A(n2406), .B(mts_ms[2]), .C(n2405), .D(
        mts_ms[3]), .Z(n2373) );
  C8T28SOI_LR_AND2X5_P0 U1373 ( .A(n2374), .B(n2373), .Z(n2426) );
  C8T28SOI_LR_NAND2X4_P0 U1374 ( .A(sf_bias[3]), .B(sf_bias[2]), .Z(n2413) );
  C8T28SOI_LR_CNNOR2X8_P16 U1375 ( .A(n2460), .B(sf_bias[3]), .Z(n2390) );
  C8T28SOI_LR_CNIVX4_P16 U1376 ( .A(n2390), .Z(n2453) );
  C8T28SOI_LR_CNNAND2X8_P16 U1378 ( .A(n2389), .B(sf_bias[3]), .Z(n2430) );
  C8T28SOI_LR_CNIVX4_P16 U1379 ( .A(n2430), .Z(n2469) );
  C8T28SOI_LR_AOI22X2_P0 U1380 ( .A(mts_ms[8]), .B(n2404), .C(n2452), .D(
        mts_ms[5]), .Z(n2376) );
  C8T28SOI_LR_AOI22X2_P0 U1381 ( .A(n2406), .B(mts_ms[6]), .C(n2405), .D(
        mts_ms[7]), .Z(n2375) );
  C8T28SOI_LR_NAND2X4_P0 U1382 ( .A(n2376), .B(n2375), .Z(n2443) );
  C8T28SOI_LR_NAND2X4_P0 U1383 ( .A(n2469), .B(n2443), .Z(n2377) );
  C8T28SOI_LR_OAI211X3_P0 U1384 ( .A(n2426), .B(n2413), .C(n2453), .D(n2377), 
        .Z(n2420) );
  C8T28SOI_LR_AOI22X2_P0 U1385 ( .A(n2421), .B(n2464), .C(n3303), .D(n2420), 
        .Z(n2378) );
  C8T28SOI_LR_NAND2X4_P0 U1387 ( .A(mts_ms[8]), .B(n2384), .Z(n3325) );
  C8T28SOI_LR_OAI12CX3_P0 U1389 ( .A(n3858), .B(n3859), .C(n3325), .Z(n3306)
         );
  C8T28SOI_LR_NAND2X4_P0 U1390 ( .A(n2378), .B(n3306), .Z(n197) );
  C8T28SOI_LR_AOI22X2_P0 U1391 ( .A(n2452), .B(mts_ms[2]), .C(mts_ms[5]), .D(
        n2404), .Z(n2380) );
  C8T28SOI_LR_AOI22X2_P0 U1392 ( .A(n2406), .B(mts_ms[3]), .C(n2405), .D(
        mts_ms[4]), .Z(n2379) );
  C8T28SOI_LR_AND2X5_P0 U1393 ( .A(n2380), .B(n2379), .Z(n2431) );
  C8T28SOI_LR_AOI22X2_P0 U1394 ( .A(sf_bias[0]), .B(mts_ms[6]), .C(mts_ms[7]), 
        .D(n2381), .Z(n2385) );
  C8T28SOI_LR_AOI22X2_P0 U1395 ( .A(sf_bias[1]), .B(n2385), .C(n2460), .D(
        n2386), .Z(n2439) );
  C8T28SOI_LR_NAND2X4_P0 U1396 ( .A(n2469), .B(n2439), .Z(n2382) );
  C8T28SOI_LR_OAI211X3_P0 U1397 ( .A(n2431), .B(n2413), .C(n2453), .D(n2382), 
        .Z(n2422) );
  C8T28SOI_LR_AOI22X2_P0 U1398 ( .A(n2405), .B(mts_ms[0]), .C(n2404), .D(
        mts_ms[1]), .Z(n3289) );
  C8T28SOI_LR_CNIVX4_P16 U1399 ( .A(n3289), .Z(n2428) );
  C8T28SOI_LR_AOI22X2_P0 U1400 ( .A(n3303), .B(n2422), .C(n2464), .D(n2428), 
        .Z(n2383) );
  C8T28SOI_LR_NAND2X4_P0 U1401 ( .A(n2383), .B(n3306), .Z(n198) );
  C8T28SOI_LR_CNIVX4_P16 U1403 ( .A(n2385), .Z(n2387) );
  C8T28SOI_LR_AOI222X2_P0 U1404 ( .A(n2387), .B(n2386), .C(n2452), .D(
        mts_ms[4]), .E(mts_ms[5]), .F(n2406), .Z(n2412) );
  C8T28SOI_LR_CNIVX4_P16 U1405 ( .A(n2413), .Z(n2470) );
  C8T28SOI_LR_NAND2X4_P0 U1406 ( .A(n2470), .B(n2442), .Z(n2388) );
  C8T28SOI_LR_OAI211X3_P0 U1407 ( .A(n2412), .B(n2430), .C(n2453), .D(n2388), 
        .Z(n2397) );
  C8T28SOI_LR_CNNOR2X8_P16 U1408 ( .A(sf_bias[5]), .B(n3300), .Z(n3296) );
  C8T28SOI_LR_OAI12X3_P0 U1409 ( .A(n3859), .B(n2397), .C(n3296), .Z(n3349) );
  C8T28SOI_LR_NOR2X4_P0 U1410 ( .A(n3872), .B(n3349), .Z(n164) );
  C8T28SOI_LR_CNNOR2X8_P16 U1411 ( .A(n2389), .B(sf_bias[3]), .Z(n2466) );
  C8T28SOI_LR_CNIVX4_P16 U1412 ( .A(n2466), .Z(n2473) );
  C8T28SOI_LR_NAND2X4_P0 U1413 ( .A(n2469), .B(n2442), .Z(n2391) );
  C8T28SOI_LR_CNNAND2X8_P16 U1414 ( .A(n2390), .B(n2389), .Z(n2471) );
  C8T28SOI_LR_OAI211X3_P0 U1415 ( .A(n2412), .B(n2473), .C(n2391), .D(n2471), 
        .Z(n2394) );
  C8T28SOI_LR_OAI12X3_P0 U1416 ( .A(n3859), .B(n2394), .C(n3296), .Z(n3344) );
  C8T28SOI_LR_NOR2X4_P0 U1417 ( .A(n3872), .B(n3344), .Z(n160) );
  C8T28SOI_LR_AOI22X2_P0 U1418 ( .A(n2470), .B(n2421), .C(n2466), .D(n2443), 
        .Z(n2392) );
  C8T28SOI_LR_OAI211X3_P0 U1419 ( .A(n2426), .B(n2430), .C(n2392), .D(n2471), 
        .Z(n2396) );
  C8T28SOI_LR_OAI12X3_P0 U1420 ( .A(n3859), .B(n2396), .C(n3296), .Z(n3345) );
  C8T28SOI_LR_NOR2X4_P0 U1421 ( .A(n3872), .B(n3345), .Z(n161) );
  C8T28SOI_LR_AOI22X2_P0 U1422 ( .A(n2469), .B(n2421), .C(n2467), .D(n2443), 
        .Z(n2393) );
  C8T28SOI_LR_OAI12X3_P0 U1423 ( .A(n2426), .B(n2473), .C(n2393), .Z(n2395) );
  C8T28SOI_LR_OAI12X3_P0 U1424 ( .A(n3859), .B(n2395), .C(n3296), .Z(n3341) );
  C8T28SOI_LR_NOR2X4_P0 U1425 ( .A(n3872), .B(n3341), .Z(n157) );
  C8T28SOI_LR_CNIVX4_P16 U1426 ( .A(n2394), .Z(n3324) );
  C8T28SOI_LR_CNNAND2AX9_P16 U1427 ( .A(n3294), .B(n3859), .Z(n3299) );
  C8T28SOI_LR_NOR2X4_P0 U1428 ( .A(n3324), .B(n3299), .Z(n144) );
  C8T28SOI_LR_CNIVX4_P16 U1429 ( .A(n2395), .Z(n3321) );
  C8T28SOI_LR_NOR2X4_P0 U1430 ( .A(n3321), .B(n3299), .Z(n141) );
  C8T28SOI_LR_CNIVX4_P16 U1431 ( .A(n2396), .Z(n3326) );
  C8T28SOI_LR_NOR2X4_P0 U1432 ( .A(n3326), .B(n3299), .Z(n145) );
  C8T28SOI_LR_CNIVX4_P16 U1433 ( .A(n2397), .Z(n3330) );
  C8T28SOI_LR_NOR2X4_P0 U1434 ( .A(n3330), .B(n3299), .Z(n148) );
  C8T28SOI_LRA_AO22X5_P0 U1435 ( .A(mts_m[7]), .B(mts_m[6]), .C(mts_m[5]), .D(
        n3857), .Z(n3357) );
  C8T28SOI_LR_NAND2X4_P0 U1436 ( .A(n2399), .B(n2398), .Z(n3358) );
  C8T28SOI_LR_NAND2X4_P0 U1437 ( .A(n3358), .B(sign_m), .Z(n2400) );
  C8T28SOI_LRS_XNOR2X3_P0 U1438 ( .A(n3357), .B(n2400), .Z(n130) );
  C8T28SOI_LR_CNIVX4_P16 U1439 ( .A(vld_d[5]), .Z(n3793) );
  C8T28SOI_LR_CNIVX4_P16 U1440 ( .A(n3793), .Z(n2403) );
  C8T28SOI_LR_CNNOR2X8_P16 U1441 ( .A(counter[1]), .B(counter[2]), .Z(n3795)
         );
  C8T28SOI_LR_NAND2X4_P0 U1443 ( .A(n3795), .B(n3780), .Z(n2401) );
  C8T28SOI_LR_NAND2X4_P0 U1444 ( .A(counter[3]), .B(n2401), .Z(n2402) );
  C8T28SOI_LR_CNNAND2X8_P16 U1445 ( .A(n2403), .B(n2402), .Z(n3783) );
  C8T28SOI_LR_AND2X5_P0 U1448 ( .A(intadd_0_SUM_2_), .B(n3877), .Z(n363) );
  C8T28SOI_LR_AND2X5_P0 U1449 ( .A(intadd_0_SUM_1_), .B(n3879), .Z(n362) );
  C8T28SOI_LR_AND2X5_P0 U1450 ( .A(intadd_0_SUM_3_), .B(n3877), .Z(n364) );
  C8T28SOI_LR_AOI222X2_P0 U1451 ( .A(n2406), .B(mts_ms[0]), .C(n2405), .D(
        mts_ms[1]), .E(n2404), .F(mts_ms[2]), .Z(n3291) );
  C8T28SOI_LR_CNIVX4_P16 U1452 ( .A(n3291), .Z(n2476) );
  C8T28SOI_LR_AOI22X2_P0 U1453 ( .A(mts_ms[6]), .B(n2404), .C(n2452), .D(
        mts_ms[3]), .Z(n2408) );
  C8T28SOI_LR_AOI22X2_P0 U1454 ( .A(n2406), .B(mts_ms[4]), .C(n2405), .D(
        mts_ms[5]), .Z(n2407) );
  C8T28SOI_LR_NAND2X4_P0 U1455 ( .A(n2408), .B(n2407), .Z(n2468) );
  C8T28SOI_LR_AOI22X2_P0 U1456 ( .A(n2466), .B(n2476), .C(n2467), .D(n2468), 
        .Z(n2495) );
  C8T28SOI_LR_NOR2X4_P0 U1457 ( .A(n2495), .B(n3299), .Z(n139) );
  C8T28SOI_LR_OAI12CX3_P0 U1458 ( .A(n3858), .B(n2411), .C(n3296), .Z(n2456)
         );
  C8T28SOI_LR_NAND2X4_P0 U1459 ( .A(sf_bias[5]), .B(n3288), .Z(n2409) );
  C8T28SOI_LR_OAI211X3_P0 U1460 ( .A(n2420), .B(n3859), .C(n2456), .D(n2409), 
        .Z(n3350) );
  C8T28SOI_LR_NOR2X4_P0 U1461 ( .A(n3872), .B(n3350), .Z(n165) );
  C8T28SOI_LR_NAND2X4_P0 U1462 ( .A(sf_bias[5]), .B(n3289), .Z(n2410) );
  C8T28SOI_LR_OAI211X3_P0 U1463 ( .A(n2422), .B(n3859), .C(n2456), .D(n2410), 
        .Z(n3351) );
  C8T28SOI_LR_NOR2X4_P0 U1464 ( .A(n3872), .B(n3351), .Z(n166) );
  C8T28SOI_LR_NOR3BCX4_P0 U1465 ( .B(n2442), .C(sf_bias[5]), .A(n2411), .Z(
        n2414) );
  C8T28SOI_LR_NAND2X4_P0 U1466 ( .A(sf_bias[2]), .B(n2453), .Z(n2481) );
  C8T28SOI_LR_CNIVX4_P16 U1467 ( .A(n2412), .Z(n2424) );
  C8T28SOI_LR_CNNAND2X8_P16 U1468 ( .A(n2460), .B(n2413), .Z(n2479) );
  C8T28SOI_LR_OA12X3_P0 U1469 ( .A(n2481), .B(n2424), .C(n2479), .Z(n3304) );
  C8T28SOI_LR_OAI22X3_P0 U1470 ( .A(n3296), .B(n2414), .C(n3304), .D(n3859), 
        .Z(n3355) );
  C8T28SOI_LR_NOR2X4_P0 U1471 ( .A(n3872), .B(n3355), .Z(n168) );
  C8T28SOI_LR_NOR3X3_P0 U1472 ( .A(vld_d[7]), .B(vld_d[0]), .C(vld_d[6]), .Z(
        n2418) );
  C8T28SOI_LR_NOR3X3_P0 U1473 ( .A(vld_d[8]), .B(vld_d[9]), .C(vld_d[13]), .Z(
        n2416) );
  C8T28SOI_LR_NOR3X3_P0 U1474 ( .A(vld_d[2]), .B(vld_d[10]), .C(vld_d[3]), .Z(
        n2415) );
  C8T28SOI_LR_NOR4CDX2_P0 U1475 ( .C(n2416), .D(n2415), .A(vld_d[1]), .B(
        vld_d[4]), .Z(n2417) );
  C8T28SOI_LR_NAND3X3_P0 U1476 ( .A(n2418), .B(n2417), .C(n3793), .Z(n2419) );
  C8T28SOI_LR_NOR3X3_P0 U1477 ( .A(vld_d[12]), .B(vld_d[11]), .C(n2419), .Z(
        n2347) );
  C8T28SOI_LR_CNNOR2AX9_P10 U1478 ( .A(n2347), .B(vld_d[14]), .Z(n3798) );
  C8T28SOI_LR_OR2X5_P0 U1479 ( .A(vld_d[11]), .B(n3798), .Z(n2349) );
  C8T28SOI_LR_OR2X5_P0 U1480 ( .A(vld_d[12]), .B(n3798), .Z(n2348) );
  C8T28SOI_LR_OR2X5_P0 U1481 ( .A(acc_rdy), .B(n3798), .Z(n779) );
  C8T28SOI_LR_NAND2X4_P0 U1482 ( .A(acc[0]), .B(mts_fx[0]), .Z(n3781) );
  C8T28SOI_LR_OA112X4_P0 U1483 ( .A(acc[0]), .B(mts_fx[0]), .C(n3879), .D(
        n3781), .Z(n360) );
  C8T28SOI_LR_CNIVX4_P16 U1484 ( .A(counter[1]), .Z(n3779) );
  C8T28SOI_LR_CNNOR2X8_P16 U1485 ( .A(n3780), .B(n3779), .Z(n3778) );
  C8T28SOI_LR_NAND3X3_P0 U1486 ( .A(counter[0]), .B(counter[1]), .C(counter[2]), .Z(n3777) );
  C8T28SOI_LR_OA112X4_P0 U1487 ( .A(counter[2]), .B(n3778), .C(n3877), .D(
        n3777), .Z(n355) );
  C8T28SOI_LR_CNIVX4_P16 U1488 ( .A(n2467), .Z(n3290) );
  C8T28SOI_LR_OAI22X3_P0 U1489 ( .A(n3289), .B(n2473), .C(n2431), .D(n3290), 
        .Z(n2447) );
  C8T28SOI_LR_CNIVX4_P16 U1490 ( .A(n2447), .Z(n3293) );
  C8T28SOI_LR_NOR2X4_P0 U1491 ( .A(n3293), .B(n3299), .Z(n138) );
  C8T28SOI_LR_NOR2X4_P0 U1492 ( .A(n3859), .B(n3290), .Z(n2423) );
  C8T28SOI_LR_AOI22X2_P0 U1493 ( .A(n2423), .B(n2421), .C(n3859), .D(n2420), 
        .Z(n3332) );
  C8T28SOI_LR_NOR2X4_P0 U1494 ( .A(n3332), .B(n3294), .Z(n149) );
  C8T28SOI_LR_AOI22X2_P0 U1495 ( .A(n2423), .B(n2428), .C(n3859), .D(n2422), 
        .Z(n3333) );
  C8T28SOI_LR_NOR2X4_P0 U1496 ( .A(n3333), .B(n3294), .Z(n150) );
  C8T28SOI_LR_AOI22X2_P0 U1497 ( .A(n2442), .B(n2466), .C(n2424), .D(n2467), 
        .Z(n3320) );
  C8T28SOI_LR_NOR2X4_P0 U1498 ( .A(n3320), .B(n3299), .Z(n140) );
  C8T28SOI_LR_AOI22X2_P0 U1499 ( .A(n2467), .B(n2439), .C(n2469), .D(n2428), 
        .Z(n2425) );
  C8T28SOI_LR_OAI12X3_P0 U1500 ( .A(n2431), .B(n2473), .C(n2425), .Z(n2427) );
  C8T28SOI_LR_CNIVX4_P16 U1501 ( .A(n2427), .Z(n3322) );
  C8T28SOI_LR_NOR2X4_P0 U1502 ( .A(n3322), .B(n3299), .Z(n142) );
  C8T28SOI_LR_OAI22X3_P0 U1503 ( .A(n2426), .B(n3290), .C(n2473), .D(n3288), 
        .Z(n2458) );
  C8T28SOI_LR_CNIVX4_P16 U1504 ( .A(n2458), .Z(n3292) );
  C8T28SOI_LR_NOR2X4_P0 U1505 ( .A(n3292), .B(n3299), .Z(n137) );
  C8T28SOI_LR_OAI12X3_P0 U1506 ( .A(n3859), .B(n2427), .C(n3296), .Z(n3342) );
  C8T28SOI_LR_NOR2X4_P0 U1507 ( .A(n3872), .B(n3342), .Z(n158) );
  C8T28SOI_LR_AOI22X2_P0 U1508 ( .A(n2470), .B(n2428), .C(n2466), .D(n2439), 
        .Z(n2429) );
  C8T28SOI_LR_OAI211X3_P0 U1509 ( .A(n2431), .B(n2430), .C(n2429), .D(n2471), 
        .Z(n2451) );
  C8T28SOI_LR_CNIVX4_P16 U1510 ( .A(n2451), .Z(n3327) );
  C8T28SOI_LR_NOR2X4_P0 U1511 ( .A(n3327), .B(n3299), .Z(n146) );
  C8T28SOI_LR_FA1X4_P0 U1512 ( .A0(n2433), .B0(n3792), .CI(n2432), .CO(n2491), 
        .S0(n2369) );
  C8T28SOI_LR_AOI12X3_P0 U1513 ( .A(n2435), .B(n2434), .C(n2530), .Z(n2493) );
  C8T28SOI_LR_NAND2X4_P0 U1514 ( .A(mts_d[1]), .B(mts_w[2]), .Z(n2489) );
  C8T28SOI_LR_NAND2X4_P0 U1515 ( .A(mts_d[2]), .B(mts_w[1]), .Z(n2490) );
  C8T28SOI_LR_CNXOR2X9_P16 U1516 ( .A(n2488), .S(n2490), .Z(n2436) );
  C8T28SOI_LRS_XNOR2X3_P0 U1517 ( .A(n2489), .B(n2436), .Z(n2492) );
  C8T28SOI_LR_CNXOR2X9_P16 U1518 ( .A(n2493), .S(n2492), .Z(n2437) );
  C8T28SOI_LRS_XNOR2X3_P0 U1519 ( .A(n2491), .B(n2437), .Z(n2438) );
  C8T28SOI_LR_NOR2X4_P0 U1520 ( .A(n3790), .B(n2438), .Z(n64) );
  C8T28SOI_LR_OAI12X3_P0 U1521 ( .A(n2481), .B(n2439), .C(n2479), .Z(n2449) );
  C8T28SOI_LR_NAND2X4_P0 U1522 ( .A(n2449), .B(n3859), .Z(n2440) );
  C8T28SOI_LR_OAI211X3_P0 U1523 ( .A(n3859), .B(n2447), .C(n3858), .D(n2440), 
        .Z(n3337) );
  C8T28SOI_LR_NOR2X4_P0 U1524 ( .A(n3872), .B(n3337), .Z(n154) );
  C8T28SOI_LR_NOR2X4_P0 U1525 ( .A(n3300), .B(n3290), .Z(n2477) );
  C8T28SOI_LR_AOI22X2_P0 U1527 ( .A(n2477), .B(n2442), .C(n3304), .D(n3859), 
        .Z(n3335) );
  C8T28SOI_LR_NOR2X4_P0 U1528 ( .A(n3335), .B(n3294), .Z(n152) );
  C8T28SOI_LR_OAI12X3_P0 U1529 ( .A(n2481), .B(n2443), .C(n2479), .Z(n2461) );
  C8T28SOI_LR_NAND2X4_P0 U1531 ( .A(n2445), .B(n3859), .Z(n3302) );
  C8T28SOI_LR_NAND2X4_P0 U1532 ( .A(n2445), .B(n3858), .Z(n3301) );
  C8T28SOI_LR_NAND3X3_P0 U1533 ( .A(sf_bias[4]), .B(n2445), .C(n2458), .Z(
        n2444) );
  C8T28SOI_LR_OAI211X3_P0 U1534 ( .A(n2461), .B(n3302), .C(n3301), .D(n2444), 
        .Z(n185) );
  C8T28SOI_LR_NAND3X3_P0 U1535 ( .A(sf_bias[4]), .B(n2445), .C(n2447), .Z(
        n2446) );
  C8T28SOI_LR_OAI211X3_P0 U1536 ( .A(n2449), .B(n3302), .C(n3301), .D(n2446), 
        .Z(n186) );
  C8T28SOI_LR_NAND2X4_P0 U1537 ( .A(n3859), .B(n2447), .Z(n3317) );
  C8T28SOI_LR_CNNAND2X8_P16 U1538 ( .A(n2448), .B(sf_bias[6]), .Z(n3356) );
  C8T28SOI_LR_CNNAND2AX9_P16 U1539 ( .A(n3356), .B(n3312), .Z(n2463) );
  C8T28SOI_LR_AOI22X2_P0 U1541 ( .A(sf_bias[4]), .B(n2449), .C(n2460), .D(
        n3859), .Z(n3314) );
  C8T28SOI_LR_NOR2X4_P0 U1542 ( .A(n3356), .B(sf_bias[5]), .Z(n3331) );
  C8T28SOI_LR_NAND2X4_P0 U1543 ( .A(n3314), .B(n3331), .Z(n2450) );
  C8T28SOI_LR_OAI211X3_P0 U1544 ( .A(n3317), .B(n2463), .C(n3325), .D(n2450), 
        .Z(n234) );
  C8T28SOI_LR_OAI12X3_P0 U1545 ( .A(n3859), .B(n2451), .C(n3296), .Z(n3347) );
  C8T28SOI_LR_NOR2X4_P0 U1546 ( .A(n3872), .B(n3347), .Z(n162) );
  C8T28SOI_LR_AOI22AX2_P0 U1547 ( .C(n2452), .D(mts_ms[7]), .A(n2452), .B(
        mts_ms[8]), .Z(n2474) );
  C8T28SOI_LR_CNIVX4_P16 U1548 ( .A(n2474), .Z(n2480) );
  C8T28SOI_LR_AOI22X2_P0 U1549 ( .A(n2470), .B(n2468), .C(n2469), .D(n2480), 
        .Z(n2454) );
  C8T28SOI_LR_NAND2X4_P0 U1550 ( .A(n2454), .B(n2453), .Z(n2475) );
  C8T28SOI_LR_NAND2X4_P0 U1551 ( .A(sf_bias[5]), .B(n3291), .Z(n2455) );
  C8T28SOI_LR_OAI211X3_P0 U1552 ( .A(n3859), .B(n2475), .C(n2456), .D(n2455), 
        .Z(n3353) );
  C8T28SOI_LR_NOR2X4_P0 U1553 ( .A(n3872), .B(n3353), .Z(n167) );
  C8T28SOI_LR_NAND2X4_P0 U1554 ( .A(n2461), .B(n3859), .Z(n2457) );
  C8T28SOI_LR_OAI211X3_P0 U1555 ( .A(n3859), .B(n2458), .C(n3858), .D(n2457), 
        .Z(n3336) );
  C8T28SOI_LR_NOR2X4_P0 U1556 ( .A(n3872), .B(n3336), .Z(n153) );
  C8T28SOI_LR_NAND2X4_P0 U1557 ( .A(n3859), .B(n2458), .Z(n3311) );
  C8T28SOI_LR_AOI22X2_P0 U1558 ( .A(sf_bias[4]), .B(n2461), .C(n2460), .D(
        n3859), .Z(n3309) );
  C8T28SOI_LR_NAND2X4_P0 U1559 ( .A(n3309), .B(n3331), .Z(n2462) );
  C8T28SOI_LR_OAI211X3_P0 U1560 ( .A(n3311), .B(n2463), .C(n2462), .D(n3325), 
        .Z(n233) );
  C8T28SOI_LR_AOI22X2_P0 U1561 ( .A(n3303), .B(n2475), .C(n2464), .D(n2476), 
        .Z(n2465) );
  C8T28SOI_LR_NAND2X4_P0 U1562 ( .A(n2465), .B(n3306), .Z(n199) );
  C8T28SOI_LR_CNIVX4_P16 U1563 ( .A(n3798), .Z(n3801) );
  C8T28SOI_LR_CNNAND2X8_P16 U1564 ( .A(n3801), .B(n3783), .Z(n351) );
  C8T28SOI_LR_CNIVX4_P16 U1565 ( .A(n3303), .Z(n2483) );
  C8T28SOI_LR_OAI12X3_P0 U1566 ( .A(n3330), .B(n2483), .C(n3306), .Z(n196) );
  C8T28SOI_LR_OAI12X3_P0 U1567 ( .A(n3322), .B(n2483), .C(n3306), .Z(n190) );
  C8T28SOI_LR_OAI12X3_P0 U1568 ( .A(n3327), .B(n2483), .C(n3306), .Z(n194) );
  C8T28SOI_LR_OAI12X3_P0 U1569 ( .A(n3326), .B(n2483), .C(n3306), .Z(n193) );
  C8T28SOI_LR_OAI12X3_P0 U1570 ( .A(n3321), .B(n2483), .C(n3306), .Z(n189) );
  C8T28SOI_LR_OAI12X3_P0 U1571 ( .A(n3320), .B(n2483), .C(n3306), .Z(n188) );
  C8T28SOI_LR_OAI12X3_P0 U1572 ( .A(n3324), .B(n2483), .C(n3306), .Z(n192) );
  C8T28SOI_LR_AOI222X2_P0 U1573 ( .A(n2467), .B(n2480), .C(n2469), .D(n2476), 
        .E(n2466), .F(n2468), .Z(n3323) );
  C8T28SOI_LR_NOR2X4_P0 U1574 ( .A(n3323), .B(n3299), .Z(n143) );
  C8T28SOI_LR_AOI22X2_P0 U1575 ( .A(n2470), .B(n2476), .C(n2469), .D(n2468), 
        .Z(n2472) );
  C8T28SOI_LR_OAI211X3_P0 U1576 ( .A(n2474), .B(n2473), .C(n2472), .D(n2471), 
        .Z(n2478) );
  C8T28SOI_LR_CNIVX4_P16 U1577 ( .A(n2478), .Z(n3328) );
  C8T28SOI_LR_NOR2X4_P0 U1578 ( .A(n3328), .B(n3299), .Z(n147) );
  C8T28SOI_LR_AOI22X2_P0 U1579 ( .A(n2477), .B(n2476), .C(n3859), .D(n2475), 
        .Z(n3334) );
  C8T28SOI_LR_NOR2X4_P0 U1580 ( .A(n3334), .B(n3294), .Z(n151) );
  C8T28SOI_LR_AND2X5_P0 U1581 ( .A(intadd_0_SUM_4_), .B(n3879), .Z(n365) );
  C8T28SOI_LR_OAI12X3_P0 U1582 ( .A(n3323), .B(n2483), .C(n3306), .Z(n191) );
  C8T28SOI_LR_OAI12X3_P0 U1583 ( .A(n3859), .B(n2478), .C(n3296), .Z(n3348) );
  C8T28SOI_LR_NOR2X4_P0 U1584 ( .A(n3872), .B(n3348), .Z(n163) );
  C8T28SOI_LR_OA12X3_P0 U1585 ( .A(n2481), .B(n2480), .C(n2479), .Z(n3295) );
  C8T28SOI_LR_AOI22ABX3_P0 U1586 ( .C(n3295), .D(n3859), .A(n3300), .B(n2495), 
        .Z(n3339) );
  C8T28SOI_LR_NOR2X4_P0 U1587 ( .A(n3339), .B(n3294), .Z(n155) );
  C8T28SOI_LR_OAI12X3_P0 U1588 ( .A(n3328), .B(n2483), .C(n3306), .Z(n195) );
  C8T28SOI_LR_AO12CX4_P0 U1589 ( .A(sf_bias[4]), .B(n3320), .C(n3296), .Z(
        n3340) );
  C8T28SOI_LR_NOR2X4_P0 U1590 ( .A(n3872), .B(n3340), .Z(n156) );
  C8T28SOI_LR_OA12X3_P0 U1591 ( .A(mts_w[1]), .B(mts_d[1]), .C(n2484), .Z(
        n2529) );
  C8T28SOI_LR_CNNOR2X8_P16 U1592 ( .A(n2486), .B(n2485), .Z(n2528) );
  C8T28SOI_LR_CNIVX4_P16 U1593 ( .A(n2487), .Z(n2526) );
  C8T28SOI_LR_OA12X3_P0 U1594 ( .A(n2490), .B(n2489), .C(n2488), .Z(n2525) );
  C8T28SOI_LR_PAOI2X4_P0 U1595 ( .A(n2493), .B(n2492), .P(n2491), .Z(n2524) );
  C8T28SOI_LR_CNNOR2X8_P16 U1596 ( .A(n2494), .B(n3790), .Z(n65) );
  C8T28SOI_LR_NOR2X4_P0 U1597 ( .A(sf_bias[4]), .B(n2495), .Z(n3297) );
  C8T28SOI_LR_AOI22AX2_P0 U1598 ( .C(n3295), .D(n3303), .A(n3307), .B(n3297), 
        .Z(n2496) );
  C8T28SOI_LR_NAND2X4_P0 U1599 ( .A(n2496), .B(n3306), .Z(n203) );
  C8T28SOI_LR_AO12CX4_P0 U1600 ( .A(sf_bias[4]), .B(n3323), .C(n3296), .Z(
        n3343) );
  C8T28SOI_LR_NOR2X4_P0 U1601 ( .A(n3872), .B(n3343), .Z(n159) );
  C8T28SOI_LR_NAND2X4_P0 U1602 ( .A(n3801), .B(acc_rdy), .Z(n2497) );
  C8T28SOI_LR_CNNOR2AX9_P16 U1607 ( .A(acc[0]), .B(n3885), .Z(n782) );
  C8T28SOI_LR_CNIVX4_P16 U1610 ( .A(regi_p[1]), .Z(n2523) );
  C8T28SOI_LR_CNNOR2X8_P16 U1611 ( .A(n3883), .B(n2523), .Z(n1072) );
  C8T28SOI_LR_AND2X5_P0 U1614 ( .A(exp_p[1]), .B(n3884), .Z(n1059) );
  C8T28SOI_LR_AND2X5_P0 U1615 ( .A(mts_q[2]), .B(n3884), .Z(n1053) );
  C8T28SOI_LR_AND2X5_P0 U1616 ( .A(exp_p[0]), .B(n3884), .Z(n1058) );
  C8T28SOI_LR_AND2X5_P0 U1617 ( .A(mts_q[5]), .B(n3884), .Z(n1056) );
  C8T28SOI_LR_AND2X5_P0 U1618 ( .A(mts_q[4]), .B(n3884), .Z(n1055) );
  C8T28SOI_LR_AND2X5_P0 U1619 ( .A(mts_q[3]), .B(n3884), .Z(n1054) );
  C8T28SOI_LR_AND2X5_P0 U1620 ( .A(mts_q[0]), .B(n3884), .Z(n1051) );
  C8T28SOI_LR_AND2X5_P0 U1621 ( .A(mts_q[6]), .B(n3884), .Z(n1057) );
  C8T28SOI_LR_AND2X5_P0 U1622 ( .A(mts_q[1]), .B(n3884), .Z(n1052) );
  C8T28SOI_LR_OR3X5_P0 U1624 ( .A(acc[2]), .B(acc[0]), .C(acc[1]), .Z(n2502)
         );
  C8T28SOI_LR_CNNOR2X8_P16 U1625 ( .A(acc[3]), .B(n2502), .Z(n3773) );
  C8T28SOI_LR_CNNAND2AX9_P16 U1626 ( .A(acc[4]), .B(n3773), .Z(n2509) );
  C8T28SOI_LR_CNNOR2X8_P16 U1627 ( .A(acc[5]), .B(n2509), .Z(n3768) );
  C8T28SOI_LR_CNNAND2AX9_P16 U1628 ( .A(acc[6]), .B(n3768), .Z(n2512) );
  C8T28SOI_LR_CNNOR2X8_P16 U1629 ( .A(acc[7]), .B(n2512), .Z(n3765) );
  C8T28SOI_LR_CNNAND2AX9_P16 U1630 ( .A(acc[8]), .B(n3765), .Z(n2518) );
  C8T28SOI_LR_NAND2X4_P0 U1631 ( .A(n3862), .B(n2518), .Z(n2500) );
  C8T28SOI_LR_CNXOR2X9_P16 U1632 ( .A(acc[9]), .S(n2500), .Z(n2501) );
  C8T28SOI_LR_CNNOR2X8_P16 U1633 ( .A(n3885), .B(n2501), .Z(n791) );
  C8T28SOI_LR_NAND2X4_P0 U1634 ( .A(n3862), .B(n2502), .Z(n2503) );
  C8T28SOI_LR_CNXOR2X9_P16 U1635 ( .A(acc[3]), .S(n2503), .Z(n2504) );
  C8T28SOI_LR_CNNOR2X8_P16 U1636 ( .A(n3885), .B(n2504), .Z(n785) );
  C8T28SOI_LR_NAND2X4_P0 U1638 ( .A(n3864), .B(acc[0]), .Z(n2505) );
  C8T28SOI_LR_CNXOR2X9_P16 U1639 ( .A(acc[1]), .S(n2505), .Z(n2506) );
  C8T28SOI_LR_CNNOR2X8_P16 U1640 ( .A(n3885), .B(n2506), .Z(n783) );
  C8T28SOI_LR_OAI12X3_P0 U1641 ( .A(acc[0]), .B(acc[1]), .C(n3864), .Z(n2507)
         );
  C8T28SOI_LR_CNXOR2X9_P16 U1642 ( .A(acc[2]), .S(n2507), .Z(n2508) );
  C8T28SOI_LR_CNNOR2X8_P16 U1643 ( .A(n3885), .B(n2508), .Z(n784) );
  C8T28SOI_LR_NAND2X4_P0 U1644 ( .A(n3862), .B(n2509), .Z(n2510) );
  C8T28SOI_LR_CNXOR2X9_P16 U1645 ( .A(acc[5]), .S(n2510), .Z(n2511) );
  C8T28SOI_LR_CNNOR2X8_P16 U1646 ( .A(n3885), .B(n2511), .Z(n787) );
  C8T28SOI_LR_CNNAND2X8_P16 U1647 ( .A(n3862), .B(n2512), .Z(n2513) );
  C8T28SOI_LR_CNXOR2X9_P16 U1648 ( .A(acc[7]), .S(n2513), .Z(n2514) );
  C8T28SOI_LR_CNNOR2X8_P16 U1649 ( .A(n3885), .B(n2514), .Z(n789) );
  C8T28SOI_LR_NOR3X3_P0 U1650 ( .A(mts_q[6]), .B(mts_q[3]), .C(mts_q[4]), .Z(
        n2515) );
  C8T28SOI_LR_CNNAND2AX9_P16 U1651 ( .A(mts_q[5]), .B(n2515), .Z(n2516) );
  C8T28SOI_LR_OR3X5_P0 U1652 ( .A(mts_q[1]), .B(mts_q[2]), .C(n2516), .Z(n2517) );
  C8T28SOI_LR_NOR3X3_P0 U1653 ( .A(mts_q[7]), .B(mts_q[0]), .C(n2517), .Z(
        n2636) );
  C8T28SOI_LR_NOR2X4_P0 U1654 ( .A(n2636), .B(n3883), .Z(n1060) );
  C8T28SOI_LR_CNNOR2X8_P16 U1655 ( .A(acc[9]), .B(n2518), .Z(n3762) );
  C8T28SOI_LR_CNNAND2AX9_P16 U1656 ( .A(acc[10]), .B(n3762), .Z(n2543) );
  C8T28SOI_LR_NAND2X4_P0 U1657 ( .A(n3862), .B(n2543), .Z(n2519) );
  C8T28SOI_LR_CNXOR2X9_P16 U1658 ( .A(acc[11]), .S(n2519), .Z(n2520) );
  C8T28SOI_LR_CNNOR2X8_P16 U1659 ( .A(n3885), .B(n2520), .Z(n793) );
  C8T28SOI_LR_CNNAND2X8_P16 U1661 ( .A(sf_w[4]), .B(sf_d[4]), .Z(n3287) );
  C8T28SOI_LR_CNNAND2X8_P16 U1662 ( .A(sf_w[5]), .B(n3287), .Z(n2522) );
  C8T28SOI_LR_CNNOR2X8_P16 U1663 ( .A(intadd_1_n1), .B(n2522), .Z(n104) );
  C8T28SOI_LRS_XNOR2X3_P0 U1664 ( .A(intadd_1_n1), .B(n2522), .Z(n103) );
  C8T28SOI_LR_CNIVX4_P16 U1665 ( .A(sf_d[0]), .Z(intadd_1_CI) );
  C8T28SOI_LR_CNAND2X14_P16 U1666 ( .A(sf_w[1]), .B(sf_d[1]), .Z(intadd_1_B_2_) );
  C8T28SOI_LR_CNAND2X14_P16 U1667 ( .A(sf_w[2]), .B(sf_d[2]), .Z(intadd_1_B_3_) );
  C8T28SOI_LR_CNOR2X19_P16 U1668 ( .A(sf_d[3]), .B(sf_w[3]), .Z(intadd_1_B_4_)
         );
  C8T28SOI_LR_AO12CX4_P0 U1669 ( .A(sf_w[3]), .B(sf_d[3]), .C(intadd_1_B_4_), 
        .Z(intadd_1_A_3_) );
  C8T28SOI_LR_OAI12X3_P0 U1670 ( .A(sf_w[5]), .B(n3287), .C(n2522), .Z(
        intadd_1_B_5_) );
  C8T28SOI_LR_CNIVX4_P16 U1671 ( .A(sf_d[5]), .Z(intadd_1_A_5_) );
  C8T28SOI_LR_AND2X5_P0 U1672 ( .A(intadd_0_SUM_5_), .B(n3877), .Z(n366) );
  C8T28SOI_LR_CNNOR2AX9_P16 U1673 ( .A(regi_p[0]), .B(n3885), .Z(n1071) );
  C8T28SOI_LR_NOR2X4_P0 U1674 ( .A(regi_p[0]), .B(n3885), .Z(n1074) );
  C8T28SOI_LR_NAND2X4_P0 U1675 ( .A(n1074), .B(n2523), .Z(n3393) );
  C8T28SOI_LR_AO12CX4_P0 U1676 ( .A(regi_p[1]), .B(n1071), .C(n3393), .Z(n1075) );
  C8T28SOI_LR_AND2X5_P0 U1677 ( .A(regi_p[2]), .B(n3886), .Z(n1073) );
  C8T28SOI_LR_FA1X4_P0 U1678 ( .A0(n2526), .B0(n2525), .CI(n2524), .CO(n2527), 
        .S0(n2494) );
  C8T28SOI_LR_CNIVX4_P16 U1679 ( .A(n2527), .Z(n2535) );
  C8T28SOI_LR_FA1X4_P0 U1680 ( .A0(n2530), .B0(n2529), .CI(n2528), .CO(n2533), 
        .S0(n2487) );
  C8T28SOI_LR_AND2X5_P0 U1681 ( .A(n2531), .B(n3873), .Z(n66) );
  C8T28SOI_LR_FA1X4_P0 U1682 ( .A0(mts_w[2]), .B0(mts_d[2]), .CI(n2532), .CO(
        n3788), .S0(n2534) );
  C8T28SOI_LR_FA1X4_P0 U1683 ( .A0(n2535), .B0(n2534), .CI(n2533), .CO(n3789), 
        .S0(n2531) );
  C8T28SOI_LR_CNNOR2X8_P16 U1684 ( .A(n3788), .B(n3789), .Z(n3787) );
  C8T28SOI_LR_NOR2X4_P0 U1685 ( .A(n3787), .B(n3790), .Z(n68) );
  C8T28SOI_LR_NAND2X8_P0 U1686 ( .A(zc_i), .B(n3884), .Z(n3415) );
  C8T28SOI_LR_CNNOR2AX9_P16 U1687 ( .A(sf_q[6]), .B(n3415), .Z(n960) );
  C8T28SOI_LR_CNNOR2AX9_P16 U1688 ( .A(sf_q[2]), .B(n3415), .Z(n961) );
  C8T28SOI_LR_OAI31X3_P0 U1689 ( .A(sf_q[2]), .B(sf_q[4]), .C(sf_q[3]), .D(
        sf_q[6]), .Z(n2536) );
  C8T28SOI_LR_CNXOR2X9_P16 U1690 ( .A(sf_q[5]), .S(n2536), .Z(n2537) );
  C8T28SOI_LR_CNNOR2X8_P16 U1691 ( .A(n3415), .B(n2537), .Z(n964) );
  C8T28SOI_LR_NAND2X4_P0 U1692 ( .A(sf_q[6]), .B(sf_q[2]), .Z(n2538) );
  C8T28SOI_LR_CNXOR2X9_P16 U1693 ( .A(sf_q[3]), .S(n2538), .Z(n2539) );
  C8T28SOI_LR_CNNOR2X8_P16 U1694 ( .A(n3415), .B(n2539), .Z(n962) );
  C8T28SOI_LR_CNIVX4_P16 U1695 ( .A(tmp[15]), .Z(n3367) );
  C8T28SOI_LR_CNIVX4_P16 U1696 ( .A(tmp[13]), .Z(n3370) );
  C8T28SOI_LR_AOI31X3_P0 U1697 ( .A(regi_sf[2]), .B(regi_sf[1]), .C(regi_sf[0]), .D(regi_sf[3]), .Z(n2641) );
  C8T28SOI_LR_NAND2X4_P0 U1698 ( .A(n2641), .B(tmp[10]), .Z(n2629) );
  C8T28SOI_LR_CNNOR2AX9_P16 U1699 ( .A(tmp[11]), .B(n2629), .Z(n2632) );
  C8T28SOI_LR_NAND2X4_P0 U1700 ( .A(n2632), .B(tmp[12]), .Z(n3371) );
  C8T28SOI_LR_CNNOR2X8_P16 U1701 ( .A(n3370), .B(n3371), .Z(n3369) );
  C8T28SOI_LR_NAND2X4_P0 U1702 ( .A(n3369), .B(tmp[14]), .Z(n3368) );
  C8T28SOI_LR_CNNOR2X8_P16 U1703 ( .A(n3367), .B(n3368), .Z(n3366) );
  C8T28SOI_LR_NAND2X4_P0 U1704 ( .A(n3366), .B(tmp[16]), .Z(n2623) );
  C8T28SOI_LR_CNXOR2X9_P16 U1705 ( .A(n2623), .S(tmp[17]), .Z(n2540) );
  C8T28SOI_LR_CNNOR2X8_P16 U1706 ( .A(n3415), .B(n2540), .Z(n1156) );
  C8T28SOI_LR_OAI12X3_P0 U1707 ( .A(sf_q[2]), .B(sf_q[3]), .C(sf_q[6]), .Z(
        n2541) );
  C8T28SOI_LR_CNXOR2X9_P16 U1708 ( .A(sf_q[4]), .S(n2541), .Z(n2542) );
  C8T28SOI_LR_CNNOR2X8_P16 U1709 ( .A(n3415), .B(n2542), .Z(n963) );
  C8T28SOI_LR_AND2X5_P0 U1710 ( .A(intadd_0_SUM_6_), .B(n3877), .Z(n367) );
  C8T28SOI_LR_CNNOR2X8_P16 U1711 ( .A(acc[11]), .B(n2543), .Z(n3759) );
  C8T28SOI_LR_CNNAND2AX9_P16 U1712 ( .A(acc[12]), .B(n3759), .Z(n2613) );
  C8T28SOI_LR_NAND2X4_P0 U1713 ( .A(n3862), .B(n2613), .Z(n2544) );
  C8T28SOI_LR_CNXOR2X9_P16 U1714 ( .A(acc[13]), .S(n2544), .Z(n2545) );
  C8T28SOI_LR_CNNOR2X8_P16 U1715 ( .A(n3883), .B(n2545), .Z(n795) );
  C8T28SOI_LR_NOR2X4_P0 U1716 ( .A(sign_sf), .B(n3883), .Z(n2554) );
  C8T28SOI_LR_AND2X5_P0 U1717 ( .A(n2554), .B(tmp_neg[16]), .Z(n1095) );
  C8T28SOI_LR_NAND2X4_P0 U1719 ( .A(tmp_neg[16]), .B(n3869), .Z(n2558) );
  C8T28SOI_LR_NOR2X4_P0 U1720 ( .A(shift_neg[1]), .B(n2558), .Z(n2618) );
  C8T28SOI_LR_NAND2X4_P0 U1721 ( .A(n3886), .B(sign_sf), .Z(n2548) );
  C8T28SOI_LR_CNNOR2X8_P16 U1722 ( .A(shift_neg[2]), .B(n2548), .Z(n3399) );
  C8T28SOI_LR_CNIVX4_P16 U1723 ( .A(shift_pos[2]), .Z(n2553) );
  C8T28SOI_LR_NOR2X4_P0 U1724 ( .A(shift_pos[1]), .B(shift_pos[0]), .Z(n2622)
         );
  C8T28SOI_LR_AO12CX4_P0 U1725 ( .A(n2553), .B(n2622), .C(n1095), .Z(n2546) );
  C8T28SOI_LR_AO12CX4_P0 U1726 ( .A(n2618), .B(n3399), .C(n2546), .Z(n1094) );
  C8T28SOI_LR_NOR3X3_P0 U1727 ( .A(sign_sf), .B(n3885), .C(n2553), .Z(n3403)
         );
  C8T28SOI_LR_AOI22X2_P0 U1729 ( .A(shift_pos[0]), .B(tmp_neg[8]), .C(
        tmp_neg[7]), .D(n3868), .Z(n2549) );
  C8T28SOI_LR_NOR2X4_P0 U1731 ( .A(n2549), .B(n3870), .Z(n2586) );
  C8T28SOI_LR_CNNOR2AX9_P16 U1732 ( .A(shift_neg[2]), .B(n2548), .Z(n3394) );
  C8T28SOI_LR_AOI22X2_P0 U1733 ( .A(shift_neg[0]), .B(tmp_neg[8]), .C(
        tmp_neg[7]), .D(n3869), .Z(n2550) );
  C8T28SOI_LR_NOR2X4_P0 U1735 ( .A(n2550), .B(n3871), .Z(n2585) );
  C8T28SOI_LRA_AO22X5_P0 U1736 ( .A(n3403), .B(n2586), .C(n3394), .D(n2585), 
        .Z(n1079) );
  C8T28SOI_LR_NAND2X4_P0 U1737 ( .A(shift_pos[0]), .B(tmp_neg[7]), .Z(n2551)
         );
  C8T28SOI_LR_NOR2X4_P0 U1738 ( .A(n3870), .B(n2551), .Z(n2566) );
  C8T28SOI_LR_NAND2X4_P0 U1739 ( .A(shift_neg[0]), .B(tmp_neg[7]), .Z(n2552)
         );
  C8T28SOI_LR_NOR2X4_P0 U1740 ( .A(n3871), .B(n2552), .Z(n2565) );
  C8T28SOI_LRA_AO22X5_P0 U1741 ( .A(n3403), .B(n2566), .C(n3394), .D(n2565), 
        .Z(n1078) );
  C8T28SOI_LR_AOI22X2_P0 U1742 ( .A(shift_pos[0]), .B(tmp_neg[10]), .C(
        tmp_neg[9]), .D(n3868), .Z(n2582) );
  C8T28SOI_LR_AOI22X2_P0 U1743 ( .A(shift_pos[1]), .B(n2582), .C(n2549), .D(
        n3870), .Z(n2604) );
  C8T28SOI_LR_AOI22X2_P0 U1744 ( .A(shift_neg[0]), .B(tmp_neg[10]), .C(
        tmp_neg[9]), .D(n3869), .Z(n2584) );
  C8T28SOI_LR_AOI22X2_P0 U1745 ( .A(shift_neg[1]), .B(n2584), .C(n2550), .D(
        n3871), .Z(n2603) );
  C8T28SOI_LRA_AO22X5_P0 U1746 ( .A(n3403), .B(n2604), .C(n3394), .D(n2603), 
        .Z(n1081) );
  C8T28SOI_LR_AOI22X2_P0 U1747 ( .A(shift_pos[0]), .B(tmp_neg[9]), .C(
        tmp_neg[8]), .D(n3868), .Z(n2563) );
  C8T28SOI_LR_AOI22X2_P0 U1748 ( .A(shift_pos[1]), .B(n2563), .C(n2551), .D(
        n3870), .Z(n2572) );
  C8T28SOI_LR_AOI22X2_P0 U1749 ( .A(shift_neg[0]), .B(tmp_neg[9]), .C(
        tmp_neg[8]), .D(n3869), .Z(n2564) );
  C8T28SOI_LR_AOI22X2_P0 U1750 ( .A(shift_neg[1]), .B(n2564), .C(n2552), .D(
        n3871), .Z(n2571) );
  C8T28SOI_LRA_AO22X5_P0 U1751 ( .A(n3403), .B(n2572), .C(n3394), .D(n2571), 
        .Z(n1080) );
  C8T28SOI_LR_AOI22X2_P0 U1752 ( .A(tmp_neg[16]), .B(shift_pos[1]), .C(
        tmp_neg[15]), .D(n2622), .Z(n3402) );
  C8T28SOI_LR_NAND2X4_P0 U1753 ( .A(n2554), .B(n2553), .Z(n2556) );
  C8T28SOI_LR_NAND2X4_P0 U1754 ( .A(n3403), .B(tmp_neg[16]), .Z(n2621) );
  C8T28SOI_LR_AOI22X2_P0 U1755 ( .A(shift_neg[0]), .B(tmp_neg[16]), .C(
        tmp_neg[15]), .D(n3869), .Z(n2561) );
  C8T28SOI_LR_NOR2X4_P0 U1756 ( .A(shift_neg[1]), .B(n2561), .Z(n3395) );
  C8T28SOI_LR_NAND2X4_P0 U1757 ( .A(n3399), .B(n3395), .Z(n2555) );
  C8T28SOI_LR_OAI211X3_P0 U1758 ( .A(n3402), .B(n2556), .C(n2621), .D(n2555), 
        .Z(n1093) );
  C8T28SOI_LR_AND2X5_P0 U1759 ( .A(intadd_0_SUM_7_), .B(n3877), .Z(n368) );
  C8T28SOI_LR_AOI22X2_P0 U1761 ( .A(shift_pos[0]), .B(tmp_neg[15]), .C(
        tmp_neg[14]), .D(n3868), .Z(n2590) );
  C8T28SOI_LR_NAND2X4_P0 U1762 ( .A(tmp_neg[16]), .B(shift_pos[1]), .Z(n2557)
         );
  C8T28SOI_LR_OAI22X3_P0 U1763 ( .A(shift_pos[1]), .B(n2590), .C(n3868), .D(
        n2557), .Z(n2576) );
  C8T28SOI_LR_AOI22X2_P0 U1764 ( .A(shift_neg[0]), .B(tmp_neg[15]), .C(
        tmp_neg[14]), .D(n3869), .Z(n2592) );
  C8T28SOI_LR_AOI22X2_P0 U1765 ( .A(shift_neg[1]), .B(n2558), .C(n2592), .D(
        n3871), .Z(n2575) );
  C8T28SOI_LR_AOI22X2_P0 U1766 ( .A(n3397), .B(n2576), .C(n3399), .D(n2575), 
        .Z(n2559) );
  C8T28SOI_LR_NAND2X4_P0 U1767 ( .A(n2559), .B(n2621), .Z(n1092) );
  C8T28SOI_LR_AOI22X2_P0 U1768 ( .A(shift_pos[0]), .B(tmp_neg[14]), .C(
        tmp_neg[13]), .D(n3868), .Z(n2599) );
  C8T28SOI_LR_NAND3X3_P0 U1769 ( .A(n3868), .B(shift_pos[1]), .C(tmp_neg[15]), 
        .Z(n2560) );
  C8T28SOI_LR_OAI12X3_P0 U1770 ( .A(shift_pos[1]), .B(n2599), .C(n2560), .Z(
        n2608) );
  C8T28SOI_LR_AOI22X2_P0 U1771 ( .A(shift_neg[0]), .B(tmp_neg[14]), .C(
        tmp_neg[13]), .D(n3869), .Z(n2602) );
  C8T28SOI_LR_AOI22X2_P0 U1772 ( .A(shift_neg[1]), .B(n2561), .C(n2602), .D(
        n3871), .Z(n2607) );
  C8T28SOI_LR_AOI22X2_P0 U1773 ( .A(n3397), .B(n2608), .C(n3399), .D(n2607), 
        .Z(n2562) );
  C8T28SOI_LR_NAND2X4_P0 U1774 ( .A(n2562), .B(n2621), .Z(n1091) );
  C8T28SOI_LR_AOI22X2_P0 U1775 ( .A(shift_pos[0]), .B(tmp_neg[11]), .C(
        tmp_neg[10]), .D(n3868), .Z(n2569) );
  C8T28SOI_LR_AOI22X2_P0 U1776 ( .A(shift_pos[1]), .B(n2569), .C(n2563), .D(
        n3870), .Z(n2594) );
  C8T28SOI_LR_AOI22X2_P0 U1777 ( .A(shift_neg[0]), .B(tmp_neg[11]), .C(
        tmp_neg[10]), .D(n3869), .Z(n2570) );
  C8T28SOI_LR_AOI22X2_P0 U1778 ( .A(shift_neg[1]), .B(n2570), .C(n2564), .D(
        n3871), .Z(n2593) );
  C8T28SOI_LR_AOI22X2_P0 U1779 ( .A(n3403), .B(n2594), .C(n3394), .D(n2593), 
        .Z(n2568) );
  C8T28SOI_LR_AOI22X2_P0 U1780 ( .A(n3397), .B(n2566), .C(n3399), .D(n2565), 
        .Z(n2567) );
  C8T28SOI_LR_NAND2X4_P0 U1781 ( .A(n2568), .B(n2567), .Z(n1082) );
  C8T28SOI_LR_AOI22X2_P0 U1782 ( .A(shift_pos[0]), .B(tmp_neg[13]), .C(
        tmp_neg[12]), .D(n3868), .Z(n2589) );
  C8T28SOI_LR_AOI22X2_P0 U1783 ( .A(shift_pos[1]), .B(n2589), .C(n2569), .D(
        n3870), .Z(n2578) );
  C8T28SOI_LR_AOI22X2_P0 U1784 ( .A(shift_neg[0]), .B(tmp_neg[13]), .C(
        tmp_neg[12]), .D(n3869), .Z(n2591) );
  C8T28SOI_LR_AOI22X2_P0 U1785 ( .A(shift_neg[1]), .B(n2591), .C(n2570), .D(
        n3871), .Z(n2577) );
  C8T28SOI_LR_AOI22X2_P0 U1786 ( .A(n3403), .B(n2578), .C(n3394), .D(n2577), 
        .Z(n2574) );
  C8T28SOI_LR_AOI22X2_P0 U1787 ( .A(n3397), .B(n2572), .C(n3399), .D(n2571), 
        .Z(n2573) );
  C8T28SOI_LR_NAND2X4_P0 U1788 ( .A(n2574), .B(n2573), .Z(n1084) );
  C8T28SOI_LR_AOI22X2_P0 U1789 ( .A(n3403), .B(n2576), .C(n2575), .D(n3394), 
        .Z(n2580) );
  C8T28SOI_LR_AOI22X2_P0 U1790 ( .A(n3397), .B(n2578), .C(n3399), .D(n2577), 
        .Z(n2579) );
  C8T28SOI_LR_NAND2X4_P0 U1791 ( .A(n2580), .B(n2579), .Z(n1088) );
  C8T28SOI_LR_AOI22X2_P0 U1792 ( .A(shift_pos[0]), .B(tmp_neg[12]), .C(
        tmp_neg[11]), .D(n3868), .Z(n2598) );
  C8T28SOI_LR_AOI22X2_P0 U1793 ( .A(shift_pos[1]), .B(n2598), .C(n2582), .D(
        n3870), .Z(n2610) );
  C8T28SOI_LR_AOI22X2_P0 U1794 ( .A(shift_neg[0]), .B(tmp_neg[12]), .C(
        tmp_neg[11]), .D(n3869), .Z(n2601) );
  C8T28SOI_LR_AOI22X2_P0 U1795 ( .A(shift_neg[1]), .B(n2601), .C(n2584), .D(
        n3871), .Z(n2609) );
  C8T28SOI_LR_AOI22X2_P0 U1796 ( .A(n3403), .B(n2610), .C(n3394), .D(n2609), 
        .Z(n2588) );
  C8T28SOI_LR_AOI22X2_P0 U1797 ( .A(n3397), .B(n2586), .C(n3399), .D(n2585), 
        .Z(n2587) );
  C8T28SOI_LR_NAND2X4_P0 U1798 ( .A(n2588), .B(n2587), .Z(n1083) );
  C8T28SOI_LR_AOI22X2_P0 U1799 ( .A(shift_pos[1]), .B(n2590), .C(n2589), .D(
        n3870), .Z(n2617) );
  C8T28SOI_LR_AOI22X2_P0 U1800 ( .A(shift_neg[1]), .B(n2592), .C(n2591), .D(
        n3871), .Z(n2616) );
  C8T28SOI_LR_AOI22X2_P0 U1801 ( .A(n3403), .B(n2617), .C(n3394), .D(n2616), 
        .Z(n2596) );
  C8T28SOI_LR_AOI22X2_P0 U1802 ( .A(n3397), .B(n2594), .C(n3399), .D(n2593), 
        .Z(n2595) );
  C8T28SOI_LR_NAND2X4_P0 U1803 ( .A(n2596), .B(n2595), .Z(n1086) );
  C8T28SOI_LR_AOI22X2_P0 U1804 ( .A(shift_pos[1]), .B(n2599), .C(n2598), .D(
        n3870), .Z(n3396) );
  C8T28SOI_LR_AOI22X2_P0 U1805 ( .A(shift_neg[1]), .B(n2602), .C(n2601), .D(
        n3871), .Z(n3398) );
  C8T28SOI_LR_AOI22X2_P0 U1806 ( .A(n3403), .B(n3396), .C(n3394), .D(n3398), 
        .Z(n2606) );
  C8T28SOI_LR_AOI22X2_P0 U1807 ( .A(n3397), .B(n2604), .C(n3399), .D(n2603), 
        .Z(n2605) );
  C8T28SOI_LR_NAND2X4_P0 U1808 ( .A(n2606), .B(n2605), .Z(n1085) );
  C8T28SOI_LR_AOI22X2_P0 U1809 ( .A(n3403), .B(n2608), .C(n2607), .D(n3394), 
        .Z(n2612) );
  C8T28SOI_LR_AOI22X2_P0 U1810 ( .A(n3397), .B(n2610), .C(n3399), .D(n2609), 
        .Z(n2611) );
  C8T28SOI_LR_NAND2X4_P0 U1811 ( .A(n2612), .B(n2611), .Z(n1087) );
  C8T28SOI_LR_CNNOR2X8_P16 U1813 ( .A(acc[13]), .B(n2613), .Z(n3756) );
  C8T28SOI_LR_CNNAND2AX9_P16 U1814 ( .A(acc[14]), .B(n3756), .Z(n2633) );
  C8T28SOI_LR_NAND2X4_P0 U1815 ( .A(n3862), .B(n2633), .Z(n2614) );
  C8T28SOI_LR_CNXOR2X9_P16 U1816 ( .A(acc[15]), .S(n2614), .Z(n2615) );
  C8T28SOI_LR_CNNOR2X8_P16 U1817 ( .A(n3883), .B(n2615), .Z(n797) );
  C8T28SOI_LR_AOI22X2_P0 U1818 ( .A(n3397), .B(n2617), .C(n3399), .D(n2616), 
        .Z(n2620) );
  C8T28SOI_LR_NAND2X4_P0 U1819 ( .A(n3394), .B(n2618), .Z(n2619) );
  C8T28SOI_LR_OAI211X3_P0 U1820 ( .A(n2622), .B(n2621), .C(n2620), .D(n2619), 
        .Z(n1090) );
  C8T28SOI_LR_AND2X5_P0 U1821 ( .A(intadd_0_SUM_8_), .B(n3877), .Z(n369) );
  C8T28SOI_LR_AND2X5_P0 U1823 ( .A(mts_tmp[96]), .B(n3889), .Z(n932) );
  C8T28SOI_LR_AND2X5_P0 U1824 ( .A(mts_tmp[97]), .B(n3889), .Z(n933) );
  C8T28SOI_LR_AND2X5_P0 U1825 ( .A(mts_tmp[98]), .B(n3889), .Z(n934) );
  C8T28SOI_LR_AND2X5_P0 U1826 ( .A(mts_tmp[94]), .B(n3889), .Z(n930) );
  C8T28SOI_LR_AND2X5_P0 U1827 ( .A(mts_tmp[100]), .B(n3889), .Z(n936) );
  C8T28SOI_LR_AND2X5_P0 U1828 ( .A(regi_sf[1]), .B(n3889), .Z(n980) );
  C8T28SOI_LR_AND2X5_P0 U1829 ( .A(mts_tmp[99]), .B(n3889), .Z(n935) );
  C8T28SOI_LR_AND2X5_P0 U1830 ( .A(regi_sf[0]), .B(n3889), .Z(n979) );
  C8T28SOI_LR_AND2X5_P0 U1831 ( .A(regi_sf[2]), .B(n3889), .Z(n981) );
  C8T28SOI_LR_AND2X5_P0 U1832 ( .A(mts_tmp[95]), .B(n3889), .Z(n931) );
  C8T28SOI_LR_AND2X5_P0 U1833 ( .A(mts_tmp[101]), .B(n3889), .Z(n937) );
  C8T28SOI_LR_AND2X5_P0 U1834 ( .A(sf_q[1]), .B(n3889), .Z(n966) );
  C8T28SOI_LR_AND2X5_P0 U1835 ( .A(sf_q[0]), .B(n3889), .Z(n965) );
  C8T28SOI_LR_OA112X4_P0 U1836 ( .A(n3366), .B(tmp[16]), .C(n3889), .D(n2623), 
        .Z(n1155) );
  C8T28SOI_LR_OA112X4_P0 U1837 ( .A(n3369), .B(tmp[14]), .C(n3889), .D(n3368), 
        .Z(n1153) );
  C8T28SOI_LR_NOR3X3_P0 U1838 ( .A(tmp[5]), .B(tmp[0]), .C(tmp[4]), .Z(n2625)
         );
  C8T28SOI_LR_NOR3X3_P0 U1839 ( .A(tmp[2]), .B(tmp[9]), .C(tmp[8]), .Z(n2624)
         );
  C8T28SOI_LR_NAND2X4_P0 U1840 ( .A(n2625), .B(n2624), .Z(n2626) );
  C8T28SOI_LR_OR3X5_P0 U1841 ( .A(tmp[1]), .B(tmp[6]), .C(n2626), .Z(n2627) );
  C8T28SOI_LR_NOR3X3_P0 U1842 ( .A(tmp[7]), .B(tmp[3]), .C(n2627), .Z(n2628)
         );
  C8T28SOI_LR_CNNOR2X8_P16 U1843 ( .A(n2629), .B(n2628), .Z(n2631) );
  C8T28SOI_LR_CNIVX4_P16 U1844 ( .A(n2632), .Z(n2630) );
  C8T28SOI_LR_OA112X4_P0 U1845 ( .A(tmp[11]), .B(n2631), .C(n3889), .D(n2630), 
        .Z(n1150) );
  C8T28SOI_LR_OA112X4_P0 U1846 ( .A(n2632), .B(tmp[12]), .C(n3889), .D(n3371), 
        .Z(n1151) );
  C8T28SOI_LR_CNNOR2X8_P16 U1847 ( .A(acc[15]), .B(n2633), .Z(n3753) );
  C8T28SOI_LR_CNNAND2AX9_P16 U1848 ( .A(acc[16]), .B(n3753), .Z(n2638) );
  C8T28SOI_LR_NAND2X4_P0 U1849 ( .A(n3862), .B(n2638), .Z(n2634) );
  C8T28SOI_LR_CNXOR2X9_P16 U1850 ( .A(acc[17]), .S(n2634), .Z(n2635) );
  C8T28SOI_LR_CNNOR2X8_P16 U1851 ( .A(n3883), .B(n2635), .Z(n799) );
  C8T28SOI_LR_AND2X5_P0 U1852 ( .A(intadd_0_SUM_9_), .B(n3877), .Z(n370) );
  C8T28SOI_LR_NAND2X4_P0 U1853 ( .A(n3889), .B(n2641), .Z(n3391) );
  C8T28SOI_LR_NOR2X4_P0 U1854 ( .A(n2636), .B(n3391), .Z(n2637) );
  C8T28SOI_LR_AND2X5_P0 U1855 ( .A(exp_sf[1]), .B(n2637), .Z(n983) );
  C8T28SOI_LR_AND2X5_P0 U1856 ( .A(n2637), .B(exp_sf[0]), .Z(n982) );
  C8T28SOI_LR_CNNOR2X8_P16 U1857 ( .A(acc[17]), .B(n2638), .Z(n3750) );
  C8T28SOI_LR_CNNAND2AX9_P16 U1858 ( .A(acc[18]), .B(n3750), .Z(n2676) );
  C8T28SOI_LR_NAND2X4_P0 U1859 ( .A(n3862), .B(n2676), .Z(n2639) );
  C8T28SOI_LR_CNXOR2X9_P16 U1860 ( .A(acc[19]), .S(n2639), .Z(n2640) );
  C8T28SOI_LR_CNNOR2X8_P16 U1861 ( .A(n3883), .B(n2640), .Z(n801) );
  C8T28SOI_LR_NOR3X3_P0 U1862 ( .A(acc_o_tmp[2]), .B(acc_o_tmp[0]), .C(
        acc_o_tmp[1]), .Z(n3383) );
  C8T28SOI_LR_CNNAND2AX9_P16 U1863 ( .A(acc_o_tmp[3]), .B(n3383), .Z(n3379) );
  C8T28SOI_LR_CNNOR2X8_P16 U1864 ( .A(acc_o_tmp[4]), .B(n3379), .Z(n3376) );
  C8T28SOI_LR_CNNAND2AX9_P16 U1865 ( .A(acc_o_tmp[5]), .B(n3376), .Z(n3372) );
  C8T28SOI_LR_CNIVX4_P16 U1866 ( .A(n3391), .Z(n2643) );
  C8T28SOI_LR_NOR3X3_P0 U1867 ( .A(n2641), .B(sign_sf), .C(n3415), .Z(n3374)
         );
  C8T28SOI_LR_CBI4I6X3_P0 U1868 ( .A(acc_o_tmp[6]), .B(n3372), .C(n2643), .D(
        n3374), .Z(n2642) );
  C8T28SOI_LR_CNIVX4_P16 U1869 ( .A(sign_q), .Z(n3382) );
  C8T28SOI_LR_CNNOR2X8_P16 U1870 ( .A(n2642), .B(n3382), .Z(n1166) );
  C8T28SOI_LR_AO12X5_P0 U1871 ( .A(n2643), .B(acc_o_tmp[0]), .C(n3374), .Z(
        n1159) );
  C8T28SOI_LR_AND2X5_P0 U1872 ( .A(intadd_0_SUM_10_), .B(n3877), .Z(n371) );
  C8T28SOI_LR_NOR2X4_P0 U1873 ( .A(acc_mag[98]), .B(acc_mag[99]), .Z(n2738) );
  C8T28SOI_LR_NOR2X4_P0 U1874 ( .A(acc_mag[92]), .B(acc_mag[93]), .Z(n2733) );
  C8T28SOI_LR_NOR2X4_P0 U1875 ( .A(acc_mag[86]), .B(acc_mag[87]), .Z(n2731) );
  C8T28SOI_LR_NOR2X4_P0 U1876 ( .A(acc_mag[80]), .B(acc_mag[81]), .Z(n2743) );
  C8T28SOI_LR_NOR2X4_P0 U1877 ( .A(acc_mag[74]), .B(acc_mag[75]), .Z(n2740) );
  C8T28SOI_LR_NOR2X4_P0 U1878 ( .A(acc_mag[68]), .B(acc_mag[69]), .Z(n2729) );
  C8T28SOI_LR_NOR2X4_P0 U1879 ( .A(acc_mag[62]), .B(acc_mag[63]), .Z(n2727) );
  C8T28SOI_LR_NOR2X4_P0 U1880 ( .A(acc_mag[56]), .B(acc_mag[57]), .Z(n2725) );
  C8T28SOI_LR_NOR2X4_P0 U1881 ( .A(acc_mag[50]), .B(acc_mag[51]), .Z(n2722) );
  C8T28SOI_LR_NOR2X4_P0 U1882 ( .A(acc_mag[44]), .B(acc_mag[45]), .Z(n2719) );
  C8T28SOI_LR_NOR2X4_P0 U1883 ( .A(acc_mag[38]), .B(acc_mag[39]), .Z(n2717) );
  C8T28SOI_LR_NOR2X4_P0 U1884 ( .A(acc_mag[33]), .B(acc_mag[32]), .Z(n2711) );
  C8T28SOI_LR_NOR2X4_P0 U1885 ( .A(acc_mag[27]), .B(acc_mag[26]), .Z(n2708) );
  C8T28SOI_LR_NOR2X4_P0 U1886 ( .A(acc_mag[21]), .B(acc_mag[20]), .Z(n2716) );
  C8T28SOI_LR_NOR2X4_P0 U1887 ( .A(acc_mag[15]), .B(acc_mag[14]), .Z(n2713) );
  C8T28SOI_LR_NOR2X4_P0 U1888 ( .A(acc_mag[9]), .B(acc_mag[8]), .Z(n2706) );
  C8T28SOI_LR_CNNOR2X8_P16 U1889 ( .A(acc_mag[3]), .B(acc_mag[2]), .Z(n2745)
         );
  C8T28SOI_LR_CNIVX4_P16 U1890 ( .A(acc_mag[1]), .Z(n3042) );
  C8T28SOI_LR_CNIVX4_P16 U1891 ( .A(acc_mag[0]), .Z(n3041) );
  C8T28SOI_LR_NAND2X4_P0 U1892 ( .A(n3042), .B(n3041), .Z(n2746) );
  C8T28SOI_LR_CNIVX4_P16 U1893 ( .A(acc_mag[5]), .Z(n2748) );
  C8T28SOI_LR_CNIVX4_P16 U1894 ( .A(acc_mag[4]), .Z(n2882) );
  C8T28SOI_LR_CNNAND2X8_P16 U1895 ( .A(n2748), .B(n2882), .Z(n2644) );
  C8T28SOI_LR_NOR2X4_P0 U1896 ( .A(acc_mag[7]), .B(acc_mag[6]), .Z(n2705) );
  C8T28SOI_LR_CBI4I1X3_P0 U1897 ( .A(n2745), .B(n2746), .C(n2644), .D(n2705), 
        .Z(n2646) );
  C8T28SOI_LR_CNIVX4_P16 U1898 ( .A(acc_mag[11]), .Z(n2752) );
  C8T28SOI_LR_CNIVX4_P16 U1899 ( .A(acc_mag[10]), .Z(n3121) );
  C8T28SOI_LR_CNNAND2X8_P16 U1900 ( .A(n2752), .B(n3121), .Z(n2704) );
  C8T28SOI_LR_NOR2X4_P0 U1901 ( .A(acc_mag[13]), .B(acc_mag[12]), .Z(n2645) );
  C8T28SOI_LR_CBI4I1X3_P0 U1902 ( .A(n2706), .B(n2646), .C(n2704), .D(n2645), 
        .Z(n2648) );
  C8T28SOI_LR_NOR2X4_P0 U1903 ( .A(acc_mag[17]), .B(acc_mag[16]), .Z(n2714) );
  C8T28SOI_LR_CNIVX4_P16 U1904 ( .A(n2714), .Z(n2647) );
  C8T28SOI_LR_NOR2X4_P0 U1905 ( .A(acc_mag[19]), .B(acc_mag[18]), .Z(n2715) );
  C8T28SOI_LR_CBI4I1X3_P0 U1906 ( .A(n2713), .B(n2648), .C(n2647), .D(n2715), 
        .Z(n2650) );
  C8T28SOI_LR_CNIVX4_P16 U1907 ( .A(acc_mag[23]), .Z(n2759) );
  C8T28SOI_LR_CNIVX4_P16 U1908 ( .A(acc_mag[22]), .Z(n3107) );
  C8T28SOI_LR_CNNAND2X8_P16 U1909 ( .A(n2759), .B(n3107), .Z(n2707) );
  C8T28SOI_LR_NOR2X4_P0 U1910 ( .A(acc_mag[25]), .B(acc_mag[24]), .Z(n2649) );
  C8T28SOI_LR_CBI4I1X3_P0 U1911 ( .A(n2716), .B(n2650), .C(n2707), .D(n2649), 
        .Z(n2652) );
  C8T28SOI_LR_NOR2X4_P0 U1912 ( .A(acc_mag[29]), .B(acc_mag[28]), .Z(n2709) );
  C8T28SOI_LR_CNIVX4_P16 U1913 ( .A(n2709), .Z(n2651) );
  C8T28SOI_LR_NOR2X4_P0 U1914 ( .A(acc_mag[31]), .B(acc_mag[30]), .Z(n2710) );
  C8T28SOI_LR_CBI4I1X3_P0 U1915 ( .A(n2708), .B(n2652), .C(n2651), .D(n2710), 
        .Z(n2654) );
  C8T28SOI_LR_CNIVX4_P16 U1916 ( .A(acc_mag[35]), .Z(n2767) );
  C8T28SOI_LR_CNIVX4_P16 U1917 ( .A(acc_mag[34]), .Z(n3148) );
  C8T28SOI_LR_CNNAND2X8_P16 U1918 ( .A(n2767), .B(n3148), .Z(n2712) );
  C8T28SOI_LR_NOR2X4_P0 U1919 ( .A(acc_mag[37]), .B(acc_mag[36]), .Z(n2653) );
  C8T28SOI_LR_CBI4I1X3_P0 U1920 ( .A(n2711), .B(n2654), .C(n2712), .D(n2653), 
        .Z(n2656) );
  C8T28SOI_LR_NOR2X4_P0 U1921 ( .A(acc_mag[40]), .B(acc_mag[41]), .Z(n2718) );
  C8T28SOI_LR_CNIVX4_P16 U1922 ( .A(n2718), .Z(n2655) );
  C8T28SOI_LR_NOR2X4_P0 U1923 ( .A(acc_mag[42]), .B(acc_mag[43]), .Z(n2720) );
  C8T28SOI_LR_CBI4I1X3_P0 U1924 ( .A(n2717), .B(n2656), .C(n2655), .D(n2720), 
        .Z(n2658) );
  C8T28SOI_LR_CNIVX4_P16 U1925 ( .A(acc_mag[46]), .Z(n3137) );
  C8T28SOI_LR_CNIVX4_P16 U1926 ( .A(acc_mag[47]), .Z(n2774) );
  C8T28SOI_LR_CNNAND2X8_P16 U1927 ( .A(n3137), .B(n2774), .Z(n2721) );
  C8T28SOI_LR_NOR2X4_P0 U1928 ( .A(acc_mag[48]), .B(acc_mag[49]), .Z(n2657) );
  C8T28SOI_LR_CBI4I1X3_P0 U1929 ( .A(n2719), .B(n2658), .C(n2721), .D(n2657), 
        .Z(n2660) );
  C8T28SOI_LR_NOR2X4_P0 U1930 ( .A(acc_mag[52]), .B(acc_mag[53]), .Z(n2723) );
  C8T28SOI_LR_CNIVX4_P16 U1931 ( .A(n2723), .Z(n2659) );
  C8T28SOI_LR_NOR2X4_P0 U1932 ( .A(acc_mag[54]), .B(acc_mag[55]), .Z(n2724) );
  C8T28SOI_LR_CBI4I1X3_P0 U1933 ( .A(n2722), .B(n2660), .C(n2659), .D(n2724), 
        .Z(n2662) );
  C8T28SOI_LR_OR2X5_P0 U1934 ( .A(acc_mag[58]), .B(acc_mag[59]), .Z(n2726) );
  C8T28SOI_LR_NOR2X4_P0 U1935 ( .A(acc_mag[60]), .B(acc_mag[61]), .Z(n2661) );
  C8T28SOI_LR_CBI4I1X3_P0 U1936 ( .A(n2725), .B(n2662), .C(n2726), .D(n2661), 
        .Z(n2664) );
  C8T28SOI_LR_NOR2X4_P0 U1937 ( .A(acc_mag[64]), .B(acc_mag[65]), .Z(n2728) );
  C8T28SOI_LR_CNIVX4_P16 U1938 ( .A(n2728), .Z(n2663) );
  C8T28SOI_LR_NOR2X4_P0 U1939 ( .A(acc_mag[66]), .B(acc_mag[67]), .Z(n2730) );
  C8T28SOI_LR_CBI4I1X3_P0 U1940 ( .A(n2727), .B(n2664), .C(n2663), .D(n2730), 
        .Z(n2666) );
  C8T28SOI_LR_OR2X5_P0 U1941 ( .A(acc_mag[70]), .B(acc_mag[71]), .Z(n2739) );
  C8T28SOI_LR_NOR2X4_P0 U1942 ( .A(acc_mag[72]), .B(acc_mag[73]), .Z(n2665) );
  C8T28SOI_LR_CBI4I1X3_P0 U1943 ( .A(n2729), .B(n2666), .C(n2739), .D(n2665), 
        .Z(n2668) );
  C8T28SOI_LR_NOR2X4_P0 U1944 ( .A(acc_mag[76]), .B(acc_mag[77]), .Z(n2741) );
  C8T28SOI_LR_CNIVX4_P16 U1945 ( .A(n2741), .Z(n2667) );
  C8T28SOI_LR_NOR2X4_P0 U1946 ( .A(acc_mag[78]), .B(acc_mag[79]), .Z(n2742) );
  C8T28SOI_LR_CBI4I1X3_P0 U1947 ( .A(n2740), .B(n2668), .C(n2667), .D(n2742), 
        .Z(n2670) );
  C8T28SOI_LR_OR2X5_P0 U1948 ( .A(acc_mag[82]), .B(acc_mag[83]), .Z(n2744) );
  C8T28SOI_LR_NOR2X4_P0 U1949 ( .A(acc_mag[84]), .B(acc_mag[85]), .Z(n2669) );
  C8T28SOI_LR_CBI4I1X3_P0 U1950 ( .A(n2743), .B(n2670), .C(n2744), .D(n2669), 
        .Z(n2672) );
  C8T28SOI_LR_NOR2X4_P0 U1951 ( .A(acc_mag[88]), .B(acc_mag[89]), .Z(n2732) );
  C8T28SOI_LR_CNIVX4_P16 U1952 ( .A(n2732), .Z(n2671) );
  C8T28SOI_LR_NOR2X4_P0 U1953 ( .A(acc_mag[90]), .B(acc_mag[91]), .Z(n2734) );
  C8T28SOI_LR_CBI4I1X3_P0 U1954 ( .A(n2731), .B(n2672), .C(n2671), .D(n2734), 
        .Z(n2674) );
  C8T28SOI_LR_CNIVX4_P16 U1955 ( .A(acc_mag[95]), .Z(n3163) );
  C8T28SOI_LR_CNIVX4_P16 U1956 ( .A(acc_mag[94]), .Z(n2736) );
  C8T28SOI_LR_NAND2X4_P0 U1957 ( .A(n3163), .B(n2736), .Z(n2673) );
  C8T28SOI_LR_NOR2X4_P0 U1958 ( .A(acc_mag[97]), .B(acc_mag[96]), .Z(n2735) );
  C8T28SOI_LR_CBI4I1X3_P0 U1959 ( .A(n2733), .B(n2674), .C(n2673), .D(n2735), 
        .Z(n2675) );
  C8T28SOI_LR_AOI211X2_P0 U1960 ( .A(n2738), .B(n2675), .C(acc_mag[101]), .D(
        acc_mag[100]), .Z(n3419) );
  C8T28SOI_LR_NOR2X4_P0 U1962 ( .A(n3417), .B(n3415), .Z(n916) );
  C8T28SOI_LR_AND2X5_P0 U1963 ( .A(intadd_0_SUM_11_), .B(n3877), .Z(n372) );
  C8T28SOI_LR_CNNOR2X8_P16 U1964 ( .A(acc[19]), .B(n2676), .Z(n3747) );
  C8T28SOI_LR_CNNAND2AX9_P16 U1965 ( .A(acc[20]), .B(n3747), .Z(n2679) );
  C8T28SOI_LR_NAND2X4_P0 U1966 ( .A(n3862), .B(n2679), .Z(n2677) );
  C8T28SOI_LR_CNXOR2X9_P16 U1967 ( .A(acc[21]), .S(n2677), .Z(n2678) );
  C8T28SOI_LR_NOR2X4_P0 U1968 ( .A(n3883), .B(n2678), .Z(n803) );
  C8T28SOI_LR_AND2X5_P0 U1970 ( .A(intadd_0_SUM_12_), .B(n3877), .Z(n373) );
  C8T28SOI_LR_CNNOR2X8_P16 U1971 ( .A(acc[21]), .B(n2679), .Z(n3744) );
  C8T28SOI_LR_CNNAND2AX9_P16 U1972 ( .A(acc[22]), .B(n3744), .Z(n2682) );
  C8T28SOI_LR_NAND2X4_P0 U1973 ( .A(n3862), .B(n2682), .Z(n2680) );
  C8T28SOI_LR_CNXOR2X9_P16 U1974 ( .A(acc[23]), .S(n2680), .Z(n2681) );
  C8T28SOI_LR_NOR2X4_P0 U1975 ( .A(n3883), .B(n2681), .Z(n805) );
  C8T28SOI_LR_AND2X5_P0 U1976 ( .A(intadd_0_SUM_13_), .B(n3877), .Z(n374) );
  C8T28SOI_LR_CNNOR2X8_P16 U1978 ( .A(acc[23]), .B(n2682), .Z(n3741) );
  C8T28SOI_LR_CNNAND2AX9_P16 U1979 ( .A(acc[24]), .B(n3741), .Z(n2685) );
  C8T28SOI_LR_CNNAND2X8_P16 U1980 ( .A(n3862), .B(n2685), .Z(n2683) );
  C8T28SOI_LR_CNXOR2X9_P16 U1981 ( .A(acc[25]), .S(n2683), .Z(n2684) );
  C8T28SOI_LR_NOR2X4_P0 U1982 ( .A(n3883), .B(n2684), .Z(n807) );
  C8T28SOI_LR_AND2X5_P0 U1983 ( .A(intadd_0_SUM_14_), .B(n3877), .Z(n375) );
  C8T28SOI_LR_CNNOR2X8_P16 U1984 ( .A(acc[25]), .B(n2685), .Z(n3738) );
  C8T28SOI_LR_CNNAND2AX9_P16 U1985 ( .A(acc[26]), .B(n3738), .Z(n2688) );
  C8T28SOI_LR_NAND2X4_P0 U1986 ( .A(n3862), .B(n2688), .Z(n2686) );
  C8T28SOI_LR_CNXOR2X9_P16 U1987 ( .A(acc[27]), .S(n2686), .Z(n2687) );
  C8T28SOI_LR_NOR2X4_P0 U1988 ( .A(n3883), .B(n2687), .Z(n809) );
  C8T28SOI_LR_AND2X5_P0 U1989 ( .A(intadd_0_SUM_15_), .B(n3877), .Z(n376) );
  C8T28SOI_LR_CNNOR2X8_P16 U1990 ( .A(acc[27]), .B(n2688), .Z(n3735) );
  C8T28SOI_LR_CNNAND2AX9_P16 U1991 ( .A(acc[28]), .B(n3735), .Z(n2691) );
  C8T28SOI_LR_NAND2X4_P0 U1992 ( .A(n3862), .B(n2691), .Z(n2689) );
  C8T28SOI_LR_CNXOR2X9_P16 U1993 ( .A(acc[29]), .S(n2689), .Z(n2690) );
  C8T28SOI_LR_NOR2X4_P0 U1994 ( .A(n3883), .B(n2690), .Z(n811) );
  C8T28SOI_LR_AND2X5_P0 U1995 ( .A(intadd_0_SUM_16_), .B(n3877), .Z(n377) );
  C8T28SOI_LR_AND2X5_P0 U1996 ( .A(intadd_0_SUM_17_), .B(n3877), .Z(n378) );
  C8T28SOI_LR_CNNOR2X8_P16 U1997 ( .A(acc[29]), .B(n2691), .Z(n3732) );
  C8T28SOI_LR_CNNAND2AX9_P16 U1998 ( .A(acc[30]), .B(n3732), .Z(n2694) );
  C8T28SOI_LR_NAND2X4_P0 U1999 ( .A(n3862), .B(n2694), .Z(n2692) );
  C8T28SOI_LR_CNXOR2X9_P16 U2000 ( .A(acc[31]), .S(n2692), .Z(n2693) );
  C8T28SOI_LR_NOR2X4_P0 U2001 ( .A(n3883), .B(n2693), .Z(n813) );
  C8T28SOI_LR_AND2X5_P0 U2002 ( .A(intadd_0_SUM_18_), .B(n3877), .Z(n379) );
  C8T28SOI_LR_CNNOR2X8_P16 U2003 ( .A(acc[31]), .B(n2694), .Z(n3729) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2004 ( .A(acc[32]), .B(n3729), .Z(n2697) );
  C8T28SOI_LR_CNNAND2X8_P16 U2005 ( .A(n3864), .B(n2697), .Z(n2695) );
  C8T28SOI_LR_CNXOR2X9_P16 U2006 ( .A(acc[33]), .S(n2695), .Z(n2696) );
  C8T28SOI_LR_NOR2X4_P0 U2007 ( .A(n3883), .B(n2696), .Z(n815) );
  C8T28SOI_LR_AND2X5_P0 U2008 ( .A(intadd_0_SUM_19_), .B(n3877), .Z(n380) );
  C8T28SOI_LR_CNNOR2X8_P16 U2009 ( .A(acc[33]), .B(n2697), .Z(n3726) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2010 ( .A(acc[34]), .B(n3726), .Z(n2700) );
  C8T28SOI_LR_CNNAND2X8_P16 U2011 ( .A(n3864), .B(n2700), .Z(n2698) );
  C8T28SOI_LR_CNXOR2X9_P16 U2012 ( .A(acc[35]), .S(n2698), .Z(n2699) );
  C8T28SOI_LR_NOR2X4_P0 U2013 ( .A(n3883), .B(n2699), .Z(n817) );
  C8T28SOI_LR_AND2X5_P0 U2014 ( .A(intadd_0_SUM_20_), .B(n3877), .Z(n381) );
  C8T28SOI_LR_CNNOR2X8_P16 U2015 ( .A(acc[35]), .B(n2700), .Z(n3723) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2016 ( .A(acc[36]), .B(n3723), .Z(n2803) );
  C8T28SOI_LR_CNNAND2X8_P16 U2017 ( .A(n3864), .B(n2803), .Z(n2702) );
  C8T28SOI_LR_CNXOR2X9_P16 U2018 ( .A(acc[37]), .S(n2702), .Z(n2703) );
  C8T28SOI_LR_NOR2X4_P0 U2019 ( .A(n3883), .B(n2703), .Z(n819) );
  C8T28SOI_LR_AND2X5_P0 U2020 ( .A(intadd_0_SUM_21_), .B(n3877), .Z(n382) );
  C8T28SOI_LR_NOR3X3_P0 U2021 ( .A(acc_mag[13]), .B(acc_mag[12]), .C(n2704), 
        .Z(n2824) );
  C8T28SOI_LR_NAND2X4_P0 U2022 ( .A(n2706), .B(n2705), .Z(n2825) );
  C8T28SOI_LR_CNNOR2AX9_P16 U2023 ( .A(n2824), .B(n2825), .Z(n2856) );
  C8T28SOI_LR_NOR3X3_P0 U2024 ( .A(acc_mag[25]), .B(acc_mag[24]), .C(n2707), 
        .Z(n2828) );
  C8T28SOI_LR_NAND2X4_P0 U2025 ( .A(n2709), .B(n2708), .Z(n2827) );
  C8T28SOI_LR_CNNOR2AX9_P16 U2026 ( .A(n2828), .B(n2827), .Z(n2858) );
  C8T28SOI_LR_NAND2X4_P0 U2027 ( .A(n2711), .B(n2710), .Z(n2833) );
  C8T28SOI_LR_NOR3X3_P0 U2028 ( .A(acc_mag[37]), .B(acc_mag[36]), .C(n2712), 
        .Z(n2832) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2029 ( .A(n2833), .B(n2832), .Z(n2857) );
  C8T28SOI_LR_NOR2AX4_P0 U2030 ( .A(n2858), .B(n2857), .Z(n2873) );
  C8T28SOI_LR_NAND2X4_P0 U2031 ( .A(n2714), .B(n2713), .Z(n2823) );
  C8T28SOI_LR_NAND2X4_P0 U2032 ( .A(n2716), .B(n2715), .Z(n2829) );
  C8T28SOI_LR_CNOR2X19_P16 U2033 ( .A(n2823), .B(n2829), .Z(n2874) );
  C8T28SOI_LR_NOR3BCX4_P0 U2034 ( .B(n2856), .C(n2873), .A(n2874), .Z(n2880)
         );
  C8T28SOI_LR_NAND2X4_P0 U2035 ( .A(n2718), .B(n2717), .Z(n2831) );
  C8T28SOI_LR_NAND2X4_P0 U2036 ( .A(n2720), .B(n2719), .Z(n2837) );
  C8T28SOI_LR_CNNOR2X8_P16 U2037 ( .A(n2831), .B(n2837), .Z(n2860) );
  C8T28SOI_LR_NOR3X3_P0 U2038 ( .A(acc_mag[48]), .B(acc_mag[49]), .C(n2721), 
        .Z(n2836) );
  C8T28SOI_LR_NAND2X4_P0 U2039 ( .A(n2723), .B(n2722), .Z(n2835) );
  C8T28SOI_LR_CNNOR2AX9_P16 U2040 ( .A(n2836), .B(n2835), .Z(n2862) );
  C8T28SOI_LR_NAND2X4_P0 U2041 ( .A(n2860), .B(n2862), .Z(n2872) );
  C8T28SOI_LR_NAND2X4_P0 U2042 ( .A(n2725), .B(n2724), .Z(n2841) );
  C8T28SOI_LR_NOR3X3_P0 U2043 ( .A(acc_mag[60]), .B(acc_mag[61]), .C(n2726), 
        .Z(n2840) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2044 ( .A(n2841), .B(n2840), .Z(n2861) );
  C8T28SOI_LR_NAND2X4_P0 U2045 ( .A(n2728), .B(n2727), .Z(n2839) );
  C8T28SOI_LR_NAND2X4_P0 U2046 ( .A(n2730), .B(n2729), .Z(n2845) );
  C8T28SOI_LR_CNOR2X19_P16 U2047 ( .A(n2839), .B(n2845), .Z(n2867) );
  C8T28SOI_LR_OR2X5_P0 U2048 ( .A(n2861), .B(n2867), .Z(n2878) );
  C8T28SOI_LR_CNNOR2X8_P16 U2049 ( .A(n2872), .B(n2878), .Z(n2953) );
  C8T28SOI_LR_NAND2X4_P0 U2050 ( .A(n2732), .B(n2731), .Z(n2847) );
  C8T28SOI_LR_NAND2X4_P0 U2051 ( .A(n2734), .B(n2733), .Z(n2854) );
  C8T28SOI_LR_CNNOR2X8_P16 U2052 ( .A(n2847), .B(n2854), .Z(n2871) );
  C8T28SOI_LR_NAND3X3_P0 U2053 ( .A(n3163), .B(n2736), .C(n2735), .Z(n2851) );
  C8T28SOI_LR_CNNOR2X8_P16 U2054 ( .A(acc_mag[100]), .B(acc_mag[101]), .Z(
        n2737) );
  C8T28SOI_LR_CNNAND2X8_P16 U2055 ( .A(n2738), .B(n2737), .Z(n2852) );
  C8T28SOI_LR_CNNOR2X8_P16 U2056 ( .A(n2851), .B(n2852), .Z(n2869) );
  C8T28SOI_LR_NAND2X4_P0 U2057 ( .A(n2871), .B(n2869), .Z(n2876) );
  C8T28SOI_LR_NOR3X3_P0 U2058 ( .A(acc_mag[72]), .B(acc_mag[73]), .C(n2739), 
        .Z(n2844) );
  C8T28SOI_LR_NAND2X4_P0 U2059 ( .A(n2741), .B(n2740), .Z(n2843) );
  C8T28SOI_LR_CNNOR2AX9_P16 U2060 ( .A(n2844), .B(n2843), .Z(n2866) );
  C8T28SOI_LR_NAND2X4_P0 U2061 ( .A(n2743), .B(n2742), .Z(n2849) );
  C8T28SOI_LR_NOR3X3_P0 U2062 ( .A(acc_mag[84]), .B(acc_mag[85]), .C(n2744), 
        .Z(n2848) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2063 ( .A(n2849), .B(n2848), .Z(n2865) );
  C8T28SOI_LR_CNNOR2AX9_P16 U2064 ( .A(n2866), .B(n2865), .Z(n2877) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2065 ( .A(n2876), .B(n2877), .Z(n2927) );
  C8T28SOI_LR_CNIVX4_P16 U2066 ( .A(n2927), .Z(n2952) );
  C8T28SOI_LR_NAND2X4_P0 U2067 ( .A(n2953), .B(n2952), .Z(n3620) );
  C8T28SOI_LR_NOR3BCX4_P0 U2068 ( .B(n2748), .C(n2745), .A(acc_mag[4]), .Z(
        n2826) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2069 ( .A(n2746), .B(n2826), .Z(n2747) );
  C8T28SOI_LRA_NOR3AX3_P0 U2070 ( .A(n2880), .B(n3620), .C(n2747), .Z(n2922)
         );
  C8T28SOI_LR_CNIVX4_P16 U2071 ( .A(acc_mag[2]), .Z(n3114) );
  C8T28SOI_LR_AOI12X3_P0 U2072 ( .A(acc_mag[1]), .B(n3114), .C(acc_mag[3]), 
        .Z(n2749) );
  C8T28SOI_LR_CBI4I6X3_P0 U2073 ( .A(acc_mag[4]), .B(n2749), .C(n2748), .D(
        acc_mag[6]), .Z(n2751) );
  C8T28SOI_LR_CNIVX4_P16 U2074 ( .A(acc_mag[8]), .Z(n2750) );
  C8T28SOI_LR_CBI4I6X3_P0 U2075 ( .A(acc_mag[7]), .B(n2751), .C(n2750), .D(
        acc_mag[9]), .Z(n2753) );
  C8T28SOI_LR_CBI4I6X3_P0 U2076 ( .A(acc_mag[10]), .B(n2753), .C(n2752), .D(
        acc_mag[12]), .Z(n2755) );
  C8T28SOI_LR_CNIVX4_P16 U2077 ( .A(acc_mag[14]), .Z(n2754) );
  C8T28SOI_LR_CBI4I6X3_P0 U2078 ( .A(acc_mag[13]), .B(n2755), .C(n2754), .D(
        acc_mag[15]), .Z(n2756) );
  C8T28SOI_LR_CNIVX4_P16 U2079 ( .A(acc_mag[17]), .Z(n3117) );
  C8T28SOI_LR_CBI4I6X3_P0 U2080 ( .A(n2756), .B(acc_mag[16]), .C(n3117), .D(
        acc_mag[18]), .Z(n2758) );
  C8T28SOI_LR_CNIVX4_P16 U2081 ( .A(acc_mag[20]), .Z(n2757) );
  C8T28SOI_LR_CBI4I6X3_P0 U2082 ( .A(acc_mag[19]), .B(n2758), .C(n2757), .D(
        acc_mag[21]), .Z(n2760) );
  C8T28SOI_LR_CBI4I6X3_P0 U2083 ( .A(acc_mag[22]), .B(n2760), .C(n2759), .D(
        acc_mag[24]), .Z(n2762) );
  C8T28SOI_LR_CNIVX4_P16 U2084 ( .A(acc_mag[26]), .Z(n2761) );
  C8T28SOI_LR_CBI4I6X3_P0 U2085 ( .A(acc_mag[25]), .B(n2762), .C(n2761), .D(
        acc_mag[27]), .Z(n2764) );
  C8T28SOI_LR_CNIVX4_P16 U2086 ( .A(acc_mag[29]), .Z(n2763) );
  C8T28SOI_LR_CBI4I6X3_P0 U2087 ( .A(acc_mag[28]), .B(n2764), .C(n2763), .D(
        acc_mag[30]), .Z(n2766) );
  C8T28SOI_LR_CNIVX4_P16 U2088 ( .A(acc_mag[32]), .Z(n2765) );
  C8T28SOI_LR_CBI4I6X3_P0 U2089 ( .A(acc_mag[31]), .B(n2766), .C(n2765), .D(
        acc_mag[33]), .Z(n2768) );
  C8T28SOI_LR_CBI4I6X3_P0 U2090 ( .A(acc_mag[34]), .B(n2768), .C(n2767), .D(
        acc_mag[36]), .Z(n2770) );
  C8T28SOI_LR_CNIVX4_P16 U2091 ( .A(acc_mag[38]), .Z(n2769) );
  C8T28SOI_LR_CBI4I6X3_P0 U2092 ( .A(acc_mag[37]), .B(n2770), .C(n2769), .D(
        acc_mag[39]), .Z(n2771) );
  C8T28SOI_LR_CNIVX4_P16 U2093 ( .A(acc_mag[41]), .Z(n3536) );
  C8T28SOI_LR_CBI4I6X3_P0 U2094 ( .A(acc_mag[40]), .B(n2771), .C(n3536), .D(
        acc_mag[42]), .Z(n2773) );
  C8T28SOI_LR_CNIVX4_P16 U2095 ( .A(acc_mag[44]), .Z(n2772) );
  C8T28SOI_LR_CBI4I6X3_P0 U2096 ( .A(acc_mag[43]), .B(n2773), .C(n2772), .D(
        acc_mag[45]), .Z(n2775) );
  C8T28SOI_LR_CBI4I6X3_P0 U2097 ( .A(acc_mag[46]), .B(n2775), .C(n2774), .D(
        acc_mag[48]), .Z(n2777) );
  C8T28SOI_LR_CNIVX4_P16 U2098 ( .A(acc_mag[50]), .Z(n2776) );
  C8T28SOI_LR_CBI4I6X3_P0 U2099 ( .A(acc_mag[49]), .B(n2777), .C(n2776), .D(
        acc_mag[51]), .Z(n2778) );
  C8T28SOI_LR_CNIVX4_P16 U2100 ( .A(acc_mag[53]), .Z(n3522) );
  C8T28SOI_LR_CBI4I6X3_P0 U2101 ( .A(acc_mag[52]), .B(n2778), .C(n3522), .D(
        acc_mag[54]), .Z(n2780) );
  C8T28SOI_LR_CNIVX4_P16 U2102 ( .A(acc_mag[56]), .Z(n2779) );
  C8T28SOI_LR_CBI4I6X3_P0 U2103 ( .A(acc_mag[55]), .B(n2780), .C(n2779), .D(
        acc_mag[57]), .Z(n2781) );
  C8T28SOI_LR_CNIVX4_P16 U2104 ( .A(acc_mag[59]), .Z(n3151) );
  C8T28SOI_LR_CBI4I6X3_P0 U2105 ( .A(acc_mag[58]), .B(n2781), .C(n3151), .D(
        acc_mag[60]), .Z(n2782) );
  C8T28SOI_LR_CNIVX4_P16 U2106 ( .A(acc_mag[62]), .Z(n3134) );
  C8T28SOI_LR_CBI4I6X3_P0 U2107 ( .A(acc_mag[61]), .B(n2782), .C(n3134), .D(
        acc_mag[63]), .Z(n2784) );
  C8T28SOI_LR_CNIVX4_P16 U2108 ( .A(acc_mag[65]), .Z(n2783) );
  C8T28SOI_LR_CBI4I6X3_P0 U2109 ( .A(acc_mag[64]), .B(n2784), .C(n2783), .D(
        acc_mag[66]), .Z(n2786) );
  C8T28SOI_LR_CNIVX4_P16 U2110 ( .A(acc_mag[68]), .Z(n2785) );
  C8T28SOI_LR_CBI4I6X3_P0 U2111 ( .A(acc_mag[67]), .B(n2786), .C(n2785), .D(
        acc_mag[69]), .Z(n2787) );
  C8T28SOI_LR_CNIVX4_P16 U2112 ( .A(acc_mag[71]), .Z(n3177) );
  C8T28SOI_LR_CBI4I6X3_P0 U2113 ( .A(acc_mag[70]), .B(n2787), .C(n3177), .D(
        acc_mag[72]), .Z(n2788) );
  C8T28SOI_LR_CNIVX4_P16 U2114 ( .A(acc_mag[74]), .Z(n3181) );
  C8T28SOI_LR_CBI4I6X3_P0 U2115 ( .A(acc_mag[73]), .B(n2788), .C(n3181), .D(
        acc_mag[75]), .Z(n2790) );
  C8T28SOI_LR_CNIVX4_P16 U2116 ( .A(acc_mag[77]), .Z(n2789) );
  C8T28SOI_LR_CBI4I6X3_P0 U2117 ( .A(acc_mag[76]), .B(n2790), .C(n2789), .D(
        acc_mag[78]), .Z(n2792) );
  C8T28SOI_LR_CNIVX4_P16 U2118 ( .A(acc_mag[80]), .Z(n2791) );
  C8T28SOI_LR_CBI4I6X3_P0 U2119 ( .A(acc_mag[79]), .B(n2792), .C(n2791), .D(
        acc_mag[81]), .Z(n2793) );
  C8T28SOI_LR_CNIVX4_P16 U2120 ( .A(acc_mag[83]), .Z(n3170) );
  C8T28SOI_LR_CBI4I6X3_P0 U2121 ( .A(acc_mag[82]), .B(n2793), .C(n3170), .D(
        acc_mag[84]), .Z(n2794) );
  C8T28SOI_LR_CNIVX4_P16 U2122 ( .A(acc_mag[86]), .Z(n3174) );
  C8T28SOI_LR_CBI4I6X3_P0 U2123 ( .A(acc_mag[85]), .B(n2794), .C(n3174), .D(
        acc_mag[87]), .Z(n2796) );
  C8T28SOI_LR_CNIVX4_P16 U2124 ( .A(acc_mag[89]), .Z(n2795) );
  C8T28SOI_LR_CBI4I6X3_P0 U2125 ( .A(acc_mag[88]), .B(n2796), .C(n2795), .D(
        acc_mag[90]), .Z(n2798) );
  C8T28SOI_LR_CNIVX4_P16 U2126 ( .A(acc_mag[92]), .Z(n2797) );
  C8T28SOI_LR_CBI4I6X3_P0 U2127 ( .A(acc_mag[91]), .B(n2798), .C(n2797), .D(
        acc_mag[93]), .Z(n2799) );
  C8T28SOI_LR_CBI4I6X3_P0 U2128 ( .A(acc_mag[94]), .B(n2799), .C(n3163), .D(
        acc_mag[96]), .Z(n2801) );
  C8T28SOI_LR_CNIVX4_P16 U2129 ( .A(acc_mag[98]), .Z(n2800) );
  C8T28SOI_LR_CBI4I6X3_P0 U2130 ( .A(acc_mag[97]), .B(n2801), .C(n2800), .D(
        acc_mag[99]), .Z(n2802) );
  C8T28SOI_LR_OA21CX4_P0 U2131 ( .A(acc_mag[100]), .B(n2802), .C(acc_mag[101]), 
        .Z(n2883) );
  C8T28SOI_LR_CNIVX4_P16 U2132 ( .A(n2883), .Z(n2881) );
  C8T28SOI_LR_OA12X3_P0 U2133 ( .A(n2922), .B(n2881), .C(n3889), .Z(n915) );
  C8T28SOI_LR_AND2X5_P0 U2134 ( .A(intadd_0_SUM_22_), .B(n3877), .Z(n383) );
  C8T28SOI_LR_CNNOR2X8_P16 U2135 ( .A(acc[37]), .B(n2803), .Z(n3720) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2136 ( .A(acc[38]), .B(n3720), .Z(n2806) );
  C8T28SOI_LR_CNNAND2X8_P16 U2137 ( .A(n3864), .B(n2806), .Z(n2804) );
  C8T28SOI_LR_CNXOR2X9_P16 U2138 ( .A(acc[39]), .S(n2804), .Z(n2805) );
  C8T28SOI_LR_NOR2X4_P0 U2139 ( .A(n3883), .B(n2805), .Z(n821) );
  C8T28SOI_LR_AND2X5_P0 U2140 ( .A(intadd_0_SUM_23_), .B(n3877), .Z(n384) );
  C8T28SOI_LR_CNNOR2X8_P16 U2141 ( .A(acc[39]), .B(n2806), .Z(n3717) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2142 ( .A(acc[40]), .B(n3717), .Z(n2810) );
  C8T28SOI_LR_CNNAND2X8_P16 U2143 ( .A(n3864), .B(n2810), .Z(n2807) );
  C8T28SOI_LR_CNXOR2X9_P16 U2144 ( .A(acc[41]), .S(n2807), .Z(n2808) );
  C8T28SOI_LR_NOR2X4_P0 U2145 ( .A(n3883), .B(n2808), .Z(n823) );
  C8T28SOI_LR_AND2X5_P0 U2147 ( .A(intadd_0_SUM_24_), .B(n3877), .Z(n385) );
  C8T28SOI_LR_CNNOR2X8_P16 U2148 ( .A(acc[41]), .B(n2810), .Z(n3714) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2149 ( .A(acc[42]), .B(n3714), .Z(n2813) );
  C8T28SOI_LR_CNNAND2X8_P16 U2150 ( .A(n3864), .B(n2813), .Z(n2811) );
  C8T28SOI_LR_CNXOR2X9_P16 U2151 ( .A(acc[43]), .S(n2811), .Z(n2812) );
  C8T28SOI_LR_NOR2X4_P0 U2152 ( .A(n2497), .B(n2812), .Z(n825) );
  C8T28SOI_LR_AND2X5_P0 U2153 ( .A(intadd_0_SUM_25_), .B(n3877), .Z(n386) );
  C8T28SOI_LR_CNNOR2X8_P16 U2154 ( .A(acc[43]), .B(n2813), .Z(n3710) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2155 ( .A(acc[44]), .B(n3710), .Z(n2817) );
  C8T28SOI_LR_CNNAND2X8_P16 U2156 ( .A(n3864), .B(n2817), .Z(n2814) );
  C8T28SOI_LR_CNXOR2X9_P16 U2157 ( .A(acc[45]), .S(n2814), .Z(n2815) );
  C8T28SOI_LR_NOR2X4_P0 U2158 ( .A(n2497), .B(n2815), .Z(n827) );
  C8T28SOI_LR_AND2X5_P0 U2159 ( .A(intadd_0_SUM_26_), .B(n3877), .Z(n387) );
  C8T28SOI_LR_AND2X5_P0 U2161 ( .A(intadd_0_SUM_27_), .B(n3877), .Z(n388) );
  C8T28SOI_LR_CNNOR2X8_P16 U2162 ( .A(acc[45]), .B(n2817), .Z(n3707) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2163 ( .A(acc[46]), .B(n3707), .Z(n2820) );
  C8T28SOI_LR_NAND2X4_P0 U2164 ( .A(acc[101]), .B(n2820), .Z(n2818) );
  C8T28SOI_LR_CNXOR2X9_P16 U2165 ( .A(acc[47]), .S(n2818), .Z(n2819) );
  C8T28SOI_LR_NOR2X4_P0 U2166 ( .A(n2497), .B(n2819), .Z(n829) );
  C8T28SOI_LR_AND2X5_P0 U2167 ( .A(intadd_0_SUM_28_), .B(n3879), .Z(n389) );
  C8T28SOI_LR_CNNOR2X8_P16 U2168 ( .A(acc[47]), .B(n2820), .Z(n3704) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2169 ( .A(acc[48]), .B(n3704), .Z(n2974) );
  C8T28SOI_LR_NAND2X4_P0 U2170 ( .A(acc[101]), .B(n2974), .Z(n2821) );
  C8T28SOI_LR_CNXOR2X9_P16 U2171 ( .A(acc[49]), .S(n2821), .Z(n2822) );
  C8T28SOI_LR_NOR2X4_P0 U2172 ( .A(n2497), .B(n2822), .Z(n831) );
  C8T28SOI_LR_AND2X5_P0 U2173 ( .A(intadd_0_SUM_29_), .B(n3879), .Z(n390) );
  C8T28SOI_LR_CBI4I6X3_P0 U2174 ( .A(n2826), .B(n2825), .C(n2824), .D(n2823), 
        .Z(n2830) );
  C8T28SOI_LR_CBI4I6X3_P0 U2175 ( .A(n2830), .B(n2829), .C(n2828), .D(n2827), 
        .Z(n2834) );
  C8T28SOI_LR_CBI4I6X3_P0 U2176 ( .A(n2834), .B(n2833), .C(n2832), .D(n2831), 
        .Z(n2838) );
  C8T28SOI_LR_CBI4I6X3_P0 U2177 ( .A(n2838), .B(n2837), .C(n2836), .D(n2835), 
        .Z(n2842) );
  C8T28SOI_LR_CBI4I6X3_P0 U2178 ( .A(n2842), .B(n2841), .C(n2840), .D(n2839), 
        .Z(n2846) );
  C8T28SOI_LR_CBI4I6X3_P0 U2179 ( .A(n2846), .B(n2845), .C(n2844), .D(n2843), 
        .Z(n2850) );
  C8T28SOI_LR_CBI4I6X3_P0 U2180 ( .A(n2850), .B(n2849), .C(n2848), .D(n2847), 
        .Z(n2855) );
  C8T28SOI_LR_CNIVX4_P16 U2181 ( .A(n2851), .Z(n2853) );
  C8T28SOI_LR_CBI4I6X3_P0 U2182 ( .A(n2855), .B(n2854), .C(n2853), .D(n2852), 
        .Z(n3416) );
  C8T28SOI_LR_CNIVX4_P16 U2183 ( .A(n2856), .Z(n2875) );
  C8T28SOI_LR_CNIVX4_P16 U2184 ( .A(n2875), .Z(n2859) );
  C8T28SOI_LR_CBI4I6X3_P0 U2185 ( .A(n2859), .B(n2874), .C(n2858), .D(n2857), 
        .Z(n2864) );
  C8T28SOI_LR_CNIVX4_P16 U2186 ( .A(n2860), .Z(n2863) );
  C8T28SOI_LR_CBI4I6X3_P0 U2187 ( .A(n2864), .B(n2863), .C(n2862), .D(n2861), 
        .Z(n2868) );
  C8T28SOI_LR_CBI4I6X3_P0 U2188 ( .A(n2868), .B(n2867), .C(n2866), .D(n2865), 
        .Z(n2870) );
  C8T28SOI_LR_OAI12AX3_P0 U2189 ( .A(n2871), .B(n2870), .C(n2869), .Z(n3404)
         );
  C8T28SOI_LR_CBI4I6X3_P0 U2190 ( .A(n2875), .B(n2874), .C(n2873), .D(n2872), 
        .Z(n2879) );
  C8T28SOI_LR_CBI4I6X3_P0 U2191 ( .A(n2879), .B(n2878), .C(n2877), .D(n2876), 
        .Z(n3411) );
  C8T28SOI_LR_CNIVX4_P16 U2192 ( .A(n3411), .Z(n2896) );
  C8T28SOI_LR_CNIVX4_P16 U2195 ( .A(n2953), .Z(n3406) );
  C8T28SOI_LR_OAI12X3_P0 U2196 ( .A(n2880), .B(n3406), .C(n2952), .Z(n3409) );
  C8T28SOI_LR_CNIVX4_P16 U2197 ( .A(n3409), .Z(n3616) );
  C8T28SOI_LR_NOR2X4_P0 U2198 ( .A(n2883), .B(n3419), .Z(n2907) );
  C8T28SOI_LR_CNNOR2X8_P16 U2201 ( .A(n3041), .B(n3911), .Z(n2990) );
  C8T28SOI_LR_CNIVX4_P16 U2202 ( .A(acc_mag[3]), .Z(n3040) );
  C8T28SOI_LR_NOR2X4_P0 U2203 ( .A(n3419), .B(n2881), .Z(n2905) );
  C8T28SOI_LR_OAI22X3_P0 U2206 ( .A(n2882), .B(n3911), .C(n3040), .D(n3922), 
        .Z(n2885) );
  C8T28SOI_LR_NOR2X4_P0 U2207 ( .A(n2883), .B(n3417), .Z(n2923) );
  C8T28SOI_LR_NAND2X4_P0 U2210 ( .A(n2883), .B(n3419), .Z(n3486) );
  C8T28SOI_LR_OAI22X3_P0 U2211 ( .A(n3114), .B(n3905), .C(n3042), .D(n3486), 
        .Z(n2884) );
  C8T28SOI_LR_CNNOR2X8_P16 U2212 ( .A(n2885), .B(n2884), .Z(n2978) );
  C8T28SOI_LR_NAND2X4_P0 U2214 ( .A(n3418), .B(n2896), .Z(n2902) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2215 ( .A(n2902), .B(n3404), .Z(n3601) );
  C8T28SOI_LR_NOR2X4_P0 U2216 ( .A(n3601), .B(n3409), .Z(n3133) );
  C8T28SOI_LR_CNIVX4_P16 U2217 ( .A(n3133), .Z(n3520) );
  C8T28SOI_LR_AOI22X2_P0 U2222 ( .A(acc_mag[36]), .B(n3915), .C(acc_mag[35]), 
        .D(n3919), .Z(n2890) );
  C8T28SOI_LR_AOI22X2_P0 U2227 ( .A(acc_mag[34]), .B(n3906), .C(acc_mag[33]), 
        .D(n3901), .Z(n2889) );
  C8T28SOI_LR_NAND2X4_P0 U2228 ( .A(n2890), .B(n2889), .Z(n2995) );
  C8T28SOI_LR_NAND2X4_P0 U2229 ( .A(n3411), .B(n3404), .Z(n2912) );
  C8T28SOI_LR_AOI22X2_P0 U2234 ( .A(acc_mag[20]), .B(n3910), .C(acc_mag[19]), 
        .D(n2905), .Z(n2892) );
  C8T28SOI_LR_AOI22X2_P0 U2236 ( .A(acc_mag[18]), .B(n2923), .C(acc_mag[17]), 
        .D(n3899), .Z(n2891) );
  C8T28SOI_LR_NAND2X4_P0 U2237 ( .A(n2892), .B(n2891), .Z(n2979) );
  C8T28SOI_LR_OAI22X3_P0 U2238 ( .A(n3601), .B(n2995), .C(n3892), .D(n2979), 
        .Z(n2919) );
  C8T28SOI_LR_NOR2X4_P0 U2239 ( .A(n3404), .B(n3418), .Z(n3412) );
  C8T28SOI_LR_AOI22X2_P0 U2242 ( .A(acc_mag[24]), .B(n3910), .C(acc_mag[23]), 
        .D(n2905), .Z(n2895) );
  C8T28SOI_LR_AOI22X2_P0 U2243 ( .A(acc_mag[22]), .B(n2923), .C(acc_mag[21]), 
        .D(n3899), .Z(n2894) );
  C8T28SOI_LR_NAND2X4_P0 U2244 ( .A(n2895), .B(n2894), .Z(n2981) );
  C8T28SOI_LR_NOR2X4_P0 U2245 ( .A(n3404), .B(n2896), .Z(n2899) );
  C8T28SOI_LR_NAND2X4_P0 U2246 ( .A(n3416), .B(n2899), .Z(n3610) );
  C8T28SOI_LR_AOI22X2_P0 U2247 ( .A(acc_mag[8]), .B(n3910), .C(acc_mag[7]), 
        .D(n2905), .Z(n2898) );
  C8T28SOI_LR_AOI22X2_P0 U2248 ( .A(acc_mag[6]), .B(n2923), .C(acc_mag[5]), 
        .D(n3899), .Z(n2897) );
  C8T28SOI_LR_NAND2X4_P0 U2249 ( .A(n2898), .B(n2897), .Z(n2982) );
  C8T28SOI_LR_OAI22X3_P0 U2250 ( .A(n3612), .B(n2981), .C(n3610), .D(n2982), 
        .Z(n2917) );
  C8T28SOI_LR_AOI22X2_P0 U2252 ( .A(acc_mag[12]), .B(n3910), .C(acc_mag[11]), 
        .D(n2905), .Z(n2901) );
  C8T28SOI_LR_AOI22X2_P0 U2253 ( .A(acc_mag[10]), .B(n2923), .C(acc_mag[9]), 
        .D(n3899), .Z(n2900) );
  C8T28SOI_LR_NAND2X4_P0 U2254 ( .A(n2901), .B(n2900), .Z(n2983) );
  C8T28SOI_LR_AOI22X2_P0 U2257 ( .A(acc_mag[28]), .B(n3910), .C(acc_mag[27]), 
        .D(n2905), .Z(n2904) );
  C8T28SOI_LR_AOI22X2_P0 U2258 ( .A(acc_mag[26]), .B(n2923), .C(acc_mag[25]), 
        .D(n3899), .Z(n2903) );
  C8T28SOI_LR_NAND2X4_P0 U2259 ( .A(n2904), .B(n2903), .Z(n2984) );
  C8T28SOI_LR_OAI22X3_P0 U2260 ( .A(n3597), .B(n2983), .C(n3894), .D(n2984), 
        .Z(n2916) );
  C8T28SOI_LR_AOI22X2_P0 U2267 ( .A(acc_mag[31]), .B(n3919), .C(acc_mag[32]), 
        .D(n3910), .Z(n2911) );
  C8T28SOI_LR_AOI22X2_P0 U2268 ( .A(acc_mag[30]), .B(n2923), .C(acc_mag[29]), 
        .D(n3899), .Z(n2910) );
  C8T28SOI_LR_NAND2X4_P0 U2269 ( .A(n2911), .B(n2910), .Z(n2980) );
  C8T28SOI_LR_AOI22X2_P0 U2272 ( .A(acc_mag[15]), .B(n2905), .C(acc_mag[16]), 
        .D(n3910), .Z(n2914) );
  C8T28SOI_LR_AOI22X2_P0 U2274 ( .A(acc_mag[14]), .B(n2923), .C(acc_mag[13]), 
        .D(n3899), .Z(n2913) );
  C8T28SOI_LR_NAND2X4_P0 U2275 ( .A(n2914), .B(n2913), .Z(n2977) );
  C8T28SOI_LR_OAI22X3_P0 U2276 ( .A(n3603), .B(n2980), .C(n3893), .D(n2977), 
        .Z(n2915) );
  C8T28SOI_LR_OR3X5_P0 U2277 ( .A(n2917), .B(n2916), .C(n2915), .Z(n2918) );
  C8T28SOI_LR_OAI22X3_P0 U2278 ( .A(n2978), .B(n3520), .C(n2919), .D(n2918), 
        .Z(n2920) );
  C8T28SOI_LR_AOI31X3_P0 U2279 ( .A(n3890), .B(n3616), .C(n2990), .D(n2920), 
        .Z(n2973) );
  C8T28SOI_LR_CNIVX4_P16 U2280 ( .A(n3620), .Z(n3622) );
  C8T28SOI_LR_CNNOR2X8_P16 U2281 ( .A(n2922), .B(n3415), .Z(n3407) );
  C8T28SOI_LR_NAND2X4_P0 U2282 ( .A(n3622), .B(n3407), .Z(n3433) );
  C8T28SOI_LR_AOI22X2_P0 U2283 ( .A(acc_mag[95]), .B(n3923), .C(acc_mag[96]), 
        .D(n2907), .Z(n2926) );
  C8T28SOI_LR_AOI22X2_P0 U2288 ( .A(acc_mag[93]), .B(n3897), .C(acc_mag[94]), 
        .D(n3902), .Z(n2925) );
  C8T28SOI_LR_NAND2X4_P0 U2289 ( .A(n2926), .B(n2925), .Z(n3005) );
  C8T28SOI_LR_OAI22X3_P0 U2290 ( .A(acc_mag[98]), .B(n3903), .C(acc_mag[97]), 
        .D(n3486), .Z(n2929) );
  C8T28SOI_LR_OAI22X3_P0 U2291 ( .A(acc_mag[100]), .B(n3914), .C(acc_mag[99]), 
        .D(n3918), .Z(n2928) );
  C8T28SOI_LR_CNNAND2X8_P16 U2293 ( .A(n3889), .B(n2927), .Z(n3485) );
  C8T28SOI_LR_CBI4I6X3_P0 U2294 ( .A(n2929), .B(n2928), .C(n3895), .D(n3485), 
        .Z(n2947) );
  C8T28SOI_LR_AOI22X2_P0 U2295 ( .A(acc_mag[76]), .B(n3912), .C(acc_mag[75]), 
        .D(n3923), .Z(n2932) );
  C8T28SOI_LR_AOI22X2_P0 U2297 ( .A(acc_mag[73]), .B(n3897), .C(acc_mag[74]), 
        .D(n3902), .Z(n2931) );
  C8T28SOI_LR_NAND2X4_P0 U2298 ( .A(n2932), .B(n2931), .Z(n3006) );
  C8T28SOI_LR_AOI22X2_P0 U2300 ( .A(acc_mag[72]), .B(n3912), .C(acc_mag[71]), 
        .D(n3923), .Z(n2934) );
  C8T28SOI_LR_AOI22X2_P0 U2301 ( .A(acc_mag[69]), .B(n3897), .C(acc_mag[70]), 
        .D(n3902), .Z(n2933) );
  C8T28SOI_LR_NAND2X4_P0 U2302 ( .A(n2934), .B(n2933), .Z(n3007) );
  C8T28SOI_LR_OAI22X3_P0 U2303 ( .A(n3597), .B(n3006), .C(n3610), .D(n3007), 
        .Z(n2945) );
  C8T28SOI_LR_AOI22X2_P0 U2304 ( .A(acc_mag[88]), .B(n3912), .C(acc_mag[87]), 
        .D(n3923), .Z(n2936) );
  C8T28SOI_LR_AOI22X2_P0 U2305 ( .A(acc_mag[85]), .B(n3897), .C(acc_mag[86]), 
        .D(n3902), .Z(n2935) );
  C8T28SOI_LR_NAND2X4_P0 U2306 ( .A(n2936), .B(n2935), .Z(n3003) );
  C8T28SOI_LR_AOI22X2_P0 U2307 ( .A(acc_mag[84]), .B(n3912), .C(acc_mag[83]), 
        .D(n3923), .Z(n2938) );
  C8T28SOI_LR_AOI22X2_P0 U2308 ( .A(acc_mag[81]), .B(n3897), .C(acc_mag[82]), 
        .D(n3902), .Z(n2937) );
  C8T28SOI_LR_NAND2X4_P0 U2309 ( .A(n2938), .B(n2937), .Z(n3004) );
  C8T28SOI_LR_OAI22X3_P0 U2310 ( .A(n3612), .B(n3003), .C(n3892), .D(n3004), 
        .Z(n2944) );
  C8T28SOI_LR_AOI22X2_P0 U2312 ( .A(acc_mag[91]), .B(n3923), .C(acc_mag[92]), 
        .D(n3912), .Z(n2940) );
  C8T28SOI_LR_AOI22X2_P0 U2313 ( .A(acc_mag[89]), .B(n3897), .C(acc_mag[90]), 
        .D(n3902), .Z(n2939) );
  C8T28SOI_LR_NAND2X4_P0 U2314 ( .A(n2940), .B(n2939), .Z(n3008) );
  C8T28SOI_LR_AOI22X2_P0 U2315 ( .A(acc_mag[80]), .B(n3912), .C(acc_mag[79]), 
        .D(n3923), .Z(n2942) );
  C8T28SOI_LR_AOI22X2_P0 U2316 ( .A(acc_mag[77]), .B(n3897), .C(acc_mag[78]), 
        .D(n3902), .Z(n2941) );
  C8T28SOI_LR_NAND2X4_P0 U2317 ( .A(n2942), .B(n2941), .Z(n3002) );
  C8T28SOI_LR_OAI22X3_P0 U2318 ( .A(n3894), .B(n3008), .C(n3893), .D(n3002), 
        .Z(n2943) );
  C8T28SOI_LR_NOR3X3_P0 U2319 ( .A(n2945), .B(n2944), .C(n2943), .Z(n2946) );
  C8T28SOI_LR_OAI211X3_P0 U2320 ( .A(n3603), .B(n3005), .C(n2947), .D(n2946), 
        .Z(n2972) );
  C8T28SOI_LR_AOI22X2_P0 U2321 ( .A(acc_mag[56]), .B(n2907), .C(acc_mag[55]), 
        .D(n3917), .Z(n2949) );
  C8T28SOI_LR_AOI22X2_P0 U2322 ( .A(acc_mag[53]), .B(n3901), .C(acc_mag[54]), 
        .D(n3908), .Z(n2948) );
  C8T28SOI_LR_NAND2X4_P0 U2323 ( .A(n2949), .B(n2948), .Z(n2994) );
  C8T28SOI_LR_AOI22X2_P0 U2324 ( .A(acc_mag[48]), .B(n3915), .C(acc_mag[47]), 
        .D(n3917), .Z(n2951) );
  C8T28SOI_LR_AOI22X2_P0 U2325 ( .A(acc_mag[45]), .B(n3901), .C(acc_mag[46]), 
        .D(n3908), .Z(n2950) );
  C8T28SOI_LR_NAND2X4_P0 U2326 ( .A(n2951), .B(n2950), .Z(n2992) );
  C8T28SOI_LR_OAI22X3_P0 U2327 ( .A(n3612), .B(n2994), .C(n3893), .D(n2992), 
        .Z(n2970) );
  C8T28SOI_LR_NAND2X4_P0 U2328 ( .A(n2952), .B(n3889), .Z(n3405) );
  C8T28SOI_LR_CNNOR2X8_P16 U2329 ( .A(n2953), .B(n3405), .Z(n3557) );
  C8T28SOI_LR_AOI22X2_P0 U2331 ( .A(acc_mag[67]), .B(n3923), .C(acc_mag[68]), 
        .D(n2907), .Z(n2955) );
  C8T28SOI_LR_AOI22X2_P0 U2332 ( .A(acc_mag[65]), .B(n3897), .C(acc_mag[66]), 
        .D(n3908), .Z(n2954) );
  C8T28SOI_LR_NAND2X4_P0 U2333 ( .A(n2955), .B(n2954), .Z(n3009) );
  C8T28SOI_LR_AOI22X2_P0 U2334 ( .A(acc_mag[52]), .B(n3915), .C(acc_mag[51]), 
        .D(n3917), .Z(n2957) );
  C8T28SOI_LR_AOI22X2_P0 U2335 ( .A(acc_mag[49]), .B(n3901), .C(acc_mag[50]), 
        .D(n3908), .Z(n2956) );
  C8T28SOI_LR_NAND2X4_P0 U2336 ( .A(n2957), .B(n2956), .Z(n3001) );
  C8T28SOI_LR_OAI22X3_P0 U2337 ( .A(n3601), .B(n3009), .C(n3892), .D(n3001), 
        .Z(n2968) );
  C8T28SOI_LR_AOI22X2_P0 U2338 ( .A(acc_mag[43]), .B(n3917), .C(acc_mag[44]), 
        .D(n3915), .Z(n2959) );
  C8T28SOI_LR_AOI22X2_P0 U2340 ( .A(acc_mag[41]), .B(n3901), .C(acc_mag[42]), 
        .D(n3908), .Z(n2958) );
  C8T28SOI_LR_NAND2X4_P0 U2341 ( .A(n2959), .B(n2958), .Z(n2991) );
  C8T28SOI_LR_AOI22X2_P0 U2342 ( .A(acc_mag[40]), .B(n3915), .C(acc_mag[39]), 
        .D(n3919), .Z(n2961) );
  C8T28SOI_LR_AOI22X2_P0 U2343 ( .A(acc_mag[38]), .B(n3906), .C(acc_mag[37]), 
        .D(n3901), .Z(n2960) );
  C8T28SOI_LR_NAND2X4_P0 U2344 ( .A(n2961), .B(n2960), .Z(n2996) );
  C8T28SOI_LR_OAI22X3_P0 U2345 ( .A(n3597), .B(n2991), .C(n3610), .D(n2996), 
        .Z(n2967) );
  C8T28SOI_LR_AOI22X2_P0 U2346 ( .A(acc_mag[60]), .B(n2907), .C(acc_mag[59]), 
        .D(n3917), .Z(n2963) );
  C8T28SOI_LR_AOI22X2_P0 U2347 ( .A(acc_mag[57]), .B(n3901), .C(acc_mag[58]), 
        .D(n3908), .Z(n2962) );
  C8T28SOI_LR_NAND2X4_P0 U2348 ( .A(n2963), .B(n2962), .Z(n2993) );
  C8T28SOI_LR_AOI22X2_P0 U2349 ( .A(acc_mag[64]), .B(n2907), .C(acc_mag[63]), 
        .D(n3917), .Z(n2965) );
  C8T28SOI_LR_AOI22X2_P0 U2350 ( .A(acc_mag[61]), .B(n3901), .C(acc_mag[62]), 
        .D(n3908), .Z(n2964) );
  C8T28SOI_LR_NAND2X4_P0 U2351 ( .A(n2965), .B(n2964), .Z(n3018) );
  C8T28SOI_LR_OAI22X3_P0 U2352 ( .A(n3894), .B(n2993), .C(n3603), .D(n3018), 
        .Z(n2966) );
  C8T28SOI_LR_NOR3X3_P0 U2353 ( .A(n2968), .B(n2967), .C(n2966), .Z(n2969) );
  C8T28SOI_LRA_NAND3AX3_P0 U2354 ( .A(n2970), .B(n3557), .C(n2969), .Z(n2971)
         );
  C8T28SOI_LR_OAI211X3_P0 U2355 ( .A(n2973), .B(n3433), .C(n2972), .D(n2971), 
        .Z(n928) );
  C8T28SOI_LR_CNNOR2X8_P16 U2356 ( .A(acc[49]), .B(n2974), .Z(n3701) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2357 ( .A(acc[50]), .B(n3701), .Z(n3097) );
  C8T28SOI_LR_NAND2X4_P0 U2358 ( .A(acc[101]), .B(n3097), .Z(n2975) );
  C8T28SOI_LR_CNXOR2X9_P16 U2359 ( .A(acc[51]), .S(n2975), .Z(n2976) );
  C8T28SOI_LR_NOR2X4_P0 U2360 ( .A(n2497), .B(n2976), .Z(n833) );
  C8T28SOI_LR_AND2X5_P0 U2361 ( .A(intadd_0_SUM_30_), .B(n3879), .Z(n391) );
  C8T28SOI_LR_AOI22ABX3_P0 U2363 ( .C(n3891), .D(n2978), .A(n2977), .B(n3892), 
        .Z(n2989) );
  C8T28SOI_LR_OAI22X3_P0 U2364 ( .A(n3601), .B(n2980), .C(n3612), .D(n2979), 
        .Z(n2987) );
  C8T28SOI_LR_OAI22X3_P0 U2365 ( .A(n3597), .B(n2982), .C(n3894), .D(n2981), 
        .Z(n2986) );
  C8T28SOI_LR_OAI22X3_P0 U2366 ( .A(n3603), .B(n2984), .C(n3893), .D(n2983), 
        .Z(n2985) );
  C8T28SOI_LR_NOR3X3_P0 U2367 ( .A(n2987), .B(n2986), .C(n2985), .Z(n2988) );
  C8T28SOI_LR_AOI22X2_P0 U2368 ( .A(n3133), .B(n2990), .C(n2989), .D(n2988), 
        .Z(n3020) );
  C8T28SOI_LR_OAI22X3_P0 U2369 ( .A(n3892), .B(n2992), .C(n3893), .D(n2991), 
        .Z(n2999) );
  C8T28SOI_LR_OAI22X3_P0 U2370 ( .A(n3894), .B(n2994), .C(n3603), .D(n2993), 
        .Z(n2998) );
  C8T28SOI_LR_OAI22X3_P0 U2371 ( .A(n3597), .B(n2996), .C(n3610), .D(n2995), 
        .Z(n2997) );
  C8T28SOI_LR_NOR3X3_P0 U2372 ( .A(n2999), .B(n2998), .C(n2997), .Z(n3000) );
  C8T28SOI_LR_OAI12X3_P0 U2373 ( .A(n3612), .B(n3001), .C(n3000), .Z(n3016) );
  C8T28SOI_LR_OAI22X3_P0 U2374 ( .A(n3894), .B(n3003), .C(n3892), .D(n3002), 
        .Z(n3015) );
  C8T28SOI_LR_OAI22X3_P0 U2375 ( .A(n3601), .B(n3005), .C(n3612), .D(n3004), 
        .Z(n3012) );
  C8T28SOI_LR_OAI22X3_P0 U2376 ( .A(n3597), .B(n3007), .C(n3893), .D(n3006), 
        .Z(n3011) );
  C8T28SOI_LR_OAI22X3_P0 U2377 ( .A(n3610), .B(n3009), .C(n3603), .D(n3008), 
        .Z(n3010) );
  C8T28SOI_LR_NOR3X3_P0 U2378 ( .A(n3012), .B(n3011), .C(n3010), .Z(n3013) );
  C8T28SOI_LR_CNIVX4_P16 U2379 ( .A(n3013), .Z(n3014) );
  C8T28SOI_LR_OAI22X3_P0 U2380 ( .A(n3409), .B(n3016), .C(n3015), .D(n3014), 
        .Z(n3017) );
  C8T28SOI_LR_OAI211X3_P0 U2381 ( .A(n3520), .B(n3018), .C(n3407), .D(n3017), 
        .Z(n3019) );
  C8T28SOI_LR_AOI22X2_P0 U2382 ( .A(n3622), .B(n3020), .C(n3433), .D(n3019), 
        .Z(n924) );
  C8T28SOI_LR_AOI22X2_P0 U2384 ( .A(acc_mag[11]), .B(n3910), .C(acc_mag[10]), 
        .D(n2905), .Z(n3024) );
  C8T28SOI_LR_AOI22X2_P0 U2386 ( .A(acc_mag[9]), .B(n2923), .C(acc_mag[8]), 
        .D(n3899), .Z(n3023) );
  C8T28SOI_LR_NAND2X4_P0 U2387 ( .A(n3024), .B(n3023), .Z(n3441) );
  C8T28SOI_LR_AOI22X2_P0 U2388 ( .A(acc_mag[23]), .B(n3910), .C(acc_mag[22]), 
        .D(n2905), .Z(n3026) );
  C8T28SOI_LR_AOI22X2_P0 U2389 ( .A(acc_mag[21]), .B(n2923), .C(acc_mag[20]), 
        .D(n3899), .Z(n3025) );
  C8T28SOI_LR_NAND2X4_P0 U2390 ( .A(n3026), .B(n3025), .Z(n3439) );
  C8T28SOI_LR_AOI22X2_P0 U2391 ( .A(acc_mag[27]), .B(n3910), .C(acc_mag[26]), 
        .D(n2905), .Z(n3028) );
  C8T28SOI_LR_AOI22X2_P0 U2392 ( .A(acc_mag[25]), .B(n2923), .C(acc_mag[24]), 
        .D(n3899), .Z(n3027) );
  C8T28SOI_LR_NAND2X4_P0 U2393 ( .A(n3028), .B(n3027), .Z(n3440) );
  C8T28SOI_LR_OAI22X3_P0 U2394 ( .A(n3894), .B(n3439), .C(n3603), .D(n3440), 
        .Z(n3039) );
  C8T28SOI_LR_AOI22X2_P0 U2395 ( .A(acc_mag[31]), .B(n3910), .C(acc_mag[30]), 
        .D(n2905), .Z(n3030) );
  C8T28SOI_LR_AOI22X2_P0 U2396 ( .A(acc_mag[29]), .B(n2923), .C(acc_mag[28]), 
        .D(n3899), .Z(n3029) );
  C8T28SOI_LR_NAND2X4_P0 U2397 ( .A(n3030), .B(n3029), .Z(n3437) );
  C8T28SOI_LR_AOI22X2_P0 U2398 ( .A(acc_mag[7]), .B(n3910), .C(acc_mag[6]), 
        .D(n2905), .Z(n3032) );
  C8T28SOI_LR_AOI22X2_P0 U2399 ( .A(acc_mag[5]), .B(n2923), .C(acc_mag[4]), 
        .D(n3899), .Z(n3031) );
  C8T28SOI_LR_NAND2X4_P0 U2400 ( .A(n3032), .B(n3031), .Z(n3438) );
  C8T28SOI_LR_OAI22X3_P0 U2401 ( .A(n3601), .B(n3437), .C(n3597), .D(n3438), 
        .Z(n3038) );
  C8T28SOI_LR_AOI22X2_P0 U2402 ( .A(acc_mag[19]), .B(n3910), .C(acc_mag[18]), 
        .D(n2905), .Z(n3034) );
  C8T28SOI_LR_AOI22X2_P0 U2403 ( .A(acc_mag[17]), .B(n2923), .C(acc_mag[16]), 
        .D(n3899), .Z(n3033) );
  C8T28SOI_LR_NAND2X4_P0 U2404 ( .A(n3034), .B(n3033), .Z(n3434) );
  C8T28SOI_LR_AOI22X2_P0 U2405 ( .A(acc_mag[15]), .B(n3910), .C(acc_mag[14]), 
        .D(n2905), .Z(n3036) );
  C8T28SOI_LR_AOI22X2_P0 U2406 ( .A(acc_mag[13]), .B(n2923), .C(acc_mag[12]), 
        .D(n3899), .Z(n3035) );
  C8T28SOI_LR_NAND2X4_P0 U2407 ( .A(n3036), .B(n3035), .Z(n3436) );
  C8T28SOI_LR_OAI22X3_P0 U2408 ( .A(n3612), .B(n3434), .C(n3892), .D(n3436), 
        .Z(n3037) );
  C8T28SOI_LR_NOR3X3_P0 U2409 ( .A(n3039), .B(n3038), .C(n3037), .Z(n3046) );
  C8T28SOI_LR_OAI22X3_P0 U2410 ( .A(n3040), .B(n3911), .C(n3114), .D(n3920), 
        .Z(n3044) );
  C8T28SOI_LR_OAI22X3_P0 U2411 ( .A(n3042), .B(n3905), .C(n3041), .D(n3486), 
        .Z(n3043) );
  C8T28SOI_LR_CNNOR2X8_P16 U2412 ( .A(n3044), .B(n3043), .Z(n3447) );
  C8T28SOI_LR_NAND2X4_P0 U2413 ( .A(n3891), .B(n3447), .Z(n3045) );
  C8T28SOI_LR_OAI211X3_P0 U2414 ( .A(n3893), .B(n3441), .C(n3046), .D(n3045), 
        .Z(n3096) );
  C8T28SOI_LR_AOI22X2_P0 U2416 ( .A(acc_mag[62]), .B(n3917), .C(acc_mag[63]), 
        .D(n2907), .Z(n3049) );
  C8T28SOI_LR_AOI22X2_P0 U2418 ( .A(acc_mag[60]), .B(n3901), .C(acc_mag[61]), 
        .D(n3908), .Z(n3048) );
  C8T28SOI_LR_NAND2X4_P0 U2419 ( .A(n3049), .B(n3048), .Z(n3454) );
  C8T28SOI_LR_AOI22X2_P0 U2420 ( .A(acc_mag[58]), .B(n3917), .C(acc_mag[59]), 
        .D(n2907), .Z(n3051) );
  C8T28SOI_LR_AOI22X2_P0 U2421 ( .A(acc_mag[56]), .B(n3901), .C(acc_mag[57]), 
        .D(n3908), .Z(n3050) );
  C8T28SOI_LR_NAND2X4_P0 U2422 ( .A(n3051), .B(n3050), .Z(n3452) );
  C8T28SOI_LR_AOI22X2_P0 U2423 ( .A(acc_mag[50]), .B(n3917), .C(acc_mag[51]), 
        .D(n3915), .Z(n3053) );
  C8T28SOI_LR_AOI22X2_P0 U2424 ( .A(acc_mag[48]), .B(n3901), .C(acc_mag[49]), 
        .D(n3908), .Z(n3052) );
  C8T28SOI_LR_NAND2X4_P0 U2425 ( .A(n3053), .B(n3052), .Z(n3448) );
  C8T28SOI_LR_AOI22X2_P0 U2426 ( .A(acc_mag[46]), .B(n3917), .C(acc_mag[47]), 
        .D(n3915), .Z(n3055) );
  C8T28SOI_LR_AOI22X2_P0 U2427 ( .A(acc_mag[44]), .B(n3901), .C(acc_mag[45]), 
        .D(n3908), .Z(n3054) );
  C8T28SOI_LR_NAND2X4_P0 U2428 ( .A(n3055), .B(n3054), .Z(n3456) );
  C8T28SOI_LR_OAI22X3_P0 U2429 ( .A(n3612), .B(n3448), .C(n3892), .D(n3456), 
        .Z(n3066) );
  C8T28SOI_LR_AOI22X2_P0 U2430 ( .A(acc_mag[38]), .B(n3919), .C(acc_mag[39]), 
        .D(n3915), .Z(n3057) );
  C8T28SOI_LR_AOI22X2_P0 U2431 ( .A(acc_mag[37]), .B(n3906), .C(acc_mag[36]), 
        .D(n3901), .Z(n3056) );
  C8T28SOI_LR_NAND2X4_P0 U2432 ( .A(n3057), .B(n3056), .Z(n3455) );
  C8T28SOI_LR_AOI22X2_P0 U2433 ( .A(acc_mag[42]), .B(n3919), .C(acc_mag[43]), 
        .D(n3915), .Z(n3059) );
  C8T28SOI_LR_AOI22X2_P0 U2434 ( .A(acc_mag[40]), .B(n3901), .C(acc_mag[41]), 
        .D(n3906), .Z(n3058) );
  C8T28SOI_LR_NAND2X4_P0 U2435 ( .A(n3059), .B(n3058), .Z(n3457) );
  C8T28SOI_LR_OAI22X3_P0 U2436 ( .A(n3597), .B(n3455), .C(n3893), .D(n3457), 
        .Z(n3065) );
  C8T28SOI_LR_AOI22X2_P0 U2437 ( .A(acc_mag[54]), .B(n3917), .C(acc_mag[55]), 
        .D(n3915), .Z(n3061) );
  C8T28SOI_LR_AOI22X2_P0 U2438 ( .A(acc_mag[52]), .B(n3901), .C(acc_mag[53]), 
        .D(n3908), .Z(n3060) );
  C8T28SOI_LR_NAND2X4_P0 U2439 ( .A(n3061), .B(n3060), .Z(n3453) );
  C8T28SOI_LR_AOI22X2_P0 U2440 ( .A(acc_mag[35]), .B(n3915), .C(acc_mag[34]), 
        .D(n3919), .Z(n3063) );
  C8T28SOI_LR_AOI22X2_P0 U2441 ( .A(acc_mag[33]), .B(n3906), .C(acc_mag[32]), 
        .D(n3901), .Z(n3062) );
  C8T28SOI_LR_NAND2X4_P0 U2442 ( .A(n3063), .B(n3062), .Z(n3435) );
  C8T28SOI_LR_OAI22X3_P0 U2443 ( .A(n3894), .B(n3453), .C(n3610), .D(n3435), 
        .Z(n3064) );
  C8T28SOI_LR_NOR3X3_P0 U2444 ( .A(n3066), .B(n3065), .C(n3064), .Z(n3067) );
  C8T28SOI_LR_OAI12X3_P0 U2445 ( .A(n3603), .B(n3452), .C(n3067), .Z(n3093) );
  C8T28SOI_LR_AOI22X2_P0 U2446 ( .A(acc_mag[82]), .B(n3923), .C(acc_mag[83]), 
        .D(n3912), .Z(n3069) );
  C8T28SOI_LR_AOI22X2_P0 U2447 ( .A(acc_mag[80]), .B(n3897), .C(acc_mag[81]), 
        .D(n3902), .Z(n3068) );
  C8T28SOI_LR_NAND2X4_P0 U2448 ( .A(n3069), .B(n3068), .Z(n3432) );
  C8T28SOI_LR_AOI22X2_P0 U2449 ( .A(acc_mag[66]), .B(n3923), .C(acc_mag[67]), 
        .D(n2907), .Z(n3071) );
  C8T28SOI_LR_AOI22X2_P0 U2450 ( .A(acc_mag[64]), .B(n3897), .C(acc_mag[65]), 
        .D(n3908), .Z(n3070) );
  C8T28SOI_LR_NAND2X4_P0 U2451 ( .A(n3071), .B(n3070), .Z(n3449) );
  C8T28SOI_LR_OAI22X3_P0 U2452 ( .A(n3612), .B(n3432), .C(n3610), .D(n3449), 
        .Z(n3092) );
  C8T28SOI_LR_AOI22X2_P0 U2453 ( .A(acc_mag[70]), .B(n3923), .C(acc_mag[71]), 
        .D(n3912), .Z(n3073) );
  C8T28SOI_LR_AOI22X2_P0 U2454 ( .A(acc_mag[68]), .B(n3897), .C(acc_mag[69]), 
        .D(n3902), .Z(n3072) );
  C8T28SOI_LR_NAND2X4_P0 U2455 ( .A(n3073), .B(n3072), .Z(n3424) );
  C8T28SOI_LR_AOI22X2_P0 U2456 ( .A(acc_mag[86]), .B(n3923), .C(acc_mag[87]), 
        .D(n3912), .Z(n3075) );
  C8T28SOI_LR_AOI22X2_P0 U2457 ( .A(acc_mag[84]), .B(n3897), .C(acc_mag[85]), 
        .D(n3902), .Z(n3074) );
  C8T28SOI_LR_NAND2X4_P0 U2458 ( .A(n3075), .B(n3074), .Z(n3421) );
  C8T28SOI_LR_OAI22X3_P0 U2459 ( .A(n3597), .B(n3424), .C(n3894), .D(n3421), 
        .Z(n3089) );
  C8T28SOI_LR_AOI22X2_P0 U2460 ( .A(acc_mag[95]), .B(n3912), .C(acc_mag[94]), 
        .D(n3923), .Z(n3079) );
  C8T28SOI_LR_AOI22X2_P0 U2461 ( .A(acc_mag[92]), .B(n3897), .C(acc_mag[93]), 
        .D(n3902), .Z(n3078) );
  C8T28SOI_LR_NAND2X4_P0 U2462 ( .A(n3079), .B(n3078), .Z(n3423) );
  C8T28SOI_LR_AOI22X2_P0 U2463 ( .A(acc_mag[74]), .B(n3923), .C(acc_mag[75]), 
        .D(n3912), .Z(n3082) );
  C8T28SOI_LR_AOI22X2_P0 U2464 ( .A(acc_mag[72]), .B(n3897), .C(acc_mag[73]), 
        .D(n3902), .Z(n3081) );
  C8T28SOI_LR_NAND2X4_P0 U2465 ( .A(n3082), .B(n3081), .Z(n3420) );
  C8T28SOI_LR_OAI22X3_P0 U2466 ( .A(n3601), .B(n3423), .C(n3893), .D(n3420), 
        .Z(n3088) );
  C8T28SOI_LR_AOI22X2_P0 U2467 ( .A(acc_mag[78]), .B(n3923), .C(acc_mag[79]), 
        .D(n3912), .Z(n3084) );
  C8T28SOI_LR_AOI22X2_P0 U2468 ( .A(acc_mag[76]), .B(n3897), .C(acc_mag[77]), 
        .D(n3902), .Z(n3083) );
  C8T28SOI_LR_NAND2X4_P0 U2469 ( .A(n3084), .B(n3083), .Z(n3422) );
  C8T28SOI_LR_AOI22X2_P0 U2470 ( .A(acc_mag[90]), .B(n3923), .C(acc_mag[91]), 
        .D(n3912), .Z(n3086) );
  C8T28SOI_LR_AOI22X2_P0 U2471 ( .A(acc_mag[88]), .B(n3897), .C(acc_mag[89]), 
        .D(n3902), .Z(n3085) );
  C8T28SOI_LR_NAND2X4_P0 U2472 ( .A(n3086), .B(n3085), .Z(n3425) );
  C8T28SOI_LR_OAI22X3_P0 U2473 ( .A(n3892), .B(n3422), .C(n3603), .D(n3425), 
        .Z(n3087) );
  C8T28SOI_LR_NOR3X3_P0 U2474 ( .A(n3089), .B(n3088), .C(n3087), .Z(n3090) );
  C8T28SOI_LR_CNIVX4_P16 U2475 ( .A(n3090), .Z(n3091) );
  C8T28SOI_LR_OAI22X3_P0 U2476 ( .A(n3409), .B(n3093), .C(n3092), .D(n3091), 
        .Z(n3094) );
  C8T28SOI_LR_OAI211X3_P0 U2477 ( .A(n3520), .B(n3454), .C(n3407), .D(n3094), 
        .Z(n3095) );
  C8T28SOI_LR_AOI22X2_P0 U2478 ( .A(n3622), .B(n3096), .C(n3433), .D(n3095), 
        .Z(n923) );
  C8T28SOI_LR_CNNOR2X8_P16 U2479 ( .A(acc[51]), .B(n3097), .Z(n3698) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2480 ( .A(acc[52]), .B(n3698), .Z(n3199) );
  C8T28SOI_LR_NAND2X4_P0 U2481 ( .A(acc[101]), .B(n3199), .Z(n3098) );
  C8T28SOI_LR_CNXOR2X9_P16 U2482 ( .A(acc[53]), .S(n3098), .Z(n3099) );
  C8T28SOI_LR_NOR2X4_P0 U2483 ( .A(n2497), .B(n3099), .Z(n835) );
  C8T28SOI_LR_AOI22X2_P0 U2484 ( .A(acc_mag[1]), .B(n3910), .C(acc_mag[0]), 
        .D(n3919), .Z(n3131) );
  C8T28SOI_LR_AOI22X2_P0 U2485 ( .A(acc_mag[33]), .B(n3910), .C(acc_mag[32]), 
        .D(n3919), .Z(n3100) );
  C8T28SOI_LR_OAI211AX3_P0 U2486 ( .A(acc_mag[30]), .B(n3486), .C(n3895), .D(
        n3100), .Z(n3105) );
  C8T28SOI_LR_AOI12X3_P0 U2488 ( .A(acc_mag[18]), .B(n3899), .C(n3612), .Z(
        n3103) );
  C8T28SOI_LR_AOI22X2_P0 U2489 ( .A(acc_mag[21]), .B(n3910), .C(acc_mag[20]), 
        .D(n2905), .Z(n3102) );
  C8T28SOI_LR_OAI211AX3_P0 U2490 ( .A(acc_mag[19]), .B(n3905), .C(n3103), .D(
        n3102), .Z(n3104) );
  C8T28SOI_LR_CBI4I1X3_P0 U2491 ( .A(n2923), .B(acc_mag[31]), .C(n3105), .D(
        n3104), .Z(n3130) );
  C8T28SOI_LR_AOI22X2_P0 U2493 ( .A(acc_mag[24]), .B(n2905), .C(acc_mag[23]), 
        .D(n2923), .Z(n3106) );
  C8T28SOI_LR_OAI211X3_P0 U2494 ( .A(n3107), .B(n3486), .C(n3581), .D(n3106), 
        .Z(n3111) );
  C8T28SOI_LR_AOI12X3_P0 U2495 ( .A(acc_mag[6]), .B(n3899), .C(n3597), .Z(
        n3109) );
  C8T28SOI_LR_AOI22X2_P0 U2496 ( .A(acc_mag[9]), .B(n3910), .C(acc_mag[8]), 
        .D(n3919), .Z(n3108) );
  C8T28SOI_LR_OAI211AX3_P0 U2497 ( .A(acc_mag[7]), .B(n3907), .C(n3109), .D(
        n3108), .Z(n3110) );
  C8T28SOI_LR_CBI4I1X3_P0 U2498 ( .A(n3910), .B(acc_mag[25]), .C(n3111), .D(
        n3110), .Z(n3128) );
  C8T28SOI_LR_AOI22X2_P0 U2500 ( .A(acc_mag[4]), .B(n3919), .C(acc_mag[3]), 
        .D(n3906), .Z(n3113) );
  C8T28SOI_LR_OAI211X3_P0 U2501 ( .A(n3114), .B(n3486), .C(n3891), .D(n3113), 
        .Z(n3119) );
  C8T28SOI_LR_AOI12X3_P0 U2502 ( .A(acc_mag[14]), .B(n3899), .C(n3892), .Z(
        n3116) );
  C8T28SOI_LR_AOI22X2_P0 U2503 ( .A(acc_mag[15]), .B(n2923), .C(acc_mag[16]), 
        .D(n2905), .Z(n3115) );
  C8T28SOI_LR_OAI211X3_P0 U2504 ( .A(n3117), .B(n3911), .C(n3116), .D(n3115), 
        .Z(n3118) );
  C8T28SOI_LR_CBI4I1X3_P0 U2505 ( .A(n3910), .B(acc_mag[5]), .C(n3119), .D(
        n3118), .Z(n3127) );
  C8T28SOI_LR_AOI22X2_P0 U2506 ( .A(acc_mag[12]), .B(n3919), .C(acc_mag[11]), 
        .D(n3906), .Z(n3120) );
  C8T28SOI_LR_OAI211X3_P0 U2507 ( .A(n3121), .B(n3486), .C(n3583), .D(n3120), 
        .Z(n3125) );
  C8T28SOI_LR_AOI12X3_P0 U2508 ( .A(acc_mag[26]), .B(n3899), .C(n3603), .Z(
        n3123) );
  C8T28SOI_LR_AOI22X2_P0 U2509 ( .A(acc_mag[29]), .B(n3910), .C(acc_mag[28]), 
        .D(n3919), .Z(n3122) );
  C8T28SOI_LR_OAI211AX3_P0 U2510 ( .A(acc_mag[27]), .B(n3907), .C(n3123), .D(
        n3122), .Z(n3124) );
  C8T28SOI_LR_CBI4I1X3_P0 U2511 ( .A(n3910), .B(acc_mag[13]), .C(n3125), .D(
        n3124), .Z(n3126) );
  C8T28SOI_LR_OR3X5_P0 U2512 ( .A(n3128), .B(n3127), .C(n3126), .Z(n3129) );
  C8T28SOI_LR_OAI22X3_P0 U2513 ( .A(n3131), .B(n3520), .C(n3130), .D(n3129), 
        .Z(n3198) );
  C8T28SOI_LR_AOI22X2_P0 U2514 ( .A(acc_mag[65]), .B(n2907), .C(acc_mag[63]), 
        .D(n3908), .Z(n3132) );
  C8T28SOI_LR_OAI211X3_P0 U2515 ( .A(n3134), .B(n3486), .C(n3133), .D(n3132), 
        .Z(n3195) );
  C8T28SOI_LR_CNIVX4_P16 U2516 ( .A(acc_mag[54]), .Z(n3521) );
  C8T28SOI_LR_AOI22X2_P0 U2517 ( .A(acc_mag[57]), .B(n3915), .C(acc_mag[55]), 
        .D(n3908), .Z(n3135) );
  C8T28SOI_LR_OAI211X3_P0 U2518 ( .A(n3521), .B(n3486), .C(n3581), .D(n3135), 
        .Z(n3158) );
  C8T28SOI_LR_AOI22X2_P0 U2519 ( .A(acc_mag[49]), .B(n3915), .C(acc_mag[47]), 
        .D(n3908), .Z(n3136) );
  C8T28SOI_LR_OAI211X3_P0 U2520 ( .A(n3137), .B(n3486), .C(n3585), .D(n3136), 
        .Z(n3141) );
  C8T28SOI_LR_AOI12X3_P0 U2521 ( .A(acc_mag[50]), .B(n3901), .C(n3612), .Z(
        n3139) );
  C8T28SOI_LR_AOI22X2_P0 U2522 ( .A(acc_mag[52]), .B(n3917), .C(acc_mag[53]), 
        .D(n3915), .Z(n3138) );
  C8T28SOI_LR_OAI211AX3_P0 U2523 ( .A(acc_mag[51]), .B(n3909), .C(n3139), .D(
        n3138), .Z(n3140) );
  C8T28SOI_LR_CBI4I1X3_P0 U2524 ( .A(n3917), .B(acc_mag[48]), .C(n3141), .D(
        n3140), .Z(n3156) );
  C8T28SOI_LR_CNIVX4_P16 U2525 ( .A(acc_mag[42]), .Z(n3534) );
  C8T28SOI_LR_AOI22X2_P0 U2526 ( .A(acc_mag[44]), .B(n3917), .C(acc_mag[45]), 
        .D(n3915), .Z(n3142) );
  C8T28SOI_LR_OAI211X3_P0 U2527 ( .A(n3534), .B(n3486), .C(n3583), .D(n3142), 
        .Z(n3146) );
  C8T28SOI_LR_AOI12X3_P0 U2528 ( .A(acc_mag[38]), .B(n3901), .C(n3597), .Z(
        n3144) );
  C8T28SOI_LR_AOI22X2_P0 U2529 ( .A(acc_mag[40]), .B(n3919), .C(acc_mag[41]), 
        .D(n3915), .Z(n3143) );
  C8T28SOI_LR_OAI211AX3_P0 U2530 ( .A(acc_mag[39]), .B(n3907), .C(n3144), .D(
        n3143), .Z(n3145) );
  C8T28SOI_LR_CBI4I1X3_P0 U2531 ( .A(n3906), .B(acc_mag[43]), .C(n3146), .D(
        n3145), .Z(n3155) );
  C8T28SOI_LR_AOI22X2_P0 U2532 ( .A(acc_mag[36]), .B(n3919), .C(acc_mag[35]), 
        .D(n3906), .Z(n3147) );
  C8T28SOI_LR_OAI211X3_P0 U2533 ( .A(n3148), .B(n3486), .C(n3891), .D(n3147), 
        .Z(n3153) );
  C8T28SOI_LR_AOI12X3_P0 U2534 ( .A(acc_mag[58]), .B(n3901), .C(n3603), .Z(
        n3150) );
  C8T28SOI_LR_AOI22X2_P0 U2535 ( .A(acc_mag[60]), .B(n3917), .C(acc_mag[61]), 
        .D(n2907), .Z(n3149) );
  C8T28SOI_LR_OAI211X3_P0 U2536 ( .A(n3151), .B(n3909), .C(n3150), .D(n3149), 
        .Z(n3152) );
  C8T28SOI_LR_CBI4I1X3_P0 U2537 ( .A(n3915), .B(acc_mag[37]), .C(n3153), .D(
        n3152), .Z(n3154) );
  C8T28SOI_LR_NOR3X3_P0 U2538 ( .A(n3156), .B(n3155), .C(n3154), .Z(n3157) );
  C8T28SOI_LR_CBI4I1X3_P0 U2539 ( .A(n3917), .B(acc_mag[56]), .C(n3158), .D(
        n3157), .Z(n3193) );
  C8T28SOI_LR_AOI22X2_P0 U2540 ( .A(acc_mag[68]), .B(n3923), .C(acc_mag[69]), 
        .D(n2907), .Z(n3160) );
  C8T28SOI_LR_OAI211AX3_P0 U2541 ( .A(acc_mag[66]), .B(n3486), .C(n3891), .D(
        n3160), .Z(n3165) );
  C8T28SOI_LR_AOI12X3_P0 U2542 ( .A(acc_mag[94]), .B(n3897), .C(n3601), .Z(
        n3162) );
  C8T28SOI_LR_AOI22X2_P0 U2543 ( .A(acc_mag[97]), .B(n2907), .C(acc_mag[96]), 
        .D(n3917), .Z(n3161) );
  C8T28SOI_LR_OAI211X3_P0 U2544 ( .A(n3163), .B(n3909), .C(n3162), .D(n3161), 
        .Z(n3164) );
  C8T28SOI_LR_CBI4I1X3_P0 U2545 ( .A(n3902), .B(acc_mag[67]), .C(n3165), .D(
        n3164), .Z(n3192) );
  C8T28SOI_LR_AOI22X2_P0 U2546 ( .A(acc_mag[81]), .B(n3912), .C(acc_mag[79]), 
        .D(n3902), .Z(n3166) );
  C8T28SOI_LR_OAI211AX3_P0 U2547 ( .A(acc_mag[78]), .B(n3486), .C(n3585), .D(
        n3166), .Z(n3172) );
  C8T28SOI_LR_AOI12X3_P0 U2548 ( .A(acc_mag[82]), .B(n3897), .C(n3612), .Z(
        n3169) );
  C8T28SOI_LR_AOI22X2_P0 U2550 ( .A(acc_mag[84]), .B(n3923), .C(acc_mag[85]), 
        .D(n3912), .Z(n3168) );
  C8T28SOI_LR_OAI211X3_P0 U2551 ( .A(n3170), .B(n3903), .C(n3169), .D(n3168), 
        .Z(n3171) );
  C8T28SOI_LR_CBI4I1X3_P0 U2552 ( .A(n3923), .B(acc_mag[80]), .C(n3172), .D(
        n3171), .Z(n3189) );
  C8T28SOI_LR_AOI22X2_P0 U2553 ( .A(acc_mag[89]), .B(n3912), .C(acc_mag[87]), 
        .D(n3902), .Z(n3173) );
  C8T28SOI_LR_OAI211X3_P0 U2554 ( .A(n3174), .B(n3486), .C(n3581), .D(n3173), 
        .Z(n3179) );
  C8T28SOI_LR_AOI12X3_P0 U2555 ( .A(acc_mag[70]), .B(n3897), .C(n3597), .Z(
        n3176) );
  C8T28SOI_LR_AOI22X2_P0 U2556 ( .A(acc_mag[72]), .B(n3923), .C(acc_mag[73]), 
        .D(n3912), .Z(n3175) );
  C8T28SOI_LR_OAI211X3_P0 U2557 ( .A(n3177), .B(n3903), .C(n3176), .D(n3175), 
        .Z(n3178) );
  C8T28SOI_LR_CBI4I1X3_P0 U2558 ( .A(n3923), .B(acc_mag[88]), .C(n3179), .D(
        n3178), .Z(n3188) );
  C8T28SOI_LR_AOI22X2_P0 U2559 ( .A(acc_mag[77]), .B(n3912), .C(acc_mag[75]), 
        .D(n3902), .Z(n3180) );
  C8T28SOI_LR_OAI211X3_P0 U2560 ( .A(n3181), .B(n3486), .C(n3583), .D(n3180), 
        .Z(n3186) );
  C8T28SOI_LR_AOI12X3_P0 U2561 ( .A(acc_mag[90]), .B(n3897), .C(n3603), .Z(
        n3184) );
  C8T28SOI_LR_AOI22X2_P0 U2562 ( .A(acc_mag[92]), .B(n3923), .C(acc_mag[93]), 
        .D(n3912), .Z(n3183) );
  C8T28SOI_LR_OAI211AX3_P0 U2563 ( .A(acc_mag[91]), .B(n3903), .C(n3184), .D(
        n3183), .Z(n3185) );
  C8T28SOI_LR_CBI4I1X3_P0 U2564 ( .A(n3923), .B(acc_mag[76]), .C(n3186), .D(
        n3185), .Z(n3187) );
  C8T28SOI_LR_NOR3X3_P0 U2565 ( .A(n3189), .B(n3188), .C(n3187), .Z(n3190) );
  C8T28SOI_LR_CNIVX4_P16 U2566 ( .A(n3190), .Z(n3191) );
  C8T28SOI_LR_OAI22X3_P0 U2567 ( .A(n3409), .B(n3193), .C(n3192), .D(n3191), 
        .Z(n3194) );
  C8T28SOI_LR_CBI4I1X3_P0 U2568 ( .A(n3923), .B(acc_mag[64]), .C(n3195), .D(
        n3194), .Z(n3196) );
  C8T28SOI_LR_NAND2X4_P0 U2569 ( .A(n3620), .B(n3196), .Z(n3197) );
  C8T28SOI_LR_OA112X4_P0 U2570 ( .A(n3198), .B(n3620), .C(n3407), .D(n3197), 
        .Z(n925) );
  C8T28SOI_LR_AND2X5_P0 U2571 ( .A(intadd_0_SUM_31_), .B(n3879), .Z(n392) );
  C8T28SOI_LR_CNNOR2X8_P16 U2572 ( .A(acc[53]), .B(n3199), .Z(n3695) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2573 ( .A(acc[54]), .B(n3695), .Z(n3202) );
  C8T28SOI_LR_NAND2X4_P0 U2574 ( .A(acc[101]), .B(n3202), .Z(n3200) );
  C8T28SOI_LR_CNXOR2X9_P16 U2575 ( .A(acc[55]), .S(n3200), .Z(n3201) );
  C8T28SOI_LR_NOR2X4_P0 U2576 ( .A(n2497), .B(n3201), .Z(n837) );
  C8T28SOI_LR_AND2X5_P0 U2577 ( .A(intadd_0_SUM_32_), .B(n3879), .Z(n393) );
  C8T28SOI_LR_AND2X5_P0 U2578 ( .A(intadd_0_SUM_33_), .B(n3879), .Z(n394) );
  C8T28SOI_LR_CNNOR2X8_P16 U2579 ( .A(acc[55]), .B(n3202), .Z(n3692) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2580 ( .A(acc[56]), .B(n3692), .Z(n3205) );
  C8T28SOI_LR_NAND2X4_P0 U2581 ( .A(acc[101]), .B(n3205), .Z(n3203) );
  C8T28SOI_LR_CNXOR2X9_P16 U2582 ( .A(acc[57]), .S(n3203), .Z(n3204) );
  C8T28SOI_LR_NOR2X4_P0 U2583 ( .A(n2497), .B(n3204), .Z(n839) );
  C8T28SOI_LR_AND2X5_P0 U2584 ( .A(intadd_0_SUM_34_), .B(n3879), .Z(n395) );
  C8T28SOI_LR_CNNOR2X8_P16 U2585 ( .A(acc[57]), .B(n3205), .Z(n3689) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2586 ( .A(acc[58]), .B(n3689), .Z(n3208) );
  C8T28SOI_LR_NAND2X4_P0 U2587 ( .A(acc[101]), .B(n3208), .Z(n3206) );
  C8T28SOI_LR_CNXOR2X9_P16 U2588 ( .A(acc[59]), .S(n3206), .Z(n3207) );
  C8T28SOI_LR_NOR2X4_P0 U2589 ( .A(n2497), .B(n3207), .Z(n841) );
  C8T28SOI_LR_AND2X5_P0 U2590 ( .A(intadd_0_SUM_35_), .B(n3879), .Z(n396) );
  C8T28SOI_LR_CNNOR2X8_P16 U2591 ( .A(acc[59]), .B(n3208), .Z(n3686) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2592 ( .A(acc[60]), .B(n3686), .Z(n3211) );
  C8T28SOI_LR_NAND2X4_P0 U2593 ( .A(acc[101]), .B(n3211), .Z(n3209) );
  C8T28SOI_LR_CNXOR2X9_P16 U2594 ( .A(acc[61]), .S(n3209), .Z(n3210) );
  C8T28SOI_LR_NOR2X4_P0 U2595 ( .A(n2497), .B(n3210), .Z(n843) );
  C8T28SOI_LR_AND2X5_P0 U2596 ( .A(intadd_0_SUM_36_), .B(n3879), .Z(n397) );
  C8T28SOI_LR_CNNOR2X8_P16 U2597 ( .A(acc[61]), .B(n3211), .Z(n3683) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2598 ( .A(acc[62]), .B(n3683), .Z(n3214) );
  C8T28SOI_LR_NAND2X4_P0 U2599 ( .A(acc[101]), .B(n3214), .Z(n3212) );
  C8T28SOI_LR_CNXOR2X9_P16 U2600 ( .A(acc[63]), .S(n3212), .Z(n3213) );
  C8T28SOI_LR_NOR2X4_P0 U2601 ( .A(n2497), .B(n3213), .Z(n845) );
  C8T28SOI_LR_AND2X5_P0 U2602 ( .A(intadd_0_SUM_37_), .B(n3879), .Z(n398) );
  C8T28SOI_LR_AND2X5_P0 U2603 ( .A(intadd_0_SUM_38_), .B(n3879), .Z(n399) );
  C8T28SOI_LR_CNNOR2X8_P16 U2604 ( .A(acc[63]), .B(n3214), .Z(n3680) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2605 ( .A(acc[64]), .B(n3680), .Z(n3219) );
  C8T28SOI_LR_NAND2X4_P0 U2606 ( .A(acc[101]), .B(n3219), .Z(n3215) );
  C8T28SOI_LR_CNXOR2X9_P16 U2607 ( .A(acc[65]), .S(n3215), .Z(n3216) );
  C8T28SOI_LR_NOR2X4_P0 U2608 ( .A(n2497), .B(n3216), .Z(n847) );
  C8T28SOI_LR_AND2X5_P0 U2609 ( .A(intadd_0_SUM_39_), .B(n3879), .Z(n400) );
  C8T28SOI_LR_CNNOR2X8_P16 U2611 ( .A(acc[65]), .B(n3219), .Z(n3677) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2612 ( .A(acc[66]), .B(n3677), .Z(n3223) );
  C8T28SOI_LR_NAND2X4_P0 U2613 ( .A(acc[101]), .B(n3223), .Z(n3220) );
  C8T28SOI_LR_CNXOR2X9_P16 U2614 ( .A(acc[67]), .S(n3220), .Z(n3221) );
  C8T28SOI_LR_CNNOR2X8_P16 U2615 ( .A(n2497), .B(n3221), .Z(n849) );
  C8T28SOI_LR_AND2X5_P0 U2616 ( .A(intadd_0_SUM_40_), .B(n3879), .Z(n401) );
  C8T28SOI_LR_CNNOR2X8_P16 U2617 ( .A(acc[67]), .B(n3223), .Z(n3674) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2618 ( .A(acc[68]), .B(n3674), .Z(n3226) );
  C8T28SOI_LR_NAND2X4_P0 U2619 ( .A(acc[101]), .B(n3226), .Z(n3224) );
  C8T28SOI_LR_CNXOR2X9_P16 U2620 ( .A(acc[69]), .S(n3224), .Z(n3225) );
  C8T28SOI_LR_NOR2X4_P0 U2621 ( .A(n2497), .B(n3225), .Z(n851) );
  C8T28SOI_LR_AND2X5_P0 U2622 ( .A(intadd_0_SUM_41_), .B(n3879), .Z(n402) );
  C8T28SOI_LR_CNNOR2X8_P16 U2623 ( .A(acc[69]), .B(n3226), .Z(n3671) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2624 ( .A(acc[70]), .B(n3671), .Z(n3229) );
  C8T28SOI_LR_NAND2X4_P0 U2625 ( .A(acc[101]), .B(n3229), .Z(n3227) );
  C8T28SOI_LR_CNXOR2X9_P16 U2626 ( .A(acc[71]), .S(n3227), .Z(n3228) );
  C8T28SOI_LR_NOR2X4_P0 U2627 ( .A(n2497), .B(n3228), .Z(n853) );
  C8T28SOI_LR_AND2X5_P0 U2628 ( .A(intadd_0_SUM_42_), .B(n3879), .Z(n403) );
  C8T28SOI_LR_AND2X5_P0 U2629 ( .A(intadd_0_SUM_43_), .B(n3879), .Z(n404) );
  C8T28SOI_LR_CNNOR2X8_P16 U2630 ( .A(acc[71]), .B(n3229), .Z(n3668) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2631 ( .A(acc[72]), .B(n3668), .Z(n3232) );
  C8T28SOI_LR_NAND2X4_P0 U2632 ( .A(acc[101]), .B(n3232), .Z(n3230) );
  C8T28SOI_LR_CNXOR2X9_P16 U2633 ( .A(acc[73]), .S(n3230), .Z(n3231) );
  C8T28SOI_LR_NOR2X4_P0 U2634 ( .A(n2497), .B(n3231), .Z(n855) );
  C8T28SOI_LR_AND2X5_P0 U2635 ( .A(intadd_0_SUM_44_), .B(n3879), .Z(n405) );
  C8T28SOI_LR_CNNOR2X8_P16 U2636 ( .A(acc[73]), .B(n3232), .Z(n3665) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2637 ( .A(acc[74]), .B(n3665), .Z(n3235) );
  C8T28SOI_LR_NAND2X4_P0 U2638 ( .A(acc[101]), .B(n3235), .Z(n3233) );
  C8T28SOI_LR_CNXOR2X9_P16 U2639 ( .A(acc[75]), .S(n3233), .Z(n3234) );
  C8T28SOI_LR_NOR2X4_P0 U2640 ( .A(n2497), .B(n3234), .Z(n857) );
  C8T28SOI_LR_AND2X5_P0 U2641 ( .A(intadd_0_SUM_45_), .B(n3875), .Z(n406) );
  C8T28SOI_LR_CNNOR2X8_P16 U2642 ( .A(acc[75]), .B(n3235), .Z(n3662) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2643 ( .A(acc[76]), .B(n3662), .Z(n3238) );
  C8T28SOI_LR_NAND2X4_P0 U2644 ( .A(acc[101]), .B(n3238), .Z(n3236) );
  C8T28SOI_LR_CNXOR2X9_P16 U2645 ( .A(acc[77]), .S(n3236), .Z(n3237) );
  C8T28SOI_LR_NOR2X4_P0 U2646 ( .A(n2497), .B(n3237), .Z(n859) );
  C8T28SOI_LR_AND2X5_P0 U2647 ( .A(intadd_0_SUM_46_), .B(n3875), .Z(n407) );
  C8T28SOI_LR_CNNOR2X8_P16 U2648 ( .A(acc[77]), .B(n3238), .Z(n3659) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2649 ( .A(acc[78]), .B(n3659), .Z(n3241) );
  C8T28SOI_LR_NAND2X4_P0 U2650 ( .A(acc[101]), .B(n3241), .Z(n3239) );
  C8T28SOI_LR_CNXOR2X9_P16 U2651 ( .A(acc[79]), .S(n3239), .Z(n3240) );
  C8T28SOI_LR_NOR2X4_P0 U2652 ( .A(n2497), .B(n3240), .Z(n861) );
  C8T28SOI_LR_AND2X5_P0 U2653 ( .A(intadd_0_SUM_47_), .B(n3875), .Z(n408) );
  C8T28SOI_LR_CNNOR2X8_P16 U2654 ( .A(acc[79]), .B(n3241), .Z(n3656) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2655 ( .A(acc[80]), .B(n3656), .Z(n3244) );
  C8T28SOI_LR_NAND2X4_P0 U2656 ( .A(acc[101]), .B(n3244), .Z(n3242) );
  C8T28SOI_LR_CNXOR2X9_P16 U2657 ( .A(acc[81]), .S(n3242), .Z(n3243) );
  C8T28SOI_LR_NOR2X4_P0 U2658 ( .A(n2497), .B(n3243), .Z(n863) );
  C8T28SOI_LR_AND2X5_P0 U2659 ( .A(intadd_0_SUM_48_), .B(n3875), .Z(n409) );
  C8T28SOI_LR_AND2X5_P0 U2660 ( .A(intadd_0_SUM_49_), .B(n3875), .Z(n410) );
  C8T28SOI_LR_CNNOR2X8_P16 U2661 ( .A(acc[81]), .B(n3244), .Z(n3652) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2662 ( .A(acc[82]), .B(n3652), .Z(n3247) );
  C8T28SOI_LR_NAND2X4_P0 U2663 ( .A(acc[101]), .B(n3247), .Z(n3245) );
  C8T28SOI_LR_CNXOR2X9_P16 U2664 ( .A(acc[83]), .S(n3245), .Z(n3246) );
  C8T28SOI_LR_NOR2X4_P0 U2665 ( .A(n2497), .B(n3246), .Z(n865) );
  C8T28SOI_LR_AND2X5_P0 U2666 ( .A(intadd_0_SUM_50_), .B(n3875), .Z(n411) );
  C8T28SOI_LR_CNNOR2X8_P16 U2667 ( .A(acc[83]), .B(n3247), .Z(n3648) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2668 ( .A(acc[84]), .B(n3648), .Z(n3250) );
  C8T28SOI_LR_NAND2X4_P0 U2669 ( .A(acc[101]), .B(n3250), .Z(n3248) );
  C8T28SOI_LR_CNXOR2X9_P16 U2670 ( .A(acc[85]), .S(n3248), .Z(n3249) );
  C8T28SOI_LR_NOR2X4_P0 U2671 ( .A(n2497), .B(n3249), .Z(n867) );
  C8T28SOI_LR_AND2X5_P0 U2672 ( .A(intadd_0_SUM_51_), .B(n3875), .Z(n412) );
  C8T28SOI_LR_CNNOR2X8_P16 U2673 ( .A(acc[85]), .B(n3250), .Z(n3645) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2674 ( .A(acc[86]), .B(n3645), .Z(n3253) );
  C8T28SOI_LR_NAND2X4_P0 U2675 ( .A(acc[101]), .B(n3253), .Z(n3251) );
  C8T28SOI_LR_CNXOR2X9_P16 U2676 ( .A(acc[87]), .S(n3251), .Z(n3252) );
  C8T28SOI_LR_NOR2X4_P0 U2677 ( .A(n2497), .B(n3252), .Z(n869) );
  C8T28SOI_LR_AND2X5_P0 U2678 ( .A(intadd_0_SUM_52_), .B(n3875), .Z(n413) );
  C8T28SOI_LR_CNNOR2X8_P16 U2679 ( .A(acc[87]), .B(n3253), .Z(n3642) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2680 ( .A(acc[88]), .B(n3642), .Z(n3257) );
  C8T28SOI_LR_NAND2X4_P0 U2681 ( .A(acc[101]), .B(n3257), .Z(n3254) );
  C8T28SOI_LR_CNXOR2X9_P16 U2682 ( .A(acc[89]), .S(n3254), .Z(n3255) );
  C8T28SOI_LR_NOR2X4_P0 U2683 ( .A(n2497), .B(n3255), .Z(n871) );
  C8T28SOI_LR_AND2X5_P0 U2684 ( .A(intadd_0_SUM_53_), .B(n3875), .Z(n414) );
  C8T28SOI_LR_AND2X5_P0 U2686 ( .A(intadd_0_SUM_54_), .B(n3875), .Z(n415) );
  C8T28SOI_LR_CNNOR2X8_P16 U2687 ( .A(acc[89]), .B(n3257), .Z(n3639) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2688 ( .A(acc[90]), .B(n3639), .Z(n3261) );
  C8T28SOI_LR_NAND2X4_P0 U2689 ( .A(acc[101]), .B(n3261), .Z(n3258) );
  C8T28SOI_LR_CNXOR2X9_P16 U2690 ( .A(acc[91]), .S(n3258), .Z(n3259) );
  C8T28SOI_LR_NOR2X4_P0 U2691 ( .A(n2497), .B(n3259), .Z(n873) );
  C8T28SOI_LR_AND2X5_P0 U2692 ( .A(intadd_0_SUM_55_), .B(n3875), .Z(n416) );
  C8T28SOI_LR_CNNOR2X8_P16 U2693 ( .A(acc[91]), .B(n3261), .Z(n3636) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2694 ( .A(acc[92]), .B(n3636), .Z(n3264) );
  C8T28SOI_LR_NAND2X4_P0 U2695 ( .A(acc[101]), .B(n3264), .Z(n3262) );
  C8T28SOI_LR_CNXOR2X9_P16 U2696 ( .A(acc[93]), .S(n3262), .Z(n3263) );
  C8T28SOI_LR_NOR2X4_P0 U2697 ( .A(n2497), .B(n3263), .Z(n875) );
  C8T28SOI_LR_AND2X5_P0 U2698 ( .A(intadd_0_SUM_56_), .B(n3875), .Z(n417) );
  C8T28SOI_LR_CNNOR2X8_P16 U2699 ( .A(acc[93]), .B(n3264), .Z(n3633) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2700 ( .A(acc[94]), .B(n3633), .Z(n3267) );
  C8T28SOI_LR_NAND2X4_P0 U2701 ( .A(acc[101]), .B(n3267), .Z(n3265) );
  C8T28SOI_LR_CNXOR2X9_P16 U2702 ( .A(acc[95]), .S(n3265), .Z(n3266) );
  C8T28SOI_LR_NOR2X4_P0 U2703 ( .A(n2497), .B(n3266), .Z(n877) );
  C8T28SOI_LR_AND2X5_P0 U2704 ( .A(intadd_0_SUM_57_), .B(n3875), .Z(n418) );
  C8T28SOI_LR_CNNOR2X8_P16 U2705 ( .A(acc[95]), .B(n3267), .Z(n3630) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2706 ( .A(acc[96]), .B(n3630), .Z(n3270) );
  C8T28SOI_LR_NAND2X4_P0 U2707 ( .A(acc[101]), .B(n3270), .Z(n3268) );
  C8T28SOI_LR_CNXOR2X9_P16 U2708 ( .A(acc[97]), .S(n3268), .Z(n3269) );
  C8T28SOI_LR_NOR2X4_P0 U2709 ( .A(n2497), .B(n3269), .Z(n879) );
  C8T28SOI_LR_AND2X5_P0 U2710 ( .A(intadd_0_SUM_58_), .B(n3875), .Z(n419) );
  C8T28SOI_LR_AND2X5_P0 U2711 ( .A(intadd_0_SUM_59_), .B(n3875), .Z(n420) );
  C8T28SOI_LR_CNNOR2X8_P16 U2712 ( .A(acc[97]), .B(n3270), .Z(n3627) );
  C8T28SOI_LR_CNNAND2AX9_P16 U2713 ( .A(acc[98]), .B(n3627), .Z(n3275) );
  C8T28SOI_LR_NAND2X4_P0 U2714 ( .A(acc[101]), .B(n3275), .Z(n3272) );
  C8T28SOI_LR_CNXOR2X9_P16 U2715 ( .A(acc[99]), .S(n3272), .Z(n3273) );
  C8T28SOI_LR_NOR2X4_P0 U2716 ( .A(n2497), .B(n3273), .Z(n881) );
  C8T28SOI_LR_NOR2X4_P0 U2719 ( .A(n2497), .B(n3867), .Z(n780) );
  C8T28SOI_LR_CNNOR2X8_P16 U2720 ( .A(acc[99]), .B(n3275), .Z(n3623) );
  C8T28SOI_LR_NOR3BCX4_P0 U2721 ( .B(n3623), .C(n780), .A(acc[100]), .Z(n883)
         );
  C8T28SOI_LR_AND2X5_P0 U2722 ( .A(intadd_0_SUM_60_), .B(n3875), .Z(n421) );
  C8T28SOI_LR_AND2X5_P0 U2723 ( .A(intadd_0_SUM_61_), .B(n3875), .Z(n422) );
  C8T28SOI_LR_AND2X5_P0 U2724 ( .A(intadd_0_SUM_62_), .B(n3875), .Z(n423) );
  C8T28SOI_LR_AND2X5_P0 U2725 ( .A(intadd_0_SUM_63_), .B(n3875), .Z(n424) );
  C8T28SOI_LR_AND2X5_P0 U2726 ( .A(intadd_0_SUM_64_), .B(n3875), .Z(n425) );
  C8T28SOI_LR_AND2X5_P0 U2727 ( .A(intadd_0_SUM_65_), .B(n3880), .Z(n426) );
  C8T28SOI_LR_AND2X5_P0 U2728 ( .A(intadd_0_SUM_66_), .B(n3880), .Z(n427) );
  C8T28SOI_LR_AND2X5_P0 U2729 ( .A(intadd_0_SUM_67_), .B(n3880), .Z(n428) );
  C8T28SOI_LR_AND2X5_P0 U2731 ( .A(intadd_0_SUM_68_), .B(n3880), .Z(n429) );
  C8T28SOI_LR_AND2X5_P0 U2732 ( .A(intadd_0_SUM_69_), .B(n3880), .Z(n430) );
  C8T28SOI_LR_AND2X5_P0 U2733 ( .A(intadd_0_SUM_70_), .B(n3880), .Z(n431) );
  C8T28SOI_LR_AND2X5_P0 U2734 ( .A(intadd_0_SUM_71_), .B(n3880), .Z(n432) );
  C8T28SOI_LR_AND2X5_P0 U2735 ( .A(intadd_0_SUM_72_), .B(n3880), .Z(n433) );
  C8T28SOI_LR_AND2X5_P0 U2736 ( .A(intadd_0_SUM_73_), .B(n3880), .Z(n434) );
  C8T28SOI_LR_AND2X5_P0 U2737 ( .A(intadd_0_SUM_74_), .B(n3880), .Z(n435) );
  C8T28SOI_LR_AND2X5_P0 U2738 ( .A(intadd_0_SUM_75_), .B(n3880), .Z(n436) );
  C8T28SOI_LR_AND2X5_P0 U2739 ( .A(intadd_0_SUM_76_), .B(n3880), .Z(n437) );
  C8T28SOI_LR_AND2X5_P0 U2740 ( .A(intadd_0_SUM_77_), .B(n3880), .Z(n438) );
  C8T28SOI_LR_AND2X5_P0 U2741 ( .A(intadd_0_SUM_78_), .B(n3880), .Z(n439) );
  C8T28SOI_LR_AND2X5_P0 U2742 ( .A(intadd_0_SUM_79_), .B(n3880), .Z(n440) );
  C8T28SOI_LR_AND2X5_P0 U2743 ( .A(intadd_0_SUM_80_), .B(n3880), .Z(n441) );
  C8T28SOI_LR_AND2X5_P0 U2744 ( .A(intadd_0_SUM_81_), .B(n3880), .Z(n442) );
  C8T28SOI_LR_AND2X5_P0 U2746 ( .A(intadd_0_SUM_82_), .B(n3880), .Z(n443) );
  C8T28SOI_LR_AND2X5_P0 U2747 ( .A(intadd_0_SUM_83_), .B(n3880), .Z(n444) );
  C8T28SOI_LR_AND2X5_P0 U2748 ( .A(intadd_0_SUM_84_), .B(n3880), .Z(n445) );
  C8T28SOI_LR_AND2X5_P0 U2749 ( .A(intadd_0_SUM_85_), .B(n3880), .Z(n446) );
  C8T28SOI_LR_AND2X5_P0 U2750 ( .A(intadd_0_SUM_86_), .B(n3880), .Z(n447) );
  C8T28SOI_LR_AND2X5_P0 U2751 ( .A(intadd_0_SUM_87_), .B(n3880), .Z(n448) );
  C8T28SOI_LR_AND2X5_P0 U2752 ( .A(intadd_0_SUM_88_), .B(n3880), .Z(n449) );
  C8T28SOI_LR_AND2X5_P0 U2753 ( .A(intadd_0_SUM_89_), .B(n3880), .Z(n450) );
  C8T28SOI_LR_AND2X5_P0 U2754 ( .A(intadd_0_SUM_90_), .B(n3880), .Z(n451) );
  C8T28SOI_LR_AND2X5_P0 U2755 ( .A(intadd_0_SUM_91_), .B(n3880), .Z(n452) );
  C8T28SOI_LR_AND2X5_P0 U2756 ( .A(intadd_0_SUM_92_), .B(n3880), .Z(n453) );
  C8T28SOI_LR_AND2X5_P0 U2757 ( .A(intadd_0_SUM_93_), .B(n3875), .Z(n454) );
  C8T28SOI_LR_AND2X5_P0 U2758 ( .A(intadd_0_SUM_94_), .B(n3875), .Z(n455) );
  C8T28SOI_LR_AND2X5_P0 U2759 ( .A(intadd_0_SUM_95_), .B(n3875), .Z(n456) );
  C8T28SOI_LR_AND2X5_P0 U2761 ( .A(intadd_0_SUM_96_), .B(n3875), .Z(n457) );
  C8T28SOI_LR_AND2X5_P0 U2762 ( .A(intadd_0_SUM_97_), .B(n3875), .Z(n458) );
  C8T28SOI_LR_AND2X5_P0 U2763 ( .A(intadd_0_SUM_98_), .B(n3875), .Z(n459) );
  C8T28SOI_LR_AND2X5_P0 U2764 ( .A(intadd_0_SUM_99_), .B(n3875), .Z(n460) );
  C8T28SOI_LR_CNXOR2X9_P16 U2767 ( .A(n3867), .S(intadd_0_n1), .Z(n3283) );
  C8T28SOI_LR_CNXOR2X9_P16 U2768 ( .A(mts_fx[101]), .S(n3283), .Z(n3284) );
  C8T28SOI_LR_CNNOR2X8_P16 U2769 ( .A(n3783), .B(n3284), .Z(n461) );
  C8T28SOI_LR_OAI12X3_P0 U2770 ( .A(n3333), .B(n3285), .C(n3301), .Z(n182) );
  C8T28SOI_LR_OAI12X3_P0 U2771 ( .A(n3332), .B(n3285), .C(n3301), .Z(n181) );
  C8T28SOI_LR_OAI12X3_P0 U2772 ( .A(n3335), .B(n3285), .C(n3301), .Z(n184) );
  C8T28SOI_LR_OAI12X3_P0 U2773 ( .A(n3334), .B(n3285), .C(n3301), .Z(n183) );
  C8T28SOI_LR_OAI12X3_P0 U2774 ( .A(n3339), .B(n3285), .C(n3301), .Z(n187) );
  C8T28SOI_LR_CNIVX4_P16 U2775 ( .A(n3781), .Z(n3286) );
  C8T28SOI_LR_FA1X4_P0 U2776 ( .A0(acc[1]), .B0(mts_fx[1]), .CI(n3286), .CO(
        intadd_0_n100), .S0(SYNOPSYS_UNCONNECTED_1) );
  C8T28SOI_LR_OA12X5_P0 U2778 ( .A(sf_w[4]), .B(sf_d[4]), .C(n3287), .Z(
        intadd_1_A_4_) );
  C8T28SOI_LR_CNXOR2X9_P16 U2779 ( .A(sf_w[2]), .S(sf_d[2]), .Z(intadd_1_A_2_)
         );
  C8T28SOI_LR_CNXOR2X9_P16 U2780 ( .A(sf_w[1]), .S(sf_d[1]), .Z(intadd_1_B_1_)
         );
  C8T28SOI_LR_NOR3X3_P0 U2781 ( .A(n3288), .B(n3290), .C(n3299), .Z(n133) );
  C8T28SOI_LR_NOR3X3_P0 U2782 ( .A(n3289), .B(n3290), .C(n3299), .Z(n134) );
  C8T28SOI_LR_NOR3X3_P0 U2783 ( .A(n3291), .B(n3290), .C(n3299), .Z(n135) );
  C8T28SOI_LR_OAI22AX3_P0 U2784 ( .A(n3309), .B(n3294), .C(n3292), .D(n3302), 
        .Z(n169) );
  C8T28SOI_LR_OAI22AX3_P0 U2785 ( .A(n3314), .B(n3294), .C(n3293), .D(n3302), 
        .Z(n170) );
  C8T28SOI_LR_AOI22X2_P0 U2786 ( .A(sf_bias[5]), .B(n3297), .C(n3296), .D(
        n3295), .Z(n3298) );
  C8T28SOI_LR_OAI22X3_P0 U2787 ( .A(n3300), .B(n3299), .C(n3298), .D(n3872), 
        .Z(n171) );
  C8T28SOI_LR_OAI12X3_P0 U2788 ( .A(n3320), .B(n3302), .C(n3301), .Z(n172) );
  C8T28SOI_LR_OAI12X3_P0 U2789 ( .A(n3321), .B(n3302), .C(n3301), .Z(n173) );
  C8T28SOI_LR_OAI12X3_P0 U2790 ( .A(n3322), .B(n3302), .C(n3301), .Z(n174) );
  C8T28SOI_LR_OAI12X3_P0 U2791 ( .A(n3323), .B(n3302), .C(n3301), .Z(n175) );
  C8T28SOI_LR_OAI12X3_P0 U2792 ( .A(n3324), .B(n3302), .C(n3301), .Z(n176) );
  C8T28SOI_LR_OAI12X3_P0 U2793 ( .A(n3326), .B(n3302), .C(n3301), .Z(n177) );
  C8T28SOI_LR_OAI12X3_P0 U2794 ( .A(n3327), .B(n3302), .C(n3301), .Z(n178) );
  C8T28SOI_LR_OAI12X3_P0 U2795 ( .A(n3328), .B(n3302), .C(n3301), .Z(n179) );
  C8T28SOI_LR_OAI12X3_P0 U2796 ( .A(n3330), .B(n3302), .C(n3301), .Z(n180) );
  C8T28SOI_LR_NAND2X4_P0 U2797 ( .A(n3304), .B(n3303), .Z(n3305) );
  C8T28SOI_LR_OAI211X3_P0 U2798 ( .A(n3308), .B(n3307), .C(n3306), .D(n3305), 
        .Z(n200) );
  C8T28SOI_LR_CBI4I6X3_P0 U2799 ( .A(n3309), .B(n3858), .C(n3312), .D(
        sf_bias[6]), .Z(n3310) );
  C8T28SOI_LR_CBI4I6X3_P0 U2800 ( .A(n3318), .B(n3311), .C(n3872), .D(n3310), 
        .Z(n201) );
  C8T28SOI_LR_CBI4I6X3_P0 U2801 ( .A(n3314), .B(n3858), .C(n3312), .D(
        sf_bias[6]), .Z(n3315) );
  C8T28SOI_LR_CBI4I6X3_P0 U2802 ( .A(n3318), .B(n3317), .C(n3872), .D(n3315), 
        .Z(n202) );
  C8T28SOI_LR_NAND2X4_P0 U2803 ( .A(n3331), .B(n3859), .Z(n3329) );
  C8T28SOI_LR_OAI12X3_P0 U2804 ( .A(n3320), .B(n3329), .C(n3325), .Z(n204) );
  C8T28SOI_LR_OAI12X3_P0 U2805 ( .A(n3321), .B(n3329), .C(n3325), .Z(n205) );
  C8T28SOI_LR_OAI12X3_P0 U2806 ( .A(n3322), .B(n3329), .C(n3325), .Z(n206) );
  C8T28SOI_LR_OAI12X3_P0 U2807 ( .A(n3323), .B(n3329), .C(n3325), .Z(n207) );
  C8T28SOI_LR_OAI12X3_P0 U2808 ( .A(n3324), .B(n3329), .C(n3325), .Z(n208) );
  C8T28SOI_LR_OAI12X3_P0 U2810 ( .A(n3326), .B(n3329), .C(n3325), .Z(n209) );
  C8T28SOI_LR_OAI12X3_P0 U2811 ( .A(n3327), .B(n3329), .C(n3325), .Z(n210) );
  C8T28SOI_LR_OAI12X3_P0 U2812 ( .A(n3328), .B(n3329), .C(n3325), .Z(n211) );
  C8T28SOI_LR_OAI12X3_P0 U2813 ( .A(n3330), .B(n3329), .C(n3325), .Z(n212) );
  C8T28SOI_LR_CNIVX4_P16 U2814 ( .A(n3331), .Z(n3338) );
  C8T28SOI_LR_OAI12X3_P0 U2815 ( .A(n3332), .B(n3338), .C(n3325), .Z(n213) );
  C8T28SOI_LR_OAI12X3_P0 U2816 ( .A(n3333), .B(n3338), .C(n3325), .Z(n214) );
  C8T28SOI_LR_OAI12X3_P0 U2817 ( .A(n3334), .B(n3338), .C(n3325), .Z(n215) );
  C8T28SOI_LR_OAI12X3_P0 U2818 ( .A(n3335), .B(n3338), .C(n3325), .Z(n216) );
  C8T28SOI_LR_OAI12X3_P0 U2819 ( .A(n3356), .B(n3336), .C(n3325), .Z(n217) );
  C8T28SOI_LR_OAI12X3_P0 U2820 ( .A(n3356), .B(n3337), .C(n3325), .Z(n218) );
  C8T28SOI_LR_OAI12X3_P0 U2821 ( .A(n3339), .B(n3338), .C(n3325), .Z(n219) );
  C8T28SOI_LR_OAI12X3_P0 U2822 ( .A(n3356), .B(n3340), .C(n3325), .Z(n220) );
  C8T28SOI_LR_OAI12X3_P0 U2823 ( .A(n3356), .B(n3341), .C(n3325), .Z(n221) );
  C8T28SOI_LR_OAI12X3_P0 U2824 ( .A(n3356), .B(n3342), .C(n3325), .Z(n222) );
  C8T28SOI_LR_OAI12X3_P0 U2825 ( .A(n3356), .B(n3343), .C(n3325), .Z(n223) );
  C8T28SOI_LR_OAI12X3_P0 U2826 ( .A(n3356), .B(n3344), .C(n3325), .Z(n224) );
  C8T28SOI_LR_OAI12X3_P0 U2827 ( .A(n3356), .B(n3345), .C(n3325), .Z(n225) );
  C8T28SOI_LR_OAI12X3_P0 U2828 ( .A(n3356), .B(n3347), .C(n3325), .Z(n226) );
  C8T28SOI_LR_OAI12X3_P0 U2829 ( .A(n3356), .B(n3348), .C(n3325), .Z(n227) );
  C8T28SOI_LR_OAI12X3_P0 U2830 ( .A(n3356), .B(n3349), .C(n3325), .Z(n228) );
  C8T28SOI_LR_OAI12X3_P0 U2831 ( .A(n3356), .B(n3350), .C(n3325), .Z(n229) );
  C8T28SOI_LR_OAI12X3_P0 U2832 ( .A(n3356), .B(n3351), .C(n3325), .Z(n230) );
  C8T28SOI_LR_OAI12X3_P0 U2833 ( .A(n3356), .B(n3353), .C(n3325), .Z(n231) );
  C8T28SOI_LR_OAI12X3_P0 U2834 ( .A(n3356), .B(n3355), .C(n3325), .Z(n232) );
  C8T28SOI_LR_NOR2X4_P0 U2835 ( .A(mts_m[7]), .B(mts_m[6]), .Z(n3361) );
  C8T28SOI_LR_OAI12X3_P0 U2836 ( .A(n3358), .B(n3357), .C(sign_m), .Z(n3360)
         );
  C8T28SOI_LR_OAI12X3_P0 U2837 ( .A(n3361), .B(n3359), .C(n3360), .Z(n132) );
  C8T28SOI_LR_CNXOR2X9_P16 U2838 ( .A(n3361), .S(n3360), .Z(n131) );
  C8T28SOI_LR_CNIVX4_P16 U2839 ( .A(mts_m[1]), .Z(n3363) );
  C8T28SOI_LR_CBI4I1X3_P0 U2840 ( .A(sign_m), .B(n3363), .C(n3857), .D(
        mts_m[0]), .Z(n3364) );
  C8T28SOI_LR_CBI4I1X3_P0 U2841 ( .A(mts_m[0]), .B(sign_m), .C(n3365), .D(
        n3364), .Z(n125) );
  C8T28SOI_LR_AOI211X2_P0 U2842 ( .A(n3368), .B(n3367), .C(n3366), .D(n3415), 
        .Z(n1154) );
  C8T28SOI_LR_AOI211X2_P0 U2843 ( .A(n3371), .B(n3370), .C(n3369), .D(n3415), 
        .Z(n1152) );
  C8T28SOI_LR_NAND2X4_P0 U2844 ( .A(sign_q), .B(n3372), .Z(n3373) );
  C8T28SOI_LR_CNXOR2X9_P16 U2845 ( .A(acc_o_tmp[6]), .S(n3373), .Z(n3375) );
  C8T28SOI_LR_NAND2X4_P0 U2846 ( .A(n3374), .B(n3382), .Z(n3389) );
  C8T28SOI_LR_OAI12X3_P0 U2847 ( .A(n3391), .B(n3375), .C(n3389), .Z(n1165) );
  C8T28SOI_LR_NOR2X4_P0 U2848 ( .A(n3376), .B(n3382), .Z(n3377) );
  C8T28SOI_LRS_XNOR2X3_P0 U2849 ( .A(n3377), .B(acc_o_tmp[5]), .Z(n3378) );
  C8T28SOI_LR_OAI12X3_P0 U2850 ( .A(n3391), .B(n3378), .C(n3389), .Z(n1164) );
  C8T28SOI_LR_NAND2X4_P0 U2851 ( .A(sign_q), .B(n3379), .Z(n3380) );
  C8T28SOI_LR_CNXOR2X9_P16 U2852 ( .A(acc_o_tmp[4]), .S(n3380), .Z(n3381) );
  C8T28SOI_LR_OAI12X3_P0 U2853 ( .A(n3391), .B(n3381), .C(n3389), .Z(n1163) );
  C8T28SOI_LR_NOR2X4_P0 U2854 ( .A(n3383), .B(n3382), .Z(n3384) );
  C8T28SOI_LRS_XNOR2X3_P0 U2855 ( .A(n3384), .B(acc_o_tmp[3]), .Z(n3385) );
  C8T28SOI_LR_OAI12X3_P0 U2856 ( .A(n3391), .B(n3385), .C(n3389), .Z(n1162) );
  C8T28SOI_LR_OAI12X3_P0 U2857 ( .A(acc_o_tmp[0]), .B(acc_o_tmp[1]), .C(sign_q), .Z(n3386) );
  C8T28SOI_LR_CNXOR2X9_P16 U2858 ( .A(acc_o_tmp[2]), .S(n3386), .Z(n3387) );
  C8T28SOI_LR_OAI12X3_P0 U2859 ( .A(n3391), .B(n3387), .C(n3389), .Z(n1161) );
  C8T28SOI_LR_NAND2X4_P0 U2860 ( .A(sign_q), .B(acc_o_tmp[0]), .Z(n3388) );
  C8T28SOI_LR_CNXOR2X9_P16 U2861 ( .A(acc_o_tmp[1]), .S(n3388), .Z(n3390) );
  C8T28SOI_LR_OAI12X3_P0 U2862 ( .A(n3391), .B(n3390), .C(n3389), .Z(n1160) );
  C8T28SOI_LR_OAI12X3_P0 U2863 ( .A(regi_p[0]), .B(regi_p[1]), .C(n1073), .Z(
        n3392) );
  C8T28SOI_LR_OAI12X3_P0 U2864 ( .A(regi_p[2]), .B(n3393), .C(n3392), .Z(n1076) );
  C8T28SOI_LR_AOI22X2_P0 U2865 ( .A(n3397), .B(n3396), .C(n3395), .D(n3394), 
        .Z(n3401) );
  C8T28SOI_LR_NAND2X4_P0 U2866 ( .A(n3399), .B(n3398), .Z(n3400) );
  C8T28SOI_LR_OAI211AX3_P0 U2867 ( .A(n3403), .B(n3402), .C(n3401), .D(n3400), 
        .Z(n1089) );
  C8T28SOI_LR_OAI12X3_P0 U2868 ( .A(n3417), .B(n3418), .C(n3404), .Z(n3414) );
  C8T28SOI_LR_NAND2X4_P0 U2869 ( .A(n3411), .B(n3414), .Z(n3410) );
  C8T28SOI_LR_AOI12X3_P0 U2870 ( .A(n3406), .B(n3410), .C(n3405), .Z(n921) );
  C8T28SOI_LR_CNIVX4_P16 U2871 ( .A(n3410), .Z(n3408) );
  C8T28SOI_LR_CNIVX4_P16 U2872 ( .A(n3407), .Z(n3618) );
  C8T28SOI_LR_AOI212X3_P0 U2873 ( .A(n3616), .B(n3410), .C(n3409), .D(n3408), 
        .E(n3618), .Z(n920) );
  C8T28SOI_LR_CBI4I6X3_P0 U2874 ( .A(n3411), .B(n3414), .C(n3410), .D(n3618), 
        .Z(n919) );
  C8T28SOI_LR_NAND2X4_P0 U2875 ( .A(n3419), .B(n3412), .Z(n3413) );
  C8T28SOI_LR_CNAND3X10_P10 U2876 ( .A(n3414), .B(n3889), .C(n3413), .Z(n918)
         );
  C8T28SOI_LR_AOI212X3_P0 U2877 ( .A(n3419), .B(n3418), .C(n3417), .D(n3416), 
        .E(n3415), .Z(n917) );
  C8T28SOI_LR_CNIVX4_P16 U2878 ( .A(n3557), .Z(n3451) );
  C8T28SOI_LR_NAND3X3_P0 U2879 ( .A(n3433), .B(n3485), .C(n3451), .Z(n929) );
  C8T28SOI_LR_OAI22X3_P0 U2880 ( .A(n3612), .B(n3421), .C(n3597), .D(n3420), 
        .Z(n3466) );
  C8T28SOI_LR_OAI22X3_P0 U2881 ( .A(n3603), .B(n3423), .C(n3893), .D(n3422), 
        .Z(n3427) );
  C8T28SOI_LR_OAI22X3_P0 U2882 ( .A(n3894), .B(n3425), .C(n3610), .D(n3424), 
        .Z(n3426) );
  C8T28SOI_LR_NOR3X3_P0 U2883 ( .A(n3485), .B(n3427), .C(n3426), .Z(n3431) );
  C8T28SOI_LR_OAI22X3_P0 U2884 ( .A(acc_mag[99]), .B(n3914), .C(acc_mag[98]), 
        .D(n3918), .Z(n3429) );
  C8T28SOI_LR_OAI22X3_P0 U2885 ( .A(acc_mag[96]), .B(n3486), .C(acc_mag[97]), 
        .D(n3903), .Z(n3428) );
  C8T28SOI_LR_OAI12X3_P0 U2886 ( .A(n3429), .B(n3428), .C(n3895), .Z(n3430) );
  C8T28SOI_LR_OAI211X3_P0 U2887 ( .A(n3432), .B(n3892), .C(n3431), .D(n3430), 
        .Z(n3465) );
  C8T28SOI_LR_CNIVX4_P16 U2888 ( .A(n3433), .Z(n3561) );
  C8T28SOI_LR_OAI22X3_P0 U2889 ( .A(n3601), .B(n3435), .C(n3892), .D(n3434), 
        .Z(n3446) );
  C8T28SOI_LR_OAI22X3_P0 U2890 ( .A(n3603), .B(n3437), .C(n3893), .D(n3436), 
        .Z(n3444) );
  C8T28SOI_LR_OAI22X3_P0 U2891 ( .A(n3612), .B(n3439), .C(n3610), .D(n3438), 
        .Z(n3443) );
  C8T28SOI_LR_OAI22X3_P0 U2892 ( .A(n3597), .B(n3441), .C(n3894), .D(n3440), 
        .Z(n3442) );
  C8T28SOI_LR_OR3X5_P0 U2893 ( .A(n3444), .B(n3443), .C(n3442), .Z(n3445) );
  C8T28SOI_LR_OAI22X3_P0 U2894 ( .A(n3447), .B(n3520), .C(n3446), .D(n3445), 
        .Z(n3463) );
  C8T28SOI_LR_OAI22X3_P0 U2895 ( .A(n3601), .B(n3449), .C(n3892), .D(n3448), 
        .Z(n3450) );
  C8T28SOI_LR_CNNOR2X8_P16 U2896 ( .A(n3451), .B(n3450), .Z(n3462) );
  C8T28SOI_LR_OAI22X3_P0 U2897 ( .A(n3612), .B(n3453), .C(n3894), .D(n3452), 
        .Z(n3460) );
  C8T28SOI_LR_OAI22X3_P0 U2898 ( .A(n3610), .B(n3455), .C(n3603), .D(n3454), 
        .Z(n3459) );
  C8T28SOI_LR_OAI22X3_P0 U2899 ( .A(n3597), .B(n3457), .C(n3893), .D(n3456), 
        .Z(n3458) );
  C8T28SOI_LR_NOR3X3_P0 U2900 ( .A(n3460), .B(n3459), .C(n3458), .Z(n3461) );
  C8T28SOI_LR_AOI22X2_P0 U2901 ( .A(n3561), .B(n3463), .C(n3462), .D(n3461), 
        .Z(n3464) );
  C8T28SOI_LR_OAI12X3_P0 U2902 ( .A(n3466), .B(n3465), .C(n3464), .Z(n927) );
  C8T28SOI_LR_AOI22X2_P0 U2903 ( .A(acc_mag[85]), .B(n3923), .C(acc_mag[86]), 
        .D(n3912), .Z(n3468) );
  C8T28SOI_LR_AOI22X2_P0 U2904 ( .A(acc_mag[84]), .B(n3902), .C(acc_mag[83]), 
        .D(n3897), .Z(n3467) );
  C8T28SOI_LR_NAND2X4_P0 U2905 ( .A(n3468), .B(n3467), .Z(n3594) );
  C8T28SOI_LR_AOI22X2_P0 U2906 ( .A(acc_mag[73]), .B(n3923), .C(acc_mag[74]), 
        .D(n3912), .Z(n3470) );
  C8T28SOI_LR_AOI22X2_P0 U2907 ( .A(acc_mag[72]), .B(n3902), .C(acc_mag[71]), 
        .D(n3897), .Z(n3469) );
  C8T28SOI_LR_NAND2X4_P0 U2908 ( .A(n3470), .B(n3469), .Z(n3598) );
  C8T28SOI_LR_OAI22X3_P0 U2909 ( .A(n3612), .B(n3594), .C(n3597), .D(n3598), 
        .Z(n3564) );
  C8T28SOI_LR_AOI22X2_P0 U2910 ( .A(acc_mag[81]), .B(n3923), .C(acc_mag[82]), 
        .D(n3912), .Z(n3472) );
  C8T28SOI_LR_AOI22X2_P0 U2911 ( .A(acc_mag[80]), .B(n3902), .C(acc_mag[79]), 
        .D(n3897), .Z(n3471) );
  C8T28SOI_LR_NAND2X4_P0 U2912 ( .A(n3472), .B(n3471), .Z(n3611) );
  C8T28SOI_LR_AOI22X2_P0 U2913 ( .A(acc_mag[93]), .B(n3923), .C(acc_mag[94]), 
        .D(n2907), .Z(n3474) );
  C8T28SOI_LR_AOI22X2_P0 U2914 ( .A(acc_mag[91]), .B(n3897), .C(acc_mag[92]), 
        .D(n3902), .Z(n3473) );
  C8T28SOI_LR_NAND2X4_P0 U2915 ( .A(n3474), .B(n3473), .Z(n3600) );
  C8T28SOI_LR_AOI22X2_P0 U2916 ( .A(acc_mag[77]), .B(n3923), .C(acc_mag[78]), 
        .D(n3912), .Z(n3476) );
  C8T28SOI_LR_AOI22X2_P0 U2917 ( .A(acc_mag[76]), .B(n3902), .C(acc_mag[75]), 
        .D(n3897), .Z(n3475) );
  C8T28SOI_LR_NAND2X4_P0 U2918 ( .A(n3476), .B(n3475), .Z(n3604) );
  C8T28SOI_LR_OAI22X3_P0 U2919 ( .A(n3603), .B(n3600), .C(n3893), .D(n3604), 
        .Z(n3484) );
  C8T28SOI_LR_AOI22X2_P0 U2920 ( .A(acc_mag[89]), .B(n3923), .C(acc_mag[90]), 
        .D(n3912), .Z(n3478) );
  C8T28SOI_LR_AOI22X2_P0 U2921 ( .A(acc_mag[88]), .B(n3902), .C(acc_mag[87]), 
        .D(n3897), .Z(n3477) );
  C8T28SOI_LR_NAND2X4_P0 U2922 ( .A(n3478), .B(n3477), .Z(n3602) );
  C8T28SOI_LR_AOI22X2_P0 U2923 ( .A(acc_mag[69]), .B(n3923), .C(acc_mag[70]), 
        .D(n3912), .Z(n3482) );
  C8T28SOI_LR_AOI22X2_P0 U2924 ( .A(acc_mag[67]), .B(n3897), .C(acc_mag[68]), 
        .D(n3902), .Z(n3481) );
  C8T28SOI_LR_NAND2X4_P0 U2925 ( .A(n3482), .B(n3481), .Z(n3596) );
  C8T28SOI_LR_OAI22X3_P0 U2926 ( .A(n3894), .B(n3602), .C(n3610), .D(n3596), 
        .Z(n3483) );
  C8T28SOI_LR_NOR3X3_P0 U2927 ( .A(n3485), .B(n3484), .C(n3483), .Z(n3492) );
  C8T28SOI_LR_OAI22X3_P0 U2928 ( .A(acc_mag[98]), .B(n3914), .C(acc_mag[97]), 
        .D(n3918), .Z(n3490) );
  C8T28SOI_LR_OAI22X3_P0 U2929 ( .A(acc_mag[96]), .B(n3903), .C(acc_mag[95]), 
        .D(n3486), .Z(n3489) );
  C8T28SOI_LR_OAI12X3_P0 U2930 ( .A(n3490), .B(n3489), .C(n3895), .Z(n3491) );
  C8T28SOI_LR_OAI211X3_P0 U2931 ( .A(n3611), .B(n3892), .C(n3492), .D(n3491), 
        .Z(n3563) );
  C8T28SOI_LR_AOI222X2_P0 U2932 ( .A(acc_mag[2]), .B(n3910), .C(acc_mag[1]), 
        .D(n3919), .E(acc_mag[0]), .F(n3906), .Z(n3574) );
  C8T28SOI_LR_AOI22X2_P0 U2933 ( .A(acc_mag[10]), .B(n3910), .C(acc_mag[9]), 
        .D(n2905), .Z(n3496) );
  C8T28SOI_LR_AOI22X2_P0 U2934 ( .A(acc_mag[8]), .B(n2923), .C(acc_mag[7]), 
        .D(n3899), .Z(n3495) );
  C8T28SOI_LR_NAND2X4_P0 U2935 ( .A(n3496), .B(n3495), .Z(n3567) );
  C8T28SOI_LR_AOI22X2_P0 U2936 ( .A(acc_mag[26]), .B(n3910), .C(acc_mag[25]), 
        .D(n2905), .Z(n3499) );
  C8T28SOI_LR_AOI22X2_P0 U2937 ( .A(acc_mag[24]), .B(n2923), .C(acc_mag[23]), 
        .D(n3899), .Z(n3498) );
  C8T28SOI_LR_NAND2X4_P0 U2938 ( .A(n3499), .B(n3498), .Z(n3568) );
  C8T28SOI_LR_OAI22X3_P0 U2939 ( .A(n3597), .B(n3567), .C(n3894), .D(n3568), 
        .Z(n3519) );
  C8T28SOI_LR_AOI22X2_P0 U2940 ( .A(acc_mag[30]), .B(n3910), .C(acc_mag[29]), 
        .D(n2905), .Z(n3501) );
  C8T28SOI_LR_AOI22X2_P0 U2941 ( .A(acc_mag[28]), .B(n2923), .C(acc_mag[27]), 
        .D(n3899), .Z(n3500) );
  C8T28SOI_LR_NAND2X4_P0 U2942 ( .A(n3501), .B(n3500), .Z(n3570) );
  C8T28SOI_LR_AOI22X2_P0 U2943 ( .A(acc_mag[14]), .B(n3910), .C(acc_mag[13]), 
        .D(n2905), .Z(n3504) );
  C8T28SOI_LR_AOI22X2_P0 U2944 ( .A(acc_mag[12]), .B(n2923), .C(acc_mag[11]), 
        .D(n3899), .Z(n3503) );
  C8T28SOI_LR_NAND2X4_P0 U2945 ( .A(n3504), .B(n3503), .Z(n3578) );
  C8T28SOI_LR_OAI22X3_P0 U2946 ( .A(n3603), .B(n3570), .C(n3893), .D(n3578), 
        .Z(n3517) );
  C8T28SOI_LR_AOI22X2_P0 U2947 ( .A(acc_mag[22]), .B(n3910), .C(acc_mag[21]), 
        .D(n2905), .Z(n3506) );
  C8T28SOI_LR_AOI22X2_P0 U2948 ( .A(acc_mag[20]), .B(n2923), .C(acc_mag[19]), 
        .D(n3899), .Z(n3505) );
  C8T28SOI_LR_NAND2X4_P0 U2949 ( .A(n3506), .B(n3505), .Z(n3565) );
  C8T28SOI_LR_AOI22X2_P0 U2950 ( .A(acc_mag[6]), .B(n3910), .C(acc_mag[5]), 
        .D(n2905), .Z(n3508) );
  C8T28SOI_LR_AOI22X2_P0 U2951 ( .A(acc_mag[4]), .B(n3906), .C(acc_mag[3]), 
        .D(n3899), .Z(n3507) );
  C8T28SOI_LR_NAND2X4_P0 U2952 ( .A(n3508), .B(n3507), .Z(n3566) );
  C8T28SOI_LR_OAI22X3_P0 U2953 ( .A(n3612), .B(n3565), .C(n3610), .D(n3566), 
        .Z(n3516) );
  C8T28SOI_LR_AOI22X2_P0 U2954 ( .A(acc_mag[34]), .B(n3910), .C(acc_mag[33]), 
        .D(n3919), .Z(n3511) );
  C8T28SOI_LR_AOI22X2_P0 U2955 ( .A(acc_mag[31]), .B(n3901), .C(acc_mag[32]), 
        .D(n3906), .Z(n3510) );
  C8T28SOI_LR_NAND2X4_P0 U2956 ( .A(n3511), .B(n3510), .Z(n3586) );
  C8T28SOI_LR_AOI22X2_P0 U2957 ( .A(acc_mag[18]), .B(n3910), .C(acc_mag[17]), 
        .D(n2905), .Z(n3514) );
  C8T28SOI_LR_AOI22X2_P0 U2958 ( .A(acc_mag[15]), .B(n3899), .C(acc_mag[16]), 
        .D(n2923), .Z(n3513) );
  C8T28SOI_LR_NAND2X4_P0 U2959 ( .A(n3514), .B(n3513), .Z(n3569) );
  C8T28SOI_LR_OAI22X3_P0 U2960 ( .A(n3601), .B(n3586), .C(n3892), .D(n3569), 
        .Z(n3515) );
  C8T28SOI_LR_OR3X5_P0 U2961 ( .A(n3517), .B(n3516), .C(n3515), .Z(n3518) );
  C8T28SOI_LR_OAI22X3_P0 U2962 ( .A(n3574), .B(n3520), .C(n3519), .D(n3518), 
        .Z(n3560) );
  C8T28SOI_LR_AOI22X2_P0 U2963 ( .A(acc_mag[52]), .B(n3908), .C(acc_mag[51]), 
        .D(n3901), .Z(n3524) );
  C8T28SOI_LR_OAI22X3_P0 U2964 ( .A(n3522), .B(n3918), .C(n3521), .D(n3916), 
        .Z(n3523) );
  C8T28SOI_LR_CNNOR2AX9_P16 U2965 ( .A(n3524), .B(n3523), .Z(n3580) );
  C8T28SOI_LR_AOI22X2_P0 U2966 ( .A(acc_mag[57]), .B(n3917), .C(acc_mag[58]), 
        .D(n2907), .Z(n3528) );
  C8T28SOI_LR_AOI22X2_P0 U2967 ( .A(acc_mag[56]), .B(n3908), .C(acc_mag[55]), 
        .D(n3901), .Z(n3527) );
  C8T28SOI_LR_NAND2X4_P0 U2968 ( .A(n3528), .B(n3527), .Z(n3588) );
  C8T28SOI_LR_OAI22AX3_P0 U2969 ( .A(n3580), .B(n3612), .C(n3894), .D(n3588), 
        .Z(n3559) );
  C8T28SOI_LR_AOI22X2_P0 U2970 ( .A(acc_mag[45]), .B(n3917), .C(acc_mag[46]), 
        .D(n3915), .Z(n3532) );
  C8T28SOI_LR_AOI22X2_P0 U2971 ( .A(acc_mag[43]), .B(n3901), .C(acc_mag[44]), 
        .D(n3908), .Z(n3531) );
  C8T28SOI_LR_AND2X5_P0 U2972 ( .A(n3532), .B(n3531), .Z(n3584) );
  C8T28SOI_LR_AOI22X2_P0 U2973 ( .A(acc_mag[40]), .B(n3906), .C(acc_mag[39]), 
        .D(n3901), .Z(n3538) );
  C8T28SOI_LR_OAI22X3_P0 U2974 ( .A(n3536), .B(n3920), .C(n3534), .D(n3916), 
        .Z(n3537) );
  C8T28SOI_LR_CNNOR2AX9_P16 U2975 ( .A(n3538), .B(n3537), .Z(n3582) );
  C8T28SOI_LR_AOI22AX2_P0 U2976 ( .C(n3583), .D(n3584), .A(n3597), .B(n3582), 
        .Z(n3556) );
  C8T28SOI_LR_AOI22X2_P0 U2977 ( .A(acc_mag[38]), .B(n3915), .C(acc_mag[37]), 
        .D(n3919), .Z(n3542) );
  C8T28SOI_LR_AOI22X2_P0 U2978 ( .A(acc_mag[36]), .B(n3906), .C(acc_mag[35]), 
        .D(n3901), .Z(n3541) );
  C8T28SOI_LR_NAND2X4_P0 U2979 ( .A(n3542), .B(n3541), .Z(n3587) );
  C8T28SOI_LR_AOI22X2_P0 U2980 ( .A(acc_mag[61]), .B(n3917), .C(acc_mag[62]), 
        .D(n2907), .Z(n3544) );
  C8T28SOI_LR_AOI22X2_P0 U2981 ( .A(acc_mag[60]), .B(n3908), .C(acc_mag[59]), 
        .D(n3901), .Z(n3543) );
  C8T28SOI_LR_NAND2X4_P0 U2982 ( .A(n3544), .B(n3543), .Z(n3589) );
  C8T28SOI_LR_OAI22X3_P0 U2983 ( .A(n3610), .B(n3587), .C(n3603), .D(n3589), 
        .Z(n3555) );
  C8T28SOI_LR_AOI22X2_P0 U2984 ( .A(acc_mag[65]), .B(n3917), .C(acc_mag[66]), 
        .D(n2907), .Z(n3547) );
  C8T28SOI_LR_AOI22X2_P0 U2985 ( .A(acc_mag[64]), .B(n3902), .C(acc_mag[63]), 
        .D(n3897), .Z(n3546) );
  C8T28SOI_LR_NAND2X4_P0 U2986 ( .A(n3547), .B(n3546), .Z(n3609) );
  C8T28SOI_LR_AOI22X2_P0 U2987 ( .A(acc_mag[49]), .B(n3917), .C(acc_mag[50]), 
        .D(n3915), .Z(n3553) );
  C8T28SOI_LR_AOI22X2_P0 U2988 ( .A(acc_mag[48]), .B(n3908), .C(acc_mag[47]), 
        .D(n3901), .Z(n3552) );
  C8T28SOI_LR_NAND2X4_P0 U2989 ( .A(n3553), .B(n3552), .Z(n3579) );
  C8T28SOI_LR_OAI22X3_P0 U2990 ( .A(n3601), .B(n3609), .C(n3892), .D(n3579), 
        .Z(n3554) );
  C8T28SOI_LR_NOR4CDX2_P0 U2991 ( .C(n3557), .D(n3556), .A(n3555), .B(n3554), 
        .Z(n3558) );
  C8T28SOI_LR_AOI22AX2_P0 U2992 ( .C(n3561), .D(n3560), .A(n3559), .B(n3558), 
        .Z(n3562) );
  C8T28SOI_LR_OAI12X3_P0 U2993 ( .A(n3564), .B(n3563), .C(n3562), .Z(n926) );
  C8T28SOI_LR_OAI22X3_P0 U2994 ( .A(n3597), .B(n3566), .C(n3894), .D(n3565), 
        .Z(n3573) );
  C8T28SOI_LR_OAI22X3_P0 U2995 ( .A(n3603), .B(n3568), .C(n3893), .D(n3567), 
        .Z(n3572) );
  C8T28SOI_LR_OAI22X3_P0 U2996 ( .A(n3601), .B(n3570), .C(n3612), .D(n3569), 
        .Z(n3571) );
  C8T28SOI_LR_NOR3X3_P0 U2997 ( .A(n3573), .B(n3572), .C(n3571), .Z(n3577) );
  C8T28SOI_LR_NAND2X4_P0 U2998 ( .A(n3891), .B(n3574), .Z(n3576) );
  C8T28SOI_LR_OAI211X3_P0 U2999 ( .A(n3892), .B(n3578), .C(n3577), .D(n3576), 
        .Z(n3621) );
  C8T28SOI_LR_AOI22ABX3_P0 U3000 ( .C(n3581), .D(n3580), .A(n3612), .B(n3579), 
        .Z(n3593) );
  C8T28SOI_LR_AOI22X2_P0 U3001 ( .A(n3585), .B(n3584), .C(n3583), .D(n3582), 
        .Z(n3592) );
  C8T28SOI_LR_OAI22X3_P0 U3002 ( .A(n3597), .B(n3587), .C(n3610), .D(n3586), 
        .Z(n3591) );
  C8T28SOI_LR_OAI22X3_P0 U3003 ( .A(n3601), .B(n3589), .C(n3603), .D(n3588), 
        .Z(n3590) );
  C8T28SOI_LR_NOR4CDX2_P0 U3004 ( .C(n3593), .D(n3592), .A(n3591), .B(n3590), 
        .Z(n3617) );
  C8T28SOI_LR_OAI22X3_P0 U3005 ( .A(n3597), .B(n3596), .C(n3894), .D(n3594), 
        .Z(n3608) );
  C8T28SOI_LR_OAI22X3_P0 U3006 ( .A(n3601), .B(n3600), .C(n3893), .D(n3598), 
        .Z(n3607) );
  C8T28SOI_LR_OAI22X3_P0 U3007 ( .A(n3892), .B(n3604), .C(n3603), .D(n3602), 
        .Z(n3606) );
  C8T28SOI_LR_NOR3X3_P0 U3008 ( .A(n3608), .B(n3607), .C(n3606), .Z(n3615) );
  C8T28SOI_LR_OAI22X3_P0 U3009 ( .A(n3612), .B(n3611), .C(n3610), .D(n3609), 
        .Z(n3613) );
  C8T28SOI_LR_CNIVX4_P16 U3010 ( .A(n3613), .Z(n3614) );
  C8T28SOI_LR_AOI22X2_P0 U3011 ( .A(n3617), .B(n3616), .C(n3615), .D(n3614), 
        .Z(n3619) );
  C8T28SOI_LR_AOI212X3_P0 U3012 ( .A(n3622), .B(n3621), .C(n3620), .D(n3619), 
        .E(n3618), .Z(n922) );
  C8T28SOI_LR_NOR2X4_P0 U3013 ( .A(n3623), .B(n3867), .Z(n3626) );
  C8T28SOI_LR_OAI12X3_P0 U3015 ( .A(acc[100]), .B(n3626), .C(n3888), .Z(n3625)
         );
  C8T28SOI_LR_AOI12X3_P0 U3016 ( .A(acc[100]), .B(n3626), .C(n3625), .Z(n882)
         );
  C8T28SOI_LR_NOR2X4_P0 U3017 ( .A(n3627), .B(n3867), .Z(n3629) );
  C8T28SOI_LR_OAI12X3_P0 U3018 ( .A(acc[98]), .B(n3629), .C(n3888), .Z(n3628)
         );
  C8T28SOI_LR_AOI12X3_P0 U3019 ( .A(acc[98]), .B(n3629), .C(n3628), .Z(n880)
         );
  C8T28SOI_LR_NOR2X4_P0 U3020 ( .A(n3630), .B(n3867), .Z(n3632) );
  C8T28SOI_LR_OAI12X3_P0 U3021 ( .A(acc[96]), .B(n3632), .C(n3888), .Z(n3631)
         );
  C8T28SOI_LR_AOI12X3_P0 U3022 ( .A(acc[96]), .B(n3632), .C(n3631), .Z(n878)
         );
  C8T28SOI_LR_NOR2X4_P0 U3023 ( .A(n3633), .B(n3861), .Z(n3635) );
  C8T28SOI_LR_OAI12X3_P0 U3024 ( .A(acc[94]), .B(n3635), .C(n3882), .Z(n3634)
         );
  C8T28SOI_LR_AOI12X3_P0 U3025 ( .A(acc[94]), .B(n3635), .C(n3634), .Z(n876)
         );
  C8T28SOI_LR_NOR2X4_P0 U3026 ( .A(n3636), .B(n3861), .Z(n3638) );
  C8T28SOI_LR_OAI12X3_P0 U3027 ( .A(acc[92]), .B(n3638), .C(n3882), .Z(n3637)
         );
  C8T28SOI_LR_AOI12X3_P0 U3028 ( .A(acc[92]), .B(n3638), .C(n3637), .Z(n874)
         );
  C8T28SOI_LR_NOR2X4_P0 U3029 ( .A(n3639), .B(n3861), .Z(n3641) );
  C8T28SOI_LR_OAI12X3_P0 U3030 ( .A(acc[90]), .B(n3641), .C(n3882), .Z(n3640)
         );
  C8T28SOI_LR_AOI12X3_P0 U3031 ( .A(acc[90]), .B(n3641), .C(n3640), .Z(n872)
         );
  C8T28SOI_LR_NOR2X4_P0 U3032 ( .A(n3642), .B(n3861), .Z(n3644) );
  C8T28SOI_LR_OAI12X3_P0 U3033 ( .A(acc[88]), .B(n3644), .C(n3882), .Z(n3643)
         );
  C8T28SOI_LR_AOI12X3_P0 U3034 ( .A(acc[88]), .B(n3644), .C(n3643), .Z(n870)
         );
  C8T28SOI_LR_NOR2X4_P0 U3035 ( .A(n3645), .B(n3861), .Z(n3647) );
  C8T28SOI_LR_OAI12X3_P0 U3036 ( .A(acc[86]), .B(n3647), .C(n3882), .Z(n3646)
         );
  C8T28SOI_LR_AOI12X3_P0 U3037 ( .A(acc[86]), .B(n3647), .C(n3646), .Z(n868)
         );
  C8T28SOI_LR_NOR2X4_P0 U3038 ( .A(n3648), .B(n3861), .Z(n3650) );
  C8T28SOI_LR_OAI12X3_P0 U3039 ( .A(acc[84]), .B(n3650), .C(n3882), .Z(n3649)
         );
  C8T28SOI_LR_AOI12X3_P0 U3040 ( .A(acc[84]), .B(n3650), .C(n3649), .Z(n866)
         );
  C8T28SOI_LR_NOR2X4_P0 U3041 ( .A(n3652), .B(n3861), .Z(n3654) );
  C8T28SOI_LR_OAI12X3_P0 U3042 ( .A(acc[82]), .B(n3654), .C(n3882), .Z(n3653)
         );
  C8T28SOI_LR_AOI12X3_P0 U3043 ( .A(acc[82]), .B(n3654), .C(n3653), .Z(n864)
         );
  C8T28SOI_LR_NOR2X4_P0 U3045 ( .A(n3656), .B(n3861), .Z(n3658) );
  C8T28SOI_LR_OAI12X3_P0 U3046 ( .A(acc[80]), .B(n3658), .C(n3882), .Z(n3657)
         );
  C8T28SOI_LR_AOI12X3_P0 U3047 ( .A(acc[80]), .B(n3658), .C(n3657), .Z(n862)
         );
  C8T28SOI_LR_NOR2X4_P0 U3048 ( .A(n3659), .B(n3861), .Z(n3661) );
  C8T28SOI_LR_OAI12X3_P0 U3049 ( .A(acc[78]), .B(n3661), .C(n3882), .Z(n3660)
         );
  C8T28SOI_LR_AOI12X3_P0 U3050 ( .A(acc[78]), .B(n3661), .C(n3660), .Z(n860)
         );
  C8T28SOI_LR_NOR2X4_P0 U3051 ( .A(n3662), .B(n3861), .Z(n3664) );
  C8T28SOI_LR_OAI12X3_P0 U3052 ( .A(acc[76]), .B(n3664), .C(n3882), .Z(n3663)
         );
  C8T28SOI_LR_AOI12X3_P0 U3053 ( .A(acc[76]), .B(n3664), .C(n3663), .Z(n858)
         );
  C8T28SOI_LR_NOR2X4_P0 U3054 ( .A(n3665), .B(n3861), .Z(n3667) );
  C8T28SOI_LR_OAI12X3_P0 U3055 ( .A(acc[74]), .B(n3667), .C(n3882), .Z(n3666)
         );
  C8T28SOI_LR_AOI12X3_P0 U3056 ( .A(acc[74]), .B(n3667), .C(n3666), .Z(n856)
         );
  C8T28SOI_LR_NOR2X4_P0 U3057 ( .A(n3668), .B(n3861), .Z(n3670) );
  C8T28SOI_LR_OAI12X3_P0 U3058 ( .A(acc[72]), .B(n3670), .C(n3882), .Z(n3669)
         );
  C8T28SOI_LR_AOI12X3_P0 U3059 ( .A(acc[72]), .B(n3670), .C(n3669), .Z(n854)
         );
  C8T28SOI_LR_NOR2X4_P0 U3060 ( .A(n3671), .B(n3861), .Z(n3673) );
  C8T28SOI_LR_OAI12X3_P0 U3061 ( .A(acc[70]), .B(n3673), .C(n3882), .Z(n3672)
         );
  C8T28SOI_LR_AOI12X3_P0 U3062 ( .A(acc[70]), .B(n3673), .C(n3672), .Z(n852)
         );
  C8T28SOI_LR_NOR2X4_P0 U3063 ( .A(n3674), .B(n3861), .Z(n3676) );
  C8T28SOI_LR_OAI12X3_P0 U3064 ( .A(acc[68]), .B(n3676), .C(n3882), .Z(n3675)
         );
  C8T28SOI_LR_AOI12X3_P0 U3065 ( .A(acc[68]), .B(n3676), .C(n3675), .Z(n850)
         );
  C8T28SOI_LR_NOR2X4_P0 U3066 ( .A(n3677), .B(n3861), .Z(n3679) );
  C8T28SOI_LR_OAI12X3_P0 U3067 ( .A(acc[66]), .B(n3679), .C(n3882), .Z(n3678)
         );
  C8T28SOI_LR_AOI12X3_P0 U3068 ( .A(acc[66]), .B(n3679), .C(n3678), .Z(n848)
         );
  C8T28SOI_LR_NOR2X4_P0 U3069 ( .A(n3680), .B(n3867), .Z(n3682) );
  C8T28SOI_LR_OAI12X3_P0 U3070 ( .A(acc[64]), .B(n3682), .C(n3882), .Z(n3681)
         );
  C8T28SOI_LR_AOI12X3_P0 U3071 ( .A(acc[64]), .B(n3682), .C(n3681), .Z(n846)
         );
  C8T28SOI_LR_NOR2X4_P0 U3072 ( .A(n3683), .B(n3867), .Z(n3685) );
  C8T28SOI_LR_OAI12X3_P0 U3073 ( .A(acc[62]), .B(n3685), .C(n3888), .Z(n3684)
         );
  C8T28SOI_LR_AOI12X3_P0 U3074 ( .A(acc[62]), .B(n3685), .C(n3684), .Z(n844)
         );
  C8T28SOI_LR_NOR2X4_P0 U3075 ( .A(n3686), .B(n3867), .Z(n3688) );
  C8T28SOI_LR_OAI12X3_P0 U3076 ( .A(acc[60]), .B(n3688), .C(n3888), .Z(n3687)
         );
  C8T28SOI_LR_AOI12X3_P0 U3077 ( .A(acc[60]), .B(n3688), .C(n3687), .Z(n842)
         );
  C8T28SOI_LR_NOR2X4_P0 U3078 ( .A(n3689), .B(n3867), .Z(n3691) );
  C8T28SOI_LR_OAI12X3_P0 U3079 ( .A(acc[58]), .B(n3691), .C(n3888), .Z(n3690)
         );
  C8T28SOI_LR_AOI12X3_P0 U3080 ( .A(acc[58]), .B(n3691), .C(n3690), .Z(n840)
         );
  C8T28SOI_LR_NOR2X4_P0 U3081 ( .A(n3692), .B(n3867), .Z(n3694) );
  C8T28SOI_LR_OAI12X3_P0 U3082 ( .A(acc[56]), .B(n3694), .C(n3888), .Z(n3693)
         );
  C8T28SOI_LR_AOI12X3_P0 U3083 ( .A(acc[56]), .B(n3694), .C(n3693), .Z(n838)
         );
  C8T28SOI_LR_NOR2X4_P0 U3084 ( .A(n3695), .B(n3867), .Z(n3697) );
  C8T28SOI_LR_OAI12X3_P0 U3085 ( .A(acc[54]), .B(n3697), .C(n3888), .Z(n3696)
         );
  C8T28SOI_LR_AOI12X3_P0 U3086 ( .A(acc[54]), .B(n3697), .C(n3696), .Z(n836)
         );
  C8T28SOI_LR_NOR2X4_P0 U3087 ( .A(n3698), .B(n3867), .Z(n3700) );
  C8T28SOI_LR_OAI12X3_P0 U3088 ( .A(acc[52]), .B(n3700), .C(n3888), .Z(n3699)
         );
  C8T28SOI_LR_AOI12X3_P0 U3089 ( .A(acc[52]), .B(n3700), .C(n3699), .Z(n834)
         );
  C8T28SOI_LR_NOR2X4_P0 U3090 ( .A(n3701), .B(n3867), .Z(n3703) );
  C8T28SOI_LR_OAI12X3_P0 U3091 ( .A(acc[50]), .B(n3703), .C(n3888), .Z(n3702)
         );
  C8T28SOI_LR_AOI12X3_P0 U3092 ( .A(acc[50]), .B(n3703), .C(n3702), .Z(n832)
         );
  C8T28SOI_LR_NOR2X4_P0 U3093 ( .A(n3704), .B(n3867), .Z(n3706) );
  C8T28SOI_LR_OAI12X3_P0 U3094 ( .A(acc[48]), .B(n3706), .C(n3888), .Z(n3705)
         );
  C8T28SOI_LR_AOI12X3_P0 U3095 ( .A(acc[48]), .B(n3706), .C(n3705), .Z(n830)
         );
  C8T28SOI_LR_NOR2X4_P0 U3096 ( .A(n3707), .B(n3867), .Z(n3709) );
  C8T28SOI_LR_OAI12X3_P0 U3097 ( .A(acc[46]), .B(n3709), .C(n3888), .Z(n3708)
         );
  C8T28SOI_LR_AOI12X3_P0 U3098 ( .A(acc[46]), .B(n3709), .C(n3708), .Z(n828)
         );
  C8T28SOI_LR_NOR2X4_P0 U3099 ( .A(n3710), .B(n3865), .Z(n3712) );
  C8T28SOI_LR_OAI12X3_P0 U3100 ( .A(acc[44]), .B(n3712), .C(n3888), .Z(n3711)
         );
  C8T28SOI_LR_AOI12X3_P0 U3101 ( .A(acc[44]), .B(n3712), .C(n3711), .Z(n826)
         );
  C8T28SOI_LR_NOR2X4_P0 U3102 ( .A(n3714), .B(n3865), .Z(n3716) );
  C8T28SOI_LR_OAI12X3_P0 U3103 ( .A(acc[42]), .B(n3716), .C(n3888), .Z(n3715)
         );
  C8T28SOI_LR_AOI12X3_P0 U3104 ( .A(acc[42]), .B(n3716), .C(n3715), .Z(n824)
         );
  C8T28SOI_LR_NOR2X4_P0 U3105 ( .A(n3717), .B(n3865), .Z(n3719) );
  C8T28SOI_LR_OAI12X3_P0 U3106 ( .A(acc[40]), .B(n3719), .C(n3884), .Z(n3718)
         );
  C8T28SOI_LR_AOI12X3_P0 U3107 ( .A(acc[40]), .B(n3719), .C(n3718), .Z(n822)
         );
  C8T28SOI_LR_NOR2X4_P0 U3108 ( .A(n3720), .B(n3865), .Z(n3722) );
  C8T28SOI_LR_OAI12X3_P0 U3109 ( .A(acc[38]), .B(n3722), .C(n3884), .Z(n3721)
         );
  C8T28SOI_LR_AOI12X3_P0 U3110 ( .A(acc[38]), .B(n3722), .C(n3721), .Z(n820)
         );
  C8T28SOI_LR_NOR2X4_P0 U3111 ( .A(n3723), .B(n3865), .Z(n3725) );
  C8T28SOI_LR_OAI12X3_P0 U3112 ( .A(acc[36]), .B(n3725), .C(n3884), .Z(n3724)
         );
  C8T28SOI_LR_AOI12X3_P0 U3113 ( .A(acc[36]), .B(n3725), .C(n3724), .Z(n818)
         );
  C8T28SOI_LR_NOR2X4_P0 U3114 ( .A(n3726), .B(n3865), .Z(n3728) );
  C8T28SOI_LR_OAI12X3_P0 U3115 ( .A(acc[34]), .B(n3728), .C(n3886), .Z(n3727)
         );
  C8T28SOI_LR_AOI12X3_P0 U3116 ( .A(acc[34]), .B(n3728), .C(n3727), .Z(n816)
         );
  C8T28SOI_LR_NOR2X4_P0 U3117 ( .A(n3729), .B(n3865), .Z(n3731) );
  C8T28SOI_LR_OAI12X3_P0 U3118 ( .A(acc[32]), .B(n3731), .C(n3886), .Z(n3730)
         );
  C8T28SOI_LR_AOI12X3_P0 U3119 ( .A(acc[32]), .B(n3731), .C(n3730), .Z(n814)
         );
  C8T28SOI_LR_NOR2X4_P0 U3120 ( .A(n3732), .B(n3863), .Z(n3734) );
  C8T28SOI_LR_OAI12X3_P0 U3121 ( .A(acc[30]), .B(n3734), .C(n3886), .Z(n3733)
         );
  C8T28SOI_LR_AOI12X3_P0 U3122 ( .A(acc[30]), .B(n3734), .C(n3733), .Z(n812)
         );
  C8T28SOI_LR_NOR2X4_P0 U3123 ( .A(n3735), .B(n3863), .Z(n3737) );
  C8T28SOI_LR_OAI12X3_P0 U3124 ( .A(acc[28]), .B(n3737), .C(n3886), .Z(n3736)
         );
  C8T28SOI_LR_AOI12X3_P0 U3125 ( .A(acc[28]), .B(n3737), .C(n3736), .Z(n810)
         );
  C8T28SOI_LR_NOR2X4_P0 U3126 ( .A(n3738), .B(n3863), .Z(n3740) );
  C8T28SOI_LR_OAI12X3_P0 U3127 ( .A(acc[26]), .B(n3740), .C(n3886), .Z(n3739)
         );
  C8T28SOI_LR_AOI12X3_P0 U3128 ( .A(acc[26]), .B(n3740), .C(n3739), .Z(n808)
         );
  C8T28SOI_LR_NOR2X4_P0 U3129 ( .A(n3741), .B(n3863), .Z(n3743) );
  C8T28SOI_LR_OAI12X3_P0 U3130 ( .A(acc[24]), .B(n3743), .C(n3886), .Z(n3742)
         );
  C8T28SOI_LR_AOI12X3_P0 U3131 ( .A(acc[24]), .B(n3743), .C(n3742), .Z(n806)
         );
  C8T28SOI_LR_NOR2X4_P0 U3132 ( .A(n3744), .B(n3863), .Z(n3746) );
  C8T28SOI_LR_OAI12X3_P0 U3133 ( .A(acc[22]), .B(n3746), .C(n3886), .Z(n3745)
         );
  C8T28SOI_LR_AOI12X3_P0 U3134 ( .A(acc[22]), .B(n3746), .C(n3745), .Z(n804)
         );
  C8T28SOI_LR_NOR2X4_P0 U3135 ( .A(n3747), .B(n3863), .Z(n3749) );
  C8T28SOI_LR_OAI12X3_P0 U3136 ( .A(acc[20]), .B(n3749), .C(n3886), .Z(n3748)
         );
  C8T28SOI_LR_AOI12X3_P0 U3137 ( .A(acc[20]), .B(n3749), .C(n3748), .Z(n802)
         );
  C8T28SOI_LR_NOR2X4_P0 U3138 ( .A(n3750), .B(n3863), .Z(n3752) );
  C8T28SOI_LR_OAI12X3_P0 U3139 ( .A(acc[18]), .B(n3752), .C(n3886), .Z(n3751)
         );
  C8T28SOI_LR_AOI12X3_P0 U3140 ( .A(acc[18]), .B(n3752), .C(n3751), .Z(n800)
         );
  C8T28SOI_LR_NOR2X4_P0 U3141 ( .A(n3753), .B(n3863), .Z(n3755) );
  C8T28SOI_LR_OAI12X3_P0 U3142 ( .A(acc[16]), .B(n3755), .C(n3886), .Z(n3754)
         );
  C8T28SOI_LR_AOI12X3_P0 U3143 ( .A(acc[16]), .B(n3755), .C(n3754), .Z(n798)
         );
  C8T28SOI_LR_NOR2X4_P0 U3144 ( .A(n3756), .B(n3863), .Z(n3758) );
  C8T28SOI_LR_OAI12X3_P0 U3145 ( .A(acc[14]), .B(n3758), .C(n3886), .Z(n3757)
         );
  C8T28SOI_LR_AOI12X3_P0 U3146 ( .A(acc[14]), .B(n3758), .C(n3757), .Z(n796)
         );
  C8T28SOI_LR_NOR2X4_P0 U3147 ( .A(n3759), .B(n3863), .Z(n3761) );
  C8T28SOI_LR_OAI12X3_P0 U3148 ( .A(acc[12]), .B(n3761), .C(n3886), .Z(n3760)
         );
  C8T28SOI_LR_AOI12X3_P0 U3149 ( .A(acc[12]), .B(n3761), .C(n3760), .Z(n794)
         );
  C8T28SOI_LR_NOR2X4_P0 U3150 ( .A(n3762), .B(n3863), .Z(n3764) );
  C8T28SOI_LR_OAI12X3_P0 U3151 ( .A(acc[10]), .B(n3764), .C(n3886), .Z(n3763)
         );
  C8T28SOI_LR_AOI12X3_P0 U3152 ( .A(acc[10]), .B(n3764), .C(n3763), .Z(n792)
         );
  C8T28SOI_LR_NOR2X4_P0 U3153 ( .A(n3765), .B(n3863), .Z(n3767) );
  C8T28SOI_LR_OAI12X3_P0 U3154 ( .A(acc[8]), .B(n3767), .C(n3886), .Z(n3766)
         );
  C8T28SOI_LR_AOI12X3_P0 U3155 ( .A(acc[8]), .B(n3767), .C(n3766), .Z(n790) );
  C8T28SOI_LR_NOR2X4_P0 U3156 ( .A(n3768), .B(n3863), .Z(n3771) );
  C8T28SOI_LR_OAI12X3_P0 U3157 ( .A(acc[6]), .B(n3771), .C(n3886), .Z(n3770)
         );
  C8T28SOI_LR_AOI12X3_P0 U3158 ( .A(acc[6]), .B(n3771), .C(n3770), .Z(n788) );
  C8T28SOI_LR_NOR2X4_P0 U3159 ( .A(n3773), .B(n3863), .Z(n3776) );
  C8T28SOI_LR_OAI12X3_P0 U3160 ( .A(acc[4]), .B(n3776), .C(n3886), .Z(n3775)
         );
  C8T28SOI_LR_AOI12X3_P0 U3161 ( .A(acc[4]), .B(n3776), .C(n3775), .Z(n786) );
  C8T28SOI_LR_CNIVX4_P16 U3162 ( .A(counter[3]), .Z(n3794) );
  C8T28SOI_LR_AOI12X3_P0 U3163 ( .A(n3794), .B(n3777), .C(n3783), .Z(n356) );
  C8T28SOI_LR_AOI211X2_P0 U3164 ( .A(n3780), .B(n3779), .C(n3778), .D(n3783), 
        .Z(n354) );
  C8T28SOI_LR_NOR2X4_P0 U3165 ( .A(counter[0]), .B(n3783), .Z(n352) );
  C8T28SOI_LRS_XNOR2X3_P0 U3166 ( .A(acc[1]), .B(n3781), .Z(n3784) );
  C8T28SOI_LR_CNNOR2X8_P16 U3167 ( .A(mts_fx[1]), .B(n3784), .Z(n3782) );
  C8T28SOI_LR_AOI211X2_P0 U3168 ( .A(mts_fx[1]), .B(n3784), .C(n3783), .D(
        n3782), .Z(n361) );
  C8T28SOI_LR_OAI12X3_P0 U3169 ( .A(sign_w), .B(sign_d), .C(n3873), .Z(n3785)
         );
  C8T28SOI_LR_AOI12X3_P0 U3170 ( .A(sign_w), .B(sign_d), .C(n3785), .Z(n60) );
  C8T28SOI_LR_CB4I1X3_P0 U3171 ( .A(n3789), .B(n3788), .C(n3787), .D(n3873), 
        .Z(n67) );
  C8T28SOI_LR_AOI22X2_P0 U3172 ( .A(mts_d[0]), .B(mts_w[1]), .C(mts_w[0]), .D(
        mts_d[1]), .Z(n3791) );
  C8T28SOI_LR_NOR3X3_P0 U3173 ( .A(n3792), .B(n3791), .C(n3790), .Z(n62) );
  C8T28SOI_LR_CNNAND2X8_P16 U3174 ( .A(counter[3]), .B(counter[0]), .Z(n3799)
         );
  C8T28SOI_LR_OAI22CDX2_P0 U3175 ( .A(n3795), .B(n3794), .C(n3799), .D(n3793), 
        .Z(n3796) );
  C8T28SOI_LR_CNIVX4_P16 U3176 ( .A(n3796), .Z(n3800) );
  C8T28SOI_LR_CNNOR2X8_P16 U3177 ( .A(acc_rdy), .B(n3800), .Z(n3797) );
  C8T28SOI_LR_AOI211X2_P0 U3178 ( .A(n3800), .B(n3799), .C(n3798), .D(n3797), 
        .Z(n2351) );
  C8T28SOI_LR_CNNAND2AX9_P16 U3179 ( .A(zc_i), .B(n3801), .Z(n2350) );
  C8T28SOI_LR_CNNAND2X8_P10 U2240 ( .A(n3412), .B(n2896), .Z(n3612) );
  C8T28SOI_LR_CNNOR2X8_P10 U2255 ( .A(n3404), .B(n2902), .Z(n3581) );
  C8T28SOI_LR_NAND2X4_P0 U2251 ( .A(n2899), .B(n3418), .Z(n3597) );
  C8T28SOI_LR_CNNOR2X8_P16 U2270 ( .A(n3418), .B(n2912), .Z(n3583) );
  C8T28SOI_LR_NOR2X4_P0 U2230 ( .A(n3416), .B(n2912), .Z(n3585) );
  C8T28SOI_LR_NAND3X3_P0 U2193 ( .A(n3416), .B(n3404), .C(n2896), .Z(n3603) );
  C8T28SOI_LR_CNBFX28_P16 U1262 ( .A(rstn), .Z(n3838) );
  C8T28SOI_LR_CNIVX4_P16 U1281 ( .A(mts_m[7]), .Z(n3857) );
  C8T28SOI_LR_CNIVX4_P16 U1718 ( .A(n3603), .Z(n3890) );
  C8T28SOI_LR_CNIVX4_P16 U1822 ( .A(n3601), .Z(n3895) );
  C8T28SOI_LR_CNIVX4_P16 U2204 ( .A(n3902), .Z(n3903) );
  C8T28SOI_LR_CNIVX4_P16 U2208 ( .A(n2923), .Z(n3905) );
  C8T28SOI_LR_CNIVX4_P16 U2218 ( .A(n3906), .Z(n3907) );
  C8T28SOI_LR_CNIVX4_P16 U2220 ( .A(n3908), .Z(n3909) );
  C8T28SOI_LR_CNIVX4_P16 U2223 ( .A(n3910), .Z(n3911) );
  C8T28SOI_LR_CNIVX4_P16 U2226 ( .A(n2907), .Z(n3914) );
  C8T28SOI_LR_CNIVX4_P16 U2232 ( .A(n3915), .Z(n3916) );
  C8T28SOI_LR_CNIVX4_P16 U2235 ( .A(n3917), .Z(n3918) );
  C8T28SOI_LR_CNIVX4_P16 U2256 ( .A(n3919), .Z(n3920) );
  C8T28SOI_LR_CNIVX4_P16 U2262 ( .A(n2905), .Z(n3922) );
  C8T28SOI_LR_CNBFX4_P16 U1276 ( .A(rstn), .Z(n3852) );
  C8T28SOI_LR_CNBFX4_P16 U1272 ( .A(rstn), .Z(n3848) );
  C8T28SOI_LR_CNBFX4_P16 U1271 ( .A(rstn), .Z(n3847) );
  C8T28SOI_LR_CNBFX4_P16 U1269 ( .A(rstn), .Z(n3845) );
  C8T28SOI_LR_CNBFX4_P10 U1264 ( .A(rstn), .Z(n3840) );
  C8T28SOI_LR_CNBFX4_P16 U1266 ( .A(rstn), .Z(n3842) );
  C8T28SOI_LR_CNBFX4_P10 U1258 ( .A(rstn), .Z(n3834) );
  C8T28SOI_LR_CNBFX4_P16 U1267 ( .A(rstn), .Z(n3843) );
  C8T28SOI_LR_CNBFX8_P16 U1263 ( .A(rstn), .Z(n3839) );
  C8T28SOI_LR_CNBFX8_P16 U1270 ( .A(rstn), .Z(n3846) );
  C8T28SOI_LR_CNBFX4_P10 U1274 ( .A(rstn), .Z(n3850) );
  C8T28SOI_LR_CNBFX4_P10 U1268 ( .A(rstn), .Z(n3844) );
  C8T28SOI_LR_CNBFX8_P16 U1261 ( .A(rstn), .Z(n3837) );
  C8T28SOI_LR_CNBFX8_P16 U1278 ( .A(rstn), .Z(n3854) );
  C8T28SOI_LR_CNBFX8_P16 U1265 ( .A(rstn), .Z(n3841) );
  C8T28SOI_LR_CNBFX8_P16 U1280 ( .A(rstn), .Z(n3856) );
  C8T28SOI_LR_CNIVX4_P16 U1333 ( .A(n2384), .Z(n3872) );
  C8T28SOI_LR_CNIVX4_P16 U1603 ( .A(n3783), .Z(n3880) );
  C8T28SOI_LR_CNIVX4_P16 U1402 ( .A(n3783), .Z(n3875) );
  C8T28SOI_LR_CNIVX4_P16 U1540 ( .A(n3783), .Z(n3879) );
  C8T28SOI_LR_CNIVX4_P16 U1447 ( .A(n3783), .Z(n3877) );
  C8T28SOI_LR_CNIVX4_P16 U1530 ( .A(n3285), .Z(n2445) );
  C8T28SOI_LR_CNIVX4_P16 U1760 ( .A(n2556), .Z(n3397) );
  C8T28SOI_LR_CNIVX4_P16 U1386 ( .A(n3790), .Z(n3873) );
  C8T28SOI_LR_CNIVX4_P16 U1605 ( .A(n2497), .Z(n3882) );
  C8T28SOI_LR_CNIVX4_P16 U1623 ( .A(n2497), .Z(n3888) );
  C8T28SOI_LR_CNIVX4_P16 U1289 ( .A(n3864), .Z(n3865) );
  C8T28SOI_LR_CNIVX4_P16 U1329 ( .A(shift_pos[1]), .Z(n3870) );
  C8T28SOI_LR_CNIVX4_P16 U1332 ( .A(shift_neg[1]), .Z(n3871) );
  C8T28SOI_LR_CNIVX4_P16 U1285 ( .A(acc[101]), .Z(n3861) );
  C8T28SOI_LR_CNIVX4_P16 U1287 ( .A(n3862), .Z(n3863) );
  C8T28SOI_LR_CNIVX4_P16 U1291 ( .A(acc[101]), .Z(n3867) );
  C8T28SOI_LR_CNIVX4_P16 U1292 ( .A(shift_pos[0]), .Z(n3868) );
  C8T28SOI_LR_CNIVX4_P16 U1283 ( .A(sf_bias[4]), .Z(n3859) );
  C8T28SOI_LR_CNIVX4_P16 U1300 ( .A(shift_neg[0]), .Z(n3869) );
  C8T28SOI_LR_CNIVX4_P16 U1612 ( .A(n3885), .Z(n3886) );
  C8T28SOI_LR_CNBFX4_P16 U1288 ( .A(acc[101]), .Z(n3864) );
  C8T28SOI_LR_CNBFX4_P16 U1286 ( .A(acc[101]), .Z(n3862) );
  C8T28SOI_LR_CNIVX4_P16 U1282 ( .A(sf_bias[5]), .Z(n3858) );
  C8T28SOI_LR_CNBFX4_P16 U1609 ( .A(n2497), .Z(n3885) );
  C8T28SOI_LR_CNIVX4_P16 U1442 ( .A(counter[0]), .Z(n3780) );
  C8T28SOI_LR_CNIVX4_P16 U1377 ( .A(sf_bias[2]), .Z(n2389) );
  C8T28SOI_LR_CNIVX4_P16 U1730 ( .A(n3585), .Z(n3892) );
  C8T28SOI_LR_CNIVX4_P16 U1734 ( .A(n3583), .Z(n3893) );
  C8T28SOI_LR_CNIVX4_P16 U1812 ( .A(n3581), .Z(n3894) );
  C8T28SOI_LR_CNIVX4_P16 U1366 ( .A(mts_ms[8]), .Z(n2460) );
  C8T28SOI_LR_CNIVX4_P16 U1637 ( .A(n3415), .Z(n3889) );
  C8T28SOI_LR_CNBFX4_P16 U2221 ( .A(n2907), .Z(n3910) );
  C8T28SOI_LR_CNIVX4_P16 U2160 ( .A(n3486), .Z(n3899) );
  C8T28SOI_LR_CNIVX4_P16 U1608 ( .A(n3883), .Z(n3884) );
  C8T28SOI_LR_CNIVX4_P16 U1728 ( .A(n3610), .Z(n3891) );
  C8T28SOI_LR_CNIVX4_P16 U2199 ( .A(n3486), .Z(n3901) );
  C8T28SOI_LR_CNIVX4_P16 U1977 ( .A(n3486), .Z(n3897) );
  C8T28SOI_LR_CNBFX4_P16 U2219 ( .A(n2923), .Z(n3908) );
  C8T28SOI_LR_CNBFX4_P16 U2209 ( .A(n2923), .Z(n3906) );
  C8T28SOI_LR_CNBFX4_P16 U2224 ( .A(n2907), .Z(n3912) );
  C8T28SOI_LR_CNBFX4_P16 U2231 ( .A(n2907), .Z(n3915) );
  C8T28SOI_LR_CNBFX4_P16 U2233 ( .A(n2905), .Z(n3917) );
  C8T28SOI_LR_CNBFX4_P16 U1606 ( .A(n2497), .Z(n3883) );
  C8T28SOI_LR_CNBFX4_P16 U2200 ( .A(n2923), .Z(n3902) );
  C8T28SOI_LR_CNBFX4_P16 U2263 ( .A(n2905), .Z(n3923) );
  C8T28SOI_LR_CNBFX4_P16 U2241 ( .A(n2905), .Z(n3919) );
  C8T28SOI_LR_CNIVX4_P16 U1961 ( .A(n3419), .Z(n3417) );
  C8T28SOI_LR_CNIVX4_P16 U2213 ( .A(n3416), .Z(n3418) );
  C8T28SOI_LR_TOLX5 U1259 ( .TL(n357) );
endmodule

