/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in topographical mode
// Version   : V-2023.12-SP5-3
// Date      : Sun Aug 17 15:48:56 2025
/////////////////////////////////////////////////////////////
`timescale 1ns/1ps

module SNPS_CLOCK_GATE_HIGH_fp_mac_0 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  C8T28SOI_LRP_CNHLSX4_P16 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_fp_mac_4 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  C8T28SOI_LRP_CNHLSX4_P16 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_fp_mac_6 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  C8T28SOI_LRP_CNHLSX4_P16 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_fp_mac_7 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  C8T28SOI_LRP_CNHLSX4_P16 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_fp_mac_8 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  C8T28SOI_LRP_CNHLSX4_P16 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module fp_mac ( clk_i, rstn, vld_i, win, din, acc_o, vld_o );
  input [7:0] win;
  input [7:0] din;
  output [7:0] acc_o;
  input clk_i, rstn, vld_i;
  output vld_o;
  wire   sign_wd, n13, n14, n15, sign_fp_tmp, n21, n22, n23, n24, n25, sign_fp,
         n27, n28, n29, n30, n31, n32, n33, n34, acc_rdy, n104, n105, n106,
         n107, n108, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, sign_r, zc_tmp,
         zc_i, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n338, n435, n436, n437, n438, n452, n453, n454,
         n455, n456, n457, n458, n459, n460, n461, n462, n463, n464, n465,
         n466, n467, n468, n469, n470, n471, n472, n473, n474, n475, n476,
         n477, n478, n479, n480, n481, n482, n483, n487, n510, n511, n512,
         n513, n514, n515, n516, n517, net906, net912, n981, n982, n983, n984,
         n985, n986, intadd_0_A_22_, intadd_0_A_21_, intadd_0_A_20_,
         intadd_0_A_19_, intadd_0_A_18_, intadd_0_A_17_, intadd_0_A_16_,
         intadd_0_A_15_, intadd_0_A_14_, intadd_0_A_13_, intadd_0_A_12_,
         intadd_0_A_11_, intadd_0_A_10_, intadd_0_A_9_, intadd_0_A_8_,
         intadd_0_A_7_, intadd_0_A_6_, intadd_0_A_5_, intadd_0_A_4_,
         intadd_0_A_3_, intadd_0_A_2_, intadd_0_A_1_, intadd_0_A_0_,
         intadd_0_B_22_, intadd_0_B_21_, intadd_0_B_20_, intadd_0_B_19_,
         intadd_0_B_18_, intadd_0_B_17_, intadd_0_B_16_, intadd_0_B_15_,
         intadd_0_B_14_, intadd_0_B_13_, intadd_0_B_12_, intadd_0_B_11_,
         intadd_0_B_10_, intadd_0_B_9_, intadd_0_B_8_, intadd_0_B_7_,
         intadd_0_B_6_, intadd_0_B_5_, intadd_0_B_4_, intadd_0_B_3_,
         intadd_0_B_2_, intadd_0_B_1_, intadd_0_B_0_, intadd_0_CI,
         intadd_0_SUM_22_, intadd_0_SUM_21_, intadd_0_SUM_20_,
         intadd_0_SUM_19_, intadd_0_SUM_18_, intadd_0_SUM_17_,
         intadd_0_SUM_16_, intadd_0_SUM_15_, intadd_0_SUM_14_,
         intadd_0_SUM_13_, intadd_0_SUM_12_, intadd_0_SUM_11_,
         intadd_0_SUM_10_, intadd_0_SUM_9_, intadd_0_SUM_8_, intadd_0_SUM_7_,
         intadd_0_SUM_6_, intadd_0_SUM_5_, intadd_0_SUM_4_, intadd_0_SUM_3_,
         intadd_0_SUM_2_, intadd_0_SUM_1_, intadd_0_SUM_0_, intadd_0_n23,
         intadd_0_n22, intadd_0_n21, intadd_0_n20, intadd_0_n19, intadd_0_n18,
         intadd_0_n17, intadd_0_n16, intadd_0_n15, intadd_0_n14, intadd_0_n13,
         intadd_0_n12, intadd_0_n11, intadd_0_n10, intadd_0_n9, intadd_0_n8,
         intadd_0_n7, intadd_0_n6, intadd_0_n5, intadd_0_n4, intadd_0_n3,
         intadd_0_n2, intadd_0_n1, intadd_1_A_3_, intadd_1_A_2_, intadd_1_A_1_,
         intadd_1_A_0_, intadd_1_B_3_, intadd_1_B_2_, intadd_1_B_1_,
         intadd_1_B_0_, intadd_1_CI, intadd_1_SUM_3_, intadd_1_SUM_2_,
         intadd_1_SUM_1_, intadd_1_SUM_0_, intadd_1_n4, intadd_1_n3,
         intadd_1_n2, intadd_1_n1, intadd_2_A_3_, intadd_2_A_2_, intadd_2_A_1_,
         intadd_2_A_0_, intadd_2_B_3_, intadd_2_B_2_, intadd_2_B_1_,
         intadd_2_B_0_, intadd_2_CI, intadd_2_n4, intadd_2_n3, intadd_2_n2,
         intadd_2_n1, intadd_3_A_2_, intadd_3_A_1_, intadd_3_B_2_,
         intadd_3_B_1_, intadd_3_SUM_2_, intadd_3_SUM_1_, intadd_3_n3,
         intadd_3_n2, intadd_3_n1, n990, n991, n992, n993, n995, n996, n997,
         n998, n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007,
         n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017,
         n1018, n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027,
         n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037,
         n1038, n1039, n1040, n1041, n1043, n1044, n1045, n1046, n1047, n1048,
         n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1057, n1058, n1059,
         n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068, n1069,
         n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1078, n1079,
         n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088, n1089,
         n1090, n1091, n1092, n1093, n1094, n1095, n1096, n1097, n1098, n1099,
         n1100, n1101, n1102, n1103, n1104, n1105, n1106, n1107, n1108, n1109,
         n1110, n1111, n1112, n1113, n1114, n1115, n1116, n1117, n1118, n1119,
         n1120, n1122, n1123, n1124, n1125, n1126, n1127, n1128, n1129, n1130,
         n1131, n1132, n1133, n1134, n1135, n1136, n1137, n1138, n1139, n1140,
         n1141, n1142, n1143, n1144, n1145, n1146, n1147, n1148, n1149, n1150,
         n1151, n1152, n1153, n1154, n1155, n1156, n1157, n1158, n1159, n1160,
         n1161, n1162, n1163, n1164, n1165, n1166, n1167, n1168, n1169, n1170,
         n1171, n1172, n1173, n1174, n1176, n1177, n1178, n1179, n1180, n1181,
         n1182, n1183, n1184, n1185, n1186, n1187, n1188, n1189, n1190, n1191,
         n1192, n1193, n1194, n1195, n1196, n1200, n1201, n1202, n1203, n1204,
         n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212, n1213, n1214,
         n1215, n1216, n1217, n1218, n1219, n1220, n1222, n1223, n1224, n1225,
         n1226, n1227, n1228, n1229, n1230, n1231, n1232, n1233, n1234, n1235,
         n1236, n1237, n1238, n1239, n1240, n1241, n1242, n1243, n1244, n1245,
         n1246, n1247, n1248, n1249, n1250, n1251, n1252, n1253, n1254, n1255,
         n1256, n1257, n1258, n1259, n1261, n1262, n1263, n1264, n1265, n1266,
         n1267, n1268, n1269, n1270, n1271, n1272, n1273, n1274, n1275, n1276,
         n1277, n1278, n1279, n1280, n1281, n1282, n1283, n1284, n1286, n1287,
         n1288, n1289, n1290, n1291, n1292, n1293, n1294, n1295, n1296, n1297,
         n1298, n1299, n1300, n1301, n1302, n1303, n1304, n1305, n1306, n1307,
         n1308, n1309, n1310, n1311, n1312, n1313, n1314, n1315, n1316, n1317,
         n1318, n1319, n1320, n1321, n1322, n1323, n1324, n1325, n1326, n1327,
         n1328, n1329, n1330, n1332, n1333, n1334, n1335, n1336, n1337, n1338,
         n1339, n1341, n1342, n1343, n1344, n1345, n1346, n1347, n1348, n1349,
         n1350, n1351, n1352, n1353, n1354, n1355, n1356, n1357, n1358, n1359,
         n1360, n1361, n1362, n1363, n1364, n1365, n1366, n1367, n1368, n1369,
         n1370, n1371, n1372, n1373, n1374, n1375, n1376, n1377, n1379, n1380,
         n1381, n1382, n1383, n1384, n1385, n1386, n1387, n1388, n1389, n1390,
         n1391, n1392, n1393, n1395, n1396, n1397, n1398, n1399, n1400, n1401,
         n1402, n1403, n1404, n1405, n1406, n1407, n1408, n1409, n1410, n1411,
         n1412, n1413, n1414, n1415, n1416, n1417, n1418, n1419, n1420, n1421,
         n1422, n1423, n1424, n1425, n1426, n1427, n1428, n1429, n1430, n1431,
         n1432, n1433, n1434, n1436, n1437, n1438, n1440, n1441, n1442, n1443,
         n1444, n1445, n1446, n1447, n1448, n1449, n1450, n1451, n1452, n1453,
         n1454, n1455, n1456, n1457, n1458, n1459, n1460, n1461, n1462, n1463,
         n1464, n1465, n1466, n1467, n1468, n1469, n1470, n1471, n1472, n1473,
         n1474, n1475, n1476, n1477, n1478, n1479, n1480, n1481, n1483, n1484,
         n1485, n1486, n1487, n1488, n1489, n1490, n1491, n1492, n1493, n1494,
         n1495, n1496, n1497, n1498, n1499, n1500, n1501, n1502, n1503, n1504,
         n1505, n1506, n1507, n1508, n1509, n1510, n1511, n1512, n1513, n1514,
         n1515, n1516, n1517, n1518, n1520, n1521, n1522, n1524, n1525, n1526,
         n1527, n1528, n1529, n1530, n1531, n1532, n1533, n1534, n1535, n1536,
         n1537, n1538, n1539, n1540, n1541, n1542, n1544, n1545, n1546, n1547,
         n1548, n1549, n1550, n1551, n1552, n1553, n1554, n1574, n1575, n1576,
         n1577, n1578, n1579, n1580, n1581, n1582, n1583, n1584, n1586, n1587,
         n1588, n1589, n1590, n1591, n1593, n1594, n1595, n1596, n1597,
         SYNOPSYS_UNCONNECTED_1;
  wire   [3:0] exp_w;
  wire   [3:0] exp_d;
  wire   [2:0] mts_w_tmp;
  wire   [2:0] mts_d_tmp;
  wire   [4:0] exp_fp_tmp;
  wire   [3:0] mts_w;
  wire   [3:0] mts_d;
  wire   [4:0] exp_fp;
  wire   [7:0] mts_fp;
  wire   [9:0] vld_d;
  wire   [3:0] counter;
  wire   [39:0] acc;
  wire   [39:0] acc_mag;
  wire   [14:0] acc_mag_zc;
  wire   [39:14] mts_tmp;
  wire   [3:0] exp_r;
  wire   [4:0] mts_r;

  SNPS_CLOCK_GATE_HIGH_fp_mac_0 clk_gate_mts_w_tmp_reg ( .CLK(clk_i), .EN(
        vld_i), .ENCLK(net906), .TE(n452) );
  SNPS_CLOCK_GATE_HIGH_fp_mac_4 clk_gate_counter_reg ( .CLK(clk_i), .EN(n104), 
        .ENCLK(net912), .TE(n452) );
  SNPS_CLOCK_GATE_HIGH_fp_mac_6 clk_gate_zc_tmp_reg ( .CLK(clk_i), .EN(n280), 
        .ENCLK(n983), .TE(n452) );
  SNPS_CLOCK_GATE_HIGH_fp_mac_7 clk_gate_vld_o_tmp_reg ( .CLK(n983), .EN(n985), 
        .ENCLK(n982), .TE(n452) );
  SNPS_CLOCK_GATE_HIGH_fp_mac_8 clk_gate_mts_r_reg_1 ( .CLK(n983), .EN(n984), 
        .ENCLK(n981), .TE(n452) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U24 ( .A0(intadd_0_A_0_), .B0(intadd_0_B_0_), 
        .CI(intadd_0_CI), .CO(intadd_0_n23), .S0(intadd_0_SUM_0_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U23 ( .A0(intadd_0_A_1_), .B0(intadd_0_B_1_), 
        .CI(intadd_0_n23), .CO(intadd_0_n22), .S0(intadd_0_SUM_1_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U22 ( .A0(intadd_0_A_2_), .B0(intadd_0_B_2_), 
        .CI(intadd_0_n22), .CO(intadd_0_n21), .S0(intadd_0_SUM_2_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U21 ( .A0(intadd_0_A_3_), .B0(intadd_0_B_3_), 
        .CI(intadd_0_n21), .CO(intadd_0_n20), .S0(intadd_0_SUM_3_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U20 ( .A0(intadd_0_A_4_), .B0(intadd_0_B_4_), 
        .CI(intadd_0_n20), .CO(intadd_0_n19), .S0(intadd_0_SUM_4_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U19 ( .A0(intadd_0_A_5_), .B0(intadd_0_B_5_), 
        .CI(intadd_0_n19), .CO(intadd_0_n18), .S0(intadd_0_SUM_5_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U18 ( .A0(intadd_0_A_6_), .B0(intadd_0_B_6_), 
        .CI(intadd_0_n18), .CO(intadd_0_n17), .S0(intadd_0_SUM_6_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U17 ( .A0(intadd_0_A_7_), .B0(intadd_0_B_7_), 
        .CI(intadd_0_n17), .CO(intadd_0_n16), .S0(intadd_0_SUM_7_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U16 ( .A0(intadd_0_A_8_), .B0(intadd_0_B_8_), 
        .CI(intadd_0_n16), .CO(intadd_0_n15), .S0(intadd_0_SUM_8_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U15 ( .A0(intadd_0_A_9_), .B0(intadd_0_B_9_), 
        .CI(intadd_0_n15), .CO(intadd_0_n14), .S0(intadd_0_SUM_9_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U14 ( .A0(intadd_0_A_10_), .B0(intadd_0_B_10_), 
        .CI(intadd_0_n14), .CO(intadd_0_n13), .S0(intadd_0_SUM_10_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U13 ( .A0(intadd_0_A_11_), .B0(intadd_0_B_11_), 
        .CI(intadd_0_n13), .CO(intadd_0_n12), .S0(intadd_0_SUM_11_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U12 ( .A0(intadd_0_A_12_), .B0(intadd_0_B_12_), 
        .CI(intadd_0_n12), .CO(intadd_0_n11), .S0(intadd_0_SUM_12_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U11 ( .A0(intadd_0_A_13_), .B0(intadd_0_B_13_), 
        .CI(intadd_0_n11), .CO(intadd_0_n10), .S0(intadd_0_SUM_13_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U10 ( .A0(intadd_0_A_14_), .B0(intadd_0_B_14_), 
        .CI(intadd_0_n10), .CO(intadd_0_n9), .S0(intadd_0_SUM_14_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U9 ( .A0(intadd_0_A_15_), .B0(intadd_0_B_15_), 
        .CI(intadd_0_n9), .CO(intadd_0_n8), .S0(intadd_0_SUM_15_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U8 ( .A0(intadd_0_A_16_), .B0(intadd_0_B_16_), 
        .CI(intadd_0_n8), .CO(intadd_0_n7), .S0(intadd_0_SUM_16_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U7 ( .A0(intadd_0_A_17_), .B0(intadd_0_B_17_), 
        .CI(intadd_0_n7), .CO(intadd_0_n6), .S0(intadd_0_SUM_17_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U6 ( .A0(intadd_0_A_18_), .B0(intadd_0_B_18_), 
        .CI(intadd_0_n6), .CO(intadd_0_n5), .S0(intadd_0_SUM_18_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U5 ( .A0(intadd_0_A_19_), .B0(intadd_0_B_19_), 
        .CI(intadd_0_n5), .CO(intadd_0_n4), .S0(intadd_0_SUM_19_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U4 ( .A0(intadd_0_A_20_), .B0(intadd_0_B_20_), 
        .CI(intadd_0_n4), .CO(intadd_0_n3), .S0(intadd_0_SUM_20_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U3 ( .A0(intadd_0_A_21_), .B0(intadd_0_B_21_), 
        .CI(intadd_0_n3), .CO(intadd_0_n2), .S0(intadd_0_SUM_21_) );
  C8T28SOI_LR_FA1X4_P0 intadd_0_U2 ( .A0(intadd_0_A_22_), .B0(intadd_0_B_22_), 
        .CI(intadd_0_n2), .CO(intadd_0_n1), .S0(intadd_0_SUM_22_) );
  C8T28SOI_LR_FA1X4_P0 intadd_1_U5 ( .A0(intadd_1_A_0_), .B0(intadd_1_B_0_), 
        .CI(intadd_1_CI), .CO(intadd_1_n4), .S0(intadd_1_SUM_0_) );
  C8T28SOI_LR_FA1X4_P0 intadd_1_U4 ( .A0(intadd_1_A_1_), .B0(intadd_1_B_1_), 
        .CI(intadd_1_n4), .CO(intadd_1_n3), .S0(intadd_1_SUM_1_) );
  C8T28SOI_LR_FA1X4_P0 intadd_1_U3 ( .A0(intadd_1_A_2_), .B0(intadd_1_B_2_), 
        .CI(intadd_1_n3), .CO(intadd_1_n2), .S0(intadd_1_SUM_2_) );
  C8T28SOI_LR_FA1X4_P0 intadd_1_U2 ( .A0(intadd_1_A_3_), .B0(intadd_1_B_3_), 
        .CI(intadd_1_n2), .CO(intadd_1_n1), .S0(intadd_1_SUM_3_) );
  C8T28SOI_LR_FA1X4_P0 intadd_2_U5 ( .A0(intadd_2_A_0_), .B0(intadd_2_B_0_), 
        .CI(intadd_2_CI), .CO(intadd_2_n4), .S0(n29) );
  C8T28SOI_LR_FA1X4_P0 intadd_2_U4 ( .A0(intadd_2_A_1_), .B0(intadd_2_B_1_), 
        .CI(intadd_2_n4), .CO(intadd_2_n3), .S0(n30) );
  C8T28SOI_LR_FA1X4_P0 intadd_2_U3 ( .A0(intadd_2_A_2_), .B0(intadd_2_B_2_), 
        .CI(intadd_2_n3), .CO(intadd_2_n2), .S0(n31) );
  C8T28SOI_LR_FA1X4_P0 intadd_2_U2 ( .A0(intadd_2_A_3_), .B0(intadd_2_B_3_), 
        .CI(intadd_2_n2), .CO(intadd_2_n1), .S0(n32) );
  C8T28SOI_LR_FA1X4_P0 intadd_3_U3 ( .A0(intadd_3_A_1_), .B0(intadd_3_B_1_), 
        .CI(intadd_3_n3), .CO(intadd_3_n2), .S0(intadd_3_SUM_1_) );
  C8T28SOI_LR_FA1X4_P0 intadd_3_U2 ( .A0(intadd_3_A_2_), .B0(intadd_3_B_2_), 
        .CI(intadd_3_n2), .CO(intadd_3_n1), .S0(intadd_3_SUM_2_) );
  C8T28SOI_LR_DFPRQX4_P0 mts_d_tmp_reg_2_ ( .D(din[2]), .CP(net906), .RN(n1574), .Q(mts_d_tmp[2]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_d_tmp_reg_1_ ( .D(din[1]), .CP(net906), .RN(n1574), .Q(mts_d_tmp[1]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_d_tmp_reg_0_ ( .D(din[0]), .CP(net906), .RN(n1577), .Q(mts_d_tmp[0]) );
  C8T28SOI_LR_DFPRQX4_P0 sign_wd_reg ( .D(n13), .CP(net906), .RN(n1578), .Q(
        sign_wd) );
  C8T28SOI_LR_DFPRQX4_P0 mts_w_tmp_reg_2_ ( .D(win[2]), .CP(net906), .RN(n1577), .Q(mts_w_tmp[2]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_w_tmp_reg_1_ ( .D(win[1]), .CP(net906), .RN(n1574), .Q(mts_w_tmp[1]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_w_tmp_reg_0_ ( .D(win[0]), .CP(net906), .RN(n1574), .Q(mts_w_tmp[0]) );
  C8T28SOI_LR_DFPRQX4_P0 sign_fp_tmp_reg ( .D(sign_wd), .CP(clk_i), .RN(n1577), 
        .Q(sign_fp_tmp) );
  C8T28SOI_LR_DFPRQX4_P0 exp_fp_tmp_reg_4_ ( .D(n25), .CP(clk_i), .RN(n1577), 
        .Q(exp_fp_tmp[4]) );
  C8T28SOI_LR_DFPRQX4_P0 exp_fp_tmp_reg_3_ ( .D(n24), .CP(clk_i), .RN(n1577), 
        .Q(exp_fp_tmp[3]) );
  C8T28SOI_LR_DFPRQX4_P0 exp_fp_tmp_reg_2_ ( .D(n23), .CP(clk_i), .RN(n1578), 
        .Q(exp_fp_tmp[2]) );
  C8T28SOI_LR_DFPRQX4_P0 exp_fp_tmp_reg_1_ ( .D(n22), .CP(clk_i), .RN(n1578), 
        .Q(exp_fp_tmp[1]) );
  C8T28SOI_LR_DFPRQX4_P0 exp_fp_tmp_reg_0_ ( .D(n21), .CP(clk_i), .RN(n1577), 
        .Q(exp_fp_tmp[0]) );
  C8T28SOI_LR_DFPRQX4_P0 sign_r_reg ( .D(n281), .CP(n983), .RN(n1577), .Q(
        sign_r) );
  C8T28SOI_LR_DFPRQX4_P0 zc_tmp_reg ( .D(n1595), .CP(n983), .RN(n1579), .Q(
        zc_tmp) );
  C8T28SOI_LR_DFPRQX4_P0 mts_r_reg_3_ ( .D(n482), .CP(n981), .RN(n1579), .Q(
        mts_r[3]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_o_tmp_reg ( .D(n487), .CP(n982), .RN(n1577), .Q(
        vld_o) );
  C8T28SOI_LR_DFPRQX4_P0 acc_rc_reg_7_ ( .D(n517), .CP(n982), .RN(n1577), .Q(
        acc_o[7]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_rc_reg_3_ ( .D(n513), .CP(n982), .RN(n1575), .Q(
        acc_o[3]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_rc_reg_4_ ( .D(n514), .CP(n982), .RN(n1576), .Q(
        acc_o[4]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_rc_reg_0_ ( .D(n510), .CP(n982), .RN(n1575), .Q(
        acc_o[0]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_rc_reg_1_ ( .D(n511), .CP(n982), .RN(n1575), .Q(
        acc_o[1]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_rc_reg_2_ ( .D(n512), .CP(n982), .RN(n1581), .Q(
        acc_o[2]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_rc_reg_5_ ( .D(n515), .CP(n982), .RN(n1576), .Q(
        acc_o[5]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_rc_reg_6_ ( .D(n516), .CP(n982), .RN(n1577), .Q(
        acc_o[6]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_r_reg_2_ ( .D(n481), .CP(n981), .RN(n1576), .Q(
        mts_r[2]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_r_reg_1_ ( .D(n480), .CP(n981), .RN(n1576), .Q(
        mts_r[1]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_r_reg_0_ ( .D(n479), .CP(n981), .RN(n1576), .Q(
        mts_r[0]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_39_ ( .D(n478), .CP(n981), .RN(n1579), 
        .Q(mts_tmp[39]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_38_ ( .D(n477), .CP(n981), .RN(n1580), 
        .Q(mts_tmp[38]) );
  C8T28SOI_LR_DFPRQX4_P0 exp_r_reg_3_ ( .D(n438), .CP(n981), .RN(n1581), .Q(
        exp_r[3]) );
  C8T28SOI_LR_DFPRQX4_P0 exp_r_reg_2_ ( .D(n437), .CP(n981), .RN(n1579), .Q(
        exp_r[2]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_37_ ( .D(n476), .CP(n981), .RN(n1578), 
        .Q(mts_tmp[37]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_r_reg_4_ ( .D(n483), .CP(n981), .RN(n1579), .Q(
        mts_r[4]) );
  C8T28SOI_LR_DFPRQX4_P0 exp_r_reg_0_ ( .D(n435), .CP(n981), .RN(n1576), .Q(
        exp_r[0]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_38_ ( .D(n150), .CP(net912), .RN(n1577), .Q(
        acc[38]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_36_ ( .D(n475), .CP(n981), .RN(n1581), 
        .Q(mts_tmp[36]) );
  C8T28SOI_LR_DFPRQX4_P0 exp_r_reg_1_ ( .D(n436), .CP(n981), .RN(n1579), .Q(
        exp_r[1]) );
  C8T28SOI_LR_DFPRQX4_P0 counter_reg_3_ ( .D(n108), .CP(net912), .RN(n1574), 
        .Q(counter[3]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_39_ ( .D(n321), .CP(n983), .RN(n1577), 
        .Q(acc_mag[39]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_35_ ( .D(n474), .CP(n981), .RN(n1579), 
        .Q(mts_tmp[35]) );
  C8T28SOI_LR_DFPRQX4_P0 counter_reg_2_ ( .D(n107), .CP(net912), .RN(n1574), 
        .Q(counter[2]) );
  C8T28SOI_LR_DFPRQX4_P0 counter_reg_1_ ( .D(n106), .CP(net912), .RN(n1574), 
        .Q(counter[1]) );
  C8T28SOI_LR_DFPRQX4_P0 counter_reg_0_ ( .D(n105), .CP(net912), .RN(n1574), 
        .Q(counter[0]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_14_ ( .D(n453), .CP(n981), .RN(n1578), 
        .Q(mts_tmp[14]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_31_ ( .D(n470), .CP(n981), .RN(n1574), 
        .Q(mts_tmp[31]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_29_ ( .D(n468), .CP(n981), .RN(n1574), 
        .Q(mts_tmp[29]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_27_ ( .D(n466), .CP(n981), .RN(n1574), 
        .Q(mts_tmp[27]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_23_ ( .D(n462), .CP(n981), .RN(n1578), 
        .Q(mts_tmp[23]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_34_ ( .D(n473), .CP(n981), .RN(n1574), 
        .Q(mts_tmp[34]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_33_ ( .D(n472), .CP(n981), .RN(n1574), 
        .Q(mts_tmp[33]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_37_ ( .D(n149), .CP(net912), .RN(n1577), .Q(
        acc[37]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_25_ ( .D(n464), .CP(n981), .RN(n1574), 
        .Q(mts_tmp[25]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_26_ ( .D(n465), .CP(n981), .RN(n1578), 
        .Q(mts_tmp[26]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_30_ ( .D(n469), .CP(n981), .RN(n1578), 
        .Q(mts_tmp[30]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_22_ ( .D(n461), .CP(n981), .RN(n1578), 
        .Q(mts_tmp[22]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_15_ ( .D(n454), .CP(n981), .RN(n1578), 
        .Q(mts_tmp[15]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_30_ ( .D(n312), .CP(n983), .RN(n1574), 
        .Q(acc_mag[30]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_31_ ( .D(n313), .CP(n983), .RN(n1580), 
        .Q(acc_mag[31]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_17_ ( .D(n456), .CP(n981), .RN(n1578), 
        .Q(mts_tmp[17]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_16_ ( .D(n455), .CP(n981), .RN(n1578), 
        .Q(mts_tmp[16]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_19_ ( .D(n458), .CP(n981), .RN(n1578), 
        .Q(mts_tmp[19]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_39_ ( .D(n151), .CP(net912), .RN(n1577), .Q(
        acc[39]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_7_ ( .D(n289), .CP(n983), .RN(n1575), .Q(
        acc_mag[7]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_36_ ( .D(n148), .CP(net912), .RN(n1577), .Q(
        acc[36]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_5_ ( .D(n287), .CP(n983), .RN(n1576), .Q(
        acc_mag[5]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_18_ ( .D(n457), .CP(n981), .RN(n1578), 
        .Q(mts_tmp[18]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_25_ ( .D(n307), .CP(n983), .RN(n1581), 
        .Q(acc_mag[25]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_12_ ( .D(n294), .CP(n983), .RN(n1576), 
        .Q(acc_mag[12]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_11_ ( .D(n293), .CP(n983), .RN(n1576), 
        .Q(acc_mag[11]) );
  C8T28SOI_LR_DFPRQX4_P0 exp_d_reg_1_ ( .D(din[4]), .CP(net906), .RN(n1574), 
        .Q(exp_d[1]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_28_ ( .D(n467), .CP(n981), .RN(n1578), 
        .Q(mts_tmp[28]) );
  C8T28SOI_LR_DFPRQX4_P0 exp_w_reg_1_ ( .D(win[4]), .CP(net906), .RN(n1576), 
        .Q(exp_w[1]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_20_ ( .D(n459), .CP(n981), .RN(n1578), 
        .Q(mts_tmp[20]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_16_ ( .D(n298), .CP(n983), .RN(n1575), 
        .Q(acc_mag[16]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_23_ ( .D(n305), .CP(n983), .RN(n1579), 
        .Q(acc_mag[23]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_15_ ( .D(n297), .CP(n983), .RN(n1575), 
        .Q(acc_mag[15]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_17_ ( .D(n299), .CP(n983), .RN(n1575), 
        .Q(acc_mag[17]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_33_ ( .D(n315), .CP(n983), .RN(n1575), 
        .Q(acc_mag[33]) );
  C8T28SOI_LR_DFPRQX4_P0 zc_i_reg ( .D(n338), .CP(n983), .RN(n1574), .Q(zc_i)
         );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_36_ ( .D(n318), .CP(n983), .RN(n1577), 
        .Q(acc_mag[36]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_2_ ( .D(n284), .CP(n983), .RN(n1576), .Q(
        acc_mag[2]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_35_ ( .D(n317), .CP(n983), .RN(n1579), 
        .Q(acc_mag[35]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_27_ ( .D(n309), .CP(n983), .RN(n1580), 
        .Q(acc_mag[27]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_34_ ( .D(n316), .CP(n983), .RN(n1580), 
        .Q(acc_mag[34]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_35_ ( .D(n147), .CP(net912), .RN(n1579), .Q(
        acc[35]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_6_ ( .D(n288), .CP(n983), .RN(n1576), .Q(
        acc_mag[6]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_8_ ( .D(n290), .CP(n983), .RN(n1575), .Q(
        acc_mag[8]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_9_ ( .D(n291), .CP(n983), .RN(n1576), .Q(
        acc_mag[9]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_4_ ( .D(n286), .CP(n983), .RN(n1576), .Q(
        acc_mag[4]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_3_ ( .D(n285), .CP(n983), .RN(n1576), .Q(
        acc_mag[3]) );
  C8T28SOI_LR_DFPRQX4_P0 exp_d_reg_0_ ( .D(din[3]), .CP(net906), .RN(n1577), 
        .Q(exp_d[0]) );
  C8T28SOI_LR_DFPRQX4_P0 exp_w_reg_0_ ( .D(win[3]), .CP(net906), .RN(n1580), 
        .Q(exp_w[0]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_13_ ( .D(n295), .CP(n983), .RN(n1575), 
        .Q(acc_mag[13]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_14_ ( .D(n296), .CP(n983), .RN(n1575), 
        .Q(acc_mag[14]) );
  C8T28SOI_LR_DFPRQX4_P0 exp_d_reg_2_ ( .D(din[5]), .CP(net906), .RN(n1580), 
        .Q(exp_d[2]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_d_reg_0_ ( .D(mts_d_tmp[0]), .CP(clk_i), .RN(
        n1576), .Q(mts_d[0]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_w_reg_2_ ( .D(mts_w_tmp[2]), .CP(clk_i), .RN(
        n1576), .Q(mts_w[2]) );
  C8T28SOI_LR_DFPRQX4_P0 exp_w_reg_2_ ( .D(win[5]), .CP(net906), .RN(n1578), 
        .Q(exp_w[2]) );
  C8T28SOI_LR_DFPRQX4_P0 exp_d_reg_3_ ( .D(din[6]), .CP(net906), .RN(n1578), 
        .Q(exp_d[3]) );
  C8T28SOI_LR_DFPRQX4_P0 exp_w_reg_3_ ( .D(win[6]), .CP(net906), .RN(n1577), 
        .Q(exp_w[3]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_24_ ( .D(n306), .CP(n983), .RN(n1581), 
        .Q(acc_mag[24]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_18_ ( .D(n300), .CP(n983), .RN(n1575), 
        .Q(acc_mag[18]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_19_ ( .D(n301), .CP(n983), .RN(n1575), 
        .Q(acc_mag[19]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_22_ ( .D(n304), .CP(n983), .RN(n1579), 
        .Q(acc_mag[22]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_20_ ( .D(n302), .CP(n983), .RN(n1576), 
        .Q(acc_mag[20]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_w_reg_3_ ( .D(n14), .CP(clk_i), .RN(n1576), .Q(
        mts_w[3]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_21_ ( .D(n303), .CP(n983), .RN(n1575), 
        .Q(acc_mag[21]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_d_reg_3_ ( .D(n15), .CP(clk_i), .RN(n1577), .Q(
        mts_d[3]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_32_ ( .D(n314), .CP(n983), .RN(n1580), 
        .Q(acc_mag[32]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_37_ ( .D(n319), .CP(n983), .RN(n1580), 
        .Q(acc_mag[37]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_28_ ( .D(n310), .CP(n983), .RN(n1574), 
        .Q(acc_mag[28]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_38_ ( .D(n320), .CP(n983), .RN(n1577), 
        .Q(acc_mag[38]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_26_ ( .D(n308), .CP(n983), .RN(n1574), 
        .Q(acc_mag[26]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_29_ ( .D(n311), .CP(n983), .RN(n1574), 
        .Q(acc_mag[29]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_w_reg_1_ ( .D(mts_w_tmp[1]), .CP(clk_i), .RN(
        n1575), .Q(mts_w[1]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_34_ ( .D(n146), .CP(net912), .RN(n1579), .Q(
        acc[34]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_d_reg_1_ ( .D(mts_d_tmp[1]), .CP(clk_i), .RN(
        n1580), .Q(mts_d[1]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_1_ ( .D(n283), .CP(n983), .RN(n1576), .Q(
        acc_mag[1]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_0_ ( .D(n282), .CP(n983), .RN(n1579), .Q(
        acc_mag[0]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_reg_10_ ( .D(n292), .CP(n983), .RN(n1576), 
        .Q(acc_mag[10]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_d_reg_2_ ( .D(mts_d_tmp[2]), .CP(clk_i), .RN(
        n1580), .Q(mts_d[2]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_w_reg_0_ ( .D(mts_w_tmp[0]), .CP(clk_i), .RN(
        n1576), .Q(mts_w[0]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_24_ ( .D(n463), .CP(n981), .RN(n1578), 
        .Q(mts_tmp[24]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_21_ ( .D(n460), .CP(n981), .RN(n1578), 
        .Q(mts_tmp[21]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_tmp_reg_32_ ( .D(n471), .CP(n981), .RN(n1578), 
        .Q(mts_tmp[32]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_33_ ( .D(n145), .CP(net912), .RN(n1581), .Q(
        acc[33]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_32_ ( .D(n144), .CP(net912), .RN(n1581), .Q(
        acc[32]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_rdy_reg ( .D(n986), .CP(clk_i), .RN(n1574), .Q(
        acc_rdy) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_31_ ( .D(n143), .CP(net912), .RN(n1581), .Q(
        acc[31]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_9_ ( .D(vld_d[8]), .CP(clk_i), .RN(n1577), 
        .Q(vld_d[9]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_zc_reg_9_ ( .D(n331), .CP(n983), .RN(n1576), 
        .Q(acc_mag_zc[9]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_zc_reg_7_ ( .D(n329), .CP(n983), .RN(n1575), 
        .Q(acc_mag_zc[7]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_zc_reg_8_ ( .D(n330), .CP(n983), .RN(n1575), 
        .Q(acc_mag_zc[8]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_zc_reg_10_ ( .D(n332), .CP(n983), .RN(n1575), 
        .Q(acc_mag_zc[10]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_zc_reg_11_ ( .D(n333), .CP(n983), .RN(n1575), 
        .Q(acc_mag_zc[11]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_zc_reg_12_ ( .D(n334), .CP(n983), .RN(n1576), 
        .Q(acc_mag_zc[12]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_3_ ( .D(vld_d[2]), .CP(clk_i), .RN(n1577), 
        .Q(vld_d[3]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_5_ ( .D(vld_d[4]), .CP(clk_i), .RN(n1578), 
        .Q(vld_d[5]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_zc_reg_5_ ( .D(n327), .CP(n983), .RN(n1576), 
        .Q(acc_mag_zc[5]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_zc_reg_6_ ( .D(n328), .CP(n983), .RN(n1575), 
        .Q(acc_mag_zc[6]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_30_ ( .D(n142), .CP(net912), .RN(n1581), .Q(
        acc[30]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_zc_reg_3_ ( .D(n325), .CP(n983), .RN(n1575), 
        .Q(acc_mag_zc[3]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_zc_reg_4_ ( .D(n326), .CP(n983), .RN(n1575), 
        .Q(acc_mag_zc[4]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_zc_reg_0_ ( .D(n322), .CP(n983), .RN(n1576), 
        .Q(acc_mag_zc[0]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_zc_reg_1_ ( .D(n323), .CP(n983), .RN(n1576), 
        .Q(acc_mag_zc[1]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_zc_reg_13_ ( .D(n335), .CP(n983), .RN(n1581), 
        .Q(acc_mag_zc[13]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_7_ ( .D(vld_d[6]), .CP(clk_i), .RN(n1577), 
        .Q(vld_d[7]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_zc_reg_2_ ( .D(n324), .CP(n983), .RN(n1575), 
        .Q(acc_mag_zc[2]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_1_ ( .D(vld_d[0]), .CP(clk_i), .RN(n1577), 
        .Q(vld_d[1]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_6_ ( .D(vld_d[5]), .CP(clk_i), .RN(n1578), 
        .Q(vld_d[6]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_mag_zc_reg_14_ ( .D(n336), .CP(n983), .RN(n1581), 
        .Q(acc_mag_zc[14]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_0_ ( .D(vld_i), .CP(clk_i), .RN(n1578), .Q(
        vld_d[0]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_29_ ( .D(n141), .CP(net912), .RN(n1574), .Q(
        acc[29]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_2_ ( .D(vld_d[1]), .CP(clk_i), .RN(n1577), 
        .Q(vld_d[2]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_8_ ( .D(vld_d[7]), .CP(clk_i), .RN(n1577), 
        .Q(vld_d[8]) );
  C8T28SOI_LR_DFPRQX4_P0 vld_d_reg_4_ ( .D(vld_d[3]), .CP(clk_i), .RN(n1578), 
        .Q(vld_d[4]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_28_ ( .D(n140), .CP(net912), .RN(n1574), .Q(
        acc[28]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_27_ ( .D(n139), .CP(net912), .RN(n1574), .Q(
        acc[27]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_26_ ( .D(n138), .CP(net912), .RN(n1574), .Q(
        acc[26]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_25_ ( .D(n137), .CP(net912), .RN(n1578), .Q(
        acc[25]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_24_ ( .D(n136), .CP(net912), .RN(n1574), .Q(
        acc[24]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_23_ ( .D(n135), .CP(net912), .RN(n1581), .Q(
        acc[23]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_22_ ( .D(n134), .CP(net912), .RN(n1574), .Q(
        acc[22]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_21_ ( .D(n133), .CP(net912), .RN(n1581), .Q(
        acc[21]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_20_ ( .D(n132), .CP(net912), .RN(n1574), .Q(
        acc[20]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_19_ ( .D(n131), .CP(net912), .RN(n1580), .Q(
        acc[19]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_18_ ( .D(n130), .CP(net912), .RN(n1580), .Q(
        acc[18]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_17_ ( .D(n129), .CP(net912), .RN(n1580), .Q(
        acc[17]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_16_ ( .D(n128), .CP(net912), .RN(n1580), .Q(
        acc[16]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_15_ ( .D(n127), .CP(net912), .RN(n1580), .Q(
        acc[15]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_14_ ( .D(n126), .CP(net912), .RN(n1580), .Q(
        acc[14]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_13_ ( .D(n125), .CP(net912), .RN(n1580), .Q(
        acc[13]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_12_ ( .D(n124), .CP(net912), .RN(n1580), .Q(
        acc[12]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_11_ ( .D(n123), .CP(net912), .RN(n1579), .Q(
        acc[11]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_10_ ( .D(n122), .CP(net912), .RN(n1575), .Q(
        acc[10]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_9_ ( .D(n121), .CP(net912), .RN(n1576), .Q(
        acc[9]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_8_ ( .D(n120), .CP(net912), .RN(n1575), .Q(
        acc[8]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_7_ ( .D(n119), .CP(net912), .RN(n1575), .Q(
        acc[7]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_6_ ( .D(n118), .CP(net912), .RN(n1575), .Q(
        acc[6]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_5_ ( .D(n117), .CP(net912), .RN(n1576), .Q(
        acc[5]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_4_ ( .D(n116), .CP(net912), .RN(n1575), .Q(
        acc[4]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fp_reg_7_ ( .D(n34), .CP(clk_i), .RN(n1581), .Q(
        mts_fp[7]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_3_ ( .D(n115), .CP(net912), .RN(n1579), .Q(
        acc[3]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_2_ ( .D(n114), .CP(net912), .RN(n1575), .Q(
        acc[2]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fp_reg_6_ ( .D(n33), .CP(clk_i), .RN(n1579), .Q(
        mts_fp[6]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_1_ ( .D(n113), .CP(net912), .RN(n1575), .Q(
        acc[1]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fp_reg_5_ ( .D(n32), .CP(clk_i), .RN(n1579), .Q(
        mts_fp[5]) );
  C8T28SOI_LR_DFPRQX4_P0 acc_reg_0_ ( .D(n112), .CP(net912), .RN(n1579), .Q(
        acc[0]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fp_reg_4_ ( .D(n31), .CP(clk_i), .RN(n1579), .Q(
        mts_fp[4]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fp_reg_3_ ( .D(n30), .CP(clk_i), .RN(n1579), .Q(
        mts_fp[3]) );
  C8T28SOI_LR_DFPRQX4_P0 sign_fp_reg ( .D(sign_fp_tmp), .CP(clk_i), .RN(n1579), 
        .Q(sign_fp) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fp_reg_1_ ( .D(n28), .CP(clk_i), .RN(n1579), .Q(
        mts_fp[1]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fp_reg_2_ ( .D(n29), .CP(clk_i), .RN(n1579), .Q(
        mts_fp[2]) );
  C8T28SOI_LR_DFPRQX4_P0 mts_fp_reg_0_ ( .D(n27), .CP(clk_i), .RN(n1579), .Q(
        mts_fp[0]) );
  C8T28SOI_LR_DFPRQX4_P0 exp_fp_reg_3_ ( .D(exp_fp_tmp[3]), .CP(clk_i), .RN(
        n1581), .Q(exp_fp[3]) );
  C8T28SOI_LR_DFPRQX4_P0 exp_fp_reg_4_ ( .D(exp_fp_tmp[4]), .CP(clk_i), .RN(
        n1581), .Q(exp_fp[4]) );
  C8T28SOI_LR_DFPRQX4_P0 exp_fp_reg_1_ ( .D(exp_fp_tmp[1]), .CP(clk_i), .RN(
        n1581), .Q(exp_fp[1]) );
  C8T28SOI_LR_DFPRQX4_P0 exp_fp_reg_2_ ( .D(exp_fp_tmp[2]), .CP(clk_i), .RN(
        n1581), .Q(exp_fp[2]) );
  C8T28SOI_LR_DFPRQX4_P0 exp_fp_reg_0_ ( .D(exp_fp_tmp[0]), .CP(clk_i), .RN(
        n1581), .Q(exp_fp[0]) );
  C8T28SOI_LR_CNXOR2X9_P16 U612 ( .A(win[7]), .S(din[7]), .Z(n13) );
  C8T28SOI_LR_AND2X5_P0 U630 ( .A(mts_w[0]), .B(mts_d[0]), .Z(n27) );
  C8T28SOI_LR_NOR3X3_P0 U631 ( .A(exp_w[3]), .B(exp_w[2]), .C(exp_w[0]), .Z(
        n990) );
  C8T28SOI_LR_CNNOR2AX9_P16 U632 ( .A(n990), .B(exp_w[1]), .Z(n1310) );
  C8T28SOI_LR_CNIVX4_P16 U633 ( .A(n1310), .Z(n14) );
  C8T28SOI_LR_NOR3X3_P0 U634 ( .A(exp_d[3]), .B(exp_d[2]), .C(exp_d[0]), .Z(
        n991) );
  C8T28SOI_LR_CNNOR2AX9_P16 U635 ( .A(n991), .B(exp_d[1]), .Z(n1311) );
  C8T28SOI_LR_CNIVX4_P16 U636 ( .A(n1311), .Z(n15) );
  C8T28SOI_LR_NOR3X3_P0 U637 ( .A(counter[0]), .B(counter[1]), .C(counter[2]), 
        .Z(n992) );
  C8T28SOI_LR_CNIVX4_P16 U638 ( .A(counter[3]), .Z(n1525) );
  C8T28SOI_LR_OAI12X3_P0 U639 ( .A(n992), .B(n1525), .C(vld_d[2]), .Z(n993) );
  C8T28SOI_LR_CNNOR2X8_P16 U643 ( .A(counter[0]), .B(n1589), .Z(n105) );
  C8T28SOI_LR_CNIVX4_P16 U644 ( .A(counter[0]), .Z(n1253) );
  C8T28SOI_LR_CNIVX4_P16 U645 ( .A(counter[1]), .Z(n1252) );
  C8T28SOI_LR_CNNOR2X8_P16 U646 ( .A(n1253), .B(n1252), .Z(n1251) );
  C8T28SOI_LR_NAND3X3_P0 U648 ( .A(counter[0]), .B(counter[1]), .C(counter[2]), 
        .Z(n1524) );
  C8T28SOI_LR_OA112X4_P0 U649 ( .A(counter[2]), .B(n1251), .C(n1590), .D(n1524), .Z(n107) );
  C8T28SOI_LR_CNOR2X19_P16 U650 ( .A(vld_d[4]), .B(vld_d[8]), .Z(n995) );
  C8T28SOI_LR_OR6X4_P0 U651 ( .A(n995), .B(vld_d[1]), .C(vld_d[7]), .D(
        vld_d[0]), .E(vld_d[2]), .F(vld_d[6]), .Z(n996) );
  C8T28SOI_LR_NOR3X3_P0 U652 ( .A(vld_d[5]), .B(vld_d[3]), .C(n996), .Z(n985)
         );
  C8T28SOI_LR_NAND3X3_P0 U653 ( .A(vld_d[9]), .B(n985), .C(acc_rdy), .Z(n1055)
         );
  C8T28SOI_LR_CNNOR2AX9_P16 U654 ( .A(sign_r), .B(n1055), .Z(n517) );
  C8T28SOI_LR_CNNAND2AX9_P16 U655 ( .A(vld_d[9]), .B(n985), .Z(n1009) );
  C8T28SOI_LR_CNNAND2X8_P16 U656 ( .A(n1009), .B(n1589), .Z(n104) );
  C8T28SOI_LR_CNIVX4_P16 U657 ( .A(acc_rdy), .Z(n1259) );
  C8T28SOI_LR_CNNAND2X8_P16 U658 ( .A(n1009), .B(n1259), .Z(n280) );
  C8T28SOI_LR_CNNOR2X8_P16 U659 ( .A(exp_d[2]), .B(exp_w[2]), .Z(n1037) );
  C8T28SOI_LR_AOI12X3_P0 U660 ( .A(exp_w[2]), .B(exp_d[2]), .C(n1037), .Z(
        n1034) );
  C8T28SOI_LR_CNNOR2X8_P16 U661 ( .A(exp_d[1]), .B(exp_w[1]), .Z(n1033) );
  C8T28SOI_LRS_XNOR2X3_P0 U662 ( .A(exp_d[1]), .B(exp_w[1]), .Z(n1307) );
  C8T28SOI_LR_CNNAND2X8_P16 U663 ( .A(exp_d[0]), .B(exp_w[0]), .Z(n997) );
  C8T28SOI_LR_OA12X3_P0 U664 ( .A(exp_d[0]), .B(exp_w[0]), .C(n997), .Z(n1309)
         );
  C8T28SOI_LR_CNNAND2AX9_P16 U665 ( .A(n998), .B(n997), .Z(n1308) );
  C8T28SOI_LR_CNNAND2X8_P16 U666 ( .A(n1307), .B(n1308), .Z(n1306) );
  C8T28SOI_LR_CNIVX4_P16 U667 ( .A(n999), .Z(n23) );
  C8T28SOI_LR_NAND2X4_P0 U668 ( .A(n1009), .B(acc_rdy), .Z(n1195) );
  C8T28SOI_LR_CNNOR2AX9_P16 U669 ( .A(zc_tmp), .B(n1594), .Z(n338) );
  C8T28SOI_LR_CNNAND2X8_P16 U670 ( .A(n1587), .B(acc[0]), .Z(n1000) );
  C8T28SOI_LR_CNXOR2X9_P16 U671 ( .A(acc[1]), .S(n1000), .Z(n1001) );
  C8T28SOI_LR_CNNOR2X8_P16 U672 ( .A(n1195), .B(n1001), .Z(n283) );
  C8T28SOI_LR_NOR3X3_P0 U673 ( .A(acc[2]), .B(acc[0]), .C(acc[1]), .Z(n1520)
         );
  C8T28SOI_LR_CNIVX4_P16 U674 ( .A(acc[3]), .Z(n1108) );
  C8T28SOI_LR_CNNAND2X8_P16 U675 ( .A(n1520), .B(n1108), .Z(n1004) );
  C8T28SOI_LR_CNNOR2X8_P16 U676 ( .A(acc[4]), .B(n1004), .Z(n1516) );
  C8T28SOI_LR_CNIVX4_P16 U677 ( .A(acc[5]), .Z(n1215) );
  C8T28SOI_LR_CNNAND2X8_P16 U678 ( .A(n1516), .B(n1215), .Z(n1196) );
  C8T28SOI_LR_CNNAND2X8_P16 U679 ( .A(n1587), .B(n1196), .Z(n1002) );
  C8T28SOI_LR_CNXOR2X9_P16 U680 ( .A(acc[6]), .S(n1002), .Z(n1003) );
  C8T28SOI_LR_CNNOR2X8_P16 U681 ( .A(n1195), .B(n1003), .Z(n288) );
  C8T28SOI_LR_CNIVX4_P16 U682 ( .A(acc[0]), .Z(n1263) );
  C8T28SOI_LR_CNNOR2X8_P16 U683 ( .A(n1195), .B(n1263), .Z(n282) );
  C8T28SOI_LR_CNNAND2X8_P16 U684 ( .A(n1587), .B(n1004), .Z(n1005) );
  C8T28SOI_LR_CNXOR2X9_P16 U685 ( .A(acc[4]), .S(n1005), .Z(n1006) );
  C8T28SOI_LR_CNNOR2X8_P16 U686 ( .A(n1195), .B(n1006), .Z(n286) );
  C8T28SOI_LR_CNIVX4_P16 U687 ( .A(acc_mag[14]), .Z(n1010) );
  C8T28SOI_LR_CNNOR2X8_P16 U688 ( .A(n1195), .B(n1010), .Z(n325) );
  C8T28SOI_LR_CNIVX4_P16 U689 ( .A(acc_mag[13]), .Z(n1011) );
  C8T28SOI_LR_CNNOR2X8_P16 U690 ( .A(n1195), .B(n1011), .Z(n324) );
  C8T28SOI_LR_OAI12X3_P0 U691 ( .A(acc[0]), .B(acc[1]), .C(n1587), .Z(n1007)
         );
  C8T28SOI_LR_CNXOR2X9_P16 U692 ( .A(acc[2]), .S(n1007), .Z(n1008) );
  C8T28SOI_LR_CNNOR2X8_P16 U693 ( .A(n1195), .B(n1008), .Z(n284) );
  C8T28SOI_LR_CNIVX4_P16 U694 ( .A(n1009), .Z(n1257) );
  C8T28SOI_LR_CNOR2X19_P16 U695 ( .A(zc_i), .B(n1257), .Z(n984) );
  C8T28SOI_LR_CNIVX4_P16 U696 ( .A(n1055), .Z(n487) );
  C8T28SOI_LR_NOR3X3_P0 U697 ( .A(acc_mag[11]), .B(acc_mag[12]), .C(
        acc_mag[25]), .Z(n1016) );
  C8T28SOI_LR_NOR4CDX2_P0 U698 ( .C(n1011), .D(n1010), .A(acc_mag[15]), .B(
        acc_mag[16]), .Z(n1015) );
  C8T28SOI_LR_NOR3X3_P0 U699 ( .A(acc_mag[20]), .B(acc_mag[19]), .C(
        acc_mag[18]), .Z(n1013) );
  C8T28SOI_LR_NOR3X3_P0 U700 ( .A(acc_mag[21]), .B(acc_mag[22]), .C(
        acc_mag[24]), .Z(n1012) );
  C8T28SOI_LR_NOR4CDX2_P0 U701 ( .C(n1013), .D(n1012), .A(acc_mag[17]), .B(
        acc_mag[23]), .Z(n1014) );
  C8T28SOI_LR_NAND3X3_P0 U702 ( .A(n1016), .B(n1015), .C(n1014), .Z(n1026) );
  C8T28SOI_LR_NOR3X3_P0 U703 ( .A(acc_mag[35]), .B(acc_mag[36]), .C(
        acc_mag[33]), .Z(n1020) );
  C8T28SOI_LR_NOR3X3_P0 U704 ( .A(acc_mag[26]), .B(acc_mag[38]), .C(
        acc_mag[37]), .Z(n1018) );
  C8T28SOI_LR_NOR3X3_P0 U705 ( .A(acc_mag[29]), .B(acc_mag[28]), .C(
        acc_mag[32]), .Z(n1017) );
  C8T28SOI_LR_NOR4CDX2_P0 U706 ( .C(n1018), .D(n1017), .A(acc_mag[34]), .B(
        acc_mag[27]), .Z(n1019) );
  C8T28SOI_LR_NOR4CDX2_P0 U707 ( .C(n1020), .D(n1019), .A(acc_mag[31]), .B(
        acc_mag[30]), .Z(n1029) );
  C8T28SOI_LR_OR3X5_P0 U708 ( .A(acc_mag[10]), .B(acc_mag[0]), .C(acc_mag[1]), 
        .Z(n1021) );
  C8T28SOI_LR_NOR3X3_P0 U709 ( .A(acc_mag[9]), .B(acc_mag[8]), .C(n1021), .Z(
        n1023) );
  C8T28SOI_LR_NOR3X3_P0 U710 ( .A(acc_mag[3]), .B(acc_mag[4]), .C(acc_mag[6]), 
        .Z(n1022) );
  C8T28SOI_LRA_NAND3AX3_P0 U711 ( .A(acc_mag[2]), .B(n1023), .C(n1022), .Z(
        n1025) );
  C8T28SOI_LR_CNIVX4_P16 U712 ( .A(n1026), .Z(n1024) );
  C8T28SOI_LR_OAI31X3_P0 U713 ( .A(acc_mag[5]), .B(acc_mag[7]), .C(n1025), .D(
        n1024), .Z(n1054) );
  C8T28SOI_LR_OAI211X3_P0 U714 ( .A(acc_mag[39]), .B(n1026), .C(n1029), .D(
        n1054), .Z(n1027) );
  C8T28SOI_LR_CNNAND2AX9_P16 U715 ( .A(n1027), .B(n487), .Z(n1048) );
  C8T28SOI_LR_CNIVX4_P16 U716 ( .A(exp_r[1]), .Z(n1046) );
  C8T28SOI_LR_CNNAND2X8_P16 U717 ( .A(exp_r[0]), .B(mts_r[4]), .Z(n1045) );
  C8T28SOI_LR_CNNOR2X8_P16 U718 ( .A(n1046), .B(n1045), .Z(n1044) );
  C8T28SOI_LR_CNNAND2X8_P16 U719 ( .A(exp_r[2]), .B(n1044), .Z(n1031) );
  C8T28SOI_LR_CNXOR2X9_P16 U720 ( .A(exp_r[3]), .S(n1031), .Z(n1030) );
  C8T28SOI_LR_NAND4ABX3_P0 U721 ( .A(exp_r[0]), .B(n1046), .C(exp_r[3]), .D(
        exp_r[2]), .Z(n1313) );
  C8T28SOI_LR_CNIVX4_P16 U722 ( .A(mts_r[4]), .Z(n1049) );
  C8T28SOI_LR_NOR3X3_P0 U723 ( .A(n1027), .B(n1313), .C(n1049), .Z(n1028) );
  C8T28SOI_LR_OAI21AX3_P0 U724 ( .A(n1029), .B(n1028), .C(n487), .Z(n1052) );
  C8T28SOI_LR_OAI12X3_P0 U725 ( .A(n1048), .B(n1030), .C(n1052), .Z(n516) );
  C8T28SOI_LR_OAI12X3_P0 U726 ( .A(exp_r[2]), .B(n1044), .C(n1031), .Z(n1032)
         );
  C8T28SOI_LR_OAI12X3_P0 U727 ( .A(n1048), .B(n1032), .C(n1052), .Z(n515) );
  C8T28SOI_LR_CNXOR2X9_P16 U728 ( .A(exp_d[3]), .S(exp_w[3]), .Z(n1038) );
  C8T28SOI_LR_FA1X4_P0 U729 ( .A0(n1034), .B0(n1033), .CI(n1306), .CO(n1036), 
        .S0(n999) );
  C8T28SOI_LR_CNIVX4_P16 U730 ( .A(n1035), .Z(n24) );
  C8T28SOI_LR_CNNOR2X8_P16 U731 ( .A(exp_d[3]), .B(exp_w[3]), .Z(n1040) );
  C8T28SOI_LR_FA1X4_P0 U732 ( .A0(n1038), .B0(n1037), .CI(n1036), .CO(n1039), 
        .S0(n1035) );
  C8T28SOI_LR_CNNOR2X8_P16 U733 ( .A(n1040), .B(n1039), .Z(n25) );
  C8T28SOI_LR_CNNOR2X8_P16 U734 ( .A(exp_fp[3]), .B(exp_fp[4]), .Z(n1239) );
  C8T28SOI_LR_CNIVX4_P16 U735 ( .A(exp_fp[1]), .Z(n1222) );
  C8T28SOI_LR_CNIVX4_P16 U736 ( .A(exp_fp[2]), .Z(n1535) );
  C8T28SOI_LR_NAND2X4_P0 U737 ( .A(n1222), .B(n1535), .Z(n1189) );
  C8T28SOI_LR_NAND2X4_P0 U739 ( .A(mts_fp[0]), .B(n1582), .Z(n1105) );
  C8T28SOI_LR_CNNOR2X8_P16 U740 ( .A(n1189), .B(n1105), .Z(n1527) );
  C8T28SOI_LR_NAND2X4_P0 U741 ( .A(n1239), .B(n1527), .Z(n1262) );
  C8T28SOI_LR_CNNOR2X8_P16 U742 ( .A(n1263), .B(n1262), .Z(n1261) );
  C8T28SOI_LR_CNNAND2X8_P16 U743 ( .A(sign_fp), .B(mts_fp[0]), .Z(n1041) );
  C8T28SOI_LRS_XNOR2X3_P0 U744 ( .A(mts_fp[1]), .B(n1041), .Z(n1059) );
  C8T28SOI_LR_AOI22X2_P0 U745 ( .A(exp_fp[0]), .B(mts_fp[0]), .C(n1059), .D(
        n1582), .Z(n1112) );
  C8T28SOI_LR_NOR2X4_P0 U746 ( .A(n1112), .B(n1189), .Z(n1529) );
  C8T28SOI_LR_AND2X5_P0 U747 ( .A(n1529), .B(n1239), .Z(n1060) );
  C8T28SOI_LR_CNNOR2AX9_P16 U749 ( .A(n1043), .B(n1589), .Z(n113) );
  C8T28SOI_LR_AO112X5_P0 U750 ( .A(n1046), .B(n1045), .C(n1044), .D(n1048), 
        .Z(n1047) );
  C8T28SOI_LR_NAND2X4_P0 U751 ( .A(n1052), .B(n1047), .Z(n514) );
  C8T28SOI_LR_CNNOR2X8_P16 U752 ( .A(mts_r[4]), .B(n1048), .Z(n1312) );
  C8T28SOI_LR_CNNOR2X8_P16 U753 ( .A(n1049), .B(n1048), .Z(n1314) );
  C8T28SOI_LR_AOI22X2_P0 U754 ( .A(n1312), .B(mts_r[2]), .C(n1314), .D(
        mts_r[3]), .Z(n1050) );
  C8T28SOI_LR_NAND2X4_P0 U755 ( .A(n1050), .B(n1052), .Z(n512) );
  C8T28SOI_LR_AOI22X2_P0 U756 ( .A(n1312), .B(mts_r[1]), .C(mts_r[2]), .D(
        n1314), .Z(n1051) );
  C8T28SOI_LR_NAND2X4_P0 U757 ( .A(n1051), .B(n1052), .Z(n511) );
  C8T28SOI_LR_AOI22X2_P0 U758 ( .A(n1312), .B(mts_r[0]), .C(n1314), .D(
        mts_r[1]), .Z(n1053) );
  C8T28SOI_LR_OAI211X3_P0 U759 ( .A(n1055), .B(n1054), .C(n1053), .D(n1052), 
        .Z(n510) );
  C8T28SOI_LR_AND2X5_P0 U762 ( .A(acc_mag[11]), .B(n1593), .Z(n322) );
  C8T28SOI_LR_AND2X5_P0 U763 ( .A(acc_mag[25]), .B(n1595), .Z(n336) );
  C8T28SOI_LR_AND2X5_P0 U765 ( .A(acc_mag[15]), .B(n1593), .Z(n326) );
  C8T28SOI_LR_AND2X5_P0 U766 ( .A(acc_mag[12]), .B(n1593), .Z(n323) );
  C8T28SOI_LR_AND2X5_P0 U767 ( .A(acc_mag[20]), .B(n1593), .Z(n331) );
  C8T28SOI_LR_AND2X5_P0 U768 ( .A(acc_mag[22]), .B(n1593), .Z(n333) );
  C8T28SOI_LR_AND2X5_P0 U769 ( .A(acc_mag[23]), .B(n1593), .Z(n334) );
  C8T28SOI_LR_AND2X5_P0 U770 ( .A(acc_mag[18]), .B(n1593), .Z(n329) );
  C8T28SOI_LR_AND2X5_P0 U771 ( .A(acc_mag[21]), .B(n1593), .Z(n332) );
  C8T28SOI_LR_AND2X5_P0 U772 ( .A(acc_mag[19]), .B(n1593), .Z(n330) );
  C8T28SOI_LR_AND2X5_P0 U773 ( .A(acc_mag[17]), .B(n1593), .Z(n328) );
  C8T28SOI_LR_AND2X5_P0 U774 ( .A(acc_mag[24]), .B(n1595), .Z(n335) );
  C8T28SOI_LR_AND2X5_P0 U775 ( .A(acc_mag[16]), .B(n1593), .Z(n327) );
  C8T28SOI_LR_AND2X5_P0 U776 ( .A(mts_w[2]), .B(mts_d[0]), .Z(intadd_2_CI) );
  C8T28SOI_LR_CNNAND2X8_P16 U777 ( .A(mts_w[1]), .B(mts_d[0]), .Z(n1305) );
  C8T28SOI_LR_CNNAND2X8_P16 U778 ( .A(mts_w[0]), .B(mts_d[1]), .Z(n1304) );
  C8T28SOI_LR_CNNOR2X8_P16 U779 ( .A(n1305), .B(n1304), .Z(intadd_2_B_0_) );
  C8T28SOI_LR_AND2X5_P0 U780 ( .A(mts_d[2]), .B(mts_w[0]), .Z(n1297) );
  C8T28SOI_LR_NAND3X3_P0 U781 ( .A(mts_w[1]), .B(n1297), .C(mts_d[1]), .Z(
        n1296) );
  C8T28SOI_LR_CNNAND2X8_P16 U782 ( .A(mts_w[0]), .B(mts_d[3]), .Z(n1295) );
  C8T28SOI_LR_CNXOR2X9_P16 U783 ( .A(n1296), .S(n1295), .Z(n1057) );
  C8T28SOI_LR_CNNAND2X8_P16 U784 ( .A(mts_w[1]), .B(mts_d[2]), .Z(n1294) );
  C8T28SOI_LRS_XNOR2X3_P0 U785 ( .A(n1057), .B(n1294), .Z(intadd_2_A_1_) );
  C8T28SOI_LR_OAI12X3_P0 U786 ( .A(mts_fp[0]), .B(mts_fp[1]), .C(sign_fp), .Z(
        n1058) );
  C8T28SOI_LRS_XNOR2X3_P0 U787 ( .A(mts_fp[2]), .B(n1058), .Z(n1062) );
  C8T28SOI_LR_OAI22X3_P0 U788 ( .A(n1582), .B(n1059), .C(n1062), .D(exp_fp[0]), 
        .Z(n1101) );
  C8T28SOI_LR_NOR2X4_P0 U789 ( .A(n1222), .B(exp_fp[2]), .Z(n1218) );
  C8T28SOI_LR_CNIVX4_P16 U790 ( .A(n1218), .Z(n1113) );
  C8T28SOI_LR_OAI22X3_P0 U791 ( .A(n1189), .B(n1101), .C(n1105), .D(n1113), 
        .Z(n1531) );
  C8T28SOI_LR_AND2X5_P0 U792 ( .A(n1531), .B(n1239), .Z(n1264) );
  C8T28SOI_LR_FA1X4_P0 U793 ( .A0(acc[1]), .B0(n1261), .CI(n1060), .CO(n1266), 
        .S0(n1043) );
  C8T28SOI_LR_PAOI2X4_P0 U794 ( .A(acc[2]), .B(n1264), .P(n1266), .Z(n1106) );
  C8T28SOI_LR_NOR3X3_P0 U795 ( .A(mts_fp[2]), .B(mts_fp[0]), .C(mts_fp[1]), 
        .Z(n1102) );
  C8T28SOI_LR_CNIVX4_P16 U796 ( .A(sign_fp), .Z(n1180) );
  C8T28SOI_LR_CNNOR2X8_P16 U797 ( .A(n1102), .B(n1180), .Z(n1061) );
  C8T28SOI_LR_CNXOR2X9_P16 U798 ( .A(mts_fp[3]), .S(n1061), .Z(n1104) );
  C8T28SOI_LR_OAI22X3_P0 U799 ( .A(n1582), .B(n1062), .C(n1104), .D(exp_fp[0]), 
        .Z(n1188) );
  C8T28SOI_LR_OAI22X3_P0 U800 ( .A(n1188), .B(n1189), .C(n1112), .D(n1113), 
        .Z(n1533) );
  C8T28SOI_LR_NAND2X4_P0 U801 ( .A(n1239), .B(n1533), .Z(n1107) );
  C8T28SOI_LR_CNXOR2X9_P16 U802 ( .A(n1108), .S(n1107), .Z(n1063) );
  C8T28SOI_LR_CNXOR2X9_P16 U803 ( .A(n1106), .S(n1063), .Z(n1064) );
  C8T28SOI_LR_CNNOR2X8_P16 U804 ( .A(n1589), .B(n1064), .Z(n115) );
  C8T28SOI_LR_CNNAND2X8_P16 U806 ( .A(n1595), .B(zc_i), .Z(n1413) );
  C8T28SOI_LR_AOI12AX3_P0 U807 ( .A(acc_mag_zc[1]), .B(acc_mag_zc[0]), .C(
        acc_mag_zc[2]), .Z(n1066) );
  C8T28SOI_LR_CNIVX4_P16 U808 ( .A(acc_mag_zc[4]), .Z(n1065) );
  C8T28SOI_LR_CBI4I6X3_P0 U809 ( .A(acc_mag_zc[3]), .B(n1066), .C(n1065), .D(
        acc_mag_zc[5]), .Z(n1068) );
  C8T28SOI_LR_CNIVX4_P16 U810 ( .A(acc_mag_zc[7]), .Z(n1067) );
  C8T28SOI_LR_CBI4I6X3_P0 U811 ( .A(acc_mag_zc[6]), .B(n1068), .C(n1067), .D(
        acc_mag_zc[8]), .Z(n1069) );
  C8T28SOI_LR_CNIVX4_P16 U812 ( .A(acc_mag_zc[10]), .Z(n1087) );
  C8T28SOI_LR_CBI4I6X3_P0 U813 ( .A(acc_mag_zc[9]), .B(n1069), .C(n1087), .D(
        acc_mag_zc[11]), .Z(n1071) );
  C8T28SOI_LR_CNIVX4_P16 U814 ( .A(acc_mag_zc[13]), .Z(n1070) );
  C8T28SOI_LR_CBI4I6X3_P0 U815 ( .A(acc_mag_zc[12]), .B(n1071), .C(n1070), .D(
        acc_mag_zc[14]), .Z(n1344) );
  C8T28SOI_LR_CNIVX4_P16 U816 ( .A(n1344), .Z(n1347) );
  C8T28SOI_LR_NOR2X4_P0 U817 ( .A(n1413), .B(n1347), .Z(n435) );
  C8T28SOI_LR_CNIVX4_P16 U818 ( .A(mts_tmp[37]), .Z(n1273) );
  C8T28SOI_LR_OR6X4_P0 U819 ( .A(mts_tmp[33]), .B(mts_tmp[31]), .C(mts_tmp[29]), .D(mts_tmp[25]), .E(mts_tmp[34]), .F(mts_tmp[27]), .Z(n1085) );
  C8T28SOI_LR_NOR3X3_P0 U820 ( .A(mts_tmp[32]), .B(mts_tmp[21]), .C(
        mts_tmp[24]), .Z(n1072) );
  C8T28SOI_LR_CNIVX4_P16 U821 ( .A(n1072), .Z(n1073) );
  C8T28SOI_LR_OR3X5_P0 U822 ( .A(mts_tmp[20]), .B(mts_tmp[28]), .C(n1073), .Z(
        n1074) );
  C8T28SOI_LR_NOR3X3_P0 U823 ( .A(mts_tmp[30]), .B(mts_tmp[26]), .C(n1074), 
        .Z(n1078) );
  C8T28SOI_LR_CNIVX4_P16 U824 ( .A(mts_tmp[18]), .Z(n1075) );
  C8T28SOI_LR_CNIVX4_P16 U825 ( .A(n1075), .Z(n1076) );
  C8T28SOI_LR_NOR3X3_P0 U826 ( .A(mts_tmp[15]), .B(mts_tmp[22]), .C(n1076), 
        .Z(n1077) );
  C8T28SOI_LR_NOR3BCX4_P0 U827 ( .B(n1078), .C(n1077), .A(mts_tmp[23]), .Z(
        n1083) );
  C8T28SOI_LR_CNIVX4_P16 U828 ( .A(mts_tmp[14]), .Z(n1082) );
  C8T28SOI_LR_CNNOR2X8_P16 U829 ( .A(mts_tmp[19]), .B(mts_tmp[16]), .Z(n1079)
         );
  C8T28SOI_LR_CNNAND2AX9_P16 U830 ( .A(mts_tmp[17]), .B(n1079), .Z(n1080) );
  C8T28SOI_LR_CNIVX4_P16 U831 ( .A(n1080), .Z(n1081) );
  C8T28SOI_LR_NAND3X3_P0 U832 ( .A(n1083), .B(n1082), .C(n1081), .Z(n1084) );
  C8T28SOI_LR_OA12X5_P0 U833 ( .A(n1085), .B(n1084), .C(mts_tmp[35]), .Z(n1100) );
  C8T28SOI_LR_CNNAND2X8_P16 U834 ( .A(n1100), .B(mts_tmp[36]), .Z(n1274) );
  C8T28SOI_LR_CNNOR2X8_P16 U835 ( .A(n1273), .B(n1274), .Z(n1272) );
  C8T28SOI_LR_CNNAND2X8_P16 U836 ( .A(n1272), .B(mts_tmp[38]), .Z(n1099) );
  C8T28SOI_LR_CNXOR2X9_P16 U837 ( .A(n1099), .S(mts_tmp[39]), .Z(n1086) );
  C8T28SOI_LR_CNNOR2X8_P16 U838 ( .A(n1413), .B(n1086), .Z(n482) );
  C8T28SOI_LR_CNNOR2X8_P16 U839 ( .A(acc_mag_zc[14]), .B(acc_mag_zc[13]), .Z(
        n1415) );
  C8T28SOI_LR_CNNOR2X8_P16 U840 ( .A(acc_mag_zc[12]), .B(acc_mag_zc[11]), .Z(
        n1094) );
  C8T28SOI_LR_CNNAND2X8_P16 U841 ( .A(n1415), .B(n1094), .Z(n1088) );
  C8T28SOI_LR_CNNAND2AX9_P16 U842 ( .A(acc_mag_zc[9]), .B(n1087), .Z(n1095) );
  C8T28SOI_LR_NOR3X3_P0 U843 ( .A(acc_mag_zc[8]), .B(acc_mag_zc[7]), .C(n1095), 
        .Z(n1089) );
  C8T28SOI_LR_CNNAND2AX9_P16 U844 ( .A(n1088), .B(n1089), .Z(n1119) );
  C8T28SOI_LR_NOR3X3_P0 U845 ( .A(acc_mag_zc[5]), .B(acc_mag_zc[4]), .C(
        acc_mag_zc[3]), .Z(n1118) );
  C8T28SOI_LR_CNIVX4_P16 U846 ( .A(n1118), .Z(n1090) );
  C8T28SOI_LR_CBI4I6X3_P0 U847 ( .A(acc_mag_zc[6]), .B(n1090), .C(n1089), .D(
        n1088), .Z(n1404) );
  C8T28SOI_LR_CNNOR2X8_P16 U848 ( .A(acc_mag_zc[2]), .B(acc_mag_zc[1]), .Z(
        n1117) );
  C8T28SOI_LR_CNIVX4_P16 U849 ( .A(n1117), .Z(n1092) );
  C8T28SOI_LR_CNNOR2X8_P16 U850 ( .A(acc_mag_zc[4]), .B(acc_mag_zc[3]), .Z(
        n1091) );
  C8T28SOI_LR_AOI112X3_P0 U851 ( .A(n1092), .B(n1091), .C(acc_mag_zc[6]), .D(
        acc_mag_zc[5]), .Z(n1093) );
  C8T28SOI_LR_NOR3X3_P0 U852 ( .A(acc_mag_zc[8]), .B(acc_mag_zc[7]), .C(n1093), 
        .Z(n1096) );
  C8T28SOI_LR_CNIVX4_P16 U853 ( .A(n1415), .Z(n1147) );
  C8T28SOI_LR_CBI4I6X3_P0 U854 ( .A(n1096), .B(n1095), .C(n1094), .D(n1147), 
        .Z(n1346) );
  C8T28SOI_LR_CNIVX4_P16 U855 ( .A(n1346), .Z(n1122) );
  C8T28SOI_LR_NAND2X4_P0 U859 ( .A(n1404), .B(n1097), .Z(n1317) );
  C8T28SOI_LR_CNXOR2X9_P16 U860 ( .A(n1119), .S(n1317), .Z(n1098) );
  C8T28SOI_LR_CNNOR2X8_P16 U861 ( .A(n1413), .B(n1098), .Z(n438) );
  C8T28SOI_LR_CNIVX4_P16 U862 ( .A(n1413), .Z(n1318) );
  C8T28SOI_LR_NOR3BCX4_P0 U863 ( .B(mts_tmp[39]), .C(n1318), .A(n1099), .Z(
        n483) );
  C8T28SOI_LR_OA112X4_P0 U864 ( .A(n1272), .B(mts_tmp[38]), .C(n1318), .D(
        n1099), .Z(n481) );
  C8T28SOI_LR_OA112X4_P0 U865 ( .A(n1100), .B(mts_tmp[36]), .C(n1318), .D(
        n1274), .Z(n479) );
  C8T28SOI_LR_CNIVX4_P16 U866 ( .A(n1101), .Z(n1209) );
  C8T28SOI_LR_CNNOR2AX9_P16 U867 ( .A(n1102), .B(mts_fp[3]), .Z(n1109) );
  C8T28SOI_LR_CNNOR2X8_P16 U868 ( .A(n1109), .B(n1180), .Z(n1103) );
  C8T28SOI_LR_CNXOR2X9_P16 U869 ( .A(mts_fp[4]), .S(n1103), .Z(n1111) );
  C8T28SOI_LR_AOI22X2_P0 U870 ( .A(exp_fp[0]), .B(n1104), .C(n1111), .D(n1582), 
        .Z(n1206) );
  C8T28SOI_LR_AOI22X2_P0 U871 ( .A(exp_fp[2]), .B(n1105), .C(n1206), .D(n1535), 
        .Z(n1210) );
  C8T28SOI_LR_AOI22X2_P0 U872 ( .A(n1218), .B(n1209), .C(n1210), .D(n1222), 
        .Z(n1184) );
  C8T28SOI_LR_CNIVX4_P16 U873 ( .A(n1239), .Z(n1212) );
  C8T28SOI_LR_CNNOR2X8_P16 U874 ( .A(n1184), .B(n1212), .Z(n1275) );
  C8T28SOI_LR_PAOI2X4_P0 U875 ( .A(n1108), .B(n1107), .P(n1106), .Z(n1277) );
  C8T28SOI_LR_PAOI2X4_P0 U876 ( .A(acc[4]), .B(n1275), .P(n1277), .Z(n1213) );
  C8T28SOI_LR_CNNAND2AX9_P16 U877 ( .A(mts_fp[4]), .B(n1109), .Z(n1176) );
  C8T28SOI_LR_AND2X5_P0 U878 ( .A(n1176), .B(sign_fp), .Z(n1110) );
  C8T28SOI_LRS_XNOR2X3_P0 U879 ( .A(mts_fp[5]), .B(n1110), .Z(n1178) );
  C8T28SOI_LR_AOI22ABX3_P0 U880 ( .C(exp_fp[0]), .D(n1111), .A(n1178), .B(
        exp_fp[0]), .Z(n1231) );
  C8T28SOI_LR_AOI22X2_P0 U881 ( .A(exp_fp[2]), .B(n1112), .C(n1231), .D(n1535), 
        .Z(n1191) );
  C8T28SOI_LR_OAI22CDX2_P0 U882 ( .A(n1188), .B(n1113), .C(n1191), .D(n1222), 
        .Z(n1540) );
  C8T28SOI_LR_NAND2X4_P0 U883 ( .A(n1239), .B(n1540), .Z(n1214) );
  C8T28SOI_LR_CNXOR2X9_P16 U884 ( .A(n1215), .S(n1214), .Z(n1114) );
  C8T28SOI_LR_CNXOR2X9_P16 U885 ( .A(n1213), .S(n1114), .Z(n1115) );
  C8T28SOI_LR_CNNOR2X8_P16 U886 ( .A(n1591), .B(n1115), .Z(n117) );
  C8T28SOI_LR_NOR3X3_P0 U887 ( .A(acc_mag_zc[6]), .B(acc_mag_zc[0]), .C(n1119), 
        .Z(n1116) );
  C8T28SOI_LR_AOI31X3_P0 U888 ( .A(n1118), .B(n1117), .C(n1116), .D(n1413), 
        .Z(n1146) );
  C8T28SOI_LR_CNIVX4_P16 U889 ( .A(n1146), .Z(n1143) );
  C8T28SOI_LR_NOR2X4_P0 U890 ( .A(n1346), .B(n1404), .Z(n1120) );
  C8T28SOI_LR_OAI12X3_P0 U891 ( .A(n1120), .B(n1119), .C(n1415), .Z(n1350) );
  C8T28SOI_LR_CNXOR2X9_P16 U892 ( .A(n1346), .S(n1404), .Z(n1349) );
  C8T28SOI_LR_NOR2X4_P0 U893 ( .A(n1350), .B(n1349), .Z(n1392) );
  C8T28SOI_LR_AOI22X2_P0 U896 ( .A(n1339), .B(acc_mag[10]), .C(n1097), .D(
        acc_mag[11]), .Z(n1124) );
  C8T28SOI_LR_AOI22X2_P0 U899 ( .A(n1332), .B(acc_mag[9]), .C(n1354), .D(
        acc_mag[12]), .Z(n1123) );
  C8T28SOI_LR_CNNAND2X8_P16 U900 ( .A(n1124), .B(n1123), .Z(n1377) );
  C8T28SOI_LR_CNIVX4_P16 U901 ( .A(n1349), .Z(n1129) );
  C8T28SOI_LR_NAND2X4_P0 U902 ( .A(n1350), .B(n1129), .Z(n1356) );
  C8T28SOI_LR_CNIVX4_P16 U903 ( .A(n1356), .Z(n1335) );
  C8T28SOI_LR_AOI22X2_P0 U904 ( .A(acc_mag[2]), .B(n1339), .C(acc_mag[3]), .D(
        n1097), .Z(n1126) );
  C8T28SOI_LR_AOI22X2_P0 U905 ( .A(acc_mag[1]), .B(n1332), .C(n1354), .D(
        acc_mag[4]), .Z(n1125) );
  C8T28SOI_LR_CNNAND2X8_P16 U906 ( .A(n1126), .B(n1125), .Z(n1393) );
  C8T28SOI_LR_AOI22X2_P0 U907 ( .A(n1392), .B(n1377), .C(n1335), .D(n1393), 
        .Z(n1133) );
  C8T28SOI_LR_AOI22X2_P0 U909 ( .A(n1339), .B(acc_mag[14]), .C(n1097), .D(
        acc_mag[15]), .Z(n1128) );
  C8T28SOI_LR_AOI22X2_P0 U910 ( .A(n1332), .B(acc_mag[13]), .C(n1354), .D(
        acc_mag[16]), .Z(n1127) );
  C8T28SOI_LR_CNNAND2X8_P16 U911 ( .A(n1128), .B(n1127), .Z(n1359) );
  C8T28SOI_LR_CNIVX4_P16 U912 ( .A(n1350), .Z(n1388) );
  C8T28SOI_LR_CNNOR2X8_P16 U913 ( .A(n1388), .B(n1129), .Z(n1364) );
  C8T28SOI_LR_AOI22X2_P0 U914 ( .A(n1339), .B(acc_mag[6]), .C(n1097), .D(
        acc_mag[7]), .Z(n1131) );
  C8T28SOI_LR_AOI22X2_P0 U915 ( .A(n1332), .B(acc_mag[5]), .C(n1354), .D(
        acc_mag[8]), .Z(n1130) );
  C8T28SOI_LR_CNNAND2X8_P16 U916 ( .A(n1131), .B(n1130), .Z(n1375) );
  C8T28SOI_LR_AOI22X2_P0 U917 ( .A(n1397), .B(n1359), .C(n1364), .D(n1375), 
        .Z(n1132) );
  C8T28SOI_LR_CNNAND2X8_P16 U918 ( .A(n1133), .B(n1132), .Z(n1411) );
  C8T28SOI_LR_AOI22X2_P0 U919 ( .A(n1339), .B(acc_mag[18]), .C(n1097), .D(
        acc_mag[19]), .Z(n1135) );
  C8T28SOI_LR_AOI22X2_P0 U920 ( .A(n1332), .B(acc_mag[17]), .C(n1354), .D(
        acc_mag[20]), .Z(n1134) );
  C8T28SOI_LR_CNNAND2X8_P16 U921 ( .A(n1135), .B(n1134), .Z(n1170) );
  C8T28SOI_LR_AOI22X2_P0 U922 ( .A(n1415), .B(n1411), .C(n1170), .D(n1147), 
        .Z(n1136) );
  C8T28SOI_LR_CNNOR2X8_P16 U923 ( .A(n1143), .B(n1136), .Z(n471) );
  C8T28SOI_LR_AOI22X2_P0 U924 ( .A(n1339), .B(acc_mag[21]), .C(n1097), .D(
        acc_mag[22]), .Z(n1138) );
  C8T28SOI_LR_AOI22X2_P0 U925 ( .A(n1332), .B(acc_mag[20]), .C(n1354), .D(
        acc_mag[23]), .Z(n1137) );
  C8T28SOI_LR_CNNAND2X8_P16 U926 ( .A(n1138), .B(n1137), .Z(n1321) );
  C8T28SOI_LR_AOI22X2_P0 U927 ( .A(n1339), .B(acc_mag[13]), .C(n1097), .D(
        acc_mag[14]), .Z(n1140) );
  C8T28SOI_LR_AOI22X2_P0 U928 ( .A(n1332), .B(acc_mag[12]), .C(n1354), .D(
        acc_mag[15]), .Z(n1139) );
  C8T28SOI_LR_CNNAND2X8_P16 U929 ( .A(n1140), .B(n1139), .Z(n1361) );
  C8T28SOI_LR_AOI22X2_P0 U930 ( .A(n1339), .B(acc_mag[9]), .C(n1097), .D(
        acc_mag[10]), .Z(n1142) );
  C8T28SOI_LR_AOI22X2_P0 U931 ( .A(n1332), .B(acc_mag[8]), .C(n1354), .D(
        acc_mag[11]), .Z(n1141) );
  C8T28SOI_LR_CNNAND2X8_P16 U932 ( .A(n1142), .B(n1141), .Z(n1360) );
  C8T28SOI_LR_AOI222X2_P0 U933 ( .A(n1321), .B(n1397), .C(n1361), .D(n1364), 
        .E(n1360), .F(n1335), .Z(n1383) );
  C8T28SOI_LR_CNNOR2X8_P16 U934 ( .A(n1147), .B(n1143), .Z(n1398) );
  C8T28SOI_LR_AND2X5_P0 U936 ( .A(n1392), .B(n1398), .Z(n1376) );
  C8T28SOI_LR_AOI22X2_P0 U937 ( .A(n1339), .B(acc_mag[17]), .C(n1097), .D(
        acc_mag[18]), .Z(n1145) );
  C8T28SOI_LR_AOI22X2_P0 U938 ( .A(n1332), .B(acc_mag[16]), .C(n1354), .D(
        acc_mag[19]), .Z(n1144) );
  C8T28SOI_LR_CNNAND2X8_P16 U939 ( .A(n1145), .B(n1144), .Z(n1338) );
  C8T28SOI_LR_AND2X5_P0 U940 ( .A(acc_mag_zc[14]), .B(n1146), .Z(n1171) );
  C8T28SOI_LR_AOI22X2_P0 U941 ( .A(n1376), .B(n1338), .C(acc_mag[25]), .D(
        n1171), .Z(n1149) );
  C8T28SOI_LR_CNNAND2X8_P16 U942 ( .A(n1147), .B(n1146), .Z(n1410) );
  C8T28SOI_LR_NOR2X4_P0 U943 ( .A(n1347), .B(n1410), .Z(n1172) );
  C8T28SOI_LR_NAND2X4_P0 U944 ( .A(acc_mag[24]), .B(n1172), .Z(n1148) );
  C8T28SOI_LR_OAI211X3_P0 U945 ( .A(n1383), .B(n1597), .C(n1149), .D(n1148), 
        .Z(n478) );
  C8T28SOI_LR_AOI22X2_P0 U946 ( .A(n1339), .B(acc_mag[19]), .C(n1097), .D(
        acc_mag[20]), .Z(n1151) );
  C8T28SOI_LR_AOI22X2_P0 U947 ( .A(n1332), .B(acc_mag[18]), .C(n1354), .D(
        acc_mag[21]), .Z(n1150) );
  C8T28SOI_LR_CNNAND2X8_P16 U948 ( .A(n1151), .B(n1150), .Z(n1329) );
  C8T28SOI_LR_AOI22X2_P0 U949 ( .A(n1339), .B(acc_mag[11]), .C(n1097), .D(
        acc_mag[12]), .Z(n1153) );
  C8T28SOI_LR_AOI22X2_P0 U950 ( .A(n1332), .B(acc_mag[10]), .C(n1354), .D(
        acc_mag[13]), .Z(n1152) );
  C8T28SOI_LR_CNNAND2X8_P16 U951 ( .A(n1153), .B(n1152), .Z(n1371) );
  C8T28SOI_LR_AOI22X2_P0 U952 ( .A(n1339), .B(acc_mag[7]), .C(n1097), .D(
        acc_mag[8]), .Z(n1155) );
  C8T28SOI_LR_AOI22X2_P0 U953 ( .A(n1332), .B(acc_mag[6]), .C(n1354), .D(
        acc_mag[9]), .Z(n1154) );
  C8T28SOI_LR_CNNAND2X8_P16 U954 ( .A(n1155), .B(n1154), .Z(n1369) );
  C8T28SOI_LR_AOI222X2_P0 U955 ( .A(n1329), .B(n1397), .C(n1371), .D(n1364), 
        .E(n1369), .F(n1335), .Z(n1389) );
  C8T28SOI_LR_AOI22X2_P0 U956 ( .A(n1339), .B(acc_mag[15]), .C(n1097), .D(
        acc_mag[16]), .Z(n1157) );
  C8T28SOI_LR_AOI22X2_P0 U957 ( .A(n1332), .B(acc_mag[14]), .C(n1354), .D(
        acc_mag[17]), .Z(n1156) );
  C8T28SOI_LR_CNNAND2X8_P16 U958 ( .A(n1157), .B(n1156), .Z(n1351) );
  C8T28SOI_LR_AOI22X2_P0 U959 ( .A(n1171), .B(acc_mag[23]), .C(n1376), .D(
        n1351), .Z(n1159) );
  C8T28SOI_LR_NAND2X4_P0 U960 ( .A(acc_mag[22]), .B(n1172), .Z(n1158) );
  C8T28SOI_LR_OAI211X3_P0 U961 ( .A(n1389), .B(n1597), .C(n1159), .D(n1158), 
        .Z(n476) );
  C8T28SOI_LR_AOI22X2_P0 U962 ( .A(n1339), .B(acc_mag[20]), .C(n1097), .D(
        acc_mag[21]), .Z(n1161) );
  C8T28SOI_LR_AOI22X2_P0 U963 ( .A(n1332), .B(acc_mag[19]), .C(n1354), .D(
        acc_mag[22]), .Z(n1160) );
  C8T28SOI_LR_CNNAND2X8_P16 U964 ( .A(n1161), .B(n1160), .Z(n1325) );
  C8T28SOI_LR_AOI22X2_P0 U965 ( .A(n1339), .B(acc_mag[12]), .C(n1097), .D(
        acc_mag[13]), .Z(n1163) );
  C8T28SOI_LR_AOI22X2_P0 U966 ( .A(n1332), .B(acc_mag[11]), .C(n1354), .D(
        acc_mag[14]), .Z(n1162) );
  C8T28SOI_LR_CNNAND2X8_P16 U967 ( .A(n1163), .B(n1162), .Z(n1366) );
  C8T28SOI_LR_AOI22X2_P0 U968 ( .A(n1339), .B(acc_mag[8]), .C(n1097), .D(
        acc_mag[9]), .Z(n1165) );
  C8T28SOI_LR_AOI22X2_P0 U969 ( .A(n1332), .B(acc_mag[7]), .C(n1354), .D(
        acc_mag[10]), .Z(n1164) );
  C8T28SOI_LR_CNNAND2X8_P16 U970 ( .A(n1165), .B(n1164), .Z(n1365) );
  C8T28SOI_LR_AOI222X2_P0 U971 ( .A(n1325), .B(n1397), .C(n1366), .D(n1364), 
        .E(n1365), .F(n1335), .Z(n1387) );
  C8T28SOI_LR_AOI22X2_P0 U972 ( .A(n1339), .B(acc_mag[16]), .C(n1097), .D(
        acc_mag[17]), .Z(n1167) );
  C8T28SOI_LR_AOI22X2_P0 U973 ( .A(n1332), .B(acc_mag[15]), .C(n1354), .D(
        acc_mag[18]), .Z(n1166) );
  C8T28SOI_LR_CNNAND2X8_P16 U974 ( .A(n1167), .B(n1166), .Z(n1343) );
  C8T28SOI_LR_AOI22X2_P0 U975 ( .A(n1376), .B(n1343), .C(acc_mag[24]), .D(
        n1171), .Z(n1169) );
  C8T28SOI_LR_NAND2X4_P0 U976 ( .A(acc_mag[23]), .B(n1172), .Z(n1168) );
  C8T28SOI_LR_OAI211X3_P0 U977 ( .A(n1387), .B(n1597), .C(n1169), .D(n1168), 
        .Z(n477) );
  C8T28SOI_LR_AOI222X2_P0 U978 ( .A(n1170), .B(n1397), .C(n1377), .D(n1364), 
        .E(n1375), .F(n1335), .Z(n1396) );
  C8T28SOI_LR_AOI22X2_P0 U979 ( .A(n1376), .B(n1359), .C(acc_mag[22]), .D(
        n1171), .Z(n1174) );
  C8T28SOI_LR_NAND2X4_P0 U980 ( .A(acc_mag[21]), .B(n1172), .Z(n1173) );
  C8T28SOI_LR_OAI211X3_P0 U981 ( .A(n1396), .B(n1597), .C(n1174), .D(n1173), 
        .Z(n475) );
  C8T28SOI_LR_CNNOR2X8_P16 U984 ( .A(intadd_1_SUM_0_), .B(n1589), .Z(n120) );
  C8T28SOI_LR_CNNOR2X8_P16 U985 ( .A(intadd_1_SUM_1_), .B(n1589), .Z(n121) );
  C8T28SOI_LR_CNNOR2X8_P16 U986 ( .A(intadd_1_SUM_2_), .B(n1589), .Z(n122) );
  C8T28SOI_LR_CNNOR2X8_P16 U987 ( .A(intadd_1_SUM_3_), .B(n1589), .Z(n123) );
  C8T28SOI_LR_CNIVX4_P16 U988 ( .A(acc[12]), .Z(n1500) );
  C8T28SOI_LR_CNNOR2X8_P16 U989 ( .A(mts_fp[5]), .B(n1176), .Z(n1179) );
  C8T28SOI_LR_CNNOR2X8_P16 U990 ( .A(n1179), .B(n1180), .Z(n1177) );
  C8T28SOI_LRS_XNOR2X3_P0 U991 ( .A(mts_fp[6]), .B(n1177), .Z(n1190) );
  C8T28SOI_LR_AOI22X2_P0 U992 ( .A(exp_fp[0]), .B(n1178), .C(n1190), .D(n1582), 
        .Z(n1227) );
  C8T28SOI_LR_CNNAND2AX9_P16 U993 ( .A(mts_fp[6]), .B(n1179), .Z(n1182) );
  C8T28SOI_LR_CNNOR2AX9_P16 U994 ( .A(n1182), .B(n1180), .Z(n1181) );
  C8T28SOI_LRS_XNOR2X3_P0 U995 ( .A(mts_fp[7]), .B(n1181), .Z(n1223) );
  C8T28SOI_LR_OAI12X3_P0 U996 ( .A(mts_fp[7]), .B(n1182), .C(sign_fp), .Z(
        n1200) );
  C8T28SOI_LR_AOI22X2_P0 U997 ( .A(exp_fp[0]), .B(n1223), .C(n1200), .D(n1582), 
        .Z(n1183) );
  C8T28SOI_LR_AOI22X2_P0 U998 ( .A(exp_fp[1]), .B(n1227), .C(n1183), .D(n1222), 
        .Z(n1536) );
  C8T28SOI_LR_NAND2X4_P0 U1000 ( .A(n1584), .B(n1200), .Z(n1541) );
  C8T28SOI_LR_CNIVX4_P16 U1001 ( .A(n1184), .Z(n1538) );
  C8T28SOI_LR_OAI22X3_P0 U1002 ( .A(exp_fp[2]), .B(n1541), .C(n1584), .D(n1538), .Z(n1185) );
  C8T28SOI_LR_AOI31X3_P0 U1003 ( .A(exp_fp[2]), .B(n1536), .C(n1584), .D(n1185), .Z(n1246) );
  C8T28SOI_LR_NAND2X4_P0 U1005 ( .A(n1246), .B(n1583), .Z(n1288) );
  C8T28SOI_LR_CNXOR2X9_P16 U1006 ( .A(n1500), .S(n1288), .Z(n1186) );
  C8T28SOI_LR_CNBFX4_P16 U1007 ( .A(intadd_1_n1), .Z(n1289) );
  C8T28SOI_LR_CNXOR2X9_P16 U1008 ( .A(n1186), .S(n1289), .Z(n1187) );
  C8T28SOI_LR_CNNOR2X8_P16 U1009 ( .A(n1589), .B(n1187), .Z(n124) );
  C8T28SOI_LR_CNNOR2X8_P16 U1010 ( .A(intadd_3_SUM_1_), .B(n1589), .Z(n125) );
  C8T28SOI_LR_CNNOR2X8_P16 U1011 ( .A(intadd_3_SUM_2_), .B(n1589), .Z(n126) );
  C8T28SOI_LR_CNIVX4_P16 U1012 ( .A(n1188), .Z(n1217) );
  C8T28SOI_LR_CNNOR2X8_P16 U1013 ( .A(exp_fp[1]), .B(n1535), .Z(n1229) );
  C8T28SOI_LR_CNIVX4_P16 U1014 ( .A(n1189), .Z(n1211) );
  C8T28SOI_LR_AOI22X2_P0 U1015 ( .A(exp_fp[0]), .B(n1190), .C(n1223), .D(n1582), .Z(n1234) );
  C8T28SOI_LR_AOI222X2_P0 U1016 ( .A(n1217), .B(n1229), .C(n1211), .D(n1234), 
        .E(exp_fp[1]), .F(n1191), .Z(n1208) );
  C8T28SOI_LR_CNIVX4_P16 U1017 ( .A(n1208), .Z(n1240) );
  C8T28SOI_LR_OAI12X3_P0 U1018 ( .A(n1240), .B(n1584), .C(n1541), .Z(n1546) );
  C8T28SOI_LR_CNNOR2X8_P16 U1019 ( .A(exp_fp[4]), .B(n1546), .Z(n1205) );
  C8T28SOI_LR_CNXOR2X9_P16 U1020 ( .A(n1205), .S(acc[15]), .Z(n1193) );
  C8T28SOI_LR_CNBFX4_P16 U1021 ( .A(intadd_3_n1), .Z(n1192) );
  C8T28SOI_LR_CNIVX4_P16 U1022 ( .A(n1192), .Z(n1204) );
  C8T28SOI_LRS_XNOR2X3_P0 U1023 ( .A(n1193), .B(n1204), .Z(n1194) );
  C8T28SOI_LR_CNNOR2X8_P16 U1024 ( .A(n1589), .B(n1194), .Z(n127) );
  C8T28SOI_LR_CNNOR2X8_P16 U1026 ( .A(n1594), .B(n1586), .Z(n281) );
  C8T28SOI_LR_CNIVX4_P16 U1027 ( .A(acc[38]), .Z(intadd_0_A_22_) );
  C8T28SOI_LR_CNIVX4_P16 U1028 ( .A(acc[9]), .Z(intadd_1_A_1_) );
  C8T28SOI_LR_CNIVX4_P16 U1029 ( .A(acc[11]), .Z(intadd_1_A_3_) );
  C8T28SOI_LR_CNIVX4_P16 U1030 ( .A(acc[13]), .Z(intadd_3_A_1_) );
  C8T28SOI_LR_CNIVX4_P16 U1031 ( .A(acc[17]), .Z(intadd_0_A_1_) );
  C8T28SOI_LR_CNIVX4_P16 U1032 ( .A(acc[19]), .Z(intadd_0_A_3_) );
  C8T28SOI_LR_CNIVX4_P16 U1033 ( .A(acc[21]), .Z(intadd_0_A_5_) );
  C8T28SOI_LR_CNIVX4_P16 U1034 ( .A(acc[23]), .Z(intadd_0_A_7_) );
  C8T28SOI_LR_CNIVX4_P16 U1035 ( .A(acc[25]), .Z(intadd_0_A_9_) );
  C8T28SOI_LR_CNIVX4_P16 U1036 ( .A(acc[27]), .Z(intadd_0_A_11_) );
  C8T28SOI_LR_CNIVX4_P16 U1037 ( .A(acc[29]), .Z(intadd_0_A_13_) );
  C8T28SOI_LR_CNIVX4_P16 U1038 ( .A(acc[31]), .Z(intadd_0_A_15_) );
  C8T28SOI_LR_CNIVX4_P16 U1039 ( .A(acc[33]), .Z(intadd_0_A_17_) );
  C8T28SOI_LR_CNIVX4_P16 U1040 ( .A(acc[35]), .Z(intadd_0_A_19_) );
  C8T28SOI_LR_CNIVX4_P16 U1041 ( .A(acc[37]), .Z(intadd_0_A_21_) );
  C8T28SOI_LR_CNNOR2X8_P16 U1042 ( .A(acc[6]), .B(n1196), .Z(n1513) );
  C8T28SOI_LR_CNNAND2AX9_P16 U1043 ( .A(acc[7]), .B(n1513), .Z(n1510) );
  C8T28SOI_LR_CNNOR2X8_P16 U1044 ( .A(acc[8]), .B(n1510), .Z(n1507) );
  C8T28SOI_LR_CNNAND2X8_P16 U1045 ( .A(n1507), .B(intadd_1_A_1_), .Z(n1504) );
  C8T28SOI_LR_CNNOR2X8_P16 U1046 ( .A(acc[10]), .B(n1504), .Z(n1501) );
  C8T28SOI_LR_CNNAND2X8_P16 U1047 ( .A(n1501), .B(intadd_1_A_3_), .Z(n1497) );
  C8T28SOI_LR_CNNOR2X8_P16 U1048 ( .A(acc[12]), .B(n1497), .Z(n1494) );
  C8T28SOI_LR_CNNAND2X8_P16 U1049 ( .A(n1494), .B(intadd_3_A_1_), .Z(n1491) );
  C8T28SOI_LR_CNNOR2X8_P16 U1050 ( .A(acc[14]), .B(n1491), .Z(n1488) );
  C8T28SOI_LR_CNNAND2AX9_P16 U1051 ( .A(acc[15]), .B(n1488), .Z(n1485) );
  C8T28SOI_LR_CNNOR2X8_P16 U1052 ( .A(acc[16]), .B(n1485), .Z(n1481) );
  C8T28SOI_LR_CNNAND2X8_P16 U1053 ( .A(n1481), .B(intadd_0_A_1_), .Z(n1478) );
  C8T28SOI_LR_CNNOR2X8_P16 U1054 ( .A(acc[18]), .B(n1478), .Z(n1475) );
  C8T28SOI_LR_CNNAND2X8_P16 U1055 ( .A(n1475), .B(intadd_0_A_3_), .Z(n1472) );
  C8T28SOI_LR_CNNOR2X8_P16 U1056 ( .A(acc[20]), .B(n1472), .Z(n1469) );
  C8T28SOI_LR_CNNAND2X8_P16 U1057 ( .A(n1469), .B(intadd_0_A_5_), .Z(n1466) );
  C8T28SOI_LR_CNNOR2X8_P16 U1058 ( .A(acc[22]), .B(n1466), .Z(n1463) );
  C8T28SOI_LR_CNNAND2X8_P16 U1059 ( .A(n1463), .B(intadd_0_A_7_), .Z(n1460) );
  C8T28SOI_LR_CNNOR2X8_P16 U1060 ( .A(acc[24]), .B(n1460), .Z(n1457) );
  C8T28SOI_LR_CNNAND2X8_P16 U1061 ( .A(n1457), .B(intadd_0_A_9_), .Z(n1454) );
  C8T28SOI_LR_CNNOR2X8_P16 U1062 ( .A(acc[26]), .B(n1454), .Z(n1451) );
  C8T28SOI_LR_CNNAND2X8_P16 U1063 ( .A(n1451), .B(intadd_0_A_11_), .Z(n1448)
         );
  C8T28SOI_LR_CNNOR2X8_P16 U1064 ( .A(acc[28]), .B(n1448), .Z(n1445) );
  C8T28SOI_LR_CNNAND2X8_P16 U1065 ( .A(n1445), .B(intadd_0_A_13_), .Z(n1442)
         );
  C8T28SOI_LR_CNNOR2X8_P16 U1066 ( .A(acc[30]), .B(n1442), .Z(n1438) );
  C8T28SOI_LR_CNNAND2X8_P16 U1067 ( .A(n1438), .B(intadd_0_A_15_), .Z(n1434)
         );
  C8T28SOI_LR_CNNOR2X8_P16 U1068 ( .A(acc[32]), .B(n1434), .Z(n1431) );
  C8T28SOI_LR_CNNAND2X8_P16 U1069 ( .A(n1431), .B(intadd_0_A_17_), .Z(n1428)
         );
  C8T28SOI_LR_CNNOR2X8_P16 U1070 ( .A(acc[34]), .B(n1428), .Z(n1425) );
  C8T28SOI_LR_CNNAND2X8_P16 U1071 ( .A(n1425), .B(intadd_0_A_19_), .Z(n1422)
         );
  C8T28SOI_LR_CNNOR2X8_P16 U1072 ( .A(acc[36]), .B(n1422), .Z(n1419) );
  C8T28SOI_LR_CNNAND2X8_P16 U1073 ( .A(n1419), .B(intadd_0_A_21_), .Z(n1416)
         );
  C8T28SOI_LR_NOR3BCX4_P0 U1074 ( .B(n281), .C(intadd_0_A_22_), .A(n1416), .Z(
        n321) );
  C8T28SOI_LR_CNNOR2X8_P16 U1075 ( .A(intadd_0_SUM_0_), .B(n1589), .Z(n128) );
  C8T28SOI_LR_CNNOR2X8_P16 U1076 ( .A(intadd_0_SUM_1_), .B(n1589), .Z(n129) );
  C8T28SOI_LR_CNNOR2X8_P16 U1077 ( .A(intadd_0_SUM_2_), .B(n1589), .Z(n130) );
  C8T28SOI_LR_CNNOR2X8_P16 U1080 ( .A(intadd_0_SUM_3_), .B(n1589), .Z(n131) );
  C8T28SOI_LR_CNNOR2X8_P16 U1081 ( .A(intadd_0_SUM_4_), .B(n1589), .Z(n132) );
  C8T28SOI_LR_CNNOR2X8_P16 U1082 ( .A(intadd_0_SUM_5_), .B(n1589), .Z(n133) );
  C8T28SOI_LR_CNNOR2X8_P16 U1083 ( .A(intadd_0_SUM_6_), .B(n1589), .Z(n134) );
  C8T28SOI_LR_CNNOR2X8_P16 U1084 ( .A(intadd_0_SUM_7_), .B(n1589), .Z(n135) );
  C8T28SOI_LR_CNNOR2X8_P16 U1085 ( .A(intadd_0_SUM_8_), .B(n1589), .Z(n136) );
  C8T28SOI_LR_CNNOR2X8_P16 U1086 ( .A(intadd_0_SUM_9_), .B(n1589), .Z(n137) );
  C8T28SOI_LR_CNNOR2X8_P16 U1087 ( .A(intadd_0_SUM_10_), .B(n1589), .Z(n138)
         );
  C8T28SOI_LR_CNNOR2X8_P16 U1088 ( .A(intadd_0_SUM_11_), .B(n1589), .Z(n139)
         );
  C8T28SOI_LR_CNNOR2X8_P16 U1089 ( .A(intadd_0_SUM_12_), .B(n1589), .Z(n140)
         );
  C8T28SOI_LR_CNNOR2X8_P16 U1090 ( .A(intadd_0_SUM_13_), .B(n1589), .Z(n141)
         );
  C8T28SOI_LR_CNNOR2X8_P16 U1091 ( .A(intadd_0_SUM_14_), .B(n1591), .Z(n142)
         );
  C8T28SOI_LR_CNNOR2X8_P16 U1092 ( .A(intadd_0_SUM_15_), .B(n1591), .Z(n143)
         );
  C8T28SOI_LR_CNNOR2X8_P16 U1093 ( .A(intadd_0_SUM_16_), .B(n1591), .Z(n144)
         );
  C8T28SOI_LR_CNNOR2X8_P16 U1094 ( .A(intadd_0_SUM_17_), .B(n1591), .Z(n145)
         );
  C8T28SOI_LR_CNNOR2X8_P16 U1095 ( .A(intadd_0_SUM_18_), .B(n1591), .Z(n146)
         );
  C8T28SOI_LR_CNNOR2X8_P16 U1096 ( .A(intadd_0_SUM_19_), .B(n1591), .Z(n147)
         );
  C8T28SOI_LR_CNNOR2X8_P16 U1097 ( .A(intadd_0_SUM_20_), .B(n1591), .Z(n148)
         );
  C8T28SOI_LR_CNNOR2X8_P16 U1098 ( .A(intadd_0_SUM_21_), .B(n1591), .Z(n149)
         );
  C8T28SOI_LR_CNNOR2X8_P16 U1099 ( .A(intadd_0_SUM_22_), .B(n1591), .Z(n150)
         );
  C8T28SOI_LR_CNBFX4_P16 U1100 ( .A(intadd_0_n1), .Z(n1202) );
  C8T28SOI_LR_CNIVX4_P16 U1101 ( .A(n1200), .Z(n1245) );
  C8T28SOI_LR_AOI22X2_P0 U1102 ( .A(acc[39]), .B(n1245), .C(n1200), .D(n1586), 
        .Z(n1201) );
  C8T28SOI_LR_CNXOR2X9_P16 U1103 ( .A(n1202), .S(n1201), .Z(n1203) );
  C8T28SOI_LR_CNNOR2X8_P16 U1104 ( .A(n1591), .B(n1203), .Z(n151) );
  C8T28SOI_LR_PAOI2X4_P0 U1105 ( .A(n1205), .B(acc[15]), .P(n1204), .Z(
        intadd_0_B_0_) );
  C8T28SOI_LR_CNIVX4_P16 U1106 ( .A(n1206), .Z(n1226) );
  C8T28SOI_LR_NAND2X4_P0 U1107 ( .A(exp_fp[1]), .B(exp_fp[2]), .Z(n1233) );
  C8T28SOI_LR_CNIVX4_P16 U1108 ( .A(n1233), .Z(n1232) );
  C8T28SOI_LR_AOI22X2_P0 U1109 ( .A(n1229), .B(n1226), .C(n1232), .D(n1209), 
        .Z(n1207) );
  C8T28SOI_LR_OAI12X3_P0 U1110 ( .A(exp_fp[2]), .B(n1536), .C(n1207), .Z(n1526) );
  C8T28SOI_LR_CNNOR2X8_P16 U1111 ( .A(exp_fp[4]), .B(n1584), .Z(n1238) );
  C8T28SOI_LR_AOI22X2_P0 U1112 ( .A(n1239), .B(n1526), .C(n1527), .D(n1238), 
        .Z(intadd_1_CI) );
  C8T28SOI_LR_CNNOR2X8_P16 U1113 ( .A(n1208), .B(n1212), .Z(n1283) );
  C8T28SOI_LR_AOI222X2_P0 U1114 ( .A(n1227), .B(n1211), .C(exp_fp[1]), .D(
        n1210), .E(n1209), .F(n1229), .Z(n1237) );
  C8T28SOI_LR_CNNOR2X8_P16 U1115 ( .A(n1237), .B(n1212), .Z(n1279) );
  C8T28SOI_LR_PAOI2X4_P0 U1116 ( .A(n1215), .B(n1214), .P(n1213), .Z(n1281) );
  C8T28SOI_LR_PAOI2X4_P0 U1117 ( .A(acc[6]), .B(n1279), .P(n1281), .Z(n1286)
         );
  C8T28SOI_LR_CNIVX4_P16 U1118 ( .A(n1286), .Z(n1216) );
  C8T28SOI_LR_PAOI2X4_P0 U1119 ( .A(acc[7]), .B(n1283), .P(n1216), .Z(
        intadd_1_B_0_) );
  C8T28SOI_LR_CNIVX4_P16 U1120 ( .A(acc[8]), .Z(intadd_1_A_0_) );
  C8T28SOI_LR_NAND2X4_P0 U1121 ( .A(n1245), .B(n1535), .Z(n1534) );
  C8T28SOI_LR_AOI22AX2_P0 U1122 ( .C(n1232), .D(n1217), .A(n1231), .B(n1229), 
        .Z(n1220) );
  C8T28SOI_LR_NAND2X4_P0 U1123 ( .A(n1234), .B(n1218), .Z(n1219) );
  C8T28SOI_LR_OAI211X3_P0 U1124 ( .A(exp_fp[1]), .B(n1534), .C(n1220), .D(
        n1219), .Z(n1528) );
  C8T28SOI_LR_AOI22X2_P0 U1125 ( .A(n1239), .B(n1528), .C(n1529), .D(n1238), 
        .Z(intadd_1_B_1_) );
  C8T28SOI_LR_NOR2X4_P0 U1126 ( .A(n1222), .B(n1582), .Z(n1225) );
  C8T28SOI_LR_CNNAND2X8_P16 U1127 ( .A(n1223), .B(n1225), .Z(n1224) );
  C8T28SOI_LR_OAI12X3_P0 U1128 ( .A(n1225), .B(n1245), .C(n1224), .Z(n1236) );
  C8T28SOI_LR_AOI22X2_P0 U1129 ( .A(n1229), .B(n1227), .C(n1232), .D(n1226), 
        .Z(n1228) );
  C8T28SOI_LR_OAI12X3_P0 U1130 ( .A(exp_fp[2]), .B(n1236), .C(n1228), .Z(n1530) );
  C8T28SOI_LR_AOI22X2_P0 U1131 ( .A(n1239), .B(n1530), .C(n1238), .D(n1531), 
        .Z(intadd_1_B_2_) );
  C8T28SOI_LR_CNIVX4_P16 U1132 ( .A(acc[10]), .Z(intadd_1_A_2_) );
  C8T28SOI_LR_NAND2X4_P0 U1133 ( .A(n1234), .B(n1229), .Z(n1230) );
  C8T28SOI_LR_OAI211X3_P0 U1134 ( .A(n1231), .B(n1233), .C(n1230), .D(n1534), 
        .Z(n1532) );
  C8T28SOI_LR_AOI22X2_P0 U1135 ( .A(n1239), .B(n1532), .C(n1238), .D(n1533), 
        .Z(intadd_1_B_3_) );
  C8T28SOI_LR_CNNOR2X8_P16 U1136 ( .A(n1245), .B(n1232), .Z(n1235) );
  C8T28SOI_LR_OA21CX4_P0 U1137 ( .A(n1234), .B(n1233), .C(n1235), .Z(n1539) );
  C8T28SOI_LR_AOI22X2_P0 U1138 ( .A(n1239), .B(n1539), .C(n1238), .D(n1540), 
        .Z(intadd_3_B_1_) );
  C8T28SOI_LR_OAI12X3_P0 U1139 ( .A(n1236), .B(n1235), .C(n1534), .Z(n1542) );
  C8T28SOI_LR_CNIVX4_P16 U1140 ( .A(n1237), .Z(n1544) );
  C8T28SOI_LR_AOI22X2_P0 U1141 ( .A(n1239), .B(n1542), .C(n1238), .D(n1544), 
        .Z(intadd_3_B_2_) );
  C8T28SOI_LR_CNIVX4_P16 U1142 ( .A(acc[14]), .Z(intadd_3_A_2_) );
  C8T28SOI_LR_CNIVX4_P16 U1143 ( .A(acc[16]), .Z(intadd_0_A_0_) );
  C8T28SOI_LR_CNIVX4_P16 U1144 ( .A(acc[18]), .Z(intadd_0_A_2_) );
  C8T28SOI_LR_CNIVX4_P16 U1145 ( .A(acc[20]), .Z(intadd_0_A_4_) );
  C8T28SOI_LR_CNIVX4_P16 U1146 ( .A(acc[22]), .Z(intadd_0_A_6_) );
  C8T28SOI_LR_CNNOR2X8_P16 U1147 ( .A(exp_fp[3]), .B(n1583), .Z(n1545) );
  C8T28SOI_LR_AOI22X2_P0 U1148 ( .A(n1545), .B(n1240), .C(n1245), .D(n1583), 
        .Z(intadd_0_B_7_) );
  C8T28SOI_LR_CNNOR2X8_P16 U1149 ( .A(n1584), .B(n1583), .Z(n1248) );
  C8T28SOI_LR_AOI22X2_P0 U1150 ( .A(n1248), .B(n1527), .C(n1545), .D(n1526), 
        .Z(n1241) );
  C8T28SOI_LR_NAND2X4_P0 U1151 ( .A(n1245), .B(n1583), .Z(n1553) );
  C8T28SOI_LR_AND2X5_P0 U1152 ( .A(n1241), .B(n1553), .Z(intadd_0_B_8_) );
  C8T28SOI_LR_CNIVX4_P16 U1153 ( .A(acc[24]), .Z(intadd_0_A_8_) );
  C8T28SOI_LR_AOI22X2_P0 U1154 ( .A(n1545), .B(n1528), .C(n1248), .D(n1529), 
        .Z(n1242) );
  C8T28SOI_LR_AND2X5_P0 U1155 ( .A(n1242), .B(n1553), .Z(intadd_0_B_9_) );
  C8T28SOI_LR_AOI22X2_P0 U1156 ( .A(n1545), .B(n1530), .C(n1248), .D(n1531), 
        .Z(n1243) );
  C8T28SOI_LR_AND2X5_P0 U1157 ( .A(n1243), .B(n1553), .Z(intadd_0_B_10_) );
  C8T28SOI_LR_CNIVX4_P16 U1158 ( .A(acc[26]), .Z(intadd_0_A_10_) );
  C8T28SOI_LR_AOI22X2_P0 U1159 ( .A(n1545), .B(n1532), .C(n1248), .D(n1533), 
        .Z(n1244) );
  C8T28SOI_LR_AND2X5_P0 U1160 ( .A(n1244), .B(n1553), .Z(intadd_0_B_11_) );
  C8T28SOI_LR_AOI22X2_P0 U1161 ( .A(exp_fp[4]), .B(n1246), .C(n1245), .D(n1583), .Z(intadd_0_B_12_) );
  C8T28SOI_LR_CNIVX4_P16 U1162 ( .A(acc[28]), .Z(intadd_0_A_12_) );
  C8T28SOI_LR_AOI22X2_P0 U1163 ( .A(n1539), .B(n1545), .C(n1248), .D(n1540), 
        .Z(n1247) );
  C8T28SOI_LR_AND2X5_P0 U1164 ( .A(n1247), .B(n1553), .Z(intadd_0_B_13_) );
  C8T28SOI_LR_AOI22X2_P0 U1165 ( .A(n1545), .B(n1542), .C(n1248), .D(n1544), 
        .Z(n1249) );
  C8T28SOI_LR_AND2X5_P0 U1166 ( .A(n1249), .B(n1553), .Z(intadd_0_B_14_) );
  C8T28SOI_LR_CNIVX4_P16 U1167 ( .A(acc[30]), .Z(intadd_0_A_14_) );
  C8T28SOI_LR_CNIVX4_P16 U1168 ( .A(acc[32]), .Z(intadd_0_A_16_) );
  C8T28SOI_LR_CNIVX4_P16 U1169 ( .A(acc[34]), .Z(intadd_0_A_18_) );
  C8T28SOI_LR_CNIVX4_P16 U1170 ( .A(acc[36]), .Z(intadd_0_A_20_) );
  C8T28SOI_LR_CNBFX4_P16 U1171 ( .A(intadd_2_n1), .Z(n1271) );
  C8T28SOI_LR_CNNAND2X8_P16 U1172 ( .A(mts_w[1]), .B(mts_d[3]), .Z(n1291) );
  C8T28SOI_LR_CNNAND2X8_P16 U1173 ( .A(mts_d[1]), .B(mts_w[3]), .Z(n1290) );
  C8T28SOI_LR_CNNOR2X8_P16 U1174 ( .A(n1291), .B(n1290), .Z(n1303) );
  C8T28SOI_LR_AND2X5_P0 U1175 ( .A(mts_d[2]), .B(mts_w[3]), .Z(n1302) );
  C8T28SOI_LR_AND2X5_P0 U1176 ( .A(mts_d[3]), .B(mts_w[2]), .Z(n1301) );
  C8T28SOI_LR_CNNAND2X8_P16 U1177 ( .A(mts_d[3]), .B(mts_w[3]), .Z(n1270) );
  C8T28SOI_LR_CNNOR2X8_P16 U1178 ( .A(n1268), .B(n1270), .Z(n1250) );
  C8T28SOI_LR_CNXOR2X9_P16 U1179 ( .A(n1271), .S(n1250), .Z(n33) );
  C8T28SOI_LR_AOI112X3_P0 U1180 ( .A(n1253), .B(n1252), .C(n1251), .D(n1589), 
        .Z(n106) );
  C8T28SOI_LR_CNNOR2X8_P16 U1181 ( .A(n1525), .B(n1253), .Z(n1255) );
  C8T28SOI_LR_OAI12X3_P0 U1182 ( .A(counter[1]), .B(counter[2]), .C(counter[3]), .Z(n1254) );
  C8T28SOI_LR_OAI12X3_P0 U1183 ( .A(vld_d[2]), .B(n1255), .C(n1254), .Z(n1258)
         );
  C8T28SOI_LR_CNNOR2X8_P16 U1184 ( .A(n1258), .B(n1255), .Z(n1256) );
  C8T28SOI_LR_AOI112X3_P0 U1185 ( .A(n1259), .B(n1258), .C(n1257), .D(n1256), 
        .Z(n986) );
  C8T28SOI_LR_AOI112X3_P0 U1186 ( .A(n1263), .B(n1262), .C(n1261), .D(n1589), 
        .Z(n112) );
  C8T28SOI_LR_CNXOR2X9_P16 U1187 ( .A(acc[2]), .S(n1264), .Z(n1267) );
  C8T28SOI_LR_CNNOR2X8_P16 U1188 ( .A(n1267), .B(n1266), .Z(n1265) );
  C8T28SOI_LR_AOI112X3_P0 U1189 ( .A(n1267), .B(n1266), .C(n1589), .D(n1265), 
        .Z(n114) );
  C8T28SOI_LR_CNIVX4_P16 U1190 ( .A(n1268), .Z(n1269) );
  C8T28SOI_LR_OAI12AX3_P0 U1191 ( .A(n1271), .B(n1270), .C(n1269), .Z(n34) );
  C8T28SOI_LR_AOI112X3_P0 U1192 ( .A(n1274), .B(n1273), .C(n1272), .D(n1413), 
        .Z(n480) );
  C8T28SOI_LR_CNXOR2X9_P16 U1193 ( .A(acc[4]), .S(n1275), .Z(n1278) );
  C8T28SOI_LR_CNNOR2X8_P16 U1194 ( .A(n1278), .B(n1277), .Z(n1276) );
  C8T28SOI_LR_AOI112X3_P0 U1195 ( .A(n1278), .B(n1277), .C(n1589), .D(n1276), 
        .Z(n116) );
  C8T28SOI_LR_CNXOR2X9_P16 U1196 ( .A(acc[6]), .S(n1279), .Z(n1282) );
  C8T28SOI_LR_CNNOR2X8_P16 U1197 ( .A(n1282), .B(n1281), .Z(n1280) );
  C8T28SOI_LR_AOI112X3_P0 U1198 ( .A(n1282), .B(n1281), .C(n1589), .D(n1280), 
        .Z(n118) );
  C8T28SOI_LRS_XNOR2X3_P0 U1199 ( .A(acc[7]), .B(n1283), .Z(n1287) );
  C8T28SOI_LR_CNNOR2X8_P16 U1200 ( .A(n1287), .B(n1286), .Z(n1284) );
  C8T28SOI_LR_AOI112X3_P0 U1201 ( .A(n1287), .B(n1286), .C(n1589), .D(n1284), 
        .Z(n119) );
  C8T28SOI_LR_FA1X4_P0 U1202 ( .A0(n1289), .B0(n1288), .CI(n1500), .CO(
        intadd_3_n3), .S0(SYNOPSYS_UNCONNECTED_1) );
  C8T28SOI_LR_AOI12X3_P0 U1204 ( .A(n1291), .B(n1290), .C(n1303), .Z(n1293) );
  C8T28SOI_LR_CNNAND2X8_P16 U1205 ( .A(mts_d[1]), .B(mts_w[2]), .Z(n1300) );
  C8T28SOI_LR_CNNAND2X8_P16 U1206 ( .A(mts_w[3]), .B(mts_d[0]), .Z(n1299) );
  C8T28SOI_LR_CNNOR2X8_P16 U1207 ( .A(n1300), .B(n1299), .Z(n1298) );
  C8T28SOI_LR_AND2X5_P0 U1208 ( .A(mts_d[2]), .B(mts_w[2]), .Z(n1292) );
  C8T28SOI_LR_FA1X4_P0 U1209 ( .A0(n1293), .B0(n1298), .CI(n1292), .CO(
        intadd_2_B_3_), .S0(intadd_2_A_2_) );
  C8T28SOI_LR_AOI12X3_P0 U1210 ( .A(n1296), .B(n1295), .C(n1294), .Z(
        intadd_2_B_2_) );
  C8T28SOI_LR_CB4I1X3_P0 U1211 ( .A(mts_w[1]), .B(mts_d[1]), .C(n1297), .D(
        n1296), .Z(intadd_2_A_0_) );
  C8T28SOI_LR_AOI12X3_P0 U1212 ( .A(n1300), .B(n1299), .C(n1298), .Z(
        intadd_2_B_1_) );
  C8T28SOI_LR_FA1X4_P0 U1213 ( .A0(n1303), .B0(n1302), .CI(n1301), .CO(n1268), 
        .S0(intadd_2_A_3_) );
  C8T28SOI_LR_AOI12X3_P0 U1214 ( .A(n1305), .B(n1304), .C(intadd_2_B_0_), .Z(
        n28) );
  C8T28SOI_LR_OA12X3_P0 U1215 ( .A(n1308), .B(n1307), .C(n1306), .Z(n22) );
  C8T28SOI_LR_FA1X4_P0 U1216 ( .A0(n1311), .B0(n1310), .CI(n1309), .CO(n998), 
        .S0(n21) );
  C8T28SOI_LR_CNIVX4_P16 U1217 ( .A(n1312), .Z(n1316) );
  C8T28SOI_LR_NAND2X4_P0 U1218 ( .A(n1314), .B(n1313), .Z(n1315) );
  C8T28SOI_LR_AOI22AX2_P0 U1219 ( .C(exp_r[0]), .D(n1316), .A(exp_r[0]), .B(
        n1315), .Z(n513) );
  C8T28SOI_LR_CBI4I6X3_P0 U1220 ( .A(n1404), .B(n1097), .C(n1317), .D(n1413), 
        .Z(n437) );
  C8T28SOI_LR_OA12X3_P0 U1221 ( .A(n1339), .B(n1097), .C(n1318), .Z(n436) );
  C8T28SOI_LR_AOI22X2_P0 U1222 ( .A(acc_mag[5]), .B(n1339), .C(n1097), .D(
        acc_mag[6]), .Z(n1320) );
  C8T28SOI_LR_AOI22X2_P0 U1223 ( .A(n1332), .B(acc_mag[4]), .C(n1354), .D(
        acc_mag[7]), .Z(n1319) );
  C8T28SOI_LR_CNNAND2X8_P16 U1224 ( .A(n1320), .B(n1319), .Z(n1381) );
  C8T28SOI_LR_AOI222X2_P0 U1225 ( .A(n1338), .B(n1397), .C(n1360), .D(n1364), 
        .E(n1381), .F(n1335), .Z(n1399) );
  C8T28SOI_LR_AOI22X2_P0 U1227 ( .A(n1596), .B(n1321), .C(n1376), .D(n1361), 
        .Z(n1322) );
  C8T28SOI_LR_OAI12X3_P0 U1228 ( .A(n1399), .B(n1597), .C(n1322), .Z(n474) );
  C8T28SOI_LR_AOI22X2_P0 U1229 ( .A(acc_mag[5]), .B(n1097), .C(n1339), .D(
        acc_mag[4]), .Z(n1324) );
  C8T28SOI_LR_AOI22X2_P0 U1230 ( .A(n1332), .B(acc_mag[3]), .C(n1354), .D(
        acc_mag[6]), .Z(n1323) );
  C8T28SOI_LR_CNNAND2X8_P16 U1231 ( .A(n1324), .B(n1323), .Z(n1385) );
  C8T28SOI_LR_AOI222X2_P0 U1232 ( .A(n1343), .B(n1397), .C(n1365), .D(n1364), 
        .E(n1385), .F(n1335), .Z(n1403) );
  C8T28SOI_LR_AOI22X2_P0 U1233 ( .A(n1596), .B(n1325), .C(n1376), .D(n1366), 
        .Z(n1326) );
  C8T28SOI_LR_OAI12X3_P0 U1234 ( .A(n1403), .B(n1597), .C(n1326), .Z(n473) );
  C8T28SOI_LR_AOI22X2_P0 U1235 ( .A(n1339), .B(acc_mag[3]), .C(acc_mag[4]), 
        .D(n1097), .Z(n1328) );
  C8T28SOI_LR_AOI22X2_P0 U1236 ( .A(n1332), .B(acc_mag[2]), .C(n1354), .D(
        acc_mag[5]), .Z(n1327) );
  C8T28SOI_LR_CNNAND2X8_P16 U1237 ( .A(n1328), .B(n1327), .Z(n1370) );
  C8T28SOI_LR_AOI222X2_P0 U1238 ( .A(n1369), .B(n1364), .C(n1351), .D(n1397), 
        .E(n1370), .F(n1335), .Z(n1407) );
  C8T28SOI_LR_AOI22X2_P0 U1239 ( .A(n1596), .B(n1329), .C(n1376), .D(n1371), 
        .Z(n1330) );
  C8T28SOI_LR_OAI12X3_P0 U1240 ( .A(n1407), .B(n1597), .C(n1330), .Z(n472) );
  C8T28SOI_LR_AOI22X2_P0 U1241 ( .A(n1397), .B(n1361), .C(n1364), .D(n1381), 
        .Z(n1337) );
  C8T28SOI_LR_AOI22X2_P0 U1242 ( .A(acc_mag[1]), .B(n1339), .C(acc_mag[2]), 
        .D(n1097), .Z(n1334) );
  C8T28SOI_LR_AOI22X2_P0 U1243 ( .A(acc_mag[0]), .B(n1332), .C(n1354), .D(
        acc_mag[3]), .Z(n1333) );
  C8T28SOI_LR_CNNAND2X8_P16 U1244 ( .A(n1334), .B(n1333), .Z(n1400) );
  C8T28SOI_LR_AOI22X2_P0 U1245 ( .A(n1392), .B(n1360), .C(n1335), .D(n1400), 
        .Z(n1336) );
  C8T28SOI_LR_AND2X5_P0 U1246 ( .A(n1337), .B(n1336), .Z(n1412) );
  C8T28SOI_LR_OAI22AX3_P0 U1247 ( .A(n1338), .B(n1410), .C(n1412), .D(n1597), 
        .Z(n470) );
  C8T28SOI_LR_AOI222X2_P0 U1248 ( .A(acc_mag[1]), .B(n1097), .C(acc_mag[0]), 
        .D(n1339), .E(acc_mag[2]), .F(n1354), .Z(n1402) );
  C8T28SOI_LR_AOI22X2_P0 U1249 ( .A(n1397), .B(n1366), .C(n1364), .D(n1385), 
        .Z(n1341) );
  C8T28SOI_LR_OAI12X3_P0 U1250 ( .A(n1402), .B(n1356), .C(n1341), .Z(n1342) );
  C8T28SOI_LR_AOI12X3_P0 U1251 ( .A(n1392), .B(n1365), .C(n1342), .Z(n1414) );
  C8T28SOI_LR_OAI22AX3_P0 U1252 ( .A(n1343), .B(n1410), .C(n1414), .D(n1597), 
        .Z(n469) );
  C8T28SOI_LR_OR2X5_P0 U1253 ( .A(acc_mag[1]), .B(n1344), .Z(n1345) );
  C8T28SOI_LR_OAI211X3_P0 U1254 ( .A(acc_mag[0]), .B(n1347), .C(n1346), .D(
        n1345), .Z(n1406) );
  C8T28SOI_LR_NAND2X4_P0 U1255 ( .A(n1370), .B(n1349), .Z(n1348) );
  C8T28SOI_LR_OAI12X3_P0 U1256 ( .A(n1349), .B(n1406), .C(n1348), .Z(n1390) );
  C8T28SOI_LR_AOI22X2_P0 U1257 ( .A(n1397), .B(n1371), .C(n1390), .D(n1350), 
        .Z(n1353) );
  C8T28SOI_LR_AOI22X2_P0 U1258 ( .A(n1596), .B(n1351), .C(n1376), .D(n1369), 
        .Z(n1352) );
  C8T28SOI_LR_OAI12X3_P0 U1259 ( .A(n1353), .B(n1597), .C(n1352), .Z(n468) );
  C8T28SOI_LR_NAND2X4_P0 U1260 ( .A(acc_mag[0]), .B(n1354), .Z(n1409) );
  C8T28SOI_LR_AOI22X2_P0 U1261 ( .A(n1397), .B(n1377), .C(n1364), .D(n1393), 
        .Z(n1355) );
  C8T28SOI_LR_OAI12X3_P0 U1262 ( .A(n1356), .B(n1409), .C(n1355), .Z(n1357) );
  C8T28SOI_LR_AOI12X3_P0 U1263 ( .A(n1392), .B(n1375), .C(n1357), .Z(n1358) );
  C8T28SOI_LR_OAI22AX3_P0 U1264 ( .A(n1359), .B(n1410), .C(n1358), .D(n1597), 
        .Z(n467) );
  C8T28SOI_LR_AOI22X2_P0 U1265 ( .A(n1397), .B(n1360), .C(n1364), .D(n1400), 
        .Z(n1363) );
  C8T28SOI_LR_AOI22X2_P0 U1266 ( .A(n1596), .B(n1361), .C(n1376), .D(n1381), 
        .Z(n1362) );
  C8T28SOI_LR_OAI12X3_P0 U1267 ( .A(n1363), .B(n1597), .C(n1362), .Z(n466) );
  C8T28SOI_LR_CNIVX4_P16 U1268 ( .A(n1402), .Z(n1384) );
  C8T28SOI_LR_AOI22X2_P0 U1269 ( .A(n1397), .B(n1365), .C(n1364), .D(n1384), 
        .Z(n1368) );
  C8T28SOI_LR_AOI22X2_P0 U1270 ( .A(n1596), .B(n1366), .C(n1376), .D(n1385), 
        .Z(n1367) );
  C8T28SOI_LR_OAI12X3_P0 U1271 ( .A(n1368), .B(n1597), .C(n1367), .Z(n465) );
  C8T28SOI_LR_NOR2X4_P0 U1272 ( .A(n1404), .B(n1388), .Z(n1374) );
  C8T28SOI_LR_AOI22AX2_P0 U1273 ( .C(n1397), .D(n1369), .A(n1406), .B(n1374), 
        .Z(n1373) );
  C8T28SOI_LR_AOI22X2_P0 U1274 ( .A(n1596), .B(n1371), .C(n1376), .D(n1370), 
        .Z(n1372) );
  C8T28SOI_LR_OAI12X3_P0 U1275 ( .A(n1373), .B(n1597), .C(n1372), .Z(n464) );
  C8T28SOI_LR_CNIVX4_P16 U1276 ( .A(n1409), .Z(n1391) );
  C8T28SOI_LR_AOI22X2_P0 U1277 ( .A(n1397), .B(n1375), .C(n1391), .D(n1374), 
        .Z(n1380) );
  C8T28SOI_LR_AOI22X2_P0 U1278 ( .A(n1596), .B(n1377), .C(n1376), .D(n1393), 
        .Z(n1379) );
  C8T28SOI_LR_OAI12X3_P0 U1279 ( .A(n1380), .B(n1597), .C(n1379), .Z(n463) );
  C8T28SOI_LR_AOI22X2_P0 U1280 ( .A(n1397), .B(n1381), .C(n1392), .D(n1400), 
        .Z(n1382) );
  C8T28SOI_LR_OAI22X3_P0 U1281 ( .A(n1383), .B(n1410), .C(n1382), .D(n1597), 
        .Z(n462) );
  C8T28SOI_LR_AOI22X2_P0 U1282 ( .A(n1397), .B(n1385), .C(n1392), .D(n1384), 
        .Z(n1386) );
  C8T28SOI_LR_OAI22X3_P0 U1283 ( .A(n1387), .B(n1410), .C(n1386), .D(n1597), 
        .Z(n461) );
  C8T28SOI_LR_NAND2X4_P0 U1284 ( .A(n1398), .B(n1388), .Z(n1405) );
  C8T28SOI_LR_OAI22AX3_P0 U1285 ( .A(n1390), .B(n1405), .C(n1389), .D(n1410), 
        .Z(n460) );
  C8T28SOI_LR_AOI22X2_P0 U1286 ( .A(n1397), .B(n1393), .C(n1392), .D(n1391), 
        .Z(n1395) );
  C8T28SOI_LR_OAI22X3_P0 U1287 ( .A(n1396), .B(n1410), .C(n1395), .D(n1597), 
        .Z(n459) );
  C8T28SOI_LR_NAND2X4_P0 U1288 ( .A(n1398), .B(n1397), .Z(n1401) );
  C8T28SOI_LR_OAI22AX3_P0 U1289 ( .A(n1400), .B(n1401), .C(n1399), .D(n1410), 
        .Z(n458) );
  C8T28SOI_LR_OAI22X3_P0 U1290 ( .A(n1403), .B(n1410), .C(n1402), .D(n1401), 
        .Z(n457) );
  C8T28SOI_LR_OR2X5_P0 U1291 ( .A(n1405), .B(n1404), .Z(n1408) );
  C8T28SOI_LR_OAI22X3_P0 U1292 ( .A(n1407), .B(n1410), .C(n1406), .D(n1408), 
        .Z(n456) );
  C8T28SOI_LR_OAI22AX3_P0 U1293 ( .A(n1411), .B(n1410), .C(n1409), .D(n1408), 
        .Z(n455) );
  C8T28SOI_LR_NOR3X3_P0 U1294 ( .A(n1415), .B(n1412), .C(n1413), .Z(n454) );
  C8T28SOI_LR_NOR3X3_P0 U1295 ( .A(n1415), .B(n1414), .C(n1413), .Z(n453) );
  C8T28SOI_LR_CNNAND2X8_P16 U1296 ( .A(acc[39]), .B(n1416), .Z(n1418) );
  C8T28SOI_LR_OAI12X3_P0 U1297 ( .A(intadd_0_A_22_), .B(n1418), .C(n1595), .Z(
        n1417) );
  C8T28SOI_LR_AOI12X3_P0 U1298 ( .A(intadd_0_A_22_), .B(n1418), .C(n1417), .Z(
        n320) );
  C8T28SOI_LR_CNNOR2X8_P16 U1299 ( .A(n1419), .B(n1586), .Z(n1421) );
  C8T28SOI_LR_OAI12X3_P0 U1300 ( .A(acc[37]), .B(n1421), .C(n1595), .Z(n1420)
         );
  C8T28SOI_LR_AOI12X3_P0 U1301 ( .A(acc[37]), .B(n1421), .C(n1420), .Z(n319)
         );
  C8T28SOI_LR_CNNAND2X8_P16 U1302 ( .A(acc[39]), .B(n1422), .Z(n1424) );
  C8T28SOI_LR_OAI12X3_P0 U1303 ( .A(intadd_0_A_20_), .B(n1424), .C(n1595), .Z(
        n1423) );
  C8T28SOI_LR_AOI12X3_P0 U1304 ( .A(intadd_0_A_20_), .B(n1424), .C(n1423), .Z(
        n318) );
  C8T28SOI_LR_CNNOR2X8_P16 U1305 ( .A(n1425), .B(n1586), .Z(n1427) );
  C8T28SOI_LR_OAI12X3_P0 U1306 ( .A(acc[35]), .B(n1427), .C(n1595), .Z(n1426)
         );
  C8T28SOI_LR_AOI12X3_P0 U1307 ( .A(acc[35]), .B(n1427), .C(n1426), .Z(n317)
         );
  C8T28SOI_LR_CNNAND2X8_P16 U1308 ( .A(acc[39]), .B(n1428), .Z(n1430) );
  C8T28SOI_LR_OAI12X3_P0 U1309 ( .A(intadd_0_A_18_), .B(n1430), .C(n1595), .Z(
        n1429) );
  C8T28SOI_LR_AOI12X3_P0 U1310 ( .A(intadd_0_A_18_), .B(n1430), .C(n1429), .Z(
        n316) );
  C8T28SOI_LR_CNNOR2X8_P16 U1311 ( .A(n1431), .B(n1588), .Z(n1433) );
  C8T28SOI_LR_OAI12X3_P0 U1312 ( .A(acc[33]), .B(n1433), .C(n1593), .Z(n1432)
         );
  C8T28SOI_LR_AOI12X3_P0 U1313 ( .A(acc[33]), .B(n1433), .C(n1432), .Z(n315)
         );
  C8T28SOI_LR_CNNAND2X8_P16 U1314 ( .A(acc[39]), .B(n1434), .Z(n1437) );
  C8T28SOI_LR_OAI12X3_P0 U1315 ( .A(intadd_0_A_16_), .B(n1437), .C(n1593), .Z(
        n1436) );
  C8T28SOI_LR_AOI12X3_P0 U1316 ( .A(intadd_0_A_16_), .B(n1437), .C(n1436), .Z(
        n314) );
  C8T28SOI_LR_CNNOR2X8_P16 U1317 ( .A(n1438), .B(n1586), .Z(n1441) );
  C8T28SOI_LR_OAI12X3_P0 U1319 ( .A(acc[31]), .B(n1441), .C(n1595), .Z(n1440)
         );
  C8T28SOI_LR_AOI12X3_P0 U1320 ( .A(acc[31]), .B(n1441), .C(n1440), .Z(n313)
         );
  C8T28SOI_LR_CNNAND2X8_P16 U1321 ( .A(acc[39]), .B(n1442), .Z(n1444) );
  C8T28SOI_LR_OAI12X3_P0 U1322 ( .A(intadd_0_A_14_), .B(n1444), .C(n1595), .Z(
        n1443) );
  C8T28SOI_LR_AOI12X3_P0 U1323 ( .A(intadd_0_A_14_), .B(n1444), .C(n1443), .Z(
        n312) );
  C8T28SOI_LR_CNNOR2X8_P16 U1324 ( .A(n1445), .B(n1586), .Z(n1447) );
  C8T28SOI_LR_OAI12X3_P0 U1325 ( .A(acc[29]), .B(n1447), .C(n1595), .Z(n1446)
         );
  C8T28SOI_LR_AOI12X3_P0 U1326 ( .A(acc[29]), .B(n1447), .C(n1446), .Z(n311)
         );
  C8T28SOI_LR_CNNAND2X8_P16 U1327 ( .A(acc[39]), .B(n1448), .Z(n1450) );
  C8T28SOI_LR_OAI12X3_P0 U1328 ( .A(intadd_0_A_12_), .B(n1450), .C(n1595), .Z(
        n1449) );
  C8T28SOI_LR_AOI12X3_P0 U1329 ( .A(intadd_0_A_12_), .B(n1450), .C(n1449), .Z(
        n310) );
  C8T28SOI_LR_CNNOR2X8_P16 U1330 ( .A(n1451), .B(n1586), .Z(n1453) );
  C8T28SOI_LR_OAI12X3_P0 U1331 ( .A(acc[27]), .B(n1453), .C(n1595), .Z(n1452)
         );
  C8T28SOI_LR_AOI12X3_P0 U1332 ( .A(acc[27]), .B(n1453), .C(n1452), .Z(n309)
         );
  C8T28SOI_LR_CNNAND2X8_P16 U1333 ( .A(acc[39]), .B(n1454), .Z(n1456) );
  C8T28SOI_LR_OAI12X3_P0 U1334 ( .A(intadd_0_A_10_), .B(n1456), .C(n1595), .Z(
        n1455) );
  C8T28SOI_LR_AOI12X3_P0 U1335 ( .A(intadd_0_A_10_), .B(n1456), .C(n1455), .Z(
        n308) );
  C8T28SOI_LR_CNNOR2X8_P16 U1336 ( .A(n1457), .B(n1586), .Z(n1459) );
  C8T28SOI_LR_OAI12X3_P0 U1337 ( .A(acc[25]), .B(n1459), .C(n1595), .Z(n1458)
         );
  C8T28SOI_LR_AOI12X3_P0 U1338 ( .A(acc[25]), .B(n1459), .C(n1458), .Z(n307)
         );
  C8T28SOI_LR_CNNAND2X8_P16 U1339 ( .A(acc[39]), .B(n1460), .Z(n1462) );
  C8T28SOI_LR_OAI12X3_P0 U1340 ( .A(intadd_0_A_8_), .B(n1462), .C(n1595), .Z(
        n1461) );
  C8T28SOI_LR_AOI12X3_P0 U1341 ( .A(intadd_0_A_8_), .B(n1462), .C(n1461), .Z(
        n306) );
  C8T28SOI_LR_CNNOR2X8_P16 U1342 ( .A(n1463), .B(n1586), .Z(n1465) );
  C8T28SOI_LR_OAI12X3_P0 U1343 ( .A(acc[23]), .B(n1465), .C(n1595), .Z(n1464)
         );
  C8T28SOI_LR_AOI12X3_P0 U1344 ( .A(acc[23]), .B(n1465), .C(n1464), .Z(n305)
         );
  C8T28SOI_LR_CNNAND2X8_P16 U1345 ( .A(acc[39]), .B(n1466), .Z(n1468) );
  C8T28SOI_LR_OAI12X3_P0 U1346 ( .A(intadd_0_A_6_), .B(n1468), .C(n1595), .Z(
        n1467) );
  C8T28SOI_LR_AOI12X3_P0 U1347 ( .A(intadd_0_A_6_), .B(n1468), .C(n1467), .Z(
        n304) );
  C8T28SOI_LR_CNNOR2X8_P16 U1348 ( .A(n1469), .B(n1586), .Z(n1471) );
  C8T28SOI_LR_OAI12X3_P0 U1349 ( .A(acc[21]), .B(n1471), .C(n1595), .Z(n1470)
         );
  C8T28SOI_LR_AOI12X3_P0 U1350 ( .A(acc[21]), .B(n1471), .C(n1470), .Z(n303)
         );
  C8T28SOI_LR_CNNAND2X8_P16 U1351 ( .A(acc[39]), .B(n1472), .Z(n1474) );
  C8T28SOI_LR_OAI12X3_P0 U1352 ( .A(intadd_0_A_4_), .B(n1474), .C(n1595), .Z(
        n1473) );
  C8T28SOI_LR_AOI12X3_P0 U1353 ( .A(intadd_0_A_4_), .B(n1474), .C(n1473), .Z(
        n302) );
  C8T28SOI_LR_CNNOR2X8_P16 U1354 ( .A(n1475), .B(n1586), .Z(n1477) );
  C8T28SOI_LR_OAI12X3_P0 U1355 ( .A(acc[19]), .B(n1477), .C(n1595), .Z(n1476)
         );
  C8T28SOI_LR_AOI12X3_P0 U1356 ( .A(acc[19]), .B(n1477), .C(n1476), .Z(n301)
         );
  C8T28SOI_LR_CNNAND2X8_P16 U1357 ( .A(n1587), .B(n1478), .Z(n1480) );
  C8T28SOI_LR_OAI12X3_P0 U1358 ( .A(intadd_0_A_2_), .B(n1480), .C(n1593), .Z(
        n1479) );
  C8T28SOI_LR_AOI12X3_P0 U1359 ( .A(intadd_0_A_2_), .B(n1480), .C(n1479), .Z(
        n300) );
  C8T28SOI_LR_CNNOR2X8_P16 U1360 ( .A(n1481), .B(n1588), .Z(n1484) );
  C8T28SOI_LR_OAI12X3_P0 U1361 ( .A(acc[17]), .B(n1484), .C(n1593), .Z(n1483)
         );
  C8T28SOI_LR_AOI12X3_P0 U1362 ( .A(acc[17]), .B(n1484), .C(n1483), .Z(n299)
         );
  C8T28SOI_LR_CNNAND2X8_P16 U1363 ( .A(n1587), .B(n1485), .Z(n1487) );
  C8T28SOI_LR_OAI12X3_P0 U1364 ( .A(intadd_0_A_0_), .B(n1487), .C(n1593), .Z(
        n1486) );
  C8T28SOI_LR_AOI12X3_P0 U1365 ( .A(intadd_0_A_0_), .B(n1487), .C(n1486), .Z(
        n298) );
  C8T28SOI_LR_CNNOR2X8_P16 U1366 ( .A(n1488), .B(n1588), .Z(n1490) );
  C8T28SOI_LR_OAI12X3_P0 U1367 ( .A(acc[15]), .B(n1490), .C(n1593), .Z(n1489)
         );
  C8T28SOI_LR_AOI12X3_P0 U1368 ( .A(acc[15]), .B(n1490), .C(n1489), .Z(n297)
         );
  C8T28SOI_LR_CNNAND2X8_P16 U1369 ( .A(n1587), .B(n1491), .Z(n1493) );
  C8T28SOI_LR_OAI12X3_P0 U1370 ( .A(intadd_3_A_2_), .B(n1493), .C(n1593), .Z(
        n1492) );
  C8T28SOI_LR_AOI12X3_P0 U1371 ( .A(intadd_3_A_2_), .B(n1493), .C(n1492), .Z(
        n296) );
  C8T28SOI_LR_CNNOR2X8_P16 U1372 ( .A(n1494), .B(n1588), .Z(n1496) );
  C8T28SOI_LR_OAI12X3_P0 U1373 ( .A(acc[13]), .B(n1496), .C(n1593), .Z(n1495)
         );
  C8T28SOI_LR_AOI12X3_P0 U1374 ( .A(acc[13]), .B(n1496), .C(n1495), .Z(n295)
         );
  C8T28SOI_LR_CNNAND2X8_P16 U1375 ( .A(n1587), .B(n1497), .Z(n1499) );
  C8T28SOI_LR_OAI12X3_P0 U1376 ( .A(n1500), .B(n1499), .C(n1593), .Z(n1498) );
  C8T28SOI_LR_AOI12X3_P0 U1377 ( .A(n1500), .B(n1499), .C(n1498), .Z(n294) );
  C8T28SOI_LR_CNNOR2X8_P16 U1378 ( .A(n1501), .B(n1588), .Z(n1503) );
  C8T28SOI_LR_OAI12X3_P0 U1379 ( .A(acc[11]), .B(n1503), .C(n1593), .Z(n1502)
         );
  C8T28SOI_LR_AOI12X3_P0 U1380 ( .A(acc[11]), .B(n1503), .C(n1502), .Z(n293)
         );
  C8T28SOI_LR_CNNAND2X8_P16 U1381 ( .A(n1587), .B(n1504), .Z(n1506) );
  C8T28SOI_LR_OAI12X3_P0 U1382 ( .A(intadd_1_A_2_), .B(n1506), .C(n1593), .Z(
        n1505) );
  C8T28SOI_LR_AOI12X3_P0 U1383 ( .A(intadd_1_A_2_), .B(n1506), .C(n1505), .Z(
        n292) );
  C8T28SOI_LR_CNNOR2X8_P16 U1384 ( .A(n1507), .B(n1588), .Z(n1509) );
  C8T28SOI_LR_OAI12X3_P0 U1385 ( .A(acc[9]), .B(n1509), .C(n1593), .Z(n1508)
         );
  C8T28SOI_LR_AOI12X3_P0 U1386 ( .A(acc[9]), .B(n1509), .C(n1508), .Z(n291) );
  C8T28SOI_LR_CNNAND2X8_P16 U1387 ( .A(n1587), .B(n1510), .Z(n1512) );
  C8T28SOI_LR_OAI12X3_P0 U1388 ( .A(intadd_1_A_0_), .B(n1512), .C(n1593), .Z(
        n1511) );
  C8T28SOI_LR_AOI12X3_P0 U1389 ( .A(intadd_1_A_0_), .B(n1512), .C(n1511), .Z(
        n290) );
  C8T28SOI_LR_CNNOR2X8_P16 U1390 ( .A(n1513), .B(n1588), .Z(n1515) );
  C8T28SOI_LR_OAI12X3_P0 U1391 ( .A(acc[7]), .B(n1515), .C(n1593), .Z(n1514)
         );
  C8T28SOI_LR_AOI12X3_P0 U1392 ( .A(acc[7]), .B(n1515), .C(n1514), .Z(n289) );
  C8T28SOI_LR_CNNOR2X8_P16 U1393 ( .A(n1516), .B(n1588), .Z(n1518) );
  C8T28SOI_LR_OAI12X3_P0 U1394 ( .A(acc[5]), .B(n1518), .C(n1593), .Z(n1517)
         );
  C8T28SOI_LR_AOI12X3_P0 U1395 ( .A(acc[5]), .B(n1518), .C(n1517), .Z(n287) );
  C8T28SOI_LR_NOR2X4_P0 U1396 ( .A(n1520), .B(n1588), .Z(n1522) );
  C8T28SOI_LR_OAI12X3_P0 U1397 ( .A(acc[3]), .B(n1522), .C(n1593), .Z(n1521)
         );
  C8T28SOI_LR_AOI12X3_P0 U1398 ( .A(acc[3]), .B(n1522), .C(n1521), .Z(n285) );
  C8T28SOI_LR_AOI12X3_P0 U1399 ( .A(n1525), .B(n1524), .C(n1589), .Z(n108) );
  C8T28SOI_LR_OAI12X3_P0 U1400 ( .A(n1584), .B(n1526), .C(n1541), .Z(n1547) );
  C8T28SOI_LR_AOI22AX2_P0 U1401 ( .C(n1545), .D(n1527), .A(n1547), .B(n1583), 
        .Z(intadd_0_CI) );
  C8T28SOI_LR_OAI12X3_P0 U1402 ( .A(n1584), .B(n1528), .C(n1541), .Z(n1548) );
  C8T28SOI_LR_AOI22AX2_P0 U1403 ( .C(n1529), .D(n1545), .A(n1548), .B(n1583), 
        .Z(intadd_0_B_1_) );
  C8T28SOI_LR_OAI12X3_P0 U1404 ( .A(n1584), .B(n1530), .C(n1541), .Z(n1549) );
  C8T28SOI_LR_AOI22AX2_P0 U1405 ( .C(n1545), .D(n1531), .A(n1549), .B(n1583), 
        .Z(intadd_0_B_2_) );
  C8T28SOI_LR_OAI12X3_P0 U1406 ( .A(n1584), .B(n1532), .C(n1541), .Z(n1550) );
  C8T28SOI_LR_AOI22AX2_P0 U1407 ( .C(n1545), .D(n1533), .A(n1550), .B(n1583), 
        .Z(intadd_0_B_3_) );
  C8T28SOI_LR_OAI211X3_P0 U1408 ( .A(n1536), .B(n1535), .C(exp_fp[3]), .D(
        n1534), .Z(n1537) );
  C8T28SOI_LR_CNNAND2X8_P16 U1409 ( .A(n1541), .B(n1537), .Z(n1551) );
  C8T28SOI_LR_AOI22AX2_P0 U1410 ( .C(n1545), .D(n1538), .A(n1551), .B(n1583), 
        .Z(intadd_0_B_4_) );
  C8T28SOI_LR_OAI12X3_P0 U1411 ( .A(n1539), .B(n1584), .C(n1541), .Z(n1552) );
  C8T28SOI_LR_AOI22AX2_P0 U1412 ( .C(n1545), .D(n1540), .A(n1552), .B(n1583), 
        .Z(intadd_0_B_5_) );
  C8T28SOI_LR_OAI12X3_P0 U1413 ( .A(n1584), .B(n1542), .C(n1541), .Z(n1554) );
  C8T28SOI_LR_AOI22AX2_P0 U1414 ( .C(n1545), .D(n1544), .A(n1554), .B(n1583), 
        .Z(intadd_0_B_6_) );
  C8T28SOI_LR_OA12X3_P0 U1415 ( .A(n1546), .B(n1583), .C(n1553), .Z(
        intadd_0_B_15_) );
  C8T28SOI_LR_OA12X3_P0 U1416 ( .A(n1583), .B(n1547), .C(n1553), .Z(
        intadd_0_B_16_) );
  C8T28SOI_LR_OA12X3_P0 U1417 ( .A(n1583), .B(n1548), .C(n1553), .Z(
        intadd_0_B_17_) );
  C8T28SOI_LR_OA12X3_P0 U1418 ( .A(n1583), .B(n1549), .C(n1553), .Z(
        intadd_0_B_18_) );
  C8T28SOI_LR_OA12X3_P0 U1419 ( .A(n1583), .B(n1550), .C(n1553), .Z(
        intadd_0_B_19_) );
  C8T28SOI_LR_OA12X3_P0 U1420 ( .A(n1583), .B(n1551), .C(n1553), .Z(
        intadd_0_B_20_) );
  C8T28SOI_LR_OA12X3_P0 U1421 ( .A(n1583), .B(n1552), .C(n1553), .Z(
        intadd_0_B_21_) );
  C8T28SOI_LR_OA12X3_P0 U1422 ( .A(n1583), .B(n1554), .C(n1553), .Z(
        intadd_0_B_22_) );
  C8T28SOI_LR_CNNOR2X8_P16 U908 ( .A(n1350), .B(n1129), .Z(n1397) );
  C8T28SOI_LR_CNNOR2X8_P16 U856 ( .A(n1122), .B(n1347), .Z(n1097) );
  C8T28SOI_LR_CNNOR2X8_P16 U897 ( .A(n1346), .B(n1347), .Z(n1332) );
  C8T28SOI_LR_CNNOR2X8_P16 U898 ( .A(n1344), .B(n1122), .Z(n1354) );
  C8T28SOI_LR_CNNOR2X8_P16 U894 ( .A(n1346), .B(n1344), .Z(n1339) );
  C8T28SOI_LR_CNBFX28_P16 U613 ( .A(rstn), .Z(n1574) );
  C8T28SOI_LR_CNBFX28_P16 U614 ( .A(rstn), .Z(n1575) );
  C8T28SOI_LR_CNBFX28_P16 U615 ( .A(rstn), .Z(n1576) );
  C8T28SOI_LR_CNBFX28_P16 U616 ( .A(rstn), .Z(n1577) );
  C8T28SOI_LR_CNBFX28_P16 U617 ( .A(rstn), .Z(n1578) );
  C8T28SOI_LR_CNBFX28_P16 U618 ( .A(rstn), .Z(n1579) );
  C8T28SOI_LR_CNBFX23_P16 U619 ( .A(rstn), .Z(n1580) );
  C8T28SOI_LR_CNBFX23_P16 U620 ( .A(rstn), .Z(n1581) );
  C8T28SOI_LR_CNIVX4_P16 U621 ( .A(exp_fp[0]), .Z(n1582) );
  C8T28SOI_LR_CNIVX9_P16 U622 ( .A(exp_fp[4]), .Z(n1583) );
  C8T28SOI_LR_CNIVX4_P16 U623 ( .A(exp_fp[3]), .Z(n1584) );
  C8T28SOI_LR_CNIVX9_P16 U625 ( .A(acc[39]), .Z(n1586) );
  C8T28SOI_LR_CNBFX8_P16 U626 ( .A(acc[39]), .Z(n1587) );
  C8T28SOI_LR_CNIVX9_P16 U627 ( .A(n1587), .Z(n1588) );
  C8T28SOI_LR_CNBFX28_P16 U628 ( .A(n993), .Z(n1589) );
  C8T28SOI_LR_CNIVX4_P16 U629 ( .A(n1589), .Z(n1590) );
  C8T28SOI_LR_CNBFX8_P16 U640 ( .A(n993), .Z(n1591) );
  C8T28SOI_LR_CNIVX14_P16 U642 ( .A(n1195), .Z(n1593) );
  C8T28SOI_LR_CNBFX4_P16 U647 ( .A(n1195), .Z(n1594) );
  C8T28SOI_LR_CNIVX4_P16 U748 ( .A(n1410), .Z(n1596) );
  C8T28SOI_LR_CNIVX4_P16 U760 ( .A(n1398), .Z(n1597) );
  C8T28SOI_LR_CNIVX4_P16 U738 ( .A(n1594), .Z(n1595) );
  C8T28SOI_LR_TOLX5 U624 ( .TL(n452) );
endmodule

