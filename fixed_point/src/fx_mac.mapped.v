/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in topographical mode
// Version   : V-2023.12-SP5-3
// Date      : Sat Aug 16 15:41:31 2025
/////////////////////////////////////////////////////////////
`timescale 1ns/1ps

module SNPS_CLOCK_GATE_HIGH_fx_mac_3 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  C8T28SOI_LRP_CNHLSX4_P16 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_fx_mac_4 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  C8T28SOI_LRP_CNHLSX4_P16 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_fx_mac_5 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  C8T28SOI_LRP_CNHLSX4_P16 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module fx_mac ( clk_i, rstn, vld_i, win, din, acc_o, vld_o );
  input [7:0] win;
  input [7:0] din;
  output [7:0] acc_o;
  input clk_i, rstn, vld_i;
  output vld_o;
  wire   mult_tmp_0_, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, acc_rdy, n128, n129, n130, n131, n132, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n161, n186,
         n187, n188, n189, n190, n191, n192, n193, n224, n225, n226, n227,
         n228, n229, n230, intadd_0_SUM_13_, intadd_0_SUM_12_,
         intadd_0_SUM_11_, intadd_0_SUM_10_, intadd_0_SUM_9_, intadd_0_SUM_8_,
         intadd_0_SUM_7_, intadd_0_SUM_6_, intadd_0_SUM_5_, intadd_0_SUM_4_,
         intadd_0_SUM_3_, intadd_0_SUM_2_, intadd_0_SUM_1_, intadd_0_n14,
         intadd_0_n13, intadd_0_n12, intadd_0_n11, intadd_0_n10, intadd_0_n9,
         intadd_0_n8, intadd_0_n7, intadd_0_n6, intadd_0_n5, intadd_0_n4,
         intadd_0_n3, intadd_0_n2, intadd_0_n1, intadd_1_A_9_, intadd_1_A_8_,
         intadd_1_A_7_, intadd_1_A_6_, intadd_1_A_5_, intadd_1_A_4_,
         intadd_1_A_3_, intadd_1_A_2_, intadd_1_A_1_, intadd_1_A_0_,
         intadd_1_B_8_, intadd_1_B_5_, intadd_1_B_4_, intadd_1_B_3_,
         intadd_1_B_2_, intadd_1_B_1_, intadd_1_B_0_, intadd_1_CI,
         intadd_1_SUM_9_, intadd_1_SUM_8_, intadd_1_SUM_7_, intadd_1_SUM_6_,
         intadd_1_SUM_5_, intadd_1_SUM_4_, intadd_1_SUM_3_, intadd_1_SUM_2_,
         intadd_1_SUM_1_, intadd_1_SUM_0_, intadd_1_n10, intadd_1_n9,
         intadd_1_n8, intadd_1_n7, intadd_1_n6, intadd_1_n5, intadd_1_n4,
         intadd_1_n3, intadd_1_n2, intadd_1_n1, intadd_2_A_3_, intadd_2_A_2_,
         intadd_2_A_1_, intadd_2_A_0_, intadd_2_B_3_, intadd_2_B_2_,
         intadd_2_B_1_, intadd_2_B_0_, intadd_2_CI, intadd_2_SUM_2_,
         intadd_2_SUM_1_, intadd_2_SUM_0_, intadd_2_n4, intadd_2_n3,
         intadd_2_n2, intadd_2_n1, intadd_3_A_2_, intadd_3_A_0_, intadd_3_B_1_,
         intadd_3_B_0_, intadd_3_CI, intadd_3_SUM_1_, intadd_3_SUM_0_,
         intadd_3_n3, intadd_3_n2, intadd_3_n1, intadd_4_A_1_, intadd_4_A_0_,
         intadd_4_B_2_, intadd_4_B_1_, intadd_4_B_0_, intadd_4_CI,
         intadd_4_SUM_1_, intadd_4_SUM_0_, intadd_4_n3, intadd_4_n2,
         intadd_4_n1, intadd_5_A_2_, intadd_5_A_1_, intadd_5_A_0_,
         intadd_5_B_2_, intadd_5_B_1_, intadd_5_B_0_, intadd_5_CI,
         intadd_5_SUM_0_, intadd_5_n3, intadd_5_n2, intadd_5_n1, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446,
         n447, n448, n449, n450, n451, n453, n454, n455, n456, n457, n458,
         n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, n469,
         n470, n471, n472, n473, n477, SYNOPSYS_UNCONNECTED_1;
  wire   [15:0] mult;
  wire   [4:0] vld_d;
  wire   [3:0] counter;
  wire   [21:0] acc;

  SNPS_CLOCK_GATE_HIGH_fx_mac_3 clk_gate_ml ( .CLK(clk_i), .EN(n229), .ENCLK(
        n226), .TE(n132) );
  SNPS_CLOCK_GATE_HIGH_fx_mac_4 clk_gate_vld_o_tmp_reg ( .CLK(n226), .EN(n228), 
        .ENCLK(n225), .TE(n132) );
  SNPS_CLOCK_GATE_HIGH_fx_mac_5 clk_gate_counter_reg ( .CLK(n226), .EN(n227), 
        .ENCLK(n224), .TE(n132) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U14 ( .A0(mult[2]), .B0(acc[2]), .CI(
        intadd_0_n14), .CO(intadd_0_n13), .S0(intadd_0_SUM_1_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U13 ( .A0(mult[3]), .B0(acc[3]), .CI(
        intadd_0_n13), .CO(intadd_0_n12), .S0(intadd_0_SUM_2_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U12 ( .A0(mult[4]), .B0(acc[4]), .CI(
        intadd_0_n12), .CO(intadd_0_n11), .S0(intadd_0_SUM_3_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U11 ( .A0(mult[5]), .B0(acc[5]), .CI(
        intadd_0_n11), .CO(intadd_0_n10), .S0(intadd_0_SUM_4_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U10 ( .A0(mult[6]), .B0(acc[6]), .CI(
        intadd_0_n10), .CO(intadd_0_n9), .S0(intadd_0_SUM_5_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U9 ( .A0(mult[7]), .B0(acc[7]), .CI(
        intadd_0_n9), .CO(intadd_0_n8), .S0(intadd_0_SUM_6_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U8 ( .A0(mult[8]), .B0(acc[8]), .CI(
        intadd_0_n8), .CO(intadd_0_n7), .S0(intadd_0_SUM_7_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U7 ( .A0(mult[9]), .B0(acc[9]), .CI(
        intadd_0_n7), .CO(intadd_0_n6), .S0(intadd_0_SUM_8_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U6 ( .A0(mult[10]), .B0(acc[10]), .CI(
        intadd_0_n6), .CO(intadd_0_n5), .S0(intadd_0_SUM_9_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U5 ( .A0(mult[11]), .B0(acc[11]), .CI(
        intadd_0_n5), .CO(intadd_0_n4), .S0(intadd_0_SUM_10_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U4 ( .A0(mult[12]), .B0(acc[12]), .CI(
        intadd_0_n4), .CO(intadd_0_n3), .S0(intadd_0_SUM_11_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U3 ( .A0(mult[13]), .B0(acc[13]), .CI(
        intadd_0_n3), .CO(intadd_0_n2), .S0(intadd_0_SUM_12_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U2 ( .A0(mult[14]), .B0(acc[14]), .CI(
        intadd_0_n2), .CO(intadd_0_n1), .S0(intadd_0_SUM_13_) );
  C8T28SOI_LR_FA1X4_P0 intadd_1_U11 ( .A0(intadd_1_A_0_), .B0(intadd_1_B_0_), 
        .CI(intadd_1_CI), .CO(intadd_1_n10), .S0(intadd_1_SUM_0_) );
  C8T28SOI_LR_FA1X4_P0 intadd_1_U10 ( .A0(intadd_1_A_1_), .B0(intadd_1_B_1_), 
        .CI(intadd_1_n10), .CO(intadd_1_n9), .S0(intadd_1_SUM_1_) );
  C8T28SOI_LR_FA1X4_P0 intadd_1_U9 ( .A0(intadd_1_A_2_), .B0(intadd_1_B_2_), 
        .CI(intadd_1_n9), .CO(intadd_1_n8), .S0(intadd_1_SUM_2_) );
  C8T28SOI_LR_FA1X4_P0 intadd_1_U8 ( .A0(intadd_1_A_3_), .B0(intadd_1_B_3_), 
        .CI(intadd_1_n8), .CO(intadd_1_n7), .S0(intadd_1_SUM_3_) );
  C8T28SOI_LR_FA1X4_P0 intadd_1_U7 ( .A0(intadd_1_A_4_), .B0(intadd_1_B_4_), 
        .CI(intadd_1_n7), .CO(intadd_1_n6), .S0(intadd_1_SUM_4_) );
  C8T28SOI_LR_FA1X4_P0 intadd_1_U6 ( .A0(intadd_1_A_5_), .B0(intadd_1_B_5_), 
        .CI(intadd_1_n6), .CO(intadd_1_n5), .S0(intadd_1_SUM_5_) );
  C8T28SOI_LR_FA1X4_P0 intadd_1_U5 ( .A0(intadd_1_A_6_), .B0(intadd_4_n1), 
        .CI(intadd_1_n5), .CO(intadd_1_n4), .S0(intadd_1_SUM_6_) );
  C8T28SOI_LR_FA1X4_P0 intadd_1_U4 ( .A0(intadd_1_A_7_), .B0(intadd_3_n1), 
        .CI(intadd_1_n4), .CO(intadd_1_n3), .S0(intadd_1_SUM_7_) );
  C8T28SOI_LR_FA1X4_P0 intadd_1_U3 ( .A0(intadd_1_A_8_), .B0(intadd_1_B_8_), 
        .CI(intadd_1_n3), .CO(intadd_1_n2), .S0(intadd_1_SUM_8_) );
  C8T28SOI_LR_FA1X4_P0 intadd_1_U2 ( .A0(intadd_1_A_9_), .B0(intadd_2_n1), 
        .CI(intadd_1_n2), .CO(intadd_1_n1), .S0(intadd_1_SUM_9_) );
  C8T28SOI_LR_FA1X4_P0 intadd_2_U5 ( .A0(intadd_2_A_0_), .B0(intadd_2_B_0_), 
        .CI(intadd_2_CI), .CO(intadd_2_n4), .S0(intadd_2_SUM_0_) );
  C8T28SOI_LR_FA1X4_P0 intadd_2_U4 ( .A0(intadd_2_A_1_), .B0(intadd_2_B_1_), 
        .CI(intadd_2_n4), .CO(intadd_2_n3), .S0(intadd_2_SUM_1_) );
  C8T28SOI_LR_FA1X4_P0 intadd_2_U3 ( .A0(intadd_2_A_2_), .B0(intadd_2_B_2_), 
        .CI(intadd_2_n3), .CO(intadd_2_n2), .S0(intadd_2_SUM_2_) );
  C8T28SOI_LR_FA1X4_P0 intadd_2_U2 ( .A0(intadd_2_A_3_), .B0(intadd_2_B_3_), 
        .CI(intadd_2_n2), .CO(intadd_2_n1), .S0(intadd_1_A_8_) );
  C8T28SOI_LR_FA1X4_P0 intadd_3_U4 ( .A0(intadd_3_A_0_), .B0(intadd_3_B_0_), 
        .CI(intadd_3_CI), .CO(intadd_3_n3), .S0(intadd_3_SUM_0_) );
  C8T28SOI_LR_FA1X4_P0 intadd_3_U3 ( .A0(intadd_2_SUM_0_), .B0(intadd_3_B_1_), 
        .CI(intadd_3_n3), .CO(intadd_3_n2), .S0(intadd_3_SUM_1_) );
  C8T28SOI_LR_FA1X4_P0 intadd_3_U2 ( .A0(intadd_3_A_2_), .B0(intadd_2_SUM_1_), 
        .CI(intadd_3_n2), .CO(intadd_3_n1), .S0(intadd_1_A_6_) );
  C8T28SOI_LR_FA1X4_P0 intadd_4_U4 ( .A0(intadd_4_A_0_), .B0(intadd_4_B_0_), 
        .CI(intadd_4_CI), .CO(intadd_4_n3), .S0(intadd_4_SUM_0_) );
  C8T28SOI_LR_FA1X4_P0 intadd_4_U3 ( .A0(intadd_4_A_1_), .B0(intadd_4_B_1_), 
        .CI(intadd_4_n3), .CO(intadd_4_n2), .S0(intadd_4_SUM_1_) );
  C8T28SOI_LR_FA1X4_P0 intadd_4_U2 ( .A0(intadd_3_SUM_1_), .B0(intadd_4_B_2_), 
        .CI(intadd_4_n2), .CO(intadd_4_n1), .S0(intadd_1_A_5_) );
  C8T28SOI_LR_FA1X4_P0 intadd_5_U4 ( .A0(intadd_5_A_0_), .B0(intadd_5_B_0_), 
        .CI(intadd_5_CI), .CO(intadd_5_n3), .S0(intadd_5_SUM_0_) );
  C8T28SOI_LR_FA1X4_P0 intadd_5_U3 ( .A0(intadd_5_A_1_), .B0(intadd_5_B_1_), 
        .CI(intadd_5_n3), .CO(intadd_5_n2), .S0(intadd_2_A_3_) );
  C8T28SOI_LR_FA1X4_P0 intadd_5_U2 ( .A0(intadd_5_A_2_), .B0(intadd_5_B_2_), 
        .CI(intadd_5_n2), .CO(intadd_5_n1), .S0(intadd_1_A_9_) );
  C8T28SOI_LR_DFPRQX4_P0 vld_o_tmp_reg ( .D(n161), .CP(n225), .RN(rstn), .Q(
        vld_o) );
  C8T28SOI_LR_DFPRQX4_P0 acc_rc_reg_4_ ( .D(n186), .CP(n225), .RN(rstn), .Q(
        acc_o[0]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_rc_reg_5_ ( .D(n187), .CP(n225), .RN(rstn), .Q(
        acc_o[1]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_rc_reg_6_ ( .D(n188), .CP(n225), .RN(rstn), .Q(
        acc_o[2]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_rc_reg_7_ ( .D(n189), .CP(n225), .RN(rstn), .Q(
        acc_o[3]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_rc_reg_8_ ( .D(n190), .CP(n225), .RN(rstn), .Q(
        acc_o[4]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_rc_reg_9_ ( .D(n191), .CP(n225), .RN(rstn), .Q(
        acc_o[5]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_rc_reg_10_ ( .D(n192), .CP(n225), .RN(rstn), .Q(
        acc_o[6]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_rc_reg_11_ ( .D(n193), .CP(n225), .RN(rstn), .Q(
        acc_o[7]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_21_ ( .D(n156), .CP(n224), .RN(rstn), .Q(
        acc[21]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_20_ ( .D(n155), .CP(n224), .RN(rstn), .Q(
        acc[20]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_19_ ( .D(n154), .CP(n224), .RN(rstn), .Q(
        acc[19]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_rdy_reg ( .D(n230), .CP(clk_i), .RN(rstn), .Q(
        acc_rdy) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_4_ ( .D(vld_d[3]), .CP(clk_i), .RN(rstn), 
        .Q(vld_d[4]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_18_ ( .D(n153), .CP(n224), .RN(rstn), .Q(
        acc[18]) );
  C8T28SOI_LR_DFPRQX4_P0 counter_reg_3_ ( .D(n131), .CP(n224), .RN(rstn), .Q(
        counter[3]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_0_ ( .D(vld_i), .CP(clk_i), .RN(rstn), .Q(
        vld_d[0]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_3_ ( .D(vld_d[2]), .CP(clk_i), .RN(rstn), 
        .Q(vld_d[3]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_1_ ( .D(vld_d[0]), .CP(clk_i), .RN(rstn), 
        .Q(vld_d[1]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_2_ ( .D(vld_d[1]), .CP(clk_i), .RN(rstn), 
        .Q(vld_d[2]) );
  C8T28SOI_LR_DFPRQX4_P0 counter_reg_2_ ( .D(n130), .CP(n224), .RN(rstn), .Q(
        counter[2]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_17_ ( .D(n152), .CP(n224), .RN(rstn), .Q(
        acc[17]) );
  C8T28SOI_LR_DFPRQX4_P0 counter_reg_1_ ( .D(n129), .CP(n224), .RN(rstn), .Q(
        counter[1]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_16_ ( .D(n151), .CP(n224), .RN(rstn), .Q(
        acc[16]) );
  C8T28SOI_LR_DFPRQX4_P0 counter_reg_0_ ( .D(n128), .CP(n224), .RN(rstn), .Q(
        counter[0]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_15_ ( .D(n150), .CP(n224), .RN(rstn), .Q(
        acc[15]) );
  C8T28SOI_LR_DFPRQX4_P0 mult_reg_15_ ( .D(n93), .CP(clk_i), .RN(rstn), .Q(
        mult[15]) );
  C8T28SOI_LR_DFPRQX4_P0 mult_reg_14_ ( .D(n92), .CP(clk_i), .RN(rstn), .Q(
        mult[14]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_14_ ( .D(n149), .CP(n224), .RN(rstn), .Q(
        acc[14]) );
  C8T28SOI_LR_DFPRQX4_P0 mult_reg_13_ ( .D(n91), .CP(clk_i), .RN(rstn), .Q(
        mult[13]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_13_ ( .D(n148), .CP(n224), .RN(rstn), .Q(
        acc[13]) );
  C8T28SOI_LR_DFPRQX4_P0 mult_reg_12_ ( .D(n90), .CP(clk_i), .RN(rstn), .Q(
        mult[12]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_12_ ( .D(n147), .CP(n224), .RN(rstn), .Q(
        acc[12]) );
  C8T28SOI_LR_DFPRQX4_P0 mult_reg_11_ ( .D(n89), .CP(clk_i), .RN(rstn), .Q(
        mult[11]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_11_ ( .D(n146), .CP(n224), .RN(rstn), .Q(
        acc[11]) );
  C8T28SOI_LR_DFPRQX4_P0 mult_reg_10_ ( .D(n88), .CP(clk_i), .RN(rstn), .Q(
        mult[10]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_10_ ( .D(n145), .CP(n224), .RN(rstn), .Q(
        acc[10]) );
  C8T28SOI_LR_DFPRQX4_P0 mult_reg_9_ ( .D(n87), .CP(clk_i), .RN(rstn), .Q(
        mult[9]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_9_ ( .D(n144), .CP(n224), .RN(rstn), .Q(
        acc[9]) );
  C8T28SOI_LR_DFPRQX4_P0 mult_reg_8_ ( .D(n86), .CP(clk_i), .RN(rstn), .Q(
        mult[8]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_8_ ( .D(n143), .CP(n224), .RN(rstn), .Q(
        acc[8]) );
  C8T28SOI_LR_DFPRQX4_P0 mult_reg_7_ ( .D(n85), .CP(clk_i), .RN(rstn), .Q(
        mult[7]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_7_ ( .D(n142), .CP(n224), .RN(rstn), .Q(
        acc[7]) );
  C8T28SOI_LR_DFPRQX4_P0 mult_reg_6_ ( .D(n84), .CP(clk_i), .RN(rstn), .Q(
        mult[6]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_6_ ( .D(n141), .CP(n224), .RN(rstn), .Q(
        acc[6]) );
  C8T28SOI_LR_DFPRQX4_P0 mult_reg_5_ ( .D(n83), .CP(clk_i), .RN(rstn), .Q(
        mult[5]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_5_ ( .D(n140), .CP(n224), .RN(rstn), .Q(
        acc[5]) );
  C8T28SOI_LR_DFPRQX4_P0 mult_reg_4_ ( .D(n82), .CP(clk_i), .RN(rstn), .Q(
        mult[4]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_4_ ( .D(n139), .CP(n224), .RN(rstn), .Q(
        acc[4]) );
  C8T28SOI_LR_DFPRQX4_P0 mult_reg_3_ ( .D(n81), .CP(clk_i), .RN(rstn), .Q(
        mult[3]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_3_ ( .D(n138), .CP(n224), .RN(rstn), .Q(
        acc[3]) );
  C8T28SOI_LR_DFPRQX4_P0 mult_reg_2_ ( .D(n80), .CP(clk_i), .RN(rstn), .Q(
        mult[2]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_2_ ( .D(n137), .CP(n224), .RN(rstn), .Q(
        acc[2]) );
  C8T28SOI_LR_DFPRQX4_P0 mult_reg_1_ ( .D(n79), .CP(clk_i), .RN(rstn), .Q(
        mult[1]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_1_ ( .D(n136), .CP(n224), .RN(rstn), .Q(
        acc[1]) );
  C8T28SOI_LR_DFPRQX4_P0 mult_reg_0_ ( .D(mult_tmp_0_), .CP(clk_i), .RN(rstn), 
        .Q(mult[0]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_0_ ( .D(n135), .CP(n224), .RN(rstn), .Q(
        acc[0]) );
  C8T28SOI_LR_CNIVX4_P16 U141 ( .A(vld_d[0]), .Z(n472) );
  C8T28SOI_LR_OR3X5_P0 U142 ( .A(vld_d[2]), .B(vld_d[1]), .C(vld_d[3]), .Z(
        n467) );
  C8T28SOI_LR_CNNAND2X8_P16 U143 ( .A(n472), .B(n467), .Z(n229) );
  C8T28SOI_LR_OAI31X3_P0 U144 ( .A(counter[0]), .B(counter[1]), .C(counter[2]), 
        .D(counter[3]), .Z(n234) );
  C8T28SOI_LR_CNIVX4_P16 U145 ( .A(n234), .Z(n235) );
  C8T28SOI_LR_CNNOR2X8_P4 U146 ( .A(n472), .B(n235), .Z(n464) );
  C8T28SOI_LR_CNNAND2X8_P16 U147 ( .A(acc[0]), .B(mult[0]), .Z(n369) );
  C8T28SOI_LR_OA112X4_P0 U148 ( .A(acc[0]), .B(mult[0]), .C(n464), .D(n369), 
        .Z(n135) );
  C8T28SOI_LR_NAND2X4_P0 U149 ( .A(counter[0]), .B(counter[1]), .Z(n444) );
  C8T28SOI_LR_OA112X4_P0 U150 ( .A(counter[0]), .B(counter[1]), .C(n464), .D(
        n444), .Z(n129) );
  C8T28SOI_LR_NOR2X4_P0 U152 ( .A(counter[0]), .B(n477), .Z(n128) );
  C8T28SOI_LR_CNNOR2AX9_P16 U153 ( .A(intadd_0_SUM_1_), .B(n477), .Z(n137) );
  C8T28SOI_LR_CNNAND2X8_P16 U154 ( .A(win[7]), .B(win[0]), .Z(n236) );
  C8T28SOI_LR_CNXOR2X9_P16 U155 ( .A(win[1]), .S(n236), .Z(n413) );
  C8T28SOI_LR_CNIVX4_P16 U156 ( .A(n413), .Z(n408) );
  C8T28SOI_LR_CNNAND2X8_P16 U157 ( .A(din[0]), .B(n408), .Z(n239) );
  C8T28SOI_LR_CNNAND2X8_P16 U158 ( .A(din[7]), .B(din[0]), .Z(n237) );
  C8T28SOI_LR_CNXOR2X9_P16 U159 ( .A(din[1]), .S(n237), .Z(n412) );
  C8T28SOI_LR_CNIVX4_P16 U160 ( .A(n412), .Z(n406) );
  C8T28SOI_LR_CNNAND2X8_P16 U161 ( .A(win[0]), .B(n406), .Z(n238) );
  C8T28SOI_LR_CNNOR2X8_P16 U162 ( .A(n239), .B(n238), .Z(intadd_1_B_0_) );
  C8T28SOI_LR_CNIVX4_P16 U163 ( .A(win[0]), .Z(n405) );
  C8T28SOI_LR_CNIVX4_P16 U164 ( .A(din[0]), .Z(n419) );
  C8T28SOI_LR_NOR2X4_P0 U165 ( .A(n405), .B(n419), .Z(mult_tmp_0_) );
  C8T28SOI_LR_AOI12X3_P0 U166 ( .A(n239), .B(n238), .C(intadd_1_B_0_), .Z(n262) );
  C8T28SOI_LR_CNIVX4_P16 U167 ( .A(din[7]), .Z(n305) );
  C8T28SOI_LR_CNIVX4_P16 U168 ( .A(win[7]), .Z(n284) );
  C8T28SOI_LR_OAI22X3_P0 U169 ( .A(n305), .B(n284), .C(win[7]), .D(din[7]), 
        .Z(n432) );
  C8T28SOI_LR_NAND2X4_P0 U171 ( .A(n298), .B(mult_tmp_0_), .Z(n240) );
  C8T28SOI_LRS_XNOR2X3_P0 U172 ( .A(n262), .B(n240), .Z(n79) );
  C8T28SOI_LR_CNNOR2AX9_P16 U173 ( .A(intadd_0_SUM_2_), .B(n477), .Z(n138) );
  C8T28SOI_LR_CNNOR2AX9_P16 U174 ( .A(intadd_0_SUM_3_), .B(n477), .Z(n139) );
  C8T28SOI_LR_NOR4CDX2_P0 U175 ( .C(vld_d[4]), .D(acc_rdy), .A(vld_d[0]), .B(
        n467), .Z(n161) );
  C8T28SOI_LR_NOR3X3_P0 U176 ( .A(acc[17]), .B(acc[16]), .C(acc[15]), .Z(n241)
         );
  C8T28SOI_LR_CNIVX4_P16 U177 ( .A(acc[11]), .Z(n435) );
  C8T28SOI_LR_NOR4CDX2_P0 U178 ( .C(n241), .D(n435), .A(acc[18]), .B(acc[12]), 
        .Z(n242) );
  C8T28SOI_LR_CNIVX4_P16 U179 ( .A(acc[20]), .Z(n358) );
  C8T28SOI_LR_CNIVX4_P16 U180 ( .A(acc[19]), .Z(n350) );
  C8T28SOI_LR_NAND3X3_P0 U181 ( .A(n242), .B(n358), .C(n350), .Z(n243) );
  C8T28SOI_LR_CNIVX4_P16 U182 ( .A(acc[21]), .Z(n366) );
  C8T28SOI_LR_OAI31X3_P0 U183 ( .A(acc[13]), .B(acc[14]), .C(n243), .D(n366), 
        .Z(n248) );
  C8T28SOI_LR_CNNAND2AX9_P16 U184 ( .A(n248), .B(n161), .Z(n440) );
  C8T28SOI_LR_NOR3X3_P0 U185 ( .A(acc[2]), .B(acc[0]), .C(acc[1]), .Z(n244) );
  C8T28SOI_LR_CNNOR2AX9_P16 U186 ( .A(acc[3]), .B(n244), .Z(n249) );
  C8T28SOI_LR_CNIVX4_P16 U187 ( .A(acc[18]), .Z(n343) );
  C8T28SOI_LR_NAND3X3_P0 U188 ( .A(acc[17]), .B(acc[16]), .C(acc[15]), .Z(n245) );
  C8T28SOI_LR_NOR4CDX2_P0 U189 ( .C(acc[11]), .D(acc[12]), .A(n343), .B(n245), 
        .Z(n246) );
  C8T28SOI_LR_NAND3X3_P0 U190 ( .A(acc[13]), .B(acc[14]), .C(n246), .Z(n247)
         );
  C8T28SOI_LR_OAI31X3_P0 U191 ( .A(n358), .B(n350), .C(n247), .D(acc[21]), .Z(
        n437) );
  C8T28SOI_LR_NAND3X3_P0 U192 ( .A(n161), .B(n437), .C(n248), .Z(n442) );
  C8T28SOI_LR_CNIVX4_P16 U193 ( .A(n442), .Z(n259) );
  C8T28SOI_LR_NAND2X4_P0 U194 ( .A(n249), .B(acc[4]), .Z(n256) );
  C8T28SOI_LR_OAI211X3_P0 U195 ( .A(n249), .B(acc[4]), .C(n259), .D(n256), .Z(
        n250) );
  C8T28SOI_LR_NAND2X4_P0 U196 ( .A(n440), .B(n250), .Z(n186) );
  C8T28SOI_LR_CNNOR2AX9_P16 U197 ( .A(acc[5]), .B(n256), .Z(n258) );
  C8T28SOI_LR_NAND2X4_P0 U198 ( .A(n258), .B(acc[6]), .Z(n253) );
  C8T28SOI_LR_OAI211X3_P0 U199 ( .A(n258), .B(acc[6]), .C(n259), .D(n253), .Z(
        n251) );
  C8T28SOI_LR_NAND2X4_P0 U200 ( .A(n440), .B(n251), .Z(n188) );
  C8T28SOI_LR_CNNOR2AX9_P16 U201 ( .A(acc[7]), .B(n253), .Z(n255) );
  C8T28SOI_LR_NAND2X4_P0 U202 ( .A(n255), .B(acc[8]), .Z(n260) );
  C8T28SOI_LR_OAI211X3_P0 U203 ( .A(n255), .B(acc[8]), .C(n259), .D(n260), .Z(
        n252) );
  C8T28SOI_LR_NAND2X4_P0 U204 ( .A(n440), .B(n252), .Z(n190) );
  C8T28SOI_LR_NOR2AX4_P0 U205 ( .A(intadd_0_SUM_4_), .B(n477), .Z(n140) );
  C8T28SOI_LR_OAI12AX3_P0 U206 ( .A(n253), .B(acc[7]), .C(n259), .Z(n254) );
  C8T28SOI_LR_OAI12X3_P0 U207 ( .A(n255), .B(n254), .C(n440), .Z(n189) );
  C8T28SOI_LR_OAI12AX3_P0 U208 ( .A(n256), .B(acc[5]), .C(n259), .Z(n257) );
  C8T28SOI_LR_OAI12X3_P0 U209 ( .A(n258), .B(n257), .C(n440), .Z(n187) );
  C8T28SOI_LR_CNNOR2AX9_P16 U210 ( .A(acc[9]), .B(n260), .Z(n439) );
  C8T28SOI_LR_OAI12AX3_P0 U211 ( .A(n260), .B(acc[9]), .C(n259), .Z(n261) );
  C8T28SOI_LR_OAI12X3_P0 U212 ( .A(n439), .B(n261), .C(n440), .Z(n191) );
  C8T28SOI_LR_NOR2X4_P0 U213 ( .A(mult_tmp_0_), .B(n262), .Z(n433) );
  C8T28SOI_LR_CNNAND2AX9_P16 U214 ( .A(intadd_1_SUM_0_), .B(n433), .Z(n264) );
  C8T28SOI_LR_NAND2X4_P0 U215 ( .A(n298), .B(n264), .Z(n263) );
  C8T28SOI_LRS_XNOR2X3_P0 U216 ( .A(intadd_1_SUM_1_), .B(n263), .Z(n81) );
  C8T28SOI_LR_NOR2AX4_P0 U217 ( .A(intadd_0_SUM_5_), .B(n477), .Z(n141) );
  C8T28SOI_LR_NOR2AX4_P0 U218 ( .A(intadd_0_SUM_6_), .B(n477), .Z(n142) );
  C8T28SOI_LR_NOR2AX4_P0 U219 ( .A(intadd_0_SUM_7_), .B(n477), .Z(n143) );
  C8T28SOI_LR_NOR2AX4_P0 U220 ( .A(intadd_0_SUM_8_), .B(n477), .Z(n144) );
  C8T28SOI_LR_CNNOR2X8_P16 U221 ( .A(intadd_1_SUM_1_), .B(n264), .Z(n430) );
  C8T28SOI_LR_CNNAND2AX9_P16 U222 ( .A(intadd_1_SUM_2_), .B(n430), .Z(n266) );
  C8T28SOI_LR_NAND2X4_P0 U223 ( .A(n298), .B(n266), .Z(n265) );
  C8T28SOI_LRS_XNOR2X3_P0 U224 ( .A(intadd_1_SUM_3_), .B(n265), .Z(n83) );
  C8T28SOI_LR_NOR2AX4_P0 U225 ( .A(intadd_0_SUM_9_), .B(n477), .Z(n145) );
  C8T28SOI_LR_NOR2AX4_P0 U226 ( .A(intadd_0_SUM_10_), .B(n477), .Z(n146) );
  C8T28SOI_LR_CNNOR2X8_P16 U227 ( .A(intadd_1_SUM_3_), .B(n266), .Z(n428) );
  C8T28SOI_LR_CNNAND2AX9_P16 U228 ( .A(intadd_1_SUM_4_), .B(n428), .Z(n268) );
  C8T28SOI_LR_NAND2X4_P0 U229 ( .A(n298), .B(n268), .Z(n267) );
  C8T28SOI_LRS_XNOR2X3_P0 U230 ( .A(intadd_1_SUM_5_), .B(n267), .Z(n85) );
  C8T28SOI_LR_NOR2AX4_P0 U231 ( .A(intadd_0_SUM_11_), .B(n477), .Z(n147) );
  C8T28SOI_LR_NOR2AX4_P0 U232 ( .A(intadd_0_SUM_12_), .B(n477), .Z(n148) );
  C8T28SOI_LR_CNNOR2X8_P16 U233 ( .A(intadd_1_SUM_5_), .B(n268), .Z(n426) );
  C8T28SOI_LR_CNNAND2AX9_P16 U234 ( .A(intadd_1_SUM_6_), .B(n426), .Z(n270) );
  C8T28SOI_LR_NAND2X4_P0 U235 ( .A(n298), .B(n270), .Z(n269) );
  C8T28SOI_LRS_XNOR2X3_P0 U236 ( .A(intadd_1_SUM_7_), .B(n269), .Z(n87) );
  C8T28SOI_LR_NOR2AX4_P0 U237 ( .A(intadd_0_SUM_13_), .B(n477), .Z(n149) );
  C8T28SOI_LR_CNNOR2X8_P16 U238 ( .A(intadd_1_SUM_7_), .B(n270), .Z(n424) );
  C8T28SOI_LR_CNNAND2AX9_P16 U239 ( .A(intadd_1_SUM_8_), .B(n424), .Z(n273) );
  C8T28SOI_LR_NAND2X4_P0 U240 ( .A(n298), .B(n273), .Z(n271) );
  C8T28SOI_LRS_XNOR2X3_P0 U241 ( .A(intadd_1_SUM_9_), .B(n271), .Z(n89) );
  C8T28SOI_LR_NOR2AX4_P0 U243 ( .A(n272), .B(n477), .Z(n150) );
  C8T28SOI_LR_CNNOR2X8_P16 U244 ( .A(intadd_1_SUM_9_), .B(n273), .Z(n291) );
  C8T28SOI_LR_NOR2X4_P0 U245 ( .A(n291), .B(n432), .Z(n289) );
  C8T28SOI_LR_OR3X5_P0 U246 ( .A(win[0]), .B(win[1]), .C(win[2]), .Z(n302) );
  C8T28SOI_LR_CNNOR2X8_P16 U247 ( .A(win[3]), .B(n302), .Z(n280) );
  C8T28SOI_LR_CNNOR2AX9_P16 U248 ( .A(n280), .B(win[4]), .Z(n285) );
  C8T28SOI_LR_CNNOR2AX9_P16 U249 ( .A(n285), .B(win[5]), .Z(n276) );
  C8T28SOI_LR_NOR2X4_P0 U250 ( .A(n276), .B(n284), .Z(n274) );
  C8T28SOI_LRS_XNOR2X3_P0 U251 ( .A(win[6]), .B(n274), .Z(n375) );
  C8T28SOI_LR_CNIVX4_P16 U252 ( .A(n375), .Z(n336) );
  C8T28SOI_LR_NOR3X3_P0 U253 ( .A(din[0]), .B(din[1]), .C(din[2]), .Z(n306) );
  C8T28SOI_LR_CNNOR2AX9_P16 U254 ( .A(n306), .B(din[3]), .Z(n277) );
  C8T28SOI_LR_CNNOR2AX9_P16 U255 ( .A(n277), .B(din[4]), .Z(n279) );
  C8T28SOI_LR_NOR2X4_P0 U256 ( .A(n279), .B(n305), .Z(n275) );
  C8T28SOI_LRS_XNOR2X3_P0 U257 ( .A(din[5]), .B(n275), .Z(n331) );
  C8T28SOI_LR_CNIVX4_P16 U258 ( .A(n331), .Z(n340) );
  C8T28SOI_LRA_NOR3AX3_P0 U259 ( .A(n276), .B(n284), .C(win[6]), .Z(n327) );
  C8T28SOI_LR_NOR2X4_P0 U260 ( .A(n277), .B(n305), .Z(n278) );
  C8T28SOI_LRS_XNOR2X3_P0 U261 ( .A(din[4]), .B(n278), .Z(n392) );
  C8T28SOI_LR_CNIVX4_P16 U262 ( .A(n392), .Z(n335) );
  C8T28SOI_LR_CNNOR2AX9_P16 U263 ( .A(n279), .B(din[5]), .Z(n282) );
  C8T28SOI_LRA_NOR3AX3_P0 U264 ( .A(n282), .B(n305), .C(din[6]), .Z(n334) );
  C8T28SOI_LR_NOR2X4_P0 U265 ( .A(n280), .B(n284), .Z(n281) );
  C8T28SOI_LRS_XNOR2X3_P0 U266 ( .A(win[4]), .B(n281), .Z(n330) );
  C8T28SOI_LR_CNIVX4_P16 U267 ( .A(n330), .Z(n387) );
  C8T28SOI_LR_AOI222X2_P0 U268 ( .A(n336), .B(n340), .C(n327), .D(n335), .E(
        n334), .F(n387), .Z(n372) );
  C8T28SOI_LR_NOR2X4_P0 U269 ( .A(n282), .B(n305), .Z(n283) );
  C8T28SOI_LRS_XNOR2X3_P0 U270 ( .A(din[6]), .B(n283), .Z(n332) );
  C8T28SOI_LR_CNIVX4_P16 U271 ( .A(n332), .Z(n338) );
  C8T28SOI_LR_NOR2X4_P0 U272 ( .A(n285), .B(n284), .Z(n286) );
  C8T28SOI_LRS_XNOR2X3_P0 U273 ( .A(win[5]), .B(n286), .Z(n386) );
  C8T28SOI_LR_CNIVX4_P16 U274 ( .A(n386), .Z(n339) );
  C8T28SOI_LR_NAND2X4_P0 U275 ( .A(n338), .B(n339), .Z(n371) );
  C8T28SOI_LR_NOR2X4_P0 U276 ( .A(n372), .B(n371), .Z(n370) );
  C8T28SOI_LR_AOI222X2_P0 U277 ( .A(n336), .B(n338), .C(n340), .D(n327), .E(
        n334), .F(n339), .Z(n287) );
  C8T28SOI_LR_NOR2X4_P0 U278 ( .A(n370), .B(n287), .Z(n292) );
  C8T28SOI_LR_CNNOR2X8_P16 U281 ( .A(intadd_5_n1), .B(intadd_1_n1), .Z(n288)
         );
  C8T28SOI_LR_CNXOR2X9_P16 U282 ( .A(n292), .S(n288), .Z(n290) );
  C8T28SOI_LRS_XNOR2X3_P0 U283 ( .A(n289), .B(n290), .Z(n90) );
  C8T28SOI_LR_NAND2X4_P0 U284 ( .A(n291), .B(n290), .Z(n297) );
  C8T28SOI_LR_AOI22X2_P0 U285 ( .A(n336), .B(n334), .C(n327), .D(n338), .Z(
        n296) );
  C8T28SOI_LR_OAI12X3_P0 U286 ( .A(intadd_5_n1), .B(intadd_1_n1), .C(n292), 
        .Z(n295) );
  C8T28SOI_LRA_NAND3AX3_P0 U287 ( .A(n370), .B(n296), .C(n295), .Z(n300) );
  C8T28SOI_LR_OAI12X3_P0 U288 ( .A(n297), .B(n300), .C(n298), .Z(n421) );
  C8T28SOI_LR_CNIVX4_P16 U289 ( .A(n421), .Z(n93) );
  C8T28SOI_LR_NAND2X4_P0 U290 ( .A(n298), .B(n297), .Z(n299) );
  C8T28SOI_LRS_XNOR2X3_P0 U291 ( .A(n300), .B(n299), .Z(n91) );
  C8T28SOI_LR_OAI12X3_P0 U292 ( .A(win[0]), .B(win[1]), .C(win[7]), .Z(n301)
         );
  C8T28SOI_LR_CNXOR2X9_P16 U293 ( .A(win[2]), .S(n301), .Z(n391) );
  C8T28SOI_LR_NOR2X4_P0 U294 ( .A(n419), .B(n391), .Z(intadd_1_CI) );
  C8T28SOI_LR_NOR2X4_P0 U296 ( .A(n405), .B(n331), .Z(intadd_4_CI) );
  C8T28SOI_LR_CNNAND2X8_P16 U297 ( .A(win[7]), .B(n302), .Z(n303) );
  C8T28SOI_LR_CNXOR2X9_P16 U298 ( .A(win[3]), .S(n303), .Z(n420) );
  C8T28SOI_LR_OAI12X3_P0 U299 ( .A(din[0]), .B(din[1]), .C(din[7]), .Z(n304)
         );
  C8T28SOI_LR_CNXOR2X9_P16 U300 ( .A(din[2]), .S(n304), .Z(n404) );
  C8T28SOI_LR_NOR2X4_P0 U301 ( .A(n420), .B(n404), .Z(intadd_4_B_0_) );
  C8T28SOI_LR_NOR2X4_P0 U302 ( .A(n306), .B(n305), .Z(n307) );
  C8T28SOI_LRS_XNOR2X3_P0 U303 ( .A(din[3]), .B(n307), .Z(n403) );
  C8T28SOI_LR_NOR2X4_P0 U304 ( .A(n403), .B(n391), .Z(intadd_4_A_0_) );
  C8T28SOI_LR_NOR2X4_P0 U306 ( .A(n392), .B(n391), .Z(intadd_3_CI) );
  C8T28SOI_LR_NOR2X4_P0 U307 ( .A(n403), .B(n420), .Z(intadd_3_B_0_) );
  C8T28SOI_LR_NAND2X4_P0 U308 ( .A(n408), .B(n338), .Z(n324) );
  C8T28SOI_LR_CNIVX4_P16 U309 ( .A(n334), .Z(n423) );
  C8T28SOI_LR_CNIVX4_P16 U310 ( .A(n404), .Z(n407) );
  C8T28SOI_LR_NAND2X4_P0 U311 ( .A(n339), .B(n407), .Z(n323) );
  C8T28SOI_LR_OAI12X3_P0 U312 ( .A(n405), .B(n423), .C(n323), .Z(n308) );
  C8T28SOI_LRS_XNOR2X3_P0 U313 ( .A(n324), .B(n308), .Z(intadd_3_B_1_) );
  C8T28SOI_LR_NOR2X4_P0 U314 ( .A(n386), .B(n403), .Z(n310) );
  C8T28SOI_LR_NAND3X3_P0 U315 ( .A(n335), .B(n387), .C(n310), .Z(n313) );
  C8T28SOI_LR_NAND2X4_P0 U316 ( .A(n335), .B(n387), .Z(n309) );
  C8T28SOI_LR_CNNAND2AX9_P16 U317 ( .A(n310), .B(n309), .Z(n311) );
  C8T28SOI_LR_AOI22X2_P0 U318 ( .A(n408), .B(n334), .C(n313), .D(n311), .Z(
        n317) );
  C8T28SOI_LR_NOR2X4_P0 U319 ( .A(n419), .B(n375), .Z(n379) );
  C8T28SOI_LR_NAND3X3_P0 U320 ( .A(n406), .B(n339), .C(n379), .Z(n384) );
  C8T28SOI_LR_NOR2X4_P0 U321 ( .A(n413), .B(n331), .Z(n378) );
  C8T28SOI_LR_NOR2X4_P0 U322 ( .A(n330), .B(n404), .Z(n377) );
  C8T28SOI_LR_NOR2X4_P0 U323 ( .A(n405), .B(n332), .Z(n376) );
  C8T28SOI_LR_CNIVX4_P16 U324 ( .A(n327), .Z(n422) );
  C8T28SOI_LR_OAI22X3_P0 U325 ( .A(n419), .B(n422), .C(n412), .D(n375), .Z(
        n382) );
  C8T28SOI_LR_OAI12AX3_P0 U326 ( .A(n384), .B(n381), .C(n382), .Z(n316) );
  C8T28SOI_LR_CNIVX4_P16 U327 ( .A(n391), .Z(n398) );
  C8T28SOI_LR_NAND2X4_P0 U328 ( .A(n338), .B(n398), .Z(n326) );
  C8T28SOI_LR_CNIVX4_P16 U329 ( .A(n420), .Z(n333) );
  C8T28SOI_LR_NAND2X4_P0 U330 ( .A(n340), .B(n333), .Z(n325) );
  C8T28SOI_LRS_XNOR2X3_P0 U331 ( .A(n326), .B(n325), .Z(n315) );
  C8T28SOI_LR_CNIVX4_P16 U332 ( .A(n312), .Z(intadd_3_A_2_) );
  C8T28SOI_LR_CNIVX4_P16 U333 ( .A(n313), .Z(n314) );
  C8T28SOI_LR_CNNAND2X8_P16 U334 ( .A(intadd_5_SUM_0_), .B(n314), .Z(n329) );
  C8T28SOI_LR_OAI12X3_P0 U335 ( .A(n314), .B(intadd_5_SUM_0_), .C(n329), .Z(
        n321) );
  C8T28SOI_LR_FA1X4_P0 U336 ( .A0(n317), .B0(n316), .CI(n315), .CO(n320), .S0(
        n312) );
  C8T28SOI_LR_CNIVX4_P16 U337 ( .A(intadd_2_SUM_2_), .Z(n319) );
  C8T28SOI_LR_CNIVX4_P16 U338 ( .A(n318), .Z(intadd_1_A_7_) );
  C8T28SOI_LR_FA1X4_P0 U339 ( .A0(n321), .B0(n320), .CI(n319), .CO(n322), .S0(
        n318) );
  C8T28SOI_LR_CNIVX4_P16 U340 ( .A(n322), .Z(intadd_1_B_8_) );
  C8T28SOI_LR_NOR2X4_P0 U342 ( .A(n331), .B(n391), .Z(intadd_2_CI) );
  C8T28SOI_LR_NOR2X4_P0 U343 ( .A(n330), .B(n403), .Z(intadd_2_B_0_) );
  C8T28SOI_LR_NOR2X4_P0 U344 ( .A(n392), .B(n420), .Z(intadd_2_A_0_) );
  C8T28SOI_LR_CNNOR2X8_P16 U345 ( .A(n324), .B(n323), .Z(intadd_2_B_1_) );
  C8T28SOI_LR_CNNOR2X8_P16 U346 ( .A(n326), .B(n325), .Z(intadd_2_B_2_) );
  C8T28SOI_LR_AOI22X2_P0 U347 ( .A(n327), .B(n407), .C(n334), .D(n398), .Z(
        n328) );
  C8T28SOI_LR_OAI12X3_P0 U348 ( .A(n375), .B(n403), .C(n328), .Z(intadd_2_A_2_) );
  C8T28SOI_LR_CNIVX4_P16 U349 ( .A(n329), .Z(intadd_2_B_3_) );
  C8T28SOI_LR_NOR2X4_P0 U350 ( .A(n392), .B(n386), .Z(intadd_5_CI) );
  C8T28SOI_LR_NOR2X4_P0 U351 ( .A(n331), .B(n330), .Z(intadd_5_B_0_) );
  C8T28SOI_LR_NOR2X4_P0 U352 ( .A(n332), .B(n420), .Z(intadd_5_A_0_) );
  C8T28SOI_LR_AOI22X2_P0 U353 ( .A(n336), .B(n335), .C(n334), .D(n333), .Z(
        n337) );
  C8T28SOI_LR_OAI12X3_P0 U354 ( .A(n422), .B(n403), .C(n337), .Z(intadd_5_B_1_) );
  C8T28SOI_LR_NAND2X4_P0 U355 ( .A(n387), .B(n338), .Z(n374) );
  C8T28SOI_LR_NAND2X4_P0 U356 ( .A(n340), .B(n339), .Z(n373) );
  C8T28SOI_LR_CNNOR2X8_P16 U357 ( .A(n374), .B(n373), .Z(intadd_5_B_2_) );
  C8T28SOI_LR_NOR2X4_P0 U358 ( .A(mult[15]), .B(n477), .Z(n456) );
  C8T28SOI_LR_CNIVX4_P16 U359 ( .A(mult[15]), .Z(n356) );
  C8T28SOI_LR_AO12CX4_P0 U360 ( .A(intadd_0_n1), .B(acc[15]), .C(n356), .Z(
        n458) );
  C8T28SOI_LR_NAND2X4_P0 U361 ( .A(acc[16]), .B(n458), .Z(n447) );
  C8T28SOI_LR_NAND2X4_P0 U362 ( .A(n356), .B(n447), .Z(n449) );
  C8T28SOI_LR_NAND2X4_P0 U363 ( .A(acc[17]), .B(n449), .Z(n341) );
  C8T28SOI_LR_NOR2X4_P0 U364 ( .A(n477), .B(n356), .Z(n454) );
  C8T28SOI_LR_FA1X4_P0 U365 ( .A0(acc[15]), .B0(mult[15]), .CI(intadd_0_n1), 
        .CO(n453), .S0(n272) );
  C8T28SOI_LR_OAI12X3_P0 U366 ( .A(acc[16]), .B(n453), .C(mult[15]), .Z(n448)
         );
  C8T28SOI_LR_NAND2X4_P0 U367 ( .A(n341), .B(n448), .Z(n342) );
  C8T28SOI_LR_AOI22X2_P0 U368 ( .A(n456), .B(n341), .C(n454), .D(n342), .Z(
        n345) );
  C8T28SOI_LR_NAND2X4_P0 U369 ( .A(n356), .B(n341), .Z(n346) );
  C8T28SOI_LR_NAND2X4_P0 U370 ( .A(mult[15]), .B(n342), .Z(n347) );
  C8T28SOI_LR_NAND3X3_P0 U371 ( .A(n464), .B(n346), .C(n347), .Z(n344) );
  C8T28SOI_LR_AOI22X2_P0 U372 ( .A(acc[18]), .B(n345), .C(n344), .D(n343), .Z(
        n153) );
  C8T28SOI_LR_NAND2X4_P0 U373 ( .A(acc[18]), .B(n346), .Z(n348) );
  C8T28SOI_LR_CNNAND2X8_P16 U374 ( .A(n348), .B(n347), .Z(n349) );
  C8T28SOI_LR_AOI22X2_P0 U375 ( .A(n456), .B(n348), .C(n454), .D(n349), .Z(
        n352) );
  C8T28SOI_LR_NAND2X4_P0 U376 ( .A(n356), .B(n348), .Z(n353) );
  C8T28SOI_LR_NAND2X4_P0 U377 ( .A(mult[15]), .B(n349), .Z(n354) );
  C8T28SOI_LR_NAND3X3_P0 U378 ( .A(n464), .B(n353), .C(n354), .Z(n351) );
  C8T28SOI_LR_AOI22X2_P0 U379 ( .A(acc[19]), .B(n352), .C(n351), .D(n350), .Z(
        n154) );
  C8T28SOI_LR_CNNAND2X8_P16 U380 ( .A(acc[19]), .B(n353), .Z(n355) );
  C8T28SOI_LR_CNNAND2X8_P16 U381 ( .A(n355), .B(n354), .Z(n357) );
  C8T28SOI_LR_AOI22X2_P0 U382 ( .A(n456), .B(n355), .C(n454), .D(n357), .Z(
        n360) );
  C8T28SOI_LR_NAND2X4_P0 U383 ( .A(n356), .B(n355), .Z(n361) );
  C8T28SOI_LR_NAND2X4_P0 U384 ( .A(mult[15]), .B(n357), .Z(n362) );
  C8T28SOI_LR_NAND3X3_P0 U385 ( .A(n464), .B(n361), .C(n362), .Z(n359) );
  C8T28SOI_LR_AOI22X2_P0 U386 ( .A(acc[20]), .B(n360), .C(n359), .D(n358), .Z(
        n155) );
  C8T28SOI_LR_CNNAND2X8_P16 U387 ( .A(acc[20]), .B(n361), .Z(n363) );
  C8T28SOI_LR_NAND2X4_P0 U388 ( .A(n363), .B(n362), .Z(n364) );
  C8T28SOI_LR_AOI22X2_P0 U389 ( .A(n456), .B(n363), .C(n454), .D(n364), .Z(
        n368) );
  C8T28SOI_LR_CNIVX4_P16 U390 ( .A(n363), .Z(n365) );
  C8T28SOI_LR_AOI22AX2_P0 U391 ( .C(n365), .D(n456), .A(n364), .B(n454), .Z(
        n367) );
  C8T28SOI_LR_AOI22X2_P0 U392 ( .A(acc[21]), .B(n368), .C(n367), .D(n366), .Z(
        n156) );
  C8T28SOI_LR_CNIVX4_P16 U393 ( .A(n369), .Z(n461) );
  C8T28SOI_LR_FA1X4_P0 U394 ( .A0(acc[1]), .B0(mult[1]), .CI(n461), .CO(
        intadd_0_n14), .S0(SYNOPSYS_UNCONNECTED_1) );
  C8T28SOI_LR_AOI12X3_P0 U396 ( .A(n372), .B(n371), .C(n370), .Z(intadd_5_A_2_) );
  C8T28SOI_LR_AOI12X3_P0 U397 ( .A(n374), .B(n373), .C(intadd_5_B_2_), .Z(
        intadd_5_A_1_) );
  C8T28SOI_LR_OAI22X3_P0 U398 ( .A(n412), .B(n422), .C(n375), .D(n404), .Z(
        intadd_2_A_1_) );
  C8T28SOI_LR_NAND2X4_P0 U399 ( .A(n406), .B(n387), .Z(n385) );
  C8T28SOI_LR_NOR3X3_P0 U400 ( .A(n419), .B(n386), .C(n385), .Z(intadd_3_A_0_)
         );
  C8T28SOI_LR_FA1X4_P0 U401 ( .A0(n378), .B0(n377), .CI(n376), .CO(n381), .S0(
        intadd_4_A_1_) );
  C8T28SOI_LR_NOR2X4_P0 U402 ( .A(n412), .B(n386), .Z(n380) );
  C8T28SOI_LR_OA12X5_P0 U403 ( .A(n380), .B(n379), .C(n384), .Z(intadd_4_B_1_)
         );
  C8T28SOI_LRS_XNOR2X3_P0 U404 ( .A(n382), .B(n381), .Z(n383) );
  C8T28SOI_LR_CNXOR2X9_P16 U405 ( .A(n384), .S(n383), .Z(intadd_4_B_2_) );
  C8T28SOI_LR_CBI4I6X3_P0 U406 ( .A(n386), .B(n419), .C(n385), .D(
        intadd_3_A_0_), .Z(n390) );
  C8T28SOI_LR_CNNAND2X8_P16 U407 ( .A(din[0]), .B(n387), .Z(n400) );
  C8T28SOI_LR_NOR3X3_P0 U408 ( .A(n412), .B(n420), .C(n400), .Z(n399) );
  C8T28SOI_LR_NOR2X4_P0 U409 ( .A(n413), .B(n392), .Z(n389) );
  C8T28SOI_LR_FA1X4_P0 U410 ( .A0(intadd_4_SUM_1_), .B0(n388), .CI(
        intadd_3_SUM_0_), .CO(intadd_1_B_5_), .S0(intadd_1_A_4_) );
  C8T28SOI_LR_FA1X4_P0 U411 ( .A0(n390), .B0(n399), .CI(n389), .CO(n388), .S0(
        n394) );
  C8T28SOI_LR_NOR2X4_P0 U412 ( .A(n413), .B(n403), .Z(n397) );
  C8T28SOI_LR_NOR2X4_P0 U413 ( .A(n391), .B(n404), .Z(n396) );
  C8T28SOI_LR_NOR2X4_P0 U414 ( .A(n405), .B(n392), .Z(n395) );
  C8T28SOI_LR_FA1X4_P0 U415 ( .A0(n394), .B0(n393), .CI(intadd_4_SUM_0_), .CO(
        intadd_1_B_4_), .S0(intadd_1_A_3_) );
  C8T28SOI_LR_FA1X4_P0 U416 ( .A0(n397), .B0(n396), .CI(n395), .CO(n393), .S0(
        n402) );
  C8T28SOI_LR_NAND2X4_P0 U417 ( .A(n406), .B(n398), .Z(n418) );
  C8T28SOI_LR_NOR3X3_P0 U418 ( .A(n419), .B(n420), .C(n418), .Z(n417) );
  C8T28SOI_LR_CBI4I6X3_P0 U419 ( .A(n420), .B(n412), .C(n400), .D(n399), .Z(
        n401) );
  C8T28SOI_LR_FA1X4_P0 U420 ( .A0(n402), .B0(n417), .CI(n401), .CO(
        intadd_1_B_3_), .S0(intadd_1_A_2_) );
  C8T28SOI_LR_NOR2X4_P0 U421 ( .A(n405), .B(n403), .Z(n410) );
  C8T28SOI_LR_NOR2X4_P0 U422 ( .A(n405), .B(n404), .Z(n416) );
  C8T28SOI_LR_NAND3X3_P0 U423 ( .A(n408), .B(n406), .C(n416), .Z(n414) );
  C8T28SOI_LR_NAND2X4_P0 U424 ( .A(n408), .B(n407), .Z(n409) );
  C8T28SOI_LR_AOI12AX3_P0 U425 ( .A(n410), .B(n414), .C(n409), .Z(
        intadd_1_B_2_) );
  C8T28SOI_LR_CNXOR2X9_P16 U426 ( .A(n410), .S(n409), .Z(n411) );
  C8T28SOI_LR_CNXOR2X9_P16 U427 ( .A(n414), .S(n411), .Z(intadd_1_A_1_) );
  C8T28SOI_LR_NOR2X4_P0 U428 ( .A(n413), .B(n412), .Z(n415) );
  C8T28SOI_LR_OA12X5_P0 U429 ( .A(n416), .B(n415), .C(n414), .Z(intadd_1_A_0_)
         );
  C8T28SOI_LR_CBI4I6X3_P0 U430 ( .A(n420), .B(n419), .C(n418), .D(n417), .Z(
        intadd_1_B_1_) );
  C8T28SOI_LR_OAI12X3_P0 U431 ( .A(n423), .B(n422), .C(n421), .Z(n92) );
  C8T28SOI_LR_NOR2X4_P0 U432 ( .A(n424), .B(n432), .Z(n425) );
  C8T28SOI_LR_CNXOR2X9_P16 U433 ( .A(intadd_1_SUM_8_), .S(n425), .Z(n88) );
  C8T28SOI_LR_NOR2X4_P0 U434 ( .A(n426), .B(n432), .Z(n427) );
  C8T28SOI_LR_CNXOR2X9_P16 U435 ( .A(intadd_1_SUM_6_), .S(n427), .Z(n86) );
  C8T28SOI_LR_NOR2X4_P0 U436 ( .A(n428), .B(n432), .Z(n429) );
  C8T28SOI_LR_CNXOR2X9_P16 U437 ( .A(intadd_1_SUM_4_), .S(n429), .Z(n84) );
  C8T28SOI_LR_NOR2X4_P0 U438 ( .A(n430), .B(n432), .Z(n431) );
  C8T28SOI_LR_CNXOR2X9_P16 U439 ( .A(intadd_1_SUM_2_), .S(n431), .Z(n82) );
  C8T28SOI_LR_NOR2X4_P0 U440 ( .A(n433), .B(n432), .Z(n434) );
  C8T28SOI_LR_CNXOR2X9_P16 U441 ( .A(intadd_1_SUM_0_), .S(n434), .Z(n80) );
  C8T28SOI_LR_NAND2X4_P0 U442 ( .A(n439), .B(acc[10]), .Z(n438) );
  C8T28SOI_LRS_XNOR2X3_P0 U443 ( .A(n435), .B(n438), .Z(n436) );
  C8T28SOI_LR_OAI22AX3_P0 U444 ( .A(n161), .B(n437), .C(n442), .D(n436), .Z(
        n193) );
  C8T28SOI_LR_OAI12X3_P0 U445 ( .A(n439), .B(acc[10]), .C(n438), .Z(n441) );
  C8T28SOI_LR_OAI12X3_P0 U446 ( .A(n442), .B(n441), .C(n440), .Z(n192) );
  C8T28SOI_LR_CNIVX4_P16 U447 ( .A(counter[2]), .Z(n445) );
  C8T28SOI_LR_CNNOR2X8_P16 U448 ( .A(n445), .B(n444), .Z(n443) );
  C8T28SOI_LR_OA12X3_P0 U449 ( .A(counter[3]), .B(n443), .C(n464), .Z(n131) );
  C8T28SOI_LR_AOI211X2_P0 U450 ( .A(n445), .B(n444), .C(n443), .D(n477), .Z(
        n130) );
  C8T28SOI_LR_NAND2X4_P0 U451 ( .A(mult[15]), .B(n453), .Z(n457) );
  C8T28SOI_LR_CNNAND2X8_P16 U452 ( .A(n447), .B(n457), .Z(n446) );
  C8T28SOI_LR_AOI22X2_P0 U453 ( .A(n456), .B(n447), .C(n454), .D(n446), .Z(
        n451) );
  C8T28SOI_LR_NAND3X3_P0 U454 ( .A(n464), .B(n449), .C(n448), .Z(n450) );
  C8T28SOI_LR_AOI22AX2_P0 U455 ( .C(acc[17]), .D(n451), .A(acc[17]), .B(n450), 
        .Z(n152) );
  C8T28SOI_LR_NAND2X4_P0 U456 ( .A(acc[15]), .B(intadd_0_n1), .Z(n455) );
  C8T28SOI_LR_AOI22X2_P0 U457 ( .A(n456), .B(n455), .C(n454), .D(n453), .Z(
        n460) );
  C8T28SOI_LR_NAND3X3_P0 U458 ( .A(n464), .B(n458), .C(n457), .Z(n459) );
  C8T28SOI_LR_AOI22AX2_P0 U459 ( .C(acc[16]), .D(n460), .A(acc[16]), .B(n459), 
        .Z(n151) );
  C8T28SOI_LR_CNXOR2X9_P16 U460 ( .A(acc[1]), .S(n461), .Z(n463) );
  C8T28SOI_LR_OAI12X3_P0 U461 ( .A(mult[1]), .B(n463), .C(n464), .Z(n462) );
  C8T28SOI_LR_AOI12X3_P0 U462 ( .A(mult[1]), .B(n463), .C(n462), .Z(n136) );
  C8T28SOI_LR_CNNAND2X8_P16 U463 ( .A(counter[3]), .B(counter[0]), .Z(n470) );
  C8T28SOI_LR_CNNOR2X8_P16 U464 ( .A(counter[1]), .B(counter[2]), .Z(n465) );
  C8T28SOI_LR_OAI22AX3_P0 U465 ( .A(n470), .B(vld_d[0]), .C(n465), .D(n464), 
        .Z(n466) );
  C8T28SOI_LR_CNIVX4_P16 U466 ( .A(n466), .Z(n471) );
  C8T28SOI_LR_NOR3X3_P0 U467 ( .A(vld_d[0]), .B(vld_d[4]), .C(n467), .Z(n469)
         );
  C8T28SOI_LR_CNNOR2X8_P16 U468 ( .A(acc_rdy), .B(n471), .Z(n468) );
  C8T28SOI_LR_AOI211X2_P0 U469 ( .A(n471), .B(n470), .C(n469), .D(n468), .Z(
        n230) );
  C8T28SOI_LR_CNNAND2X8_P16 U470 ( .A(acc_rdy), .B(n472), .Z(n473) );
  C8T28SOI_LR_OAI12X3_P0 U471 ( .A(vld_d[0]), .B(vld_d[4]), .C(n473), .Z(n228)
         );
  C8T28SOI_LR_OAI12X3_P0 U472 ( .A(vld_d[0]), .B(vld_d[4]), .C(n477), .Z(n227)
         );
  C8T28SOI_LR_CNIVX4_P16 U170 ( .A(n432), .Z(n298) );
  C8T28SOI_LR_CNIVX4_P16 U474 ( .A(n464), .Z(n477) );
  C8T28SOI_LR_TOLX5 U151 ( .TL(n132) );
endmodule

