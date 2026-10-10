/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Sat Oct 10 03:43:48 2026
/////////////////////////////////////////////////////////////


module rst_sych_0 ( clk, rst, sych_rst );
  input clk, rst;
  output sych_rst;

  wire   [1:0] ff;
  tri   clk;
  tri   sych_rst;

  DFFRQX2M \ff_reg[0]  ( .D(1'b1), .CK(clk), .RN(rst), .Q(ff[0]) );
  DFFRQX2M \ff_reg[1]  ( .D(ff[0]), .CK(clk), .RN(rst), .Q(ff[1]) );
  DFFRQX2M \ff_reg[2]  ( .D(ff[1]), .CK(clk), .RN(rst), .Q(sych_rst) );
endmodule


module rst_sych_1 ( clk, rst, sych_rst );
  input clk, rst;
  output sych_rst;

  wire   [1:0] ff;

  DFFRQX2M \ff_reg[2]  ( .D(ff[1]), .CK(clk), .RN(rst), .Q(sych_rst) );
  DFFRQX2M \ff_reg[1]  ( .D(ff[0]), .CK(clk), .RN(rst), .Q(ff[1]) );
  DFFRQX2M \ff_reg[0]  ( .D(1'b1), .CK(clk), .RN(rst), .Q(ff[0]) );
endmodule


module regfile ( CLK, RST, Address, WrEn, RdEn, WrData, RdData, RdData_Valid, 
        REG0, REG1, REG2, REG3 );
  input [4:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, WrEn, RdEn;
  output RdData_Valid;
  wire   \mem[4][7] , \mem[4][6] , \mem[4][5] , \mem[4][4] , \mem[4][3] ,
         \mem[4][2] , \mem[4][1] , \mem[4][0] , \mem[5][7] , \mem[5][6] ,
         \mem[5][5] , \mem[5][4] , \mem[5][3] , \mem[5][2] , \mem[5][1] ,
         \mem[5][0] , \mem[6][7] , \mem[6][6] , \mem[6][5] , \mem[6][4] ,
         \mem[6][3] , \mem[6][2] , \mem[6][1] , \mem[6][0] , \mem[7][7] ,
         \mem[7][6] , \mem[7][5] , \mem[7][4] , \mem[7][3] , \mem[7][2] ,
         \mem[7][1] , \mem[7][0] , \mem[8][7] , \mem[8][6] , \mem[8][5] ,
         \mem[8][4] , \mem[8][3] , \mem[8][2] , \mem[8][1] , \mem[8][0] ,
         \mem[9][7] , \mem[9][6] , \mem[9][5] , \mem[9][4] , \mem[9][3] ,
         \mem[9][2] , \mem[9][1] , \mem[9][0] , \mem[10][7] , \mem[10][6] ,
         \mem[10][5] , \mem[10][4] , \mem[10][3] , \mem[10][2] , \mem[10][1] ,
         \mem[10][0] , \mem[13][7] , \mem[13][6] , \mem[13][5] , \mem[13][4] ,
         \mem[13][3] , \mem[13][2] , \mem[13][1] , \mem[13][0] , \mem[14][7] ,
         \mem[14][6] , \mem[14][5] , \mem[14][4] , \mem[14][3] , \mem[14][2] ,
         \mem[14][1] , \mem[14][0] , \mem[15][7] , \mem[15][6] , \mem[15][5] ,
         \mem[15][4] , \mem[15][3] , \mem[15][2] , \mem[15][1] , \mem[15][0] ,
         N84, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n364, n365, n366, n367, n368, n369, n370,
         n371, n372, n373, n374, n375, n376, n377, n378, n379, n380, n381,
         n382, n383, n384, n385, n386, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n1, n2,
         n3, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n414, n415, n416, n417, n418,
         n419, n420, n421, n422, n423, n424, n425, n426, n427;
  tri   CLK;

  DFFRX1M \mem_reg[17][7]  ( .D(n277), .CK(CLK), .RN(RST), .QN(n28) );
  DFFRX1M \mem_reg[17][6]  ( .D(n276), .CK(CLK), .RN(RST), .QN(n29) );
  DFFRX1M \mem_reg[17][5]  ( .D(n275), .CK(CLK), .RN(RST), .QN(n30) );
  DFFRX1M \mem_reg[17][4]  ( .D(n274), .CK(CLK), .RN(RST), .QN(n31) );
  DFFRX1M \mem_reg[17][3]  ( .D(n273), .CK(CLK), .RN(RST), .QN(n32) );
  DFFRX1M \mem_reg[17][2]  ( .D(n272), .CK(CLK), .RN(RST), .QN(n33) );
  DFFRX1M \mem_reg[17][1]  ( .D(n271), .CK(CLK), .RN(RST), .QN(n34) );
  DFFRX1M \mem_reg[17][0]  ( .D(n270), .CK(CLK), .RN(RST), .QN(n35) );
  DFFRX1M \mem_reg[20][7]  ( .D(n253), .CK(CLK), .RN(RST), .QN(n52) );
  DFFRX1M \mem_reg[20][6]  ( .D(n252), .CK(CLK), .RN(RST), .QN(n53) );
  DFFRX1M \mem_reg[20][5]  ( .D(n251), .CK(CLK), .RN(RST), .QN(n54) );
  DFFRX1M \mem_reg[20][4]  ( .D(n250), .CK(CLK), .RN(RST), .QN(n55) );
  DFFRX1M \mem_reg[20][3]  ( .D(n249), .CK(CLK), .RN(RST), .QN(n56) );
  DFFRX1M \mem_reg[20][2]  ( .D(n248), .CK(CLK), .RN(RST), .QN(n57) );
  DFFRX1M \mem_reg[20][1]  ( .D(n247), .CK(CLK), .RN(RST), .QN(n58) );
  DFFRX1M \mem_reg[20][0]  ( .D(n246), .CK(CLK), .RN(RST), .QN(n59) );
  DFFRX1M \mem_reg[12][7]  ( .D(n317), .CK(CLK), .RN(RST), .QN(n12) );
  DFFRX1M \mem_reg[12][6]  ( .D(n316), .CK(CLK), .RN(RST), .QN(n13) );
  DFFRX1M \mem_reg[12][5]  ( .D(n315), .CK(CLK), .RN(RST), .QN(n14) );
  DFFRX1M \mem_reg[12][4]  ( .D(n314), .CK(CLK), .RN(RST), .QN(n15) );
  DFFRX1M \mem_reg[12][3]  ( .D(n313), .CK(CLK), .RN(RST), .QN(n16) );
  DFFRX1M \mem_reg[12][2]  ( .D(n312), .CK(CLK), .RN(RST), .QN(n17) );
  DFFRX1M \mem_reg[12][1]  ( .D(n311), .CK(CLK), .RN(RST), .QN(n18) );
  DFFRX1M \mem_reg[12][0]  ( .D(n310), .CK(CLK), .RN(RST), .QN(n19) );
  DFFRX1M \mem_reg[11][7]  ( .D(n325), .CK(CLK), .RN(RST), .QN(n4) );
  DFFRX1M \mem_reg[11][6]  ( .D(n324), .CK(CLK), .RN(RST), .QN(n5) );
  DFFRX1M \mem_reg[11][5]  ( .D(n323), .CK(CLK), .RN(RST), .QN(n6) );
  DFFRX1M \mem_reg[11][4]  ( .D(n322), .CK(CLK), .RN(RST), .QN(n7) );
  DFFRX1M \mem_reg[11][3]  ( .D(n321), .CK(CLK), .RN(RST), .QN(n8) );
  DFFRX1M \mem_reg[11][2]  ( .D(n320), .CK(CLK), .RN(RST), .QN(n9) );
  DFFRX1M \mem_reg[11][1]  ( .D(n319), .CK(CLK), .RN(RST), .QN(n10) );
  DFFRX1M \mem_reg[11][0]  ( .D(n318), .CK(CLK), .RN(RST), .QN(n11) );
  DFFRX1M \mem_reg[18][7]  ( .D(n269), .CK(CLK), .RN(RST), .QN(n36) );
  DFFRX1M \mem_reg[18][6]  ( .D(n268), .CK(CLK), .RN(RST), .QN(n37) );
  DFFRX1M \mem_reg[18][5]  ( .D(n267), .CK(CLK), .RN(RST), .QN(n38) );
  DFFRX1M \mem_reg[18][4]  ( .D(n266), .CK(CLK), .RN(RST), .QN(n39) );
  DFFRX1M \mem_reg[18][3]  ( .D(n265), .CK(CLK), .RN(RST), .QN(n40) );
  DFFRX1M \mem_reg[18][2]  ( .D(n264), .CK(CLK), .RN(RST), .QN(n41) );
  DFFRX1M \mem_reg[18][1]  ( .D(n263), .CK(CLK), .RN(RST), .QN(n42) );
  DFFRX1M \mem_reg[18][0]  ( .D(n262), .CK(CLK), .RN(RST), .QN(n43) );
  DFFRX1M \mem_reg[21][7]  ( .D(n245), .CK(CLK), .RN(RST), .QN(n60) );
  DFFRX1M \mem_reg[21][6]  ( .D(n244), .CK(CLK), .RN(RST), .QN(n61) );
  DFFRX1M \mem_reg[21][5]  ( .D(n243), .CK(CLK), .RN(RST), .QN(n62) );
  DFFRX1M \mem_reg[21][4]  ( .D(n242), .CK(CLK), .RN(RST), .QN(n63) );
  DFFRX1M \mem_reg[21][3]  ( .D(n241), .CK(CLK), .RN(RST), .QN(n64) );
  DFFRX1M \mem_reg[21][2]  ( .D(n240), .CK(CLK), .RN(RST), .QN(n65) );
  DFFRX1M \mem_reg[21][1]  ( .D(n239), .CK(CLK), .RN(RST), .QN(n66) );
  DFFRX1M \mem_reg[21][0]  ( .D(n238), .CK(CLK), .RN(RST), .QN(n67) );
  DFFRX1M \mem_reg[16][7]  ( .D(n285), .CK(CLK), .RN(RST), .QN(n20) );
  DFFRX1M \mem_reg[16][6]  ( .D(n284), .CK(CLK), .RN(RST), .QN(n21) );
  DFFRX1M \mem_reg[16][5]  ( .D(n283), .CK(CLK), .RN(RST), .QN(n22) );
  DFFRX1M \mem_reg[16][4]  ( .D(n282), .CK(CLK), .RN(RST), .QN(n23) );
  DFFRX1M \mem_reg[16][3]  ( .D(n281), .CK(CLK), .RN(RST), .QN(n24) );
  DFFRX1M \mem_reg[16][2]  ( .D(n280), .CK(CLK), .RN(RST), .QN(n25) );
  DFFRX1M \mem_reg[16][1]  ( .D(n279), .CK(CLK), .RN(RST), .QN(n26) );
  DFFRX1M \mem_reg[16][0]  ( .D(n278), .CK(CLK), .RN(RST), .QN(n27) );
  DFFRX1M \mem_reg[19][7]  ( .D(n261), .CK(CLK), .RN(RST), .QN(n44) );
  DFFRX1M \mem_reg[19][6]  ( .D(n260), .CK(CLK), .RN(RST), .QN(n45) );
  DFFRX1M \mem_reg[19][5]  ( .D(n259), .CK(CLK), .RN(RST), .QN(n46) );
  DFFRX1M \mem_reg[19][4]  ( .D(n258), .CK(CLK), .RN(RST), .QN(n47) );
  DFFRX1M \mem_reg[19][3]  ( .D(n257), .CK(CLK), .RN(RST), .QN(n48) );
  DFFRX1M \mem_reg[19][2]  ( .D(n256), .CK(CLK), .RN(RST), .QN(n49) );
  DFFRX1M \mem_reg[19][1]  ( .D(n255), .CK(CLK), .RN(RST), .QN(n50) );
  DFFRX1M \mem_reg[19][0]  ( .D(n254), .CK(CLK), .RN(RST), .QN(n51) );
  DFFRX1M RdData_Valid_reg ( .D(n82), .CK(CLK), .RN(RST), .Q(RdData_Valid) );
  DFFRX1M \mem_reg[15][7]  ( .D(n293), .CK(CLK), .RN(RST), .Q(\mem[15][7] ) );
  DFFRX1M \mem_reg[15][3]  ( .D(n289), .CK(CLK), .RN(RST), .Q(\mem[15][3] ) );
  DFFRX1M \mem_reg[15][2]  ( .D(n288), .CK(CLK), .RN(RST), .Q(\mem[15][2] ) );
  DFFRX1M \mem_reg[14][7]  ( .D(n301), .CK(CLK), .RN(RST), .Q(\mem[14][7] ) );
  DFFRX1M \mem_reg[14][3]  ( .D(n297), .CK(CLK), .RN(RST), .Q(\mem[14][3] ) );
  DFFRX1M \mem_reg[14][2]  ( .D(n296), .CK(CLK), .RN(RST), .Q(\mem[14][2] ) );
  DFFRX1M \mem_reg[15][6]  ( .D(n292), .CK(CLK), .RN(RST), .Q(\mem[15][6] ) );
  DFFRX1M \mem_reg[15][5]  ( .D(n291), .CK(CLK), .RN(RST), .Q(\mem[15][5] ) );
  DFFRX1M \mem_reg[15][4]  ( .D(n290), .CK(CLK), .RN(RST), .Q(\mem[15][4] ) );
  DFFRX1M \mem_reg[15][1]  ( .D(n287), .CK(CLK), .RN(RST), .Q(\mem[15][1] ) );
  DFFRX1M \mem_reg[15][0]  ( .D(n286), .CK(CLK), .RN(RST), .Q(\mem[15][0] ) );
  DFFRX1M \mem_reg[14][6]  ( .D(n300), .CK(CLK), .RN(RST), .Q(\mem[14][6] ) );
  DFFRX1M \mem_reg[14][5]  ( .D(n299), .CK(CLK), .RN(RST), .Q(\mem[14][5] ) );
  DFFRX1M \mem_reg[14][4]  ( .D(n298), .CK(CLK), .RN(RST), .Q(\mem[14][4] ) );
  DFFRX1M \mem_reg[14][1]  ( .D(n295), .CK(CLK), .RN(RST), .Q(\mem[14][1] ) );
  DFFRX1M \mem_reg[14][0]  ( .D(n294), .CK(CLK), .RN(RST), .Q(\mem[14][0] ) );
  DFFRX1M \mem_reg[9][7]  ( .D(n341), .CK(CLK), .RN(RST), .Q(\mem[9][7] ) );
  DFFRX1M \mem_reg[9][3]  ( .D(n337), .CK(CLK), .RN(RST), .Q(\mem[9][3] ) );
  DFFRX1M \mem_reg[9][2]  ( .D(n336), .CK(CLK), .RN(RST), .Q(\mem[9][2] ) );
  DFFRX1M \mem_reg[9][6]  ( .D(n340), .CK(CLK), .RN(RST), .Q(\mem[9][6] ) );
  DFFRX1M \mem_reg[9][5]  ( .D(n339), .CK(CLK), .RN(RST), .Q(\mem[9][5] ) );
  DFFRX1M \mem_reg[9][4]  ( .D(n338), .CK(CLK), .RN(RST), .Q(\mem[9][4] ) );
  DFFRX1M \mem_reg[9][1]  ( .D(n335), .CK(CLK), .RN(RST), .Q(\mem[9][1] ) );
  DFFRX1M \mem_reg[9][0]  ( .D(n334), .CK(CLK), .RN(RST), .Q(\mem[9][0] ) );
  DFFRX1M \mem_reg[10][7]  ( .D(n333), .CK(CLK), .RN(RST), .Q(\mem[10][7] ) );
  DFFRX1M \mem_reg[10][3]  ( .D(n329), .CK(CLK), .RN(RST), .Q(\mem[10][3] ) );
  DFFRX1M \mem_reg[10][2]  ( .D(n328), .CK(CLK), .RN(RST), .Q(\mem[10][2] ) );
  DFFRX1M \mem_reg[10][6]  ( .D(n332), .CK(CLK), .RN(RST), .Q(\mem[10][6] ) );
  DFFRX1M \mem_reg[10][5]  ( .D(n331), .CK(CLK), .RN(RST), .Q(\mem[10][5] ) );
  DFFRX1M \mem_reg[10][4]  ( .D(n330), .CK(CLK), .RN(RST), .Q(\mem[10][4] ) );
  DFFRX1M \mem_reg[10][1]  ( .D(n327), .CK(CLK), .RN(RST), .Q(\mem[10][1] ) );
  DFFRX1M \mem_reg[10][0]  ( .D(n326), .CK(CLK), .RN(RST), .Q(\mem[10][0] ) );
  DFFRX1M \mem_reg[8][7]  ( .D(n349), .CK(CLK), .RN(RST), .Q(\mem[8][7] ) );
  DFFRX1M \mem_reg[8][3]  ( .D(n345), .CK(CLK), .RN(RST), .Q(\mem[8][3] ) );
  DFFRX1M \mem_reg[8][2]  ( .D(n344), .CK(CLK), .RN(RST), .Q(\mem[8][2] ) );
  DFFRX1M \mem_reg[8][6]  ( .D(n348), .CK(CLK), .RN(RST), .Q(\mem[8][6] ) );
  DFFRX1M \mem_reg[8][5]  ( .D(n347), .CK(CLK), .RN(RST), .Q(\mem[8][5] ) );
  DFFRX1M \mem_reg[8][4]  ( .D(n346), .CK(CLK), .RN(RST), .Q(\mem[8][4] ) );
  DFFRX1M \mem_reg[8][1]  ( .D(n343), .CK(CLK), .RN(RST), .Q(\mem[8][1] ) );
  DFFRX1M \mem_reg[8][0]  ( .D(n342), .CK(CLK), .RN(RST), .Q(\mem[8][0] ) );
  DFFRX1M \mem_reg[13][7]  ( .D(n309), .CK(CLK), .RN(RST), .Q(\mem[13][7] ) );
  DFFRX1M \mem_reg[13][3]  ( .D(n305), .CK(CLK), .RN(RST), .Q(\mem[13][3] ) );
  DFFRX1M \mem_reg[13][2]  ( .D(n304), .CK(CLK), .RN(RST), .Q(\mem[13][2] ) );
  DFFRX1M \mem_reg[13][6]  ( .D(n308), .CK(CLK), .RN(RST), .Q(\mem[13][6] ) );
  DFFRX1M \mem_reg[13][5]  ( .D(n307), .CK(CLK), .RN(RST), .Q(\mem[13][5] ) );
  DFFRX1M \mem_reg[13][4]  ( .D(n306), .CK(CLK), .RN(RST), .Q(\mem[13][4] ) );
  DFFRX1M \mem_reg[13][1]  ( .D(n303), .CK(CLK), .RN(RST), .Q(\mem[13][1] ) );
  DFFRX1M \mem_reg[13][0]  ( .D(n302), .CK(CLK), .RN(RST), .Q(\mem[13][0] ) );
  DFFRX1M \mem_reg[3][7]  ( .D(n389), .CK(CLK), .RN(RST), .Q(REG3[7]) );
  DFFRX1M \mem_reg[3][6]  ( .D(n388), .CK(CLK), .RN(RST), .Q(REG3[6]) );
  DFFRX1M \mem_reg[3][5]  ( .D(n387), .CK(CLK), .RN(RST), .Q(REG3[5]) );
  DFFRX1M \mem_reg[3][4]  ( .D(n386), .CK(CLK), .RN(RST), .Q(REG3[4]) );
  DFFRX1M \mem_reg[3][3]  ( .D(n385), .CK(CLK), .RN(RST), .Q(REG3[3]) );
  DFFRX1M \mem_reg[3][2]  ( .D(n384), .CK(CLK), .RN(RST), .Q(REG3[2]) );
  DFFRX1M \mem_reg[3][1]  ( .D(n383), .CK(CLK), .RN(RST), .Q(REG3[1]) );
  DFFRX1M \mem_reg[3][0]  ( .D(n382), .CK(CLK), .RN(RST), .Q(REG3[0]) );
  DFFRX1M \mem_reg[5][7]  ( .D(n373), .CK(CLK), .RN(RST), .Q(\mem[5][7] ) );
  DFFRX1M \mem_reg[5][6]  ( .D(n372), .CK(CLK), .RN(RST), .Q(\mem[5][6] ) );
  DFFRX1M \mem_reg[5][5]  ( .D(n371), .CK(CLK), .RN(RST), .Q(\mem[5][5] ) );
  DFFRX1M \mem_reg[5][4]  ( .D(n370), .CK(CLK), .RN(RST), .Q(\mem[5][4] ) );
  DFFRX1M \mem_reg[5][3]  ( .D(n369), .CK(CLK), .RN(RST), .Q(\mem[5][3] ) );
  DFFRX1M \mem_reg[5][2]  ( .D(n368), .CK(CLK), .RN(RST), .Q(\mem[5][2] ) );
  DFFRX1M \mem_reg[5][1]  ( .D(n367), .CK(CLK), .RN(RST), .Q(\mem[5][1] ) );
  DFFRX1M \mem_reg[5][0]  ( .D(n366), .CK(CLK), .RN(RST), .Q(\mem[5][0] ) );
  DFFRX1M \mem_reg[4][7]  ( .D(n381), .CK(CLK), .RN(RST), .Q(\mem[4][7] ) );
  DFFRX1M \mem_reg[4][6]  ( .D(n380), .CK(CLK), .RN(RST), .Q(\mem[4][6] ) );
  DFFRX1M \mem_reg[4][5]  ( .D(n379), .CK(CLK), .RN(RST), .Q(\mem[4][5] ) );
  DFFRX1M \mem_reg[4][4]  ( .D(n378), .CK(CLK), .RN(RST), .Q(\mem[4][4] ) );
  DFFRX1M \mem_reg[4][3]  ( .D(n377), .CK(CLK), .RN(RST), .Q(\mem[4][3] ) );
  DFFRX1M \mem_reg[4][2]  ( .D(n376), .CK(CLK), .RN(RST), .Q(\mem[4][2] ) );
  DFFRX1M \mem_reg[4][1]  ( .D(n375), .CK(CLK), .RN(RST), .Q(\mem[4][1] ) );
  DFFRX1M \mem_reg[4][0]  ( .D(n374), .CK(CLK), .RN(RST), .Q(\mem[4][0] ) );
  DFFRX1M \mem_reg[2][7]  ( .D(n397), .CK(CLK), .RN(RST), .Q(REG2[7]) );
  DFFRX1M \mem_reg[2][6]  ( .D(n396), .CK(CLK), .RN(RST), .Q(REG2[6]) );
  DFFRX1M \mem_reg[2][5]  ( .D(n395), .CK(CLK), .RN(RST), .Q(REG2[5]) );
  DFFRX1M \mem_reg[2][4]  ( .D(n394), .CK(CLK), .RN(RST), .Q(REG2[4]) );
  DFFRX1M \mem_reg[2][3]  ( .D(n393), .CK(CLK), .RN(RST), .Q(REG2[3]) );
  DFFRX1M \mem_reg[2][2]  ( .D(n392), .CK(CLK), .RN(RST), .Q(REG2[2]) );
  DFFRX1M \mem_reg[2][1]  ( .D(n391), .CK(CLK), .RN(RST), .Q(REG2[1]) );
  DFFRX1M \mem_reg[2][0]  ( .D(n390), .CK(CLK), .RN(RST), .Q(REG2[0]) );
  DFFRX1M \mem_reg[7][7]  ( .D(n357), .CK(CLK), .RN(RST), .Q(\mem[7][7] ) );
  DFFRX1M \mem_reg[7][6]  ( .D(n356), .CK(CLK), .RN(RST), .Q(\mem[7][6] ) );
  DFFRX1M \mem_reg[7][5]  ( .D(n355), .CK(CLK), .RN(RST), .Q(\mem[7][5] ) );
  DFFRX1M \mem_reg[7][4]  ( .D(n354), .CK(CLK), .RN(RST), .Q(\mem[7][4] ) );
  DFFRX1M \mem_reg[7][3]  ( .D(n353), .CK(CLK), .RN(RST), .Q(\mem[7][3] ) );
  DFFRX1M \mem_reg[7][2]  ( .D(n352), .CK(CLK), .RN(RST), .Q(\mem[7][2] ) );
  DFFRX1M \mem_reg[7][1]  ( .D(n351), .CK(CLK), .RN(RST), .Q(\mem[7][1] ) );
  DFFRX1M \mem_reg[7][0]  ( .D(n350), .CK(CLK), .RN(RST), .Q(\mem[7][0] ) );
  DFFRX1M \mem_reg[6][7]  ( .D(n365), .CK(CLK), .RN(RST), .Q(\mem[6][7] ) );
  DFFRX1M \mem_reg[6][6]  ( .D(n364), .CK(CLK), .RN(RST), .Q(\mem[6][6] ) );
  DFFRX1M \mem_reg[6][5]  ( .D(n363), .CK(CLK), .RN(RST), .Q(\mem[6][5] ) );
  DFFRX1M \mem_reg[6][4]  ( .D(n362), .CK(CLK), .RN(RST), .Q(\mem[6][4] ) );
  DFFRX1M \mem_reg[6][3]  ( .D(n361), .CK(CLK), .RN(RST), .Q(\mem[6][3] ) );
  DFFRX1M \mem_reg[6][2]  ( .D(n360), .CK(CLK), .RN(RST), .Q(\mem[6][2] ) );
  DFFRX1M \mem_reg[6][1]  ( .D(n359), .CK(CLK), .RN(RST), .Q(\mem[6][1] ) );
  DFFRX1M \mem_reg[6][0]  ( .D(n358), .CK(CLK), .RN(RST), .Q(\mem[6][0] ) );
  DFFRX1M \RdData_reg[7]  ( .D(n237), .CK(CLK), .RN(RST), .Q(RdData[7]) );
  DFFRX1M \RdData_reg[6]  ( .D(n236), .CK(CLK), .RN(RST), .Q(RdData[6]) );
  DFFRX1M \RdData_reg[5]  ( .D(n235), .CK(CLK), .RN(RST), .Q(RdData[5]) );
  DFFRX1M \RdData_reg[4]  ( .D(n234), .CK(CLK), .RN(RST), .Q(RdData[4]) );
  DFFRX1M \RdData_reg[3]  ( .D(n233), .CK(CLK), .RN(RST), .Q(RdData[3]) );
  DFFRX1M \RdData_reg[2]  ( .D(n232), .CK(CLK), .RN(RST), .Q(RdData[2]) );
  DFFRX1M \RdData_reg[1]  ( .D(n231), .CK(CLK), .RN(RST), .Q(RdData[1]) );
  DFFRX1M \RdData_reg[0]  ( .D(n230), .CK(CLK), .RN(RST), .Q(RdData[0]) );
  DFFRHQX4M \mem_reg[0][7]  ( .D(n413), .CK(CLK), .RN(RST), .Q(REG0[7]) );
  DFFRQX2M \mem_reg[0][6]  ( .D(n412), .CK(CLK), .RN(RST), .Q(REG0[6]) );
  DFFRQX2M \mem_reg[0][5]  ( .D(n411), .CK(CLK), .RN(RST), .Q(REG0[5]) );
  DFFRQX2M \mem_reg[0][4]  ( .D(n410), .CK(CLK), .RN(RST), .Q(REG0[4]) );
  DFFRQX2M \mem_reg[0][3]  ( .D(n409), .CK(CLK), .RN(RST), .Q(REG0[3]) );
  DFFRQX2M \mem_reg[0][2]  ( .D(n408), .CK(CLK), .RN(RST), .Q(REG0[2]) );
  DFFRQX2M \mem_reg[0][1]  ( .D(n407), .CK(CLK), .RN(RST), .Q(REG0[1]) );
  DFFRHQX2M \mem_reg[0][0]  ( .D(n406), .CK(CLK), .RN(RST), .Q(REG0[0]) );
  DFFRHQX1M \mem_reg[1][7]  ( .D(n405), .CK(CLK), .RN(RST), .Q(REG1[7]) );
  DFFRQX2M \mem_reg[1][6]  ( .D(n404), .CK(CLK), .RN(RST), .Q(REG1[6]) );
  DFFRQX2M \mem_reg[1][5]  ( .D(n403), .CK(CLK), .RN(RST), .Q(REG1[5]) );
  DFFRQX2M \mem_reg[1][4]  ( .D(n402), .CK(CLK), .RN(RST), .Q(REG1[4]) );
  DFFRQX2M \mem_reg[1][3]  ( .D(n401), .CK(CLK), .RN(RST), .Q(REG1[3]) );
  DFFRQX2M \mem_reg[1][2]  ( .D(n400), .CK(CLK), .RN(RST), .Q(REG1[2]) );
  DFFRQX2M \mem_reg[1][1]  ( .D(n399), .CK(CLK), .RN(RST), .Q(REG1[1]) );
  DFFRQX2M \mem_reg[1][0]  ( .D(n398), .CK(CLK), .RN(RST), .Q(REG1[0]) );
  NOR3X2M U3 ( .A(n209), .B(n427), .C(n1), .Y(n211) );
  NOR3BX2M U4 ( .AN(n1), .B(Address[3]), .C(n209), .Y(n203) );
  NOR2X2M U5 ( .A(Address[3]), .B(n1), .Y(n220) );
  BUFX2M U6 ( .A(Address[4]), .Y(n1) );
  AOI22XLM U7 ( .A0(REG1[0]), .A1(n120), .B0(REG0[0]), .B1(n121), .Y(n107) );
  AOI22XLM U8 ( .A0(REG1[1]), .A1(n120), .B0(REG0[1]), .B1(n121), .Y(n128) );
  AOI22XLM U9 ( .A0(REG1[2]), .A1(n120), .B0(REG0[2]), .B1(n121), .Y(n138) );
  AOI22XLM U10 ( .A0(REG1[3]), .A1(n120), .B0(REG0[3]), .B1(n121), .Y(n148) );
  AOI22XLM U11 ( .A0(REG1[4]), .A1(n120), .B0(REG0[4]), .B1(n121), .Y(n158) );
  AOI22XLM U12 ( .A0(REG1[5]), .A1(n120), .B0(REG0[5]), .B1(n121), .Y(n168) );
  AOI22XLM U13 ( .A0(REG1[6]), .A1(n120), .B0(REG0[6]), .B1(n121), .Y(n178) );
  AOI22XLM U14 ( .A0(REG1[7]), .A1(n120), .B0(REG0[7]), .B1(n121), .Y(n197) );
  OAI2BB2XLM U15 ( .B0(n419), .B1(n227), .A0N(n227), .A1N(REG1[2]), .Y(n400)
         );
  OAI2BB2XLM U16 ( .B0(n420), .B1(n227), .A0N(n227), .A1N(REG1[3]), .Y(n401)
         );
  OAI2BB2XLM U17 ( .B0(n421), .B1(n227), .A0N(n227), .A1N(REG1[4]), .Y(n402)
         );
  OAI2BB2XLM U18 ( .B0(n422), .B1(n227), .A0N(n227), .A1N(REG1[5]), .Y(n403)
         );
  OAI2BB2XLM U19 ( .B0(n423), .B1(n227), .A0N(n227), .A1N(REG1[6]), .Y(n404)
         );
  OAI2BB2XLM U20 ( .B0(n424), .B1(n227), .A0N(n227), .A1N(REG1[7]), .Y(n405)
         );
  OAI2BB2XLM U21 ( .B0(n417), .B1(n229), .A0N(n229), .A1N(REG0[0]), .Y(n406)
         );
  OAI2BB2XLM U22 ( .B0(n418), .B1(n229), .A0N(n229), .A1N(REG0[1]), .Y(n407)
         );
  OAI2BB2XLM U23 ( .B0(n419), .B1(n229), .A0N(n229), .A1N(REG0[2]), .Y(n408)
         );
  OAI2BB2XLM U24 ( .B0(n420), .B1(n229), .A0N(n229), .A1N(REG0[3]), .Y(n409)
         );
  OAI2BB2XLM U25 ( .B0(n424), .B1(n229), .A0N(n229), .A1N(REG0[7]), .Y(n413)
         );
  NAND2X2M U26 ( .A(n83), .B(n114), .Y(n222) );
  NAND2X2M U27 ( .A(n83), .B(n118), .Y(n223) );
  NAND2X2M U28 ( .A(n83), .B(n119), .Y(n224) );
  NAND2X2M U29 ( .A(n83), .B(n117), .Y(n226) );
  NAND2X2M U30 ( .A(n83), .B(n120), .Y(n227) );
  NAND2X2M U31 ( .A(n83), .B(n121), .Y(n229) );
  INVX2M U32 ( .A(n70), .Y(n84) );
  INVX2M U33 ( .A(n80), .Y(n416) );
  INVX2M U34 ( .A(n79), .Y(n415) );
  INVX2M U35 ( .A(n78), .Y(n414) );
  INVX2M U36 ( .A(n77), .Y(n88) );
  INVX2M U37 ( .A(n76), .Y(n87) );
  INVX2M U38 ( .A(n75), .Y(n86) );
  INVX2M U39 ( .A(n71), .Y(n85) );
  NOR2BX2M U40 ( .AN(n228), .B(n425), .Y(n188) );
  NAND3X2M U41 ( .A(n220), .B(n193), .C(n83), .Y(n219) );
  NAND3X2M U42 ( .A(n220), .B(n192), .C(n83), .Y(n221) );
  NOR2BX2M U43 ( .AN(n225), .B(n425), .Y(n195) );
  NOR2BX2M U44 ( .AN(n189), .B(n426), .Y(n193) );
  NOR2BX2M U45 ( .AN(n190), .B(n426), .Y(n192) );
  NOR2BX2M U46 ( .AN(n194), .B(n427), .Y(n104) );
  NOR2BX2M U47 ( .AN(n187), .B(n427), .Y(n111) );
  NOR2BX2M U48 ( .AN(n192), .B(n427), .Y(n106) );
  NOR2BX2M U49 ( .AN(n188), .B(n427), .Y(n113) );
  NOR2BX2M U50 ( .AN(n193), .B(n427), .Y(n105) );
  NOR2BX2M U51 ( .AN(n201), .B(n427), .Y(n112) );
  INVX2M U52 ( .A(n209), .Y(n83) );
  BUFX2M U53 ( .A(n214), .Y(n71) );
  NAND2X2M U54 ( .A(n211), .B(n196), .Y(n214) );
  BUFX2M U55 ( .A(n215), .Y(n70) );
  NAND2X2M U56 ( .A(n211), .B(n195), .Y(n215) );
  AND2X2M U57 ( .A(n220), .B(n201), .Y(n117) );
  AND2X2M U58 ( .A(n220), .B(n194), .Y(n114) );
  AND2X2M U59 ( .A(n220), .B(n187), .Y(n121) );
  AND2X2M U60 ( .A(n220), .B(n188), .Y(n120) );
  AND2X2M U61 ( .A(n220), .B(n195), .Y(n119) );
  AND2X2M U62 ( .A(n220), .B(n196), .Y(n118) );
  BUFX2M U63 ( .A(n218), .Y(n3) );
  NAND2X2M U64 ( .A(n211), .B(n187), .Y(n218) );
  BUFX2M U65 ( .A(n216), .Y(n69) );
  NAND2X2M U66 ( .A(n211), .B(n201), .Y(n216) );
  BUFX2M U67 ( .A(n213), .Y(n72) );
  NAND2X2M U68 ( .A(n211), .B(n194), .Y(n213) );
  BUFX2M U69 ( .A(n210), .Y(n74) );
  NAND2X2M U70 ( .A(n211), .B(n193), .Y(n210) );
  BUFX2M U71 ( .A(n212), .Y(n73) );
  NAND2X2M U72 ( .A(n211), .B(n192), .Y(n212) );
  BUFX2M U73 ( .A(n217), .Y(n68) );
  NAND2X2M U74 ( .A(n211), .B(n188), .Y(n217) );
  BUFX2M U75 ( .A(n202), .Y(n80) );
  NAND2X2M U76 ( .A(n203), .B(n194), .Y(n202) );
  BUFX2M U77 ( .A(n204), .Y(n79) );
  NAND2X2M U78 ( .A(n203), .B(n196), .Y(n204) );
  BUFX2M U79 ( .A(n205), .Y(n78) );
  NAND2X2M U80 ( .A(n203), .B(n195), .Y(n205) );
  BUFX2M U81 ( .A(n206), .Y(n77) );
  NAND2X2M U82 ( .A(n203), .B(n201), .Y(n206) );
  BUFX2M U83 ( .A(n207), .Y(n76) );
  NAND2XLM U84 ( .A(n203), .B(n188), .Y(n207) );
  BUFX2M U85 ( .A(n208), .Y(n75) );
  NAND2XLM U86 ( .A(n203), .B(n187), .Y(n208) );
  INVX2M U87 ( .A(n2), .Y(n82) );
  NOR2BX2M U88 ( .AN(n228), .B(Address[0]), .Y(n187) );
  INVX2M U89 ( .A(Address[0]), .Y(n425) );
  NAND3X2M U90 ( .A(n1), .B(Address[0]), .C(Address[1]), .Y(n100) );
  INVX2M U91 ( .A(Address[3]), .Y(n427) );
  NOR2BX2M U92 ( .AN(n190), .B(Address[1]), .Y(n196) );
  NOR2BX2M U93 ( .AN(n225), .B(Address[0]), .Y(n201) );
  NAND3BX2M U94 ( .AN(RdEn), .B(N84), .C(WrEn), .Y(n209) );
  NOR2BX2M U95 ( .AN(n189), .B(Address[1]), .Y(n194) );
  NOR2BX2M U96 ( .AN(Address[2]), .B(Address[0]), .Y(n190) );
  NOR2BX2M U97 ( .AN(n192), .B(Address[3]), .Y(n116) );
  NOR2BX2M U98 ( .AN(n193), .B(Address[3]), .Y(n115) );
  NAND2X2M U99 ( .A(n196), .B(Address[3]), .Y(n101) );
  NAND2X2M U100 ( .A(n195), .B(Address[3]), .Y(n102) );
  NOR2BX2M U101 ( .AN(Address[2]), .B(n425), .Y(n189) );
  NAND3X2M U102 ( .A(n1), .B(n425), .C(Address[1]), .Y(n96) );
  INVX2M U103 ( .A(Address[1]), .Y(n426) );
  NAND2X2M U104 ( .A(n187), .B(n1), .Y(n97) );
  NAND2X2M U105 ( .A(n188), .B(n1), .Y(n95) );
  NAND2X2M U106 ( .A(n190), .B(n1), .Y(n98) );
  NOR2X2M U107 ( .A(Address[1]), .B(Address[2]), .Y(n228) );
  NAND2X2M U108 ( .A(n1), .B(n189), .Y(n99) );
  NOR2X2M U109 ( .A(n426), .B(Address[2]), .Y(n225) );
  BUFX2M U110 ( .A(n90), .Y(n2) );
  NAND3BX2M U111 ( .AN(WrEn), .B(N84), .C(RdEn), .Y(n90) );
  INVX2M U112 ( .A(WrData[0]), .Y(n417) );
  INVX2M U113 ( .A(WrData[1]), .Y(n418) );
  INVX2M U114 ( .A(WrData[2]), .Y(n419) );
  INVX2M U115 ( .A(WrData[3]), .Y(n420) );
  INVX2M U116 ( .A(WrData[4]), .Y(n421) );
  INVX2M U117 ( .A(WrData[5]), .Y(n422) );
  INVX2M U118 ( .A(WrData[6]), .Y(n423) );
  INVX2M U119 ( .A(WrData[7]), .Y(n424) );
  AOI222X1M U120 ( .A0(REG2[0]), .A1(n117), .B0(\mem[4][0] ), .B1(n118), .C0(
        REG3[0]), .C1(n119), .Y(n108) );
  AOI222X1M U121 ( .A0(REG2[1]), .A1(n117), .B0(\mem[4][1] ), .B1(n118), .C0(
        REG3[1]), .C1(n119), .Y(n129) );
  AOI222X1M U122 ( .A0(REG2[2]), .A1(n117), .B0(\mem[4][2] ), .B1(n118), .C0(
        REG3[2]), .C1(n119), .Y(n139) );
  AOI222X1M U123 ( .A0(REG2[3]), .A1(n117), .B0(\mem[4][3] ), .B1(n118), .C0(
        REG3[3]), .C1(n119), .Y(n149) );
  AOI222X1M U124 ( .A0(REG2[4]), .A1(n117), .B0(\mem[4][4] ), .B1(n118), .C0(
        REG3[4]), .C1(n119), .Y(n159) );
  AOI222X1M U125 ( .A0(REG2[5]), .A1(n117), .B0(\mem[4][5] ), .B1(n118), .C0(
        REG3[5]), .C1(n119), .Y(n169) );
  AOI222X1M U126 ( .A0(REG2[6]), .A1(n117), .B0(\mem[4][6] ), .B1(n118), .C0(
        REG3[6]), .C1(n119), .Y(n179) );
  AOI222X1M U127 ( .A0(REG2[7]), .A1(n117), .B0(\mem[4][7] ), .B1(n118), .C0(
        REG3[7]), .C1(n119), .Y(n198) );
  OAI221X1M U128 ( .A0(n101), .A1(n19), .B0(n102), .B1(n11), .C0(n103), .Y(n92) );
  AOI222X1M U129 ( .A0(\mem[13][0] ), .A1(n104), .B0(\mem[15][0] ), .B1(n105), 
        .C0(\mem[14][0] ), .C1(n106), .Y(n103) );
  OAI221X1M U130 ( .A0(n101), .A1(n18), .B0(n102), .B1(n10), .C0(n127), .Y(
        n124) );
  AOI222X1M U131 ( .A0(\mem[13][1] ), .A1(n104), .B0(\mem[15][1] ), .B1(n105), 
        .C0(\mem[14][1] ), .C1(n106), .Y(n127) );
  OAI221X1M U132 ( .A0(n101), .A1(n17), .B0(n102), .B1(n9), .C0(n137), .Y(n134) );
  AOI222X1M U133 ( .A0(\mem[13][2] ), .A1(n104), .B0(\mem[15][2] ), .B1(n105), 
        .C0(\mem[14][2] ), .C1(n106), .Y(n137) );
  OAI221X1M U134 ( .A0(n101), .A1(n16), .B0(n102), .B1(n8), .C0(n147), .Y(n144) );
  AOI222X1M U135 ( .A0(\mem[13][3] ), .A1(n104), .B0(\mem[15][3] ), .B1(n105), 
        .C0(\mem[14][3] ), .C1(n106), .Y(n147) );
  OAI221X1M U136 ( .A0(n101), .A1(n15), .B0(n102), .B1(n7), .C0(n157), .Y(n154) );
  AOI222X1M U137 ( .A0(\mem[13][4] ), .A1(n104), .B0(\mem[15][4] ), .B1(n105), 
        .C0(\mem[14][4] ), .C1(n106), .Y(n157) );
  OAI221X1M U138 ( .A0(n101), .A1(n14), .B0(n102), .B1(n6), .C0(n167), .Y(n164) );
  AOI222X1M U139 ( .A0(\mem[13][5] ), .A1(n104), .B0(\mem[15][5] ), .B1(n105), 
        .C0(\mem[14][5] ), .C1(n106), .Y(n167) );
  OAI221X1M U140 ( .A0(n101), .A1(n13), .B0(n102), .B1(n5), .C0(n177), .Y(n174) );
  AOI222X1M U141 ( .A0(\mem[13][6] ), .A1(n104), .B0(\mem[15][6] ), .B1(n105), 
        .C0(\mem[14][6] ), .C1(n106), .Y(n177) );
  OAI221X1M U142 ( .A0(n101), .A1(n12), .B0(n102), .B1(n4), .C0(n191), .Y(n184) );
  AOI222X1M U143 ( .A0(\mem[13][7] ), .A1(n104), .B0(\mem[15][7] ), .B1(n105), 
        .C0(\mem[14][7] ), .C1(n106), .Y(n191) );
  NAND4X2M U144 ( .A(n107), .B(n108), .C(n109), .D(n110), .Y(n91) );
  AOI222X1M U145 ( .A0(\mem[8][0] ), .A1(n111), .B0(\mem[10][0] ), .B1(n112), 
        .C0(\mem[9][0] ), .C1(n113), .Y(n110) );
  AOI222X1M U146 ( .A0(\mem[5][0] ), .A1(n114), .B0(\mem[7][0] ), .B1(n115), 
        .C0(\mem[6][0] ), .C1(n116), .Y(n109) );
  NAND4X2M U147 ( .A(n128), .B(n129), .C(n130), .D(n131), .Y(n123) );
  AOI222X1M U148 ( .A0(\mem[8][1] ), .A1(n111), .B0(\mem[10][1] ), .B1(n112), 
        .C0(\mem[9][1] ), .C1(n113), .Y(n131) );
  AOI222X1M U149 ( .A0(\mem[5][1] ), .A1(n114), .B0(\mem[7][1] ), .B1(n115), 
        .C0(\mem[6][1] ), .C1(n116), .Y(n130) );
  NAND4X2M U150 ( .A(n138), .B(n139), .C(n140), .D(n141), .Y(n133) );
  AOI222X1M U151 ( .A0(\mem[8][2] ), .A1(n111), .B0(\mem[10][2] ), .B1(n112), 
        .C0(\mem[9][2] ), .C1(n113), .Y(n141) );
  AOI222X1M U152 ( .A0(\mem[5][2] ), .A1(n114), .B0(\mem[7][2] ), .B1(n115), 
        .C0(\mem[6][2] ), .C1(n116), .Y(n140) );
  NAND4X2M U153 ( .A(n148), .B(n149), .C(n150), .D(n151), .Y(n143) );
  AOI222X1M U154 ( .A0(\mem[8][3] ), .A1(n111), .B0(\mem[10][3] ), .B1(n112), 
        .C0(\mem[9][3] ), .C1(n113), .Y(n151) );
  AOI222X1M U155 ( .A0(\mem[5][3] ), .A1(n114), .B0(\mem[7][3] ), .B1(n115), 
        .C0(\mem[6][3] ), .C1(n116), .Y(n150) );
  NAND4X2M U156 ( .A(n158), .B(n159), .C(n160), .D(n161), .Y(n153) );
  AOI222X1M U157 ( .A0(\mem[8][4] ), .A1(n111), .B0(\mem[10][4] ), .B1(n112), 
        .C0(\mem[9][4] ), .C1(n113), .Y(n161) );
  AOI222X1M U158 ( .A0(\mem[5][4] ), .A1(n114), .B0(\mem[7][4] ), .B1(n115), 
        .C0(\mem[6][4] ), .C1(n116), .Y(n160) );
  NAND4X2M U159 ( .A(n168), .B(n169), .C(n170), .D(n171), .Y(n163) );
  AOI222X1M U160 ( .A0(\mem[8][5] ), .A1(n111), .B0(\mem[10][5] ), .B1(n112), 
        .C0(\mem[9][5] ), .C1(n113), .Y(n171) );
  AOI222X1M U161 ( .A0(\mem[5][5] ), .A1(n114), .B0(\mem[7][5] ), .B1(n115), 
        .C0(\mem[6][5] ), .C1(n116), .Y(n170) );
  NAND4X2M U162 ( .A(n178), .B(n179), .C(n180), .D(n181), .Y(n173) );
  AOI222X1M U163 ( .A0(\mem[8][6] ), .A1(n111), .B0(\mem[10][6] ), .B1(n112), 
        .C0(\mem[9][6] ), .C1(n113), .Y(n181) );
  AOI222X1M U164 ( .A0(\mem[5][6] ), .A1(n114), .B0(\mem[7][6] ), .B1(n115), 
        .C0(\mem[6][6] ), .C1(n116), .Y(n180) );
  NAND4X2M U165 ( .A(n197), .B(n198), .C(n199), .D(n200), .Y(n183) );
  AOI222X1M U166 ( .A0(\mem[8][7] ), .A1(n111), .B0(\mem[10][7] ), .B1(n112), 
        .C0(\mem[9][7] ), .C1(n113), .Y(n200) );
  AOI222X1M U167 ( .A0(\mem[5][7] ), .A1(n114), .B0(\mem[7][7] ), .B1(n115), 
        .C0(\mem[6][7] ), .C1(n116), .Y(n199) );
  OAI22X1M U168 ( .A0(n80), .A1(n417), .B0(n416), .B1(n67), .Y(n238) );
  OAI22X1M U169 ( .A0(n80), .A1(n418), .B0(n416), .B1(n66), .Y(n239) );
  OAI22X1M U170 ( .A0(n80), .A1(n419), .B0(n416), .B1(n65), .Y(n240) );
  OAI22X1M U171 ( .A0(n80), .A1(n420), .B0(n416), .B1(n64), .Y(n241) );
  OAI22X1M U172 ( .A0(n80), .A1(n421), .B0(n416), .B1(n63), .Y(n242) );
  OAI22X1M U173 ( .A0(n80), .A1(n422), .B0(n416), .B1(n62), .Y(n243) );
  OAI22X1M U174 ( .A0(n80), .A1(n423), .B0(n416), .B1(n61), .Y(n244) );
  OAI22X1M U175 ( .A0(n80), .A1(n424), .B0(n416), .B1(n60), .Y(n245) );
  OAI22X1M U176 ( .A0(n417), .A1(n79), .B0(n415), .B1(n59), .Y(n246) );
  OAI22X1M U177 ( .A0(n418), .A1(n79), .B0(n415), .B1(n58), .Y(n247) );
  OAI22X1M U178 ( .A0(n419), .A1(n79), .B0(n415), .B1(n57), .Y(n248) );
  OAI22X1M U179 ( .A0(n420), .A1(n79), .B0(n415), .B1(n56), .Y(n249) );
  OAI22X1M U180 ( .A0(n421), .A1(n79), .B0(n415), .B1(n55), .Y(n250) );
  OAI22X1M U181 ( .A0(n422), .A1(n79), .B0(n415), .B1(n54), .Y(n251) );
  OAI22X1M U182 ( .A0(n423), .A1(n79), .B0(n415), .B1(n53), .Y(n252) );
  OAI22X1M U183 ( .A0(n424), .A1(n79), .B0(n415), .B1(n52), .Y(n253) );
  OAI22X1M U184 ( .A0(n417), .A1(n78), .B0(n414), .B1(n51), .Y(n254) );
  OAI22X1M U185 ( .A0(n418), .A1(n78), .B0(n414), .B1(n50), .Y(n255) );
  OAI22X1M U186 ( .A0(n419), .A1(n78), .B0(n414), .B1(n49), .Y(n256) );
  OAI22X1M U187 ( .A0(n420), .A1(n78), .B0(n414), .B1(n48), .Y(n257) );
  OAI22X1M U188 ( .A0(n421), .A1(n78), .B0(n414), .B1(n47), .Y(n258) );
  OAI22X1M U189 ( .A0(n422), .A1(n78), .B0(n414), .B1(n46), .Y(n259) );
  OAI22X1M U190 ( .A0(n423), .A1(n78), .B0(n414), .B1(n45), .Y(n260) );
  OAI22X1M U191 ( .A0(n424), .A1(n78), .B0(n414), .B1(n44), .Y(n261) );
  OAI22X1M U192 ( .A0(n417), .A1(n77), .B0(n88), .B1(n43), .Y(n262) );
  OAI22X1M U193 ( .A0(n418), .A1(n77), .B0(n88), .B1(n42), .Y(n263) );
  OAI22X1M U194 ( .A0(n419), .A1(n77), .B0(n88), .B1(n41), .Y(n264) );
  OAI22X1M U195 ( .A0(n420), .A1(n77), .B0(n88), .B1(n40), .Y(n265) );
  OAI22X1M U196 ( .A0(n421), .A1(n77), .B0(n88), .B1(n39), .Y(n266) );
  OAI22X1M U197 ( .A0(n422), .A1(n77), .B0(n88), .B1(n38), .Y(n267) );
  OAI22X1M U198 ( .A0(n423), .A1(n77), .B0(n88), .B1(n37), .Y(n268) );
  OAI22X1M U199 ( .A0(n424), .A1(n77), .B0(n88), .B1(n36), .Y(n269) );
  OAI22X1M U200 ( .A0(n417), .A1(n76), .B0(n87), .B1(n35), .Y(n270) );
  OAI22X1M U201 ( .A0(n418), .A1(n76), .B0(n87), .B1(n34), .Y(n271) );
  OAI22X1M U202 ( .A0(n419), .A1(n76), .B0(n87), .B1(n33), .Y(n272) );
  OAI22X1M U203 ( .A0(n420), .A1(n76), .B0(n87), .B1(n32), .Y(n273) );
  OAI22X1M U204 ( .A0(n421), .A1(n76), .B0(n87), .B1(n31), .Y(n274) );
  OAI22X1M U205 ( .A0(n422), .A1(n76), .B0(n87), .B1(n30), .Y(n275) );
  OAI22X1M U206 ( .A0(n423), .A1(n76), .B0(n87), .B1(n29), .Y(n276) );
  OAI22X1M U207 ( .A0(n424), .A1(n76), .B0(n87), .B1(n28), .Y(n277) );
  OAI22X1M U208 ( .A0(n417), .A1(n75), .B0(n86), .B1(n27), .Y(n278) );
  OAI22X1M U209 ( .A0(n418), .A1(n75), .B0(n86), .B1(n26), .Y(n279) );
  OAI22X1M U210 ( .A0(n419), .A1(n75), .B0(n86), .B1(n25), .Y(n280) );
  OAI22X1M U211 ( .A0(n420), .A1(n75), .B0(n86), .B1(n24), .Y(n281) );
  OAI22X1M U212 ( .A0(n421), .A1(n75), .B0(n86), .B1(n23), .Y(n282) );
  OAI22X1M U213 ( .A0(n422), .A1(n75), .B0(n86), .B1(n22), .Y(n283) );
  OAI22X1M U214 ( .A0(n423), .A1(n75), .B0(n86), .B1(n21), .Y(n284) );
  OAI22X1M U215 ( .A0(n424), .A1(n75), .B0(n86), .B1(n20), .Y(n285) );
  OAI22X1M U216 ( .A0(n417), .A1(n71), .B0(n85), .B1(n19), .Y(n310) );
  OAI22X1M U217 ( .A0(n418), .A1(n71), .B0(n85), .B1(n18), .Y(n311) );
  OAI22X1M U218 ( .A0(n419), .A1(n71), .B0(n85), .B1(n17), .Y(n312) );
  OAI22X1M U219 ( .A0(n420), .A1(n71), .B0(n85), .B1(n16), .Y(n313) );
  OAI22X1M U220 ( .A0(n421), .A1(n71), .B0(n85), .B1(n15), .Y(n314) );
  OAI22X1M U221 ( .A0(n422), .A1(n71), .B0(n85), .B1(n14), .Y(n315) );
  OAI22X1M U222 ( .A0(n423), .A1(n71), .B0(n85), .B1(n13), .Y(n316) );
  OAI22X1M U223 ( .A0(n424), .A1(n71), .B0(n85), .B1(n12), .Y(n317) );
  OAI22X1M U224 ( .A0(n417), .A1(n70), .B0(n84), .B1(n11), .Y(n318) );
  OAI22X1M U225 ( .A0(n418), .A1(n70), .B0(n84), .B1(n10), .Y(n319) );
  OAI22X1M U226 ( .A0(n419), .A1(n70), .B0(n84), .B1(n9), .Y(n320) );
  OAI22X1M U227 ( .A0(n420), .A1(n70), .B0(n84), .B1(n8), .Y(n321) );
  OAI22X1M U228 ( .A0(n421), .A1(n70), .B0(n84), .B1(n7), .Y(n322) );
  OAI22X1M U229 ( .A0(n422), .A1(n70), .B0(n84), .B1(n6), .Y(n323) );
  OAI22X1M U230 ( .A0(n423), .A1(n70), .B0(n84), .B1(n5), .Y(n324) );
  OAI22X1M U231 ( .A0(n424), .A1(n70), .B0(n84), .B1(n4), .Y(n325) );
  OAI2BB2X1M U232 ( .B0(n417), .B1(n219), .A0N(n219), .A1N(\mem[7][0] ), .Y(
        n350) );
  OAI2BB2X1M U233 ( .B0(n418), .B1(n219), .A0N(n219), .A1N(\mem[7][1] ), .Y(
        n351) );
  OAI2BB2X1M U234 ( .B0(n419), .B1(n219), .A0N(n219), .A1N(\mem[7][2] ), .Y(
        n352) );
  OAI2BB2X1M U235 ( .B0(n420), .B1(n219), .A0N(n219), .A1N(\mem[7][3] ), .Y(
        n353) );
  OAI2BB2X1M U236 ( .B0(n421), .B1(n219), .A0N(n219), .A1N(\mem[7][4] ), .Y(
        n354) );
  OAI2BB2X1M U237 ( .B0(n422), .B1(n219), .A0N(n219), .A1N(\mem[7][5] ), .Y(
        n355) );
  OAI2BB2X1M U238 ( .B0(n423), .B1(n219), .A0N(n219), .A1N(\mem[7][6] ), .Y(
        n356) );
  OAI2BB2X1M U239 ( .B0(n424), .B1(n219), .A0N(n219), .A1N(\mem[7][7] ), .Y(
        n357) );
  OAI2BB2X1M U240 ( .B0(n417), .B1(n221), .A0N(n221), .A1N(\mem[6][0] ), .Y(
        n358) );
  OAI2BB2X1M U241 ( .B0(n418), .B1(n221), .A0N(n221), .A1N(\mem[6][1] ), .Y(
        n359) );
  OAI2BB2X1M U242 ( .B0(n419), .B1(n221), .A0N(n221), .A1N(\mem[6][2] ), .Y(
        n360) );
  OAI2BB2X1M U243 ( .B0(n420), .B1(n221), .A0N(n221), .A1N(\mem[6][3] ), .Y(
        n361) );
  OAI2BB2X1M U244 ( .B0(n421), .B1(n221), .A0N(n221), .A1N(\mem[6][4] ), .Y(
        n362) );
  OAI2BB2X1M U245 ( .B0(n422), .B1(n221), .A0N(n221), .A1N(\mem[6][5] ), .Y(
        n363) );
  OAI2BB2X1M U246 ( .B0(n423), .B1(n221), .A0N(n221), .A1N(\mem[6][6] ), .Y(
        n364) );
  OAI2BB2X1M U247 ( .B0(n424), .B1(n221), .A0N(n221), .A1N(\mem[6][7] ), .Y(
        n365) );
  OAI2BB2X1M U248 ( .B0(n417), .B1(n222), .A0N(n222), .A1N(\mem[5][0] ), .Y(
        n366) );
  OAI2BB2X1M U249 ( .B0(n418), .B1(n222), .A0N(n222), .A1N(\mem[5][1] ), .Y(
        n367) );
  OAI2BB2X1M U250 ( .B0(n419), .B1(n222), .A0N(n222), .A1N(\mem[5][2] ), .Y(
        n368) );
  OAI2BB2X1M U251 ( .B0(n420), .B1(n222), .A0N(n222), .A1N(\mem[5][3] ), .Y(
        n369) );
  OAI2BB2X1M U252 ( .B0(n421), .B1(n222), .A0N(n222), .A1N(\mem[5][4] ), .Y(
        n370) );
  OAI2BB2X1M U253 ( .B0(n422), .B1(n222), .A0N(n222), .A1N(\mem[5][5] ), .Y(
        n371) );
  OAI2BB2X1M U254 ( .B0(n423), .B1(n222), .A0N(n222), .A1N(\mem[5][6] ), .Y(
        n372) );
  OAI2BB2X1M U255 ( .B0(n424), .B1(n222), .A0N(n222), .A1N(\mem[5][7] ), .Y(
        n373) );
  OAI2BB2X1M U256 ( .B0(n417), .B1(n223), .A0N(n223), .A1N(\mem[4][0] ), .Y(
        n374) );
  OAI2BB2X1M U257 ( .B0(n418), .B1(n223), .A0N(n223), .A1N(\mem[4][1] ), .Y(
        n375) );
  OAI2BB2X1M U258 ( .B0(n419), .B1(n223), .A0N(n223), .A1N(\mem[4][2] ), .Y(
        n376) );
  OAI2BB2X1M U259 ( .B0(n420), .B1(n223), .A0N(n223), .A1N(\mem[4][3] ), .Y(
        n377) );
  OAI2BB2X1M U260 ( .B0(n421), .B1(n223), .A0N(n223), .A1N(\mem[4][4] ), .Y(
        n378) );
  OAI2BB2X1M U261 ( .B0(n422), .B1(n223), .A0N(n223), .A1N(\mem[4][5] ), .Y(
        n379) );
  OAI2BB2X1M U262 ( .B0(n423), .B1(n223), .A0N(n223), .A1N(\mem[4][6] ), .Y(
        n380) );
  OAI2BB2X1M U263 ( .B0(n424), .B1(n223), .A0N(n223), .A1N(\mem[4][7] ), .Y(
        n381) );
  OAI2BB2X1M U264 ( .B0(n417), .B1(n224), .A0N(n224), .A1N(REG3[0]), .Y(n382)
         );
  OAI2BB2X1M U265 ( .B0(n418), .B1(n224), .A0N(n224), .A1N(REG3[1]), .Y(n383)
         );
  OAI2BB2X1M U266 ( .B0(n419), .B1(n224), .A0N(n224), .A1N(REG3[2]), .Y(n384)
         );
  OAI2BB2X1M U267 ( .B0(n420), .B1(n224), .A0N(n224), .A1N(REG3[3]), .Y(n385)
         );
  OAI2BB2X1M U268 ( .B0(n421), .B1(n224), .A0N(n224), .A1N(REG3[4]), .Y(n386)
         );
  OAI2BB2X1M U269 ( .B0(n422), .B1(n224), .A0N(n224), .A1N(REG3[5]), .Y(n387)
         );
  OAI2BB2X1M U270 ( .B0(n423), .B1(n224), .A0N(n224), .A1N(REG3[6]), .Y(n388)
         );
  OAI2BB2X1M U271 ( .B0(n424), .B1(n224), .A0N(n224), .A1N(REG3[7]), .Y(n389)
         );
  OAI2BB2X1M U272 ( .B0(n417), .B1(n226), .A0N(n226), .A1N(REG2[0]), .Y(n390)
         );
  OAI2BB2X1M U273 ( .B0(n418), .B1(n226), .A0N(n226), .A1N(REG2[1]), .Y(n391)
         );
  OAI2BB2X1M U274 ( .B0(n419), .B1(n226), .A0N(n226), .A1N(REG2[2]), .Y(n392)
         );
  OAI2BB2X1M U275 ( .B0(n420), .B1(n226), .A0N(n226), .A1N(REG2[3]), .Y(n393)
         );
  OAI2BB2X1M U276 ( .B0(n421), .B1(n226), .A0N(n226), .A1N(REG2[4]), .Y(n394)
         );
  OAI2BB2X1M U277 ( .B0(n422), .B1(n226), .A0N(n226), .A1N(REG2[5]), .Y(n395)
         );
  OAI2BB2X1M U278 ( .B0(n423), .B1(n226), .A0N(n226), .A1N(REG2[6]), .Y(n396)
         );
  OAI2BB2X1M U279 ( .B0(n424), .B1(n226), .A0N(n226), .A1N(REG2[7]), .Y(n397)
         );
  OAI2BB2X1M U280 ( .B0(n417), .B1(n227), .A0N(n227), .A1N(REG1[0]), .Y(n398)
         );
  OAI2BB2X1M U281 ( .B0(n418), .B1(n227), .A0N(n227), .A1N(REG1[1]), .Y(n399)
         );
  OAI2BB2X1M U282 ( .B0(n421), .B1(n229), .A0N(n229), .A1N(REG0[4]), .Y(n410)
         );
  OAI2BB2X1M U283 ( .B0(n422), .B1(n229), .A0N(n229), .A1N(REG0[5]), .Y(n411)
         );
  OAI2BB2X1M U284 ( .B0(n423), .B1(n229), .A0N(n229), .A1N(REG0[6]), .Y(n412)
         );
  OAI2BB2X1M U285 ( .B0(n417), .B1(n74), .A0N(n74), .A1N(\mem[15][0] ), .Y(
        n286) );
  OAI2BB2X1M U286 ( .B0(n418), .B1(n74), .A0N(n74), .A1N(\mem[15][1] ), .Y(
        n287) );
  OAI2BB2X1M U287 ( .B0(n419), .B1(n74), .A0N(n74), .A1N(\mem[15][2] ), .Y(
        n288) );
  OAI2BB2X1M U288 ( .B0(n420), .B1(n74), .A0N(n74), .A1N(\mem[15][3] ), .Y(
        n289) );
  OAI2BB2X1M U289 ( .B0(n421), .B1(n74), .A0N(n74), .A1N(\mem[15][4] ), .Y(
        n290) );
  OAI2BB2X1M U290 ( .B0(n422), .B1(n74), .A0N(n74), .A1N(\mem[15][5] ), .Y(
        n291) );
  OAI2BB2X1M U291 ( .B0(n423), .B1(n74), .A0N(n74), .A1N(\mem[15][6] ), .Y(
        n292) );
  OAI2BB2X1M U292 ( .B0(n424), .B1(n74), .A0N(n74), .A1N(\mem[15][7] ), .Y(
        n293) );
  OAI2BB2X1M U293 ( .B0(n417), .B1(n73), .A0N(n73), .A1N(\mem[14][0] ), .Y(
        n294) );
  OAI2BB2X1M U294 ( .B0(n418), .B1(n73), .A0N(n73), .A1N(\mem[14][1] ), .Y(
        n295) );
  OAI2BB2X1M U295 ( .B0(n419), .B1(n73), .A0N(n73), .A1N(\mem[14][2] ), .Y(
        n296) );
  OAI2BB2X1M U296 ( .B0(n420), .B1(n73), .A0N(n73), .A1N(\mem[14][3] ), .Y(
        n297) );
  OAI2BB2X1M U297 ( .B0(n421), .B1(n73), .A0N(n73), .A1N(\mem[14][4] ), .Y(
        n298) );
  OAI2BB2X1M U298 ( .B0(n422), .B1(n73), .A0N(n73), .A1N(\mem[14][5] ), .Y(
        n299) );
  OAI2BB2X1M U299 ( .B0(n423), .B1(n73), .A0N(n73), .A1N(\mem[14][6] ), .Y(
        n300) );
  OAI2BB2X1M U300 ( .B0(n424), .B1(n73), .A0N(n73), .A1N(\mem[14][7] ), .Y(
        n301) );
  OAI2BB2X1M U301 ( .B0(n417), .B1(n72), .A0N(n72), .A1N(\mem[13][0] ), .Y(
        n302) );
  OAI2BB2X1M U302 ( .B0(n418), .B1(n72), .A0N(n72), .A1N(\mem[13][1] ), .Y(
        n303) );
  OAI2BB2X1M U303 ( .B0(n419), .B1(n72), .A0N(n72), .A1N(\mem[13][2] ), .Y(
        n304) );
  OAI2BB2X1M U304 ( .B0(n420), .B1(n72), .A0N(n72), .A1N(\mem[13][3] ), .Y(
        n305) );
  OAI2BB2X1M U305 ( .B0(n421), .B1(n72), .A0N(n72), .A1N(\mem[13][4] ), .Y(
        n306) );
  OAI2BB2X1M U306 ( .B0(n422), .B1(n72), .A0N(n72), .A1N(\mem[13][5] ), .Y(
        n307) );
  OAI2BB2X1M U307 ( .B0(n423), .B1(n72), .A0N(n72), .A1N(\mem[13][6] ), .Y(
        n308) );
  OAI2BB2X1M U308 ( .B0(n424), .B1(n72), .A0N(n72), .A1N(\mem[13][7] ), .Y(
        n309) );
  OAI2BB2X1M U309 ( .B0(n417), .B1(n69), .A0N(n69), .A1N(\mem[10][0] ), .Y(
        n326) );
  OAI2BB2X1M U310 ( .B0(n418), .B1(n69), .A0N(n69), .A1N(\mem[10][1] ), .Y(
        n327) );
  OAI2BB2X1M U311 ( .B0(n419), .B1(n69), .A0N(n69), .A1N(\mem[10][2] ), .Y(
        n328) );
  OAI2BB2X1M U312 ( .B0(n420), .B1(n69), .A0N(n69), .A1N(\mem[10][3] ), .Y(
        n329) );
  OAI2BB2X1M U313 ( .B0(n421), .B1(n69), .A0N(n69), .A1N(\mem[10][4] ), .Y(
        n330) );
  OAI2BB2X1M U314 ( .B0(n422), .B1(n69), .A0N(n69), .A1N(\mem[10][5] ), .Y(
        n331) );
  OAI2BB2X1M U315 ( .B0(n423), .B1(n69), .A0N(n69), .A1N(\mem[10][6] ), .Y(
        n332) );
  OAI2BB2X1M U316 ( .B0(n424), .B1(n69), .A0N(n69), .A1N(\mem[10][7] ), .Y(
        n333) );
  OAI2BB2X1M U317 ( .B0(n417), .B1(n68), .A0N(n68), .A1N(\mem[9][0] ), .Y(n334) );
  OAI2BB2X1M U318 ( .B0(n418), .B1(n68), .A0N(n68), .A1N(\mem[9][1] ), .Y(n335) );
  OAI2BB2X1M U319 ( .B0(n419), .B1(n68), .A0N(n68), .A1N(\mem[9][2] ), .Y(n336) );
  OAI2BB2X1M U320 ( .B0(n420), .B1(n68), .A0N(n68), .A1N(\mem[9][3] ), .Y(n337) );
  OAI2BB2X1M U321 ( .B0(n421), .B1(n68), .A0N(n68), .A1N(\mem[9][4] ), .Y(n338) );
  OAI2BB2X1M U322 ( .B0(n422), .B1(n68), .A0N(n68), .A1N(\mem[9][5] ), .Y(n339) );
  OAI2BB2X1M U323 ( .B0(n423), .B1(n68), .A0N(n68), .A1N(\mem[9][6] ), .Y(n340) );
  OAI2BB2X1M U324 ( .B0(n424), .B1(n68), .A0N(n68), .A1N(\mem[9][7] ), .Y(n341) );
  OAI2BB2X1M U325 ( .B0(n417), .B1(n3), .A0N(n3), .A1N(\mem[8][0] ), .Y(n342)
         );
  OAI2BB2X1M U326 ( .B0(n418), .B1(n3), .A0N(n3), .A1N(\mem[8][1] ), .Y(n343)
         );
  OAI2BB2X1M U327 ( .B0(n419), .B1(n3), .A0N(n3), .A1N(\mem[8][2] ), .Y(n344)
         );
  OAI2BB2X1M U328 ( .B0(n420), .B1(n3), .A0N(n3), .A1N(\mem[8][3] ), .Y(n345)
         );
  OAI2BB2X1M U329 ( .B0(n421), .B1(n3), .A0N(n3), .A1N(\mem[8][4] ), .Y(n346)
         );
  OAI2BB2X1M U330 ( .B0(n422), .B1(n3), .A0N(n3), .A1N(\mem[8][5] ), .Y(n347)
         );
  OAI2BB2X1M U331 ( .B0(n423), .B1(n3), .A0N(n3), .A1N(\mem[8][6] ), .Y(n348)
         );
  OAI2BB2X1M U332 ( .B0(n424), .B1(n3), .A0N(n3), .A1N(\mem[8][7] ), .Y(n349)
         );
  OAI2BB2X1M U333 ( .B0(n89), .B1(n2), .A0N(RdData[0]), .A1N(n2), .Y(n230) );
  NOR4X1M U334 ( .A(n91), .B(n92), .C(n93), .D(n94), .Y(n89) );
  OAI222X1M U335 ( .A0(n98), .A1(n59), .B0(n99), .B1(n67), .C0(n100), .C1(n51), 
        .Y(n93) );
  OAI222X1M U336 ( .A0(n95), .A1(n35), .B0(n96), .B1(n43), .C0(n97), .C1(n27), 
        .Y(n94) );
  OAI2BB2X1M U337 ( .B0(n122), .B1(n2), .A0N(RdData[1]), .A1N(n2), .Y(n231) );
  NOR4X1M U338 ( .A(n123), .B(n124), .C(n125), .D(n126), .Y(n122) );
  OAI222X1M U339 ( .A0(n98), .A1(n58), .B0(n99), .B1(n66), .C0(n100), .C1(n50), 
        .Y(n125) );
  OAI222X1M U340 ( .A0(n95), .A1(n34), .B0(n96), .B1(n42), .C0(n97), .C1(n26), 
        .Y(n126) );
  OAI2BB2X1M U341 ( .B0(n132), .B1(n2), .A0N(RdData[2]), .A1N(n2), .Y(n232) );
  NOR4X1M U342 ( .A(n133), .B(n134), .C(n135), .D(n136), .Y(n132) );
  OAI222X1M U343 ( .A0(n98), .A1(n57), .B0(n99), .B1(n65), .C0(n100), .C1(n49), 
        .Y(n135) );
  OAI222X1M U344 ( .A0(n95), .A1(n33), .B0(n96), .B1(n41), .C0(n97), .C1(n25), 
        .Y(n136) );
  OAI2BB2X1M U345 ( .B0(n142), .B1(n2), .A0N(RdData[3]), .A1N(n2), .Y(n233) );
  NOR4X1M U346 ( .A(n143), .B(n144), .C(n145), .D(n146), .Y(n142) );
  OAI222X1M U347 ( .A0(n98), .A1(n56), .B0(n99), .B1(n64), .C0(n100), .C1(n48), 
        .Y(n145) );
  OAI222X1M U348 ( .A0(n95), .A1(n32), .B0(n96), .B1(n40), .C0(n97), .C1(n24), 
        .Y(n146) );
  OAI2BB2X1M U349 ( .B0(n152), .B1(n2), .A0N(RdData[4]), .A1N(n2), .Y(n234) );
  NOR4X1M U350 ( .A(n153), .B(n154), .C(n155), .D(n156), .Y(n152) );
  OAI222X1M U351 ( .A0(n98), .A1(n55), .B0(n99), .B1(n63), .C0(n100), .C1(n47), 
        .Y(n155) );
  OAI222X1M U352 ( .A0(n95), .A1(n31), .B0(n96), .B1(n39), .C0(n97), .C1(n23), 
        .Y(n156) );
  OAI2BB2X1M U353 ( .B0(n162), .B1(n2), .A0N(RdData[5]), .A1N(n2), .Y(n235) );
  NOR4X1M U354 ( .A(n163), .B(n164), .C(n165), .D(n166), .Y(n162) );
  OAI222X1M U355 ( .A0(n98), .A1(n54), .B0(n99), .B1(n62), .C0(n100), .C1(n46), 
        .Y(n165) );
  OAI222X1M U356 ( .A0(n95), .A1(n30), .B0(n96), .B1(n38), .C0(n97), .C1(n22), 
        .Y(n166) );
  OAI2BB2X1M U357 ( .B0(n172), .B1(n2), .A0N(RdData[6]), .A1N(n2), .Y(n236) );
  NOR4X1M U358 ( .A(n173), .B(n174), .C(n175), .D(n176), .Y(n172) );
  OAI222X1M U359 ( .A0(n98), .A1(n53), .B0(n99), .B1(n61), .C0(n100), .C1(n45), 
        .Y(n175) );
  OAI222X1M U360 ( .A0(n95), .A1(n29), .B0(n96), .B1(n37), .C0(n97), .C1(n21), 
        .Y(n176) );
  OAI2BB2X1M U361 ( .B0(n182), .B1(n2), .A0N(RdData[7]), .A1N(n2), .Y(n237) );
  NOR4X1M U362 ( .A(n183), .B(n184), .C(n185), .D(n186), .Y(n182) );
  OAI222X1M U363 ( .A0(n98), .A1(n52), .B0(n99), .B1(n60), .C0(n100), .C1(n44), 
        .Y(n185) );
  OAI222X1M U364 ( .A0(n95), .A1(n28), .B0(n96), .B1(n36), .C0(n97), .C1(n20), 
        .Y(n186) );
  AOI21X1M U365 ( .A0(Address[2]), .A1(Address[1]), .B0(Address[3]), .Y(n81)
         );
  NAND2BX1M U366 ( .AN(n81), .B(n1), .Y(N84) );
endmodule


module SYS_CTRL ( CLK, RST, ALU_OUT, OUT_Valid, RdData_Valid, RdData, 
        RX_P_DATA, RX_D_VLD, FIFO_FULL, ALU_FUN, EN, CLK_EN, Address, WrEn, 
        RdEn, WrData, TX_P_DATA, TX_D_VLD, clk_div_en );
  input [15:0] ALU_OUT;
  input [7:0] RdData;
  input [7:0] RX_P_DATA;
  output [3:0] ALU_FUN;
  output [4:0] Address;
  output [7:0] WrData;
  output [7:0] TX_P_DATA;
  input CLK, RST, OUT_Valid, RdData_Valid, RX_D_VLD, FIFO_FULL;
  output EN, CLK_EN, WrEn, RdEn, TX_D_VLD, clk_div_en;
  wire   n1, n2, n3, n4, n5, n11, n22, n23, n26, n27, n28, n30, n31, n33, n34,
         n35, n38, n39, n40, n44, n45, n46, n47, n48, n49, n50, n51, n52, n54,
         n56, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n113, n114, n115, n116, n6, n7, n8, n9, n10, n12, n13, n15, n16, n17,
         n19, n20, n21, n24, n25, n29, n32, n36, n37, n41, n42, n43, n53, n55,
         n57, n58, n111, n112, n117, n118, n119;
  wire   [3:0] current_state;
  wire   [7:0] rd_reg;
  wire   [15:0] alu_res;
  tri   CLK;
  tri   [7:0] RX_P_DATA;
  tri   RX_D_VLD;
  assign clk_div_en = 1'b1;

  DFFRQX1M \alu_fun_reg_reg[3]  ( .D(n105), .CK(CLK), .RN(RST), .Q(ALU_FUN[3])
         );
  DFFRX1M \rd_reg_reg[7]  ( .D(n101), .CK(CLK), .RN(RST), .Q(rd_reg[7]) );
  DFFRX1M \rd_reg_reg[6]  ( .D(n100), .CK(CLK), .RN(RST), .Q(rd_reg[6]) );
  DFFRX1M \rd_reg_reg[5]  ( .D(n99), .CK(CLK), .RN(RST), .Q(rd_reg[5]) );
  DFFRX1M \rd_reg_reg[4]  ( .D(n98), .CK(CLK), .RN(RST), .Q(rd_reg[4]) );
  DFFRX1M \rd_reg_reg[3]  ( .D(n97), .CK(CLK), .RN(RST), .Q(rd_reg[3]) );
  DFFRX1M \rd_reg_reg[2]  ( .D(n96), .CK(CLK), .RN(RST), .Q(rd_reg[2]) );
  DFFRX1M \rd_reg_reg[1]  ( .D(n95), .CK(CLK), .RN(RST), .Q(rd_reg[1]) );
  DFFRX1M \rd_reg_reg[0]  ( .D(n94), .CK(CLK), .RN(RST), .Q(rd_reg[0]) );
  DFFRX1M \alu_res_reg[15]  ( .D(n93), .CK(CLK), .RN(RST), .Q(alu_res[15]) );
  DFFRX1M \alu_res_reg[14]  ( .D(n92), .CK(CLK), .RN(RST), .Q(alu_res[14]) );
  DFFRX1M \alu_res_reg[13]  ( .D(n91), .CK(CLK), .RN(RST), .Q(alu_res[13]) );
  DFFRX1M \alu_res_reg[12]  ( .D(n90), .CK(CLK), .RN(RST), .Q(alu_res[12]) );
  DFFRX1M \alu_res_reg[11]  ( .D(n89), .CK(CLK), .RN(RST), .Q(alu_res[11]) );
  DFFRX1M \alu_res_reg[10]  ( .D(n88), .CK(CLK), .RN(RST), .Q(alu_res[10]) );
  DFFRX1M \alu_res_reg[9]  ( .D(n87), .CK(CLK), .RN(RST), .Q(alu_res[9]) );
  DFFRX1M \alu_res_reg[8]  ( .D(n86), .CK(CLK), .RN(RST), .Q(alu_res[8]) );
  DFFRX1M \alu_res_reg[7]  ( .D(n85), .CK(CLK), .RN(RST), .Q(alu_res[7]) );
  DFFRX1M \alu_res_reg[6]  ( .D(n84), .CK(CLK), .RN(RST), .Q(alu_res[6]) );
  DFFRX1M \alu_res_reg[5]  ( .D(n83), .CK(CLK), .RN(RST), .Q(alu_res[5]) );
  DFFRX1M \alu_res_reg[4]  ( .D(n82), .CK(CLK), .RN(RST), .Q(alu_res[4]) );
  DFFRX1M \alu_res_reg[3]  ( .D(n81), .CK(CLK), .RN(RST), .Q(alu_res[3]) );
  DFFRX1M \alu_res_reg[2]  ( .D(n80), .CK(CLK), .RN(RST), .Q(alu_res[2]) );
  DFFRX1M \alu_res_reg[1]  ( .D(n79), .CK(CLK), .RN(RST), .Q(alu_res[1]) );
  DFFRX1M \alu_res_reg[0]  ( .D(n78), .CK(CLK), .RN(RST), .Q(alu_res[0]) );
  DFFRX1M \addr_reg_reg[4]  ( .D(n110), .CK(CLK), .RN(RST), .QN(n32) );
  DFFRX1M \addr_reg_reg[3]  ( .D(n109), .CK(CLK), .RN(RST), .QN(n36) );
  DFFRX1M \addr_reg_reg[2]  ( .D(n108), .CK(CLK), .RN(RST), .QN(n37) );
  DFFRX1M \addr_reg_reg[1]  ( .D(n107), .CK(CLK), .RN(RST), .QN(n41) );
  DFFRX1M \addr_reg_reg[0]  ( .D(n106), .CK(CLK), .RN(RST), .QN(n42) );
  DFFRX1M \current_state_reg[3]  ( .D(n113), .CK(CLK), .RN(RST), .Q(
        current_state[3]), .QN(n25) );
  DFFRX1M \current_state_reg[2]  ( .D(n115), .CK(CLK), .RN(RST), .Q(
        current_state[2]), .QN(n21) );
  DFFRX1M \current_state_reg[1]  ( .D(n114), .CK(CLK), .RN(RST), .Q(
        current_state[1]), .QN(n29) );
  DFFRQX2M \current_state_reg[0]  ( .D(n116), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  DFFRQX2M \alu_fun_reg_reg[2]  ( .D(n104), .CK(CLK), .RN(RST), .Q(ALU_FUN[2])
         );
  DFFRQX2M \alu_fun_reg_reg[1]  ( .D(n103), .CK(CLK), .RN(RST), .Q(ALU_FUN[1])
         );
  DFFRQX2M \alu_fun_reg_reg[0]  ( .D(n102), .CK(CLK), .RN(RST), .Q(ALU_FUN[0])
         );
  OAI22X1M U3 ( .A0(n58), .A1(n22), .B0(n36), .B1(n77), .Y(Address[3]) );
  OAI222X1M U4 ( .A0(n42), .A1(n77), .B0(n119), .B1(n64), .C0(n53), .C1(n22), 
        .Y(Address[0]) );
  OAI22X1M U5 ( .A0(n57), .A1(n22), .B0(n37), .B1(n77), .Y(Address[2]) );
  OAI22X1M U6 ( .A0(n55), .A1(n22), .B0(n41), .B1(n77), .Y(Address[1]) );
  NAND2X2M U7 ( .A(RX_D_VLD), .B(n61), .Y(n23) );
  INVX2M U8 ( .A(n59), .Y(n15) );
  NOR3X2M U9 ( .A(n6), .B(n68), .C(n16), .Y(n59) );
  INVX2M U10 ( .A(n11), .Y(n12) );
  INVX2M U11 ( .A(n62), .Y(n17) );
  NOR2BX2M U12 ( .AN(n60), .B(n19), .Y(n68) );
  NOR2X2M U13 ( .A(n63), .B(n19), .Y(n44) );
  NAND2X2M U14 ( .A(n65), .B(n19), .Y(n45) );
  OAI22X1M U15 ( .A0(n111), .A1(n22), .B0(n32), .B1(n77), .Y(Address[4]) );
  NOR2X2M U16 ( .A(n8), .B(n59), .Y(TX_D_VLD) );
  INVX2M U17 ( .A(n50), .Y(n16) );
  BUFX2M U18 ( .A(n67), .Y(n6) );
  NOR3BX2M U19 ( .AN(n76), .B(n19), .C(n29), .Y(n67) );
  INVX2M U20 ( .A(n23), .Y(WrEn) );
  INVX2M U21 ( .A(n22), .Y(RdEn) );
  NOR3X2M U22 ( .A(n119), .B(n19), .C(n24), .Y(n11) );
  NOR2X2M U23 ( .A(n2), .B(OUT_Valid), .Y(EN) );
  OAI22X1M U24 ( .A0(n11), .A1(n32), .B0(n12), .B1(n111), .Y(n110) );
  OAI22X1M U25 ( .A0(n11), .A1(n42), .B0(n53), .B1(n12), .Y(n106) );
  OAI22X1M U26 ( .A0(n11), .A1(n37), .B0(n57), .B1(n12), .Y(n108) );
  OAI22X1M U27 ( .A0(n11), .A1(n36), .B0(n58), .B1(n12), .Y(n109) );
  OAI22X1M U28 ( .A0(n11), .A1(n41), .B0(n55), .B1(n12), .Y(n107) );
  NOR2X2M U29 ( .A(n53), .B(n23), .Y(WrData[0]) );
  NOR2X2M U30 ( .A(n55), .B(n23), .Y(WrData[1]) );
  NOR2X2M U31 ( .A(n57), .B(n23), .Y(WrData[2]) );
  NOR2X2M U32 ( .A(n58), .B(n23), .Y(WrData[3]) );
  NOR2X2M U33 ( .A(n111), .B(n23), .Y(WrData[4]) );
  NOR2X2M U34 ( .A(n112), .B(n23), .Y(WrData[5]) );
  NOR2X2M U35 ( .A(n117), .B(n23), .Y(WrData[6]) );
  NOR2X2M U36 ( .A(n118), .B(n23), .Y(WrData[7]) );
  OAI211X2M U37 ( .A0(n9), .A1(n21), .B0(n38), .C0(n33), .Y(n115) );
  OAI31X1M U38 ( .A0(n13), .A1(n44), .A2(n4), .B0(n9), .Y(n38) );
  INVX2M U39 ( .A(n45), .Y(n13) );
  INVX2M U40 ( .A(n34), .Y(n24) );
  INVX2M U41 ( .A(n30), .Y(n9) );
  NAND3X2M U42 ( .A(n19), .B(n29), .C(n76), .Y(n62) );
  NAND3X2M U43 ( .A(n53), .B(n111), .C(n27), .Y(n33) );
  AND2X2M U44 ( .A(n60), .B(n19), .Y(n4) );
  NOR2BX2M U45 ( .AN(OUT_Valid), .B(n2), .Y(n7) );
  NOR2BX2M U46 ( .AN(OUT_Valid), .B(n2), .Y(n1) );
  NAND3X2M U47 ( .A(n2), .B(n62), .C(n64), .Y(CLK_EN) );
  OAI211X2M U48 ( .A0(current_state[0]), .A1(n63), .B0(n45), .C0(n64), .Y(n61)
         );
  NOR3X2M U49 ( .A(n21), .B(current_state[3]), .C(n29), .Y(n65) );
  NOR2X2M U50 ( .A(n25), .B(current_state[2]), .Y(n76) );
  NOR3X2M U51 ( .A(current_state[1]), .B(current_state[3]), .C(n21), .Y(n60)
         );
  NAND2X2M U52 ( .A(n44), .B(RX_D_VLD), .Y(n22) );
  INVX2M U53 ( .A(current_state[0]), .Y(n19) );
  NAND2X2M U54 ( .A(n65), .B(current_state[0]), .Y(n64) );
  NAND3X2M U55 ( .A(n21), .B(n25), .C(current_state[1]), .Y(n63) );
  NAND3X2M U56 ( .A(n76), .B(n19), .C(current_state[1]), .Y(n50) );
  BUFX2M U57 ( .A(FIFO_FULL), .Y(n8) );
  OR3X2M U58 ( .A(n63), .B(n119), .C(current_state[0]), .Y(n77) );
  NOR3X2M U59 ( .A(current_state[2]), .B(current_state[3]), .C(
        current_state[1]), .Y(n34) );
  OAI211X2M U60 ( .A0(RX_D_VLD), .A1(n54), .B0(n10), .C0(n56), .Y(n30) );
  INVX2M U61 ( .A(EN), .Y(n10) );
  AOI22X1M U62 ( .A0(n4), .A1(n43), .B0(n8), .B1(n15), .Y(n56) );
  NOR4X1M U63 ( .A(n44), .B(n17), .C(n34), .D(n61), .Y(n54) );
  OAI211X2M U64 ( .A0(n48), .A1(n49), .B0(n50), .C0(n45), .Y(n35) );
  NAND2X2M U65 ( .A(RX_P_DATA[4]), .B(RX_P_DATA[0]), .Y(n49) );
  OAI221X1M U66 ( .A0(n31), .A1(n30), .B0(n9), .B1(n29), .C0(n33), .Y(n114) );
  AOI211X2M U67 ( .A0(n34), .A1(current_state[0]), .B0(n35), .C0(n20), .Y(n31)
         );
  INVX2M U68 ( .A(n2), .Y(n20) );
  NAND3X2M U69 ( .A(n76), .B(n29), .C(current_state[0]), .Y(n2) );
  NAND4X2M U70 ( .A(n34), .B(RX_P_DATA[3]), .C(n51), .D(n52), .Y(n48) );
  NOR2X2M U71 ( .A(n118), .B(n112), .Y(n51) );
  NOR4X1M U72 ( .A(current_state[0]), .B(RX_P_DATA[6]), .C(RX_P_DATA[2]), .D(
        n55), .Y(n52) );
  OAI22X1M U73 ( .A0(n9), .A1(n19), .B0(n46), .B1(n30), .Y(n116) );
  NOR4X1M U74 ( .A(n17), .B(n4), .C(n47), .D(n35), .Y(n46) );
  NOR3X2M U75 ( .A(n48), .B(RX_P_DATA[4]), .C(RX_P_DATA[0]), .Y(n47) );
  NOR2X2M U76 ( .A(n8), .B(n75), .Y(TX_P_DATA[0]) );
  AOI222X1M U77 ( .A0(n16), .A1(alu_res[0]), .B0(n6), .B1(alu_res[8]), .C0(n68), .C1(rd_reg[0]), .Y(n75) );
  NOR2X2M U78 ( .A(n8), .B(n74), .Y(TX_P_DATA[1]) );
  AOI222X1M U79 ( .A0(n16), .A1(alu_res[1]), .B0(n6), .B1(alu_res[9]), .C0(n68), .C1(rd_reg[1]), .Y(n74) );
  NOR2X2M U80 ( .A(n8), .B(n73), .Y(TX_P_DATA[2]) );
  AOI222X1M U81 ( .A0(n16), .A1(alu_res[2]), .B0(n6), .B1(alu_res[10]), .C0(
        n68), .C1(rd_reg[2]), .Y(n73) );
  NOR2X2M U82 ( .A(n8), .B(n72), .Y(TX_P_DATA[3]) );
  AOI222X1M U83 ( .A0(n16), .A1(alu_res[3]), .B0(n6), .B1(alu_res[11]), .C0(
        n68), .C1(rd_reg[3]), .Y(n72) );
  NOR2X2M U84 ( .A(n8), .B(n71), .Y(TX_P_DATA[4]) );
  AOI222X1M U85 ( .A0(n16), .A1(alu_res[4]), .B0(n6), .B1(alu_res[12]), .C0(
        n68), .C1(rd_reg[4]), .Y(n71) );
  NOR2X2M U86 ( .A(n8), .B(n70), .Y(TX_P_DATA[5]) );
  AOI222X1M U87 ( .A0(n16), .A1(alu_res[5]), .B0(n6), .B1(alu_res[13]), .C0(
        n68), .C1(rd_reg[5]), .Y(n70) );
  NOR2X2M U88 ( .A(n8), .B(n69), .Y(TX_P_DATA[6]) );
  AOI222X1M U89 ( .A0(n16), .A1(alu_res[6]), .B0(n6), .B1(alu_res[14]), .C0(
        n68), .C1(rd_reg[6]), .Y(n69) );
  NOR2X2M U90 ( .A(n8), .B(n66), .Y(TX_P_DATA[7]) );
  AOI222X1M U91 ( .A0(n16), .A1(alu_res[7]), .B0(n6), .B1(alu_res[15]), .C0(
        n68), .C1(rd_reg[7]), .Y(n66) );
  OAI21X2M U92 ( .A0(n9), .A1(n25), .B0(n26), .Y(n113) );
  AOI31X2M U93 ( .A0(RX_P_DATA[4]), .A1(RX_P_DATA[0]), .A2(n27), .B0(n28), .Y(
        n26) );
  AOI2BB1X2M U94 ( .A0N(CLK_EN), .A1N(n16), .B0(n30), .Y(n28) );
  AND4X2M U95 ( .A(RX_P_DATA[3]), .B(RX_P_DATA[2]), .C(n39), .D(n40), .Y(n27)
         );
  NOR3X2M U96 ( .A(RX_P_DATA[1]), .B(current_state[0]), .C(RX_P_DATA[5]), .Y(
        n39) );
  NOR4X1M U97 ( .A(n24), .B(n30), .C(n117), .D(n118), .Y(n40) );
  AO2B2X2M U98 ( .B0(ALU_OUT[0]), .B1(n7), .A0(alu_res[0]), .A1N(n7), .Y(n78)
         );
  AO2B2X2M U99 ( .B0(ALU_OUT[1]), .B1(n1), .A0(alu_res[1]), .A1N(n1), .Y(n79)
         );
  AO2B2X2M U100 ( .B0(ALU_OUT[2]), .B1(n7), .A0(alu_res[2]), .A1N(n7), .Y(n80)
         );
  AO2B2X2M U101 ( .B0(ALU_OUT[3]), .B1(n1), .A0(alu_res[3]), .A1N(n1), .Y(n81)
         );
  AO2B2X2M U102 ( .B0(ALU_OUT[4]), .B1(n7), .A0(alu_res[4]), .A1N(n7), .Y(n82)
         );
  AO2B2X2M U103 ( .B0(ALU_OUT[5]), .B1(n1), .A0(alu_res[5]), .A1N(n1), .Y(n83)
         );
  AO2B2X2M U104 ( .B0(ALU_OUT[6]), .B1(n7), .A0(alu_res[6]), .A1N(n7), .Y(n84)
         );
  AO2B2X2M U105 ( .B0(ALU_OUT[7]), .B1(n1), .A0(alu_res[7]), .A1N(n1), .Y(n85)
         );
  AO2B2X2M U106 ( .B0(ALU_OUT[8]), .B1(n7), .A0(alu_res[8]), .A1N(n7), .Y(n86)
         );
  AO2B2X2M U107 ( .B0(ALU_OUT[9]), .B1(n1), .A0(alu_res[9]), .A1N(n1), .Y(n87)
         );
  AO2B2X2M U108 ( .B0(ALU_OUT[10]), .B1(n7), .A0(alu_res[10]), .A1N(n7), .Y(
        n88) );
  AO2B2X2M U109 ( .B0(ALU_OUT[11]), .B1(n1), .A0(alu_res[11]), .A1N(n1), .Y(
        n89) );
  AO2B2X2M U110 ( .B0(ALU_OUT[12]), .B1(n7), .A0(alu_res[12]), .A1N(n7), .Y(
        n90) );
  AO2B2X2M U111 ( .B0(ALU_OUT[13]), .B1(n1), .A0(alu_res[13]), .A1N(n1), .Y(
        n91) );
  AO2B2X2M U112 ( .B0(ALU_OUT[14]), .B1(n7), .A0(alu_res[14]), .A1N(n7), .Y(
        n92) );
  AO2B2X2M U113 ( .B0(ALU_OUT[15]), .B1(n1), .A0(alu_res[15]), .A1N(n1), .Y(
        n93) );
  NAND2X2M U114 ( .A(RX_D_VLD), .B(n17), .Y(n5) );
  OAI2BB2X1M U115 ( .B0(n5), .B1(n57), .A0N(ALU_FUN[2]), .A1N(n5), .Y(n104) );
  OAI2BB2X1M U116 ( .B0(n5), .B1(n58), .A0N(ALU_FUN[3]), .A1N(n5), .Y(n105) );
  OAI2BB2X1M U117 ( .B0(n5), .B1(n53), .A0N(ALU_FUN[0]), .A1N(n5), .Y(n102) );
  OAI2BB2X1M U118 ( .B0(n5), .B1(n55), .A0N(ALU_FUN[1]), .A1N(n5), .Y(n103) );
  AND2X2M U119 ( .A(n4), .B(RdData_Valid), .Y(n3) );
  AO2B2X2M U120 ( .B0(RdData[0]), .B1(n3), .A0(rd_reg[0]), .A1N(n3), .Y(n94)
         );
  AO2B2X2M U121 ( .B0(RdData[1]), .B1(n3), .A0(rd_reg[1]), .A1N(n3), .Y(n95)
         );
  AO2B2X2M U122 ( .B0(RdData[2]), .B1(n3), .A0(rd_reg[2]), .A1N(n3), .Y(n96)
         );
  AO2B2X2M U123 ( .B0(RdData[3]), .B1(n3), .A0(rd_reg[3]), .A1N(n3), .Y(n97)
         );
  AO2B2X2M U124 ( .B0(RdData[4]), .B1(n3), .A0(rd_reg[4]), .A1N(n3), .Y(n98)
         );
  AO2B2X2M U125 ( .B0(RdData[5]), .B1(n3), .A0(rd_reg[5]), .A1N(n3), .Y(n99)
         );
  AO2B2X2M U126 ( .B0(RdData[6]), .B1(n3), .A0(rd_reg[6]), .A1N(n3), .Y(n100)
         );
  AO2B2X2M U127 ( .B0(RdData[7]), .B1(n3), .A0(rd_reg[7]), .A1N(n3), .Y(n101)
         );
  INVX2M U128 ( .A(RdData_Valid), .Y(n43) );
  INVX2M U129 ( .A(RX_P_DATA[1]), .Y(n55) );
  INVX2M U130 ( .A(RX_P_DATA[7]), .Y(n118) );
  INVX2M U131 ( .A(RX_P_DATA[0]), .Y(n53) );
  INVX2M U132 ( .A(RX_P_DATA[4]), .Y(n111) );
  INVX2M U133 ( .A(RX_P_DATA[2]), .Y(n57) );
  INVX2M U134 ( .A(RX_P_DATA[3]), .Y(n58) );
  INVX2M U135 ( .A(RX_P_DATA[6]), .Y(n117) );
  INVX2M U136 ( .A(RX_P_DATA[5]), .Y(n112) );
  INVX2M U137 ( .A(RX_D_VLD), .Y(n119) );
endmodule


module DECODER ( ALU_FUNC, enable, Arith_Enable, Logic_Enable, CMP_Enable, 
        Shift_Enable );
  input [3:0] ALU_FUNC;
  input enable;
  output Arith_Enable, Logic_Enable, CMP_Enable, Shift_Enable;
  wire   n5, n6, n7, n1, n2, n3, n4;

  NOR3X2M U3 ( .A(n1), .B(ALU_FUNC[3]), .C(ALU_FUNC[2]), .Y(Arith_Enable) );
  INVX2M U4 ( .A(enable), .Y(n1) );
  NOR4X1M U5 ( .A(n5), .B(n3), .C(n2), .D(n1), .Y(Shift_Enable) );
  XNOR2X2M U6 ( .A(ALU_FUNC[0]), .B(ALU_FUNC[1]), .Y(n5) );
  INVX2M U7 ( .A(ALU_FUNC[2]), .Y(n3) );
  NOR2X2M U8 ( .A(n6), .B(n1), .Y(Logic_Enable) );
  AOI32X1M U9 ( .A0(n4), .A1(n3), .A2(ALU_FUNC[3]), .B0(ALU_FUNC[2]), .B1(n2), 
        .Y(n6) );
  AND3X2M U10 ( .A(n7), .B(enable), .C(ALU_FUNC[3]), .Y(CMP_Enable) );
  OAI32X1M U11 ( .A0(ALU_FUNC[0]), .A1(ALU_FUNC[1]), .A2(n3), .B0(n4), .B1(
        ALU_FUNC[2]), .Y(n7) );
  INVX2M U12 ( .A(ALU_FUNC[3]), .Y(n2) );
  INVX2M U13 ( .A(ALU_FUNC[1]), .Y(n4) );
endmodule


module ARITHMETIC_UNIT_DW_div_tc_0 ( a, b, quotient, remainder, divide_by_0 );
  input [8:0] a;
  input [7:0] b;
  output [8:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[2][6] , \u_div/SumTmp[3][0] ,
         \u_div/SumTmp[3][1] , \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] ,
         \u_div/SumTmp[3][4] , \u_div/SumTmp[3][5] , \u_div/SumTmp[4][0] ,
         \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] , \u_div/SumTmp[4][3] ,
         \u_div/SumTmp[4][4] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[5][3] , \u_div/SumTmp[6][0] ,
         \u_div/SumTmp[6][1] , \u_div/SumTmp[6][2] , \u_div/SumTmp[7][0] ,
         \u_div/SumTmp[7][1] , \u_div/SumTmp[8][0] , \u_div/CryTmp[0][1] ,
         \u_div/CryTmp[0][2] , \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] ,
         \u_div/CryTmp[0][5] , \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] ,
         \u_div/CryTmp[1][1] , \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] ,
         \u_div/CryTmp[1][4] , \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] ,
         \u_div/CryTmp[1][7] , \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] ,
         \u_div/CryTmp[2][3] , \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] ,
         \u_div/CryTmp[2][6] , \u_div/CryTmp[2][7] , \u_div/CryTmp[3][1] ,
         \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] , \u_div/CryTmp[3][4] ,
         \u_div/CryTmp[3][5] , \u_div/CryTmp[3][6] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[4][5] , \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] ,
         \u_div/CryTmp[5][3] , \u_div/CryTmp[5][4] , \u_div/CryTmp[6][1] ,
         \u_div/CryTmp[6][2] , \u_div/CryTmp[6][3] , \u_div/CryTmp[7][1] ,
         \u_div/CryTmp[7][2] , \u_div/PartRem[1][0] , \u_div/PartRem[1][1] ,
         \u_div/PartRem[1][2] , \u_div/PartRem[1][3] , \u_div/PartRem[1][4] ,
         \u_div/PartRem[1][5] , \u_div/PartRem[1][6] , \u_div/PartRem[2][0] ,
         \u_div/PartRem[2][1] , \u_div/PartRem[2][2] , \u_div/PartRem[2][3] ,
         \u_div/PartRem[2][4] , \u_div/PartRem[2][5] , \u_div/PartRem[2][6] ,
         \u_div/PartRem[2][7] , \u_div/PartRem[3][0] , \u_div/PartRem[3][1] ,
         \u_div/PartRem[3][2] , \u_div/PartRem[3][3] , \u_div/PartRem[3][4] ,
         \u_div/PartRem[3][5] , \u_div/PartRem[3][6] , \u_div/PartRem[4][0] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[4][5] , \u_div/PartRem[5][0] ,
         \u_div/PartRem[5][1] , \u_div/PartRem[5][2] , \u_div/PartRem[5][3] ,
         \u_div/PartRem[5][4] , \u_div/PartRem[6][0] , \u_div/PartRem[6][1] ,
         \u_div/PartRem[6][2] , \u_div/PartRem[6][3] , \u_div/PartRem[7][0] ,
         \u_div/PartRem[7][1] , \u_div/PartRem[7][2] , n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26;
  wire   [8:0] \u_div/QIncCry ;
  wire   [8:0] \u_div/QInv ;
  wire   [1:0] \u_div/QAbs ;
  wire   [7:0] \u_div/BInv ;
  wire   [8:1] \u_div/AIncCry ;
  wire   [7:0] \u_div/AInv ;

  ADDHX1M \u_div/u_ha_AInc_5  ( .A(\u_div/AInv [5]), .B(\u_div/AIncCry [5]), 
        .CO(\u_div/AIncCry [6]), .S(\u_div/PartRem[6][0] ) );
  ADDHX1M \u_div/u_ha_AInc_4  ( .A(\u_div/AInv [4]), .B(\u_div/AIncCry [4]), 
        .CO(\u_div/AIncCry [5]), .S(\u_div/PartRem[5][0] ) );
  ADDHX1M \u_div/u_ha_AInc_3  ( .A(\u_div/AInv [3]), .B(\u_div/AIncCry [3]), 
        .CO(\u_div/AIncCry [4]), .S(\u_div/PartRem[4][0] ) );
  ADDHX1M \u_div/u_ha_AInc_2  ( .A(\u_div/AInv [2]), .B(\u_div/AIncCry [2]), 
        .CO(\u_div/AIncCry [3]), .S(\u_div/PartRem[3][0] ) );
  ADDHX1M \u_div/u_ha_AInc_1  ( .A(\u_div/AInv [1]), .B(\u_div/AIncCry [1]), 
        .CO(\u_div/AIncCry [2]), .S(\u_div/PartRem[2][0] ) );
  ADDHX1M \u_div/u_ha_AInc_0  ( .A(\u_div/AInv [0]), .B(a[8]), .CO(
        \u_div/AIncCry [1]), .S(\u_div/PartRem[1][0] ) );
  ADDHX1M \u_div/u_ha_AInc_6  ( .A(\u_div/AInv [6]), .B(\u_div/AIncCry [6]), 
        .CO(\u_div/AIncCry [7]), .S(\u_div/PartRem[7][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_1_0  ( .A(\u_div/PartRem[2][0] ), .B(n12), 
        .CI(n13), .CO(\u_div/CryTmp[1][1] ), .S(\u_div/SumTmp[1][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_2_0  ( .A(\u_div/PartRem[3][0] ), .B(n12), 
        .CI(n13), .CO(\u_div/CryTmp[2][1] ), .S(\u_div/SumTmp[2][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_3_0  ( .A(\u_div/PartRem[4][0] ), .B(n12), 
        .CI(n13), .CO(\u_div/CryTmp[3][1] ), .S(\u_div/SumTmp[3][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_4_0  ( .A(\u_div/PartRem[5][0] ), .B(n12), 
        .CI(n13), .CO(\u_div/CryTmp[4][1] ), .S(\u_div/SumTmp[4][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_5_0  ( .A(\u_div/PartRem[6][0] ), .B(n12), 
        .CI(n13), .CO(\u_div/CryTmp[5][1] ), .S(\u_div/SumTmp[5][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_6_0  ( .A(\u_div/PartRem[7][0] ), .B(n12), 
        .CI(n13), .CO(\u_div/CryTmp[6][1] ), .S(\u_div/SumTmp[6][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_0_5  ( .A(\u_div/PartRem[1][5] ), .B(
        \u_div/BInv [5]), .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] )
         );
  ADDHX1M \u_div/u_ha_QInc_1  ( .A(\u_div/QInv [1]), .B(\u_div/QIncCry [1]), 
        .CO(\u_div/QIncCry [2]), .S(quotient[1]) );
  ADDHX1M \u_div/u_ha_QInc_0  ( .A(\u_div/QInv [0]), .B(\u_div/QIncCry [0]), 
        .CO(\u_div/QIncCry [1]), .S(quotient[0]) );
  ADDHX1M \u_div/u_ha_QInc_7  ( .A(\u_div/QInv [7]), .B(\u_div/QIncCry [7]), 
        .CO(\u_div/QIncCry [8]), .S(quotient[7]) );
  ADDHX1M \u_div/u_ha_QInc_6  ( .A(\u_div/QInv [6]), .B(\u_div/QIncCry [6]), 
        .CO(\u_div/QIncCry [7]), .S(quotient[6]) );
  ADDHX1M \u_div/u_ha_QInc_5  ( .A(\u_div/QInv [5]), .B(\u_div/QIncCry [5]), 
        .CO(\u_div/QIncCry [6]), .S(quotient[5]) );
  ADDHX1M \u_div/u_ha_QInc_4  ( .A(\u_div/QInv [4]), .B(\u_div/QIncCry [4]), 
        .CO(\u_div/QIncCry [5]), .S(quotient[4]) );
  ADDHX1M \u_div/u_ha_QInc_2  ( .A(\u_div/QInv [2]), .B(\u_div/QIncCry [2]), 
        .CO(\u_div/QIncCry [3]), .S(quotient[2]) );
  ADDHX1M \u_div/u_ha_QInc_3  ( .A(\u_div/QInv [3]), .B(\u_div/QIncCry [3]), 
        .CO(\u_div/QIncCry [4]), .S(quotient[3]) );
  ADDFX2M \u_div/u_fa_PartRem_1_1_5  ( .A(\u_div/PartRem[2][5] ), .B(
        \u_div/BInv [5]), .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), 
        .S(\u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_0_3  ( .A(\u_div/PartRem[1][3] ), .B(
        \u_div/BInv [3]), .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] )
         );
  ADDFX2M \u_div/u_fa_PartRem_1_0_4  ( .A(\u_div/PartRem[1][4] ), .B(
        \u_div/BInv [4]), .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] )
         );
  ADDFX2M \u_div/u_fa_PartRem_1_1_4  ( .A(\u_div/PartRem[2][4] ), .B(
        \u_div/BInv [4]), .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), 
        .S(\u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_1_3  ( .A(\u_div/PartRem[2][3] ), .B(
        \u_div/BInv [3]), .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), 
        .S(\u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_0_0  ( .A(\u_div/PartRem[1][0] ), .B(n12), 
        .CI(n13), .CO(\u_div/CryTmp[0][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n1), .CI(
        \u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_1_2  ( .A(\u_div/PartRem[2][2] ), .B(
        \u_div/BInv [2]), .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), 
        .S(\u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_2_4  ( .A(\u_div/PartRem[3][4] ), .B(
        \u_div/BInv [4]), .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), 
        .S(\u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n1), .CI(
        \u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_2_3  ( .A(\u_div/PartRem[3][3] ), .B(
        \u_div/BInv [3]), .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), 
        .S(\u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_2_2  ( .A(\u_div/PartRem[3][2] ), .B(
        \u_div/BInv [2]), .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), 
        .S(\u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n1), .CI(
        \u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_3_4  ( .A(\u_div/PartRem[4][4] ), .B(
        \u_div/BInv [4]), .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), 
        .S(\u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_3_3  ( .A(\u_div/PartRem[4][3] ), .B(
        \u_div/BInv [3]), .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), 
        .S(\u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_3_2  ( .A(\u_div/PartRem[4][2] ), .B(
        \u_div/BInv [2]), .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), 
        .S(\u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n1), .CI(
        \u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_4_3  ( .A(\u_div/PartRem[5][3] ), .B(
        \u_div/BInv [3]), .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), 
        .S(\u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_4_2  ( .A(\u_div/PartRem[5][2] ), .B(
        \u_div/BInv [2]), .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), 
        .S(\u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n1), .CI(
        \u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n1), .CI(
        \u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n1), .CI(
        \u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  XOR2X1M \u_div/u_ha_QInc_8  ( .A(\u_div/QInv [8]), .B(\u_div/QIncCry [8]), 
        .Y(quotient[8]) );
  ADDFXLM \u_div/u_fa_PartRem_1_4_4  ( .A(\u_div/PartRem[5][4] ), .B(
        \u_div/BInv [4]), .CI(\u_div/CryTmp[4][4] ), .CO(\u_div/CryTmp[4][5] ), 
        .S(\u_div/SumTmp[4][4] ) );
  ADDFXLM \u_div/u_fa_PartRem_1_5_3  ( .A(\u_div/PartRem[6][3] ), .B(
        \u_div/BInv [3]), .CI(\u_div/CryTmp[5][3] ), .CO(\u_div/CryTmp[5][4] ), 
        .S(\u_div/SumTmp[5][3] ) );
  ADDFXLM \u_div/u_fa_PartRem_1_1_6  ( .A(\u_div/PartRem[2][6] ), .B(
        \u_div/BInv [6]), .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), 
        .S(\u_div/SumTmp[1][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_2_6  ( .A(\u_div/PartRem[3][6] ), .B(
        \u_div/BInv [6]), .CI(\u_div/CryTmp[2][6] ), .CO(\u_div/CryTmp[2][7] ), 
        .S(\u_div/SumTmp[2][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_2_5  ( .A(\u_div/PartRem[3][5] ), .B(
        \u_div/BInv [5]), .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), 
        .S(\u_div/SumTmp[2][5] ) );
  ADDFXLM \u_div/u_fa_PartRem_1_0_6  ( .A(\u_div/PartRem[1][6] ), .B(
        \u_div/BInv [6]), .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] )
         );
  ADDFX2M \u_div/u_fa_PartRem_1_3_5  ( .A(\u_div/PartRem[4][5] ), .B(
        \u_div/BInv [5]), .CI(\u_div/CryTmp[3][5] ), .CO(\u_div/CryTmp[3][6] ), 
        .S(\u_div/SumTmp[3][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_0_2  ( .A(\u_div/PartRem[1][2] ), .B(
        \u_div/BInv [2]), .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] )
         );
  ADDFXLM \u_div/u_fa_PartRem_1_7_0  ( .A(\u_div/AIncCry [7]), .B(n12), .CI(
        n13), .CO(\u_div/CryTmp[7][1] ), .S(\u_div/SumTmp[7][0] ) );
  ADDFXLM \u_div/u_fa_PartRem_1_7_1  ( .A(n2), .B(n1), .CI(
        \u_div/CryTmp[7][1] ), .CO(\u_div/CryTmp[7][2] ), .S(
        \u_div/SumTmp[7][1] ) );
  ADDFX1M \u_div/u_fa_PartRem_1_6_2  ( .A(\u_div/PartRem[7][2] ), .B(
        \u_div/BInv [2]), .CI(\u_div/CryTmp[6][2] ), .CO(\u_div/CryTmp[6][3] ), 
        .S(\u_div/SumTmp[6][2] ) );
  INVX4M U1 ( .A(b[7]), .Y(n13) );
  NAND2X2M U2 ( .A(n7), .B(n8), .Y(\u_div/BInv [6]) );
  CLKXOR2X2M U3 ( .A(n13), .B(b[1]), .Y(n1) );
  AND2X2M U4 ( .A(n14), .B(\u_div/SumTmp[8][0] ), .Y(n2) );
  XOR3XLM U5 ( .A(\u_div/CryTmp[5][2] ), .B(\u_div/PartRem[6][2] ), .C(
        \u_div/BInv [2]), .Y(\u_div/SumTmp[5][2] ) );
  NAND2X2M U6 ( .A(\u_div/CryTmp[5][2] ), .B(\u_div/PartRem[6][2] ), .Y(n3) );
  NAND2X2M U7 ( .A(\u_div/CryTmp[5][2] ), .B(\u_div/BInv [2]), .Y(n4) );
  NAND2X2M U8 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/BInv [2]), .Y(n5) );
  NAND3X2M U9 ( .A(n5), .B(n4), .C(n3), .Y(\u_div/CryTmp[5][3] ) );
  MX2XLM U10 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(n17), 
        .Y(\u_div/PartRem[6][2] ) );
  AND2X2M U11 ( .A(\u_div/CryTmp[7][2] ), .B(n23), .Y(n16) );
  AND2X2M U12 ( .A(\u_div/CryTmp[6][3] ), .B(n24), .Y(n17) );
  MX2XLM U13 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(n20), 
        .Y(\u_div/PartRem[3][2] ) );
  MX2XLM U14 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(n19), 
        .Y(\u_div/PartRem[4][2] ) );
  MX2XLM U15 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        \u_div/CryTmp[2][7] ), .Y(\u_div/PartRem[2][2] ) );
  MX2XLM U16 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(n18), 
        .Y(\u_div/PartRem[5][2] ) );
  AND2X2M U17 ( .A(\u_div/CryTmp[3][6] ), .B(\u_div/BInv [6]), .Y(n20) );
  NAND2X1M U18 ( .A(n13), .B(n6), .Y(n7) );
  CLKNAND2X2M U19 ( .A(b[7]), .B(b[6]), .Y(n8) );
  INVXLM U20 ( .A(b[6]), .Y(n6) );
  MX2XLM U21 ( .A(n2), .B(\u_div/SumTmp[7][1] ), .S0(n16), .Y(
        \u_div/PartRem[7][2] ) );
  MX2XLM U22 ( .A(\u_div/PartRem[7][2] ), .B(\u_div/SumTmp[6][2] ), .S0(n17), 
        .Y(\u_div/PartRem[6][3] ) );
  MX2XLM U23 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(n18), 
        .Y(\u_div/PartRem[5][3] ) );
  MX2XLM U24 ( .A(\u_div/PartRem[6][3] ), .B(\u_div/SumTmp[5][3] ), .S0(n18), 
        .Y(\u_div/PartRem[5][4] ) );
  MX2XLM U25 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(n19), 
        .Y(\u_div/PartRem[4][4] ) );
  MX2XLM U26 ( .A(\u_div/PartRem[5][4] ), .B(\u_div/SumTmp[4][4] ), .S0(n19), 
        .Y(\u_div/PartRem[4][5] ) );
  MX2XLM U27 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(n20), 
        .Y(\u_div/PartRem[3][4] ) );
  MX2XLM U28 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(n20), 
        .Y(\u_div/PartRem[3][5] ) );
  MX2XLM U29 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        \u_div/CryTmp[2][7] ), .Y(\u_div/PartRem[2][4] ) );
  MX2XLM U30 ( .A(\u_div/PartRem[4][5] ), .B(\u_div/SumTmp[3][5] ), .S0(n20), 
        .Y(\u_div/PartRem[3][6] ) );
  MX2XLM U31 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        \u_div/CryTmp[2][7] ), .Y(\u_div/PartRem[2][5] ) );
  MX2XLM U32 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        \u_div/CryTmp[2][7] ), .Y(\u_div/PartRem[2][6] ) );
  MX2XLM U33 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        \u_div/QAbs [1]), .Y(\u_div/PartRem[1][5] ) );
  MXI2XLM U34 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        \u_div/QAbs [1]), .Y(n9) );
  MX2X2M U35 ( .A(\u_div/PartRem[7][0] ), .B(\u_div/SumTmp[6][0] ), .S0(n17), 
        .Y(\u_div/PartRem[6][1] ) );
  MX2X2M U36 ( .A(\u_div/PartRem[6][0] ), .B(\u_div/SumTmp[5][0] ), .S0(n18), 
        .Y(\u_div/PartRem[5][1] ) );
  MX2X2M U37 ( .A(\u_div/PartRem[5][0] ), .B(\u_div/SumTmp[4][0] ), .S0(n19), 
        .Y(\u_div/PartRem[4][1] ) );
  MX2X2M U38 ( .A(\u_div/PartRem[4][0] ), .B(\u_div/SumTmp[3][0] ), .S0(n20), 
        .Y(\u_div/PartRem[3][1] ) );
  MX2X2M U39 ( .A(\u_div/PartRem[3][0] ), .B(\u_div/SumTmp[2][0] ), .S0(
        \u_div/CryTmp[2][7] ), .Y(\u_div/PartRem[2][1] ) );
  MX2X2M U40 ( .A(\u_div/PartRem[2][0] ), .B(\u_div/SumTmp[1][0] ), .S0(
        \u_div/QAbs [1]), .Y(\u_div/PartRem[1][1] ) );
  AND2X2M U41 ( .A(n24), .B(\u_div/BInv [2]), .Y(n23) );
  AND2X2M U42 ( .A(n26), .B(\u_div/BInv [4]), .Y(n25) );
  CLKINVX2M U43 ( .A(\u_div/CryTmp[0][7] ), .Y(n11) );
  XOR2X2M U44 ( .A(n13), .B(b[2]), .Y(\u_div/BInv [2]) );
  XOR2X2M U45 ( .A(n13), .B(b[3]), .Y(\u_div/BInv [3]) );
  XOR2X2M U46 ( .A(n13), .B(b[4]), .Y(\u_div/BInv [4]) );
  XOR2X2M U47 ( .A(n13), .B(b[5]), .Y(\u_div/BInv [5]) );
  BUFX2M U48 ( .A(\u_div/BInv [0]), .Y(n12) );
  XOR2XLM U49 ( .A(b[0]), .B(n13), .Y(\u_div/BInv [0]) );
  XOR2XLM U50 ( .A(a[8]), .B(b[7]), .Y(n15) );
  OR2X2M U51 ( .A(\u_div/PartRem[2][7] ), .B(\u_div/CryTmp[1][7] ), .Y(
        \u_div/QAbs [1]) );
  AND2X2M U52 ( .A(n13), .B(n12), .Y(n10) );
  NAND2X2M U53 ( .A(n9), .B(n11), .Y(\u_div/QAbs [0]) );
  XNOR2X2M U54 ( .A(n12), .B(b[7]), .Y(\u_div/SumTmp[8][0] ) );
  CLKXOR2X2M U55 ( .A(n14), .B(n15), .Y(\u_div/QInv [8]) );
  CLKXOR2X2M U56 ( .A(n16), .B(n15), .Y(\u_div/QInv [7]) );
  CLKXOR2X2M U57 ( .A(n17), .B(n15), .Y(\u_div/QInv [6]) );
  CLKXOR2X2M U58 ( .A(n18), .B(n15), .Y(\u_div/QInv [5]) );
  CLKXOR2X2M U59 ( .A(n19), .B(n15), .Y(\u_div/QInv [4]) );
  CLKXOR2X2M U60 ( .A(n20), .B(n15), .Y(\u_div/QInv [3]) );
  CLKXOR2X2M U61 ( .A(\u_div/CryTmp[2][7] ), .B(n15), .Y(\u_div/QInv [2]) );
  CLKXOR2X2M U62 ( .A(\u_div/QAbs [1]), .B(n15), .Y(\u_div/QInv [1]) );
  CLKXOR2X2M U63 ( .A(\u_div/QAbs [0]), .B(n15), .Y(\u_div/QInv [0]) );
  AND2X1M U64 ( .A(n21), .B(n15), .Y(\u_div/QIncCry [0]) );
  CLKMX2X2M U65 ( .A(\u_div/PartRem[3][6] ), .B(\u_div/SumTmp[2][6] ), .S0(
        \u_div/CryTmp[2][7] ), .Y(\u_div/PartRem[2][7] ) );
  AND3X1M U66 ( .A(n22), .B(n21), .C(n10), .Y(n14) );
  NAND3BX1M U67 ( .AN(b[0]), .B(n13), .C(n22), .Y(n21) );
  AND2X1M U68 ( .A(n23), .B(n1), .Y(n22) );
  CLKMX2X2M U69 ( .A(\u_div/AIncCry [7]), .B(\u_div/SumTmp[7][0] ), .S0(n16), 
        .Y(\u_div/PartRem[7][1] ) );
  CLKMX2X2M U70 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        \u_div/QAbs [1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U71 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(n19), .Y(\u_div/PartRem[4][3] ) );
  AND2X1M U72 ( .A(n25), .B(\u_div/BInv [3]), .Y(n24) );
  CLKMX2X2M U73 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(n20), .Y(\u_div/PartRem[3][3] ) );
  AND2X1M U74 ( .A(\u_div/CryTmp[5][4] ), .B(n25), .Y(n18) );
  CLKMX2X2M U75 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        \u_div/QAbs [1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U76 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        \u_div/CryTmp[2][7] ), .Y(\u_div/PartRem[2][3] ) );
  AND2X1M U77 ( .A(\u_div/CryTmp[4][5] ), .B(n26), .Y(n19) );
  AND2X1M U78 ( .A(\u_div/BInv [6]), .B(\u_div/BInv [5]), .Y(n26) );
  CLKMX2X2M U79 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        \u_div/QAbs [1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U80 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        \u_div/QAbs [1]), .Y(\u_div/PartRem[1][2] ) );
  CLKXOR2X2M U81 ( .A(a[8]), .B(a[6]), .Y(\u_div/AInv [6]) );
  CLKXOR2X2M U82 ( .A(a[8]), .B(a[5]), .Y(\u_div/AInv [5]) );
  CLKXOR2X2M U83 ( .A(a[8]), .B(a[4]), .Y(\u_div/AInv [4]) );
  CLKXOR2X2M U84 ( .A(a[8]), .B(a[3]), .Y(\u_div/AInv [3]) );
  CLKXOR2X2M U85 ( .A(a[8]), .B(a[2]), .Y(\u_div/AInv [2]) );
  CLKXOR2X2M U86 ( .A(a[8]), .B(a[1]), .Y(\u_div/AInv [1]) );
  CLKXOR2X2M U87 ( .A(a[8]), .B(a[0]), .Y(\u_div/AInv [0]) );
endmodule


module ARITHMETIC_UNIT_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  XOR3XLM U2_8 ( .A(A[8]), .B(n2), .C(carry[8]), .Y(DIFF[8]) );
  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  XNOR2XLM U1 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVXLM U2 ( .A(A[0]), .Y(n1) );
  INVXLM U3 ( .A(B[6]), .Y(n3) );
  INVXLM U4 ( .A(B[2]), .Y(n7) );
  INVXLM U5 ( .A(B[3]), .Y(n6) );
  INVXLM U6 ( .A(B[4]), .Y(n5) );
  INVXLM U7 ( .A(B[5]), .Y(n4) );
  INVXLM U8 ( .A(B[8]), .Y(n2) );
  INVX2M U9 ( .A(B[0]), .Y(n9) );
  INVX2M U10 ( .A(B[1]), .Y(n8) );
  NAND2X2M U11 ( .A(B[0]), .B(n1), .Y(carry[1]) );
endmodule


module ARITHMETIC_UNIT_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  XOR3XLM U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .Y(SUM[8]) );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2XLM U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ARITHMETIC_UNIT_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , \A[0] , n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23;
  assign SUM[5] = \A[5] ;
  assign \A[5]  = A[5];
  assign SUM[4] = \A[4] ;
  assign \A[4]  = A[4];
  assign SUM[3] = \A[3] ;
  assign \A[3]  = A[3];
  assign SUM[2] = \A[2] ;
  assign \A[2]  = A[2];
  assign SUM[1] = \A[1] ;
  assign \A[1]  = A[1];
  assign SUM[0] = \A[0] ;
  assign \A[0]  = A[0];

  INVX2M U2 ( .A(A[6]), .Y(n1) );
  INVX2M U3 ( .A(B[6]), .Y(n2) );
  XNOR2X1M U4 ( .A(n3), .B(n4), .Y(SUM[9]) );
  NOR2X1M U5 ( .A(n5), .B(n6), .Y(n4) );
  CLKXOR2X2M U6 ( .A(n7), .B(n8), .Y(SUM[8]) );
  NAND2BX1M U7 ( .AN(n9), .B(n10), .Y(n7) );
  XOR3XLM U8 ( .A(B[7]), .B(A[7]), .C(n11), .Y(SUM[7]) );
  AOI21X1M U9 ( .A0(n2), .A1(n1), .B0(n11), .Y(SUM[6]) );
  XOR3XLM U10 ( .A(B[13]), .B(A[13]), .C(n12), .Y(SUM[13]) );
  OAI2BB1X1M U11 ( .A0N(n13), .A1N(A[12]), .B0(n14), .Y(n12) );
  OAI21X1M U12 ( .A0(A[12]), .A1(n13), .B0(B[12]), .Y(n14) );
  XOR3XLM U13 ( .A(B[12]), .B(A[12]), .C(n13), .Y(SUM[12]) );
  OAI21BX1M U14 ( .A0(n15), .A1(n16), .B0N(n17), .Y(n13) );
  XNOR2X1M U15 ( .A(n16), .B(n18), .Y(SUM[11]) );
  NOR2X1M U16 ( .A(n17), .B(n15), .Y(n18) );
  NOR2X1M U17 ( .A(B[11]), .B(A[11]), .Y(n15) );
  AND2X1M U18 ( .A(B[11]), .B(A[11]), .Y(n17) );
  OA21X1M U19 ( .A0(n19), .A1(n20), .B0(n21), .Y(n16) );
  CLKXOR2X2M U20 ( .A(n22), .B(n20), .Y(SUM[10]) );
  AOI2BB1X1M U21 ( .A0N(n3), .A1N(n6), .B0(n5), .Y(n20) );
  AND2X1M U22 ( .A(B[9]), .B(A[9]), .Y(n5) );
  NOR2X1M U23 ( .A(B[9]), .B(A[9]), .Y(n6) );
  OA21X1M U24 ( .A0(n8), .A1(n9), .B0(n10), .Y(n3) );
  CLKNAND2X2M U25 ( .A(B[8]), .B(A[8]), .Y(n10) );
  NOR2X1M U26 ( .A(B[8]), .B(A[8]), .Y(n9) );
  AOI21BX1M U27 ( .A0(n11), .A1(A[7]), .B0N(n23), .Y(n8) );
  OAI21X1M U28 ( .A0(n11), .A1(A[7]), .B0(B[7]), .Y(n23) );
  NOR2X1M U29 ( .A(n2), .B(n1), .Y(n11) );
  NAND2BX1M U30 ( .AN(n19), .B(n21), .Y(n22) );
  CLKNAND2X2M U31 ( .A(B[10]), .B(A[10]), .Y(n21) );
  NOR2X1M U32 ( .A(B[10]), .B(A[10]), .Y(n19) );
endmodule


module ARITHMETIC_UNIT_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][7] , \CARRYB[7][6] ,
         \CARRYB[7][5] , \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] ,
         \CARRYB[7][1] , \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] ,
         \CARRYB[6][4] , \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] ,
         \CARRYB[6][0] , \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] ,
         \CARRYB[5][3] , \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] ,
         \CARRYB[4][6] , \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] ,
         \CARRYB[4][2] , \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] ,
         \CARRYB[3][5] , \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] ,
         \CARRYB[3][1] , \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] ,
         \CARRYB[2][4] , \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] ,
         \CARRYB[2][0] , \SUMB[7][7] , \SUMB[7][6] , \SUMB[7][5] ,
         \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] , \SUMB[7][1] , \SUMB[7][0] ,
         \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] , \SUMB[6][3] , \SUMB[6][2] ,
         \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] , \SUMB[5][4] , \SUMB[5][3] ,
         \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] , \SUMB[4][5] , \SUMB[4][4] ,
         \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] , \SUMB[3][6] , \SUMB[3][5] ,
         \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] , \SUMB[3][1] , \SUMB[2][6] ,
         \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] , \SUMB[2][2] , \SUMB[2][1] ,
         \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] , \SUMB[1][3] , \SUMB[1][2] ,
         \SUMB[1][1] , ZA, ZB, \A1[12] , \A1[11] , \A1[10] , \A1[9] , \A1[8] ,
         \A1[7] , \A1[6] , \A1[5] , \A1[4] , \A1[3] , \A1[2] , \A1[1] ,
         \A1[0] , \A2[6] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41;
  assign ZA = A[7];
  assign ZB = B[7];

  ARITHMETIC_UNIT_DW01_add_1 FS_1 ( .A({n25, \A1[12] , \A1[11] , \A1[10] , 
        \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[5] , \A1[4] , \A1[3] , \A1[2] , 
        \A1[1] , \A1[0] }), .B({n10, n16, n15, n14, n13, n11, n12, \A2[6] , 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2])
         );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S14_7_0 ( .A(ZA), .B(ZB), .CI(\SUMB[7][0] ), .CO(\A2[6] ), .S(
        \A1[5] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n6), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S14_7 ( .A(n26), .B(n34), .CI(\ab[7][7] ), .CO(\CARRYB[7][7] ), .S(
        \SUMB[7][7] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n4), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n5), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n3), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n9), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n8), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n7), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  AND2X2M U2 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\SUMB[7][7] ), .Y(n10) );
  INVXLM U10 ( .A(B[2]), .Y(n39) );
  INVXLM U11 ( .A(A[0]), .Y(n33) );
  INVXLM U12 ( .A(A[1]), .Y(n32) );
  NOR2XLM U13 ( .A(A[0]), .B(n34), .Y(\ab[0][7] ) );
  INVXLM U14 ( .A(ZB), .Y(n34) );
  INVXLM U15 ( .A(B[6]), .Y(n35) );
  INVXLM U16 ( .A(B[5]), .Y(n36) );
  INVXLM U17 ( .A(B[4]), .Y(n37) );
  INVXLM U18 ( .A(B[3]), .Y(n38) );
  INVXLM U19 ( .A(A[2]), .Y(n31) );
  INVXLM U20 ( .A(A[3]), .Y(n30) );
  NOR2XLM U21 ( .A(B[6]), .B(n26), .Y(\ab[7][6] ) );
  INVXLM U22 ( .A(ZA), .Y(n26) );
  INVX2M U23 ( .A(\ab[0][2] ), .Y(n19) );
  INVX2M U24 ( .A(\ab[0][3] ), .Y(n20) );
  INVX2M U25 ( .A(\ab[0][6] ), .Y(n23) );
  INVX2M U26 ( .A(\ab[0][5] ), .Y(n22) );
  INVX2M U27 ( .A(\ab[0][4] ), .Y(n21) );
  INVX2M U28 ( .A(\ab[0][1] ), .Y(n18) );
  INVX2M U29 ( .A(\CARRYB[7][7] ), .Y(n25) );
  XNOR2X2M U30 ( .A(\ab[1][0] ), .B(n18), .Y(PRODUCT[1]) );
  XNOR2X2M U31 ( .A(\ab[1][4] ), .B(n22), .Y(\SUMB[1][4] ) );
  CLKXOR2X2M U32 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U33 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U34 ( .A(\ab[0][7] ), .Y(n24) );
  XNOR2X2M U35 ( .A(\ab[1][6] ), .B(n24), .Y(\SUMB[1][6] ) );
  XNOR2X2M U36 ( .A(\ab[1][5] ), .B(n23), .Y(\SUMB[1][5] ) );
  XNOR2X2M U37 ( .A(\ab[1][3] ), .B(n21), .Y(\SUMB[1][3] ) );
  XNOR2X2M U38 ( .A(\ab[1][1] ), .B(n19), .Y(\SUMB[1][1] ) );
  XNOR2X2M U39 ( .A(\ab[1][2] ), .B(n20), .Y(\SUMB[1][2] ) );
  AND2X2M U40 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n11) );
  XNOR2X2M U41 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U42 ( .A(\SUMB[7][1] ), .Y(n17) );
  AND2X2M U43 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n12) );
  CLKXOR2X2M U44 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U45 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  CLKXOR2X2M U46 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  AND2X2M U47 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n13) );
  AND2X2M U48 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n14) );
  AND2X2M U49 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n15) );
  CLKXOR2X2M U50 ( .A(\CARRYB[7][6] ), .B(\SUMB[7][7] ), .Y(\A1[12] ) );
  AND2X2M U51 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  INVX2M U52 ( .A(B[1]), .Y(n40) );
  INVX2M U53 ( .A(A[6]), .Y(n27) );
  INVX2M U54 ( .A(B[0]), .Y(n41) );
  INVX2M U55 ( .A(A[4]), .Y(n29) );
  INVX2M U56 ( .A(A[5]), .Y(n28) );
  NOR2X1M U57 ( .A(n34), .B(n26), .Y(\ab[7][7] ) );
  NOR2X1M U58 ( .A(B[5]), .B(n26), .Y(\ab[7][5] ) );
  NOR2X1M U59 ( .A(B[4]), .B(n26), .Y(\ab[7][4] ) );
  NOR2X1M U60 ( .A(B[3]), .B(n26), .Y(\ab[7][3] ) );
  NOR2X1M U61 ( .A(B[2]), .B(n26), .Y(\ab[7][2] ) );
  NOR2X1M U62 ( .A(B[1]), .B(n26), .Y(\ab[7][1] ) );
  NOR2X1M U63 ( .A(B[0]), .B(n26), .Y(\ab[7][0] ) );
  NOR2X1M U64 ( .A(A[6]), .B(n34), .Y(\ab[6][7] ) );
  NOR2X1M U65 ( .A(n27), .B(n35), .Y(\ab[6][6] ) );
  NOR2X1M U66 ( .A(n27), .B(n36), .Y(\ab[6][5] ) );
  NOR2X1M U67 ( .A(n27), .B(n37), .Y(\ab[6][4] ) );
  NOR2X1M U68 ( .A(n27), .B(n38), .Y(\ab[6][3] ) );
  NOR2X1M U69 ( .A(n27), .B(n39), .Y(\ab[6][2] ) );
  NOR2X1M U70 ( .A(n27), .B(n40), .Y(\ab[6][1] ) );
  NOR2X1M U71 ( .A(n27), .B(n41), .Y(\ab[6][0] ) );
  NOR2X1M U72 ( .A(A[5]), .B(n34), .Y(\ab[5][7] ) );
  NOR2X1M U73 ( .A(n35), .B(n28), .Y(\ab[5][6] ) );
  NOR2X1M U74 ( .A(n36), .B(n28), .Y(\ab[5][5] ) );
  NOR2X1M U75 ( .A(n37), .B(n28), .Y(\ab[5][4] ) );
  NOR2X1M U76 ( .A(n38), .B(n28), .Y(\ab[5][3] ) );
  NOR2X1M U77 ( .A(n39), .B(n28), .Y(\ab[5][2] ) );
  NOR2X1M U78 ( .A(n40), .B(n28), .Y(\ab[5][1] ) );
  NOR2X1M U79 ( .A(n41), .B(n28), .Y(\ab[5][0] ) );
  NOR2X1M U80 ( .A(A[4]), .B(n34), .Y(\ab[4][7] ) );
  NOR2X1M U81 ( .A(n35), .B(n29), .Y(\ab[4][6] ) );
  NOR2X1M U82 ( .A(n36), .B(n29), .Y(\ab[4][5] ) );
  NOR2X1M U83 ( .A(n37), .B(n29), .Y(\ab[4][4] ) );
  NOR2X1M U84 ( .A(n38), .B(n29), .Y(\ab[4][3] ) );
  NOR2X1M U85 ( .A(n39), .B(n29), .Y(\ab[4][2] ) );
  NOR2X1M U86 ( .A(n40), .B(n29), .Y(\ab[4][1] ) );
  NOR2X1M U87 ( .A(n41), .B(n29), .Y(\ab[4][0] ) );
  NOR2X1M U88 ( .A(A[3]), .B(n34), .Y(\ab[3][7] ) );
  NOR2X1M U89 ( .A(n35), .B(n30), .Y(\ab[3][6] ) );
  NOR2X1M U90 ( .A(n36), .B(n30), .Y(\ab[3][5] ) );
  NOR2X1M U91 ( .A(n37), .B(n30), .Y(\ab[3][4] ) );
  NOR2X1M U92 ( .A(n38), .B(n30), .Y(\ab[3][3] ) );
  NOR2X1M U93 ( .A(n39), .B(n30), .Y(\ab[3][2] ) );
  NOR2X1M U94 ( .A(n40), .B(n30), .Y(\ab[3][1] ) );
  NOR2X1M U95 ( .A(n41), .B(n30), .Y(\ab[3][0] ) );
  NOR2X1M U96 ( .A(A[2]), .B(n34), .Y(\ab[2][7] ) );
  NOR2X1M U97 ( .A(n35), .B(n31), .Y(\ab[2][6] ) );
  NOR2X1M U98 ( .A(n36), .B(n31), .Y(\ab[2][5] ) );
  NOR2X1M U99 ( .A(n37), .B(n31), .Y(\ab[2][4] ) );
  NOR2X1M U100 ( .A(n38), .B(n31), .Y(\ab[2][3] ) );
  NOR2X1M U101 ( .A(n39), .B(n31), .Y(\ab[2][2] ) );
  NOR2X1M U102 ( .A(n40), .B(n31), .Y(\ab[2][1] ) );
  NOR2X1M U103 ( .A(n41), .B(n31), .Y(\ab[2][0] ) );
  NOR2X1M U104 ( .A(A[1]), .B(n34), .Y(\ab[1][7] ) );
  NOR2X1M U105 ( .A(n35), .B(n32), .Y(\ab[1][6] ) );
  NOR2X1M U106 ( .A(n36), .B(n32), .Y(\ab[1][5] ) );
  NOR2X1M U107 ( .A(n37), .B(n32), .Y(\ab[1][4] ) );
  NOR2X1M U108 ( .A(n38), .B(n32), .Y(\ab[1][3] ) );
  NOR2X1M U109 ( .A(n39), .B(n32), .Y(\ab[1][2] ) );
  NOR2X1M U110 ( .A(n40), .B(n32), .Y(\ab[1][1] ) );
  NOR2X1M U111 ( .A(n41), .B(n32), .Y(\ab[1][0] ) );
  NOR2X1M U112 ( .A(n35), .B(n33), .Y(\ab[0][6] ) );
  NOR2X1M U113 ( .A(n36), .B(n33), .Y(\ab[0][5] ) );
  NOR2X1M U114 ( .A(n37), .B(n33), .Y(\ab[0][4] ) );
  NOR2X1M U115 ( .A(n38), .B(n33), .Y(\ab[0][3] ) );
  NOR2X1M U116 ( .A(n39), .B(n33), .Y(\ab[0][2] ) );
  NOR2X1M U117 ( .A(n40), .B(n33), .Y(\ab[0][1] ) );
  NOR2X1M U118 ( .A(n41), .B(n33), .Y(PRODUCT[0]) );
endmodule


module ARITHMETIC_UNIT ( A, B, ALU_FUN, Arith_Enable, CLK, RST, Arith_OUT, 
        Arith_Flag );
  input [7:0] A;
  input [7:0] B;
  input [1:0] ALU_FUN;
  output [15:0] Arith_OUT;
  input Arith_Enable, CLK, RST;
  output Arith_Flag;
  wire   N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32,
         N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N46,
         N47, N48, N49, N50, N51, N52, N55, N56, N57, N58, N59, N60, N61, N62,
         N63, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100,
         N101, N102, N103, N104, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n3;

  ARITHMETIC_UNIT_DW_div_tc_0 div_24 ( .a({A[7], A}), .b(B), .quotient({N63, 
        N62, N61, N60, N59, N58, N57, N56, N55}) );
  ARITHMETIC_UNIT_DW01_sub_0 sub_22 ( .A({A[7], A}), .B({B[7], B}), .CI(1'b0), 
        .DIFF({N36, N35, N34, N33, N32, N31, N30, N29, N28}) );
  ARITHMETIC_UNIT_DW01_add_0 add_21 ( .A({A[7], A}), .B({B[7], B}), .CI(1'b0), 
        .SUM({N27, N26, N25, N24, N23, N22, N21, N20, N19}) );
  ARITHMETIC_UNIT_DW02_mult_0 mult_23 ( .A(A), .B(B), .TC(1'b1), .PRODUCT({N52, 
        N51, N50, N49, N48, N47, N46, N45, N44, N43, N42, N41, N40, N39, N38, 
        N37}) );
  DFFRX1M Arith_Flag_reg ( .D(Arith_Enable), .CK(CLK), .RN(RST), .Q(Arith_Flag) );
  DFFRX1M \Arith_OUT_reg[0]  ( .D(N89), .CK(CLK), .RN(RST), .Q(Arith_OUT[0])
         );
  DFFRX1M \Arith_OUT_reg[1]  ( .D(N90), .CK(CLK), .RN(RST), .Q(Arith_OUT[1])
         );
  DFFRX1M \Arith_OUT_reg[2]  ( .D(N91), .CK(CLK), .RN(RST), .Q(Arith_OUT[2])
         );
  DFFRX1M \Arith_OUT_reg[3]  ( .D(N92), .CK(CLK), .RN(RST), .Q(Arith_OUT[3])
         );
  DFFRX1M \Arith_OUT_reg[4]  ( .D(N93), .CK(CLK), .RN(RST), .Q(Arith_OUT[4])
         );
  DFFRX1M \Arith_OUT_reg[5]  ( .D(N94), .CK(CLK), .RN(RST), .Q(Arith_OUT[5])
         );
  DFFRX1M \Arith_OUT_reg[6]  ( .D(N95), .CK(CLK), .RN(RST), .Q(Arith_OUT[6])
         );
  DFFRX1M \Arith_OUT_reg[7]  ( .D(N96), .CK(CLK), .RN(RST), .Q(Arith_OUT[7])
         );
  DFFRX1M \Arith_OUT_reg[15]  ( .D(N104), .CK(CLK), .RN(RST), .Q(Arith_OUT[15]) );
  DFFRX1M \Arith_OUT_reg[14]  ( .D(N103), .CK(CLK), .RN(RST), .Q(Arith_OUT[14]) );
  DFFRX1M \Arith_OUT_reg[13]  ( .D(N102), .CK(CLK), .RN(RST), .Q(Arith_OUT[13]) );
  DFFRX1M \Arith_OUT_reg[12]  ( .D(N101), .CK(CLK), .RN(RST), .Q(Arith_OUT[12]) );
  DFFRX1M \Arith_OUT_reg[11]  ( .D(N100), .CK(CLK), .RN(RST), .Q(Arith_OUT[11]) );
  DFFRX1M \Arith_OUT_reg[10]  ( .D(N99), .CK(CLK), .RN(RST), .Q(Arith_OUT[10])
         );
  DFFRX1M \Arith_OUT_reg[9]  ( .D(N98), .CK(CLK), .RN(RST), .Q(Arith_OUT[9])
         );
  DFFRX1M \Arith_OUT_reg[8]  ( .D(N97), .CK(CLK), .RN(RST), .Q(Arith_OUT[8])
         );
  OAI2BB1XLM U3 ( .A0N(N45), .A1N(n7), .B0(n8), .Y(N97) );
  OAI2BB1XLM U4 ( .A0N(N50), .A1N(n7), .B0(n8), .Y(N102) );
  OAI2BB1XLM U5 ( .A0N(N51), .A1N(n7), .B0(n8), .Y(N103) );
  OAI2BB1XLM U8 ( .A0N(N52), .A1N(n7), .B0(n8), .Y(N104) );
  OAI2BB1XLM U9 ( .A0N(N46), .A1N(n7), .B0(n8), .Y(N98) );
  OAI2BB1XLM U10 ( .A0N(N47), .A1N(n7), .B0(n8), .Y(N99) );
  OAI2BB1XLM U11 ( .A0N(N48), .A1N(n7), .B0(n8), .Y(N100) );
  OAI2BB1XLM U12 ( .A0N(N49), .A1N(n7), .B0(n8), .Y(N101) );
  NAND2X1M U13 ( .A(n9), .B(n10), .Y(N96) );
  NOR4XLM U14 ( .A(B[7]), .B(B[6]), .C(B[5]), .D(B[4]), .Y(n35) );
  NOR4XLM U15 ( .A(B[3]), .B(B[2]), .C(B[1]), .D(B[0]), .Y(n34) );
  NAND2X2M U16 ( .A(n18), .B(n19), .Y(N93) );
  AOI22X1M U17 ( .A0(N32), .A1(n11), .B0(N23), .B1(n12), .Y(n19) );
  AOI22X1M U18 ( .A0(N59), .A1(n13), .B0(N41), .B1(n7), .Y(n18) );
  NAND2X2M U19 ( .A(n16), .B(n17), .Y(N94) );
  AOI22X1M U20 ( .A0(N33), .A1(n11), .B0(N24), .B1(n12), .Y(n17) );
  AOI22X1M U21 ( .A0(N60), .A1(n13), .B0(N42), .B1(n7), .Y(n16) );
  NAND2X2M U22 ( .A(n14), .B(n15), .Y(N95) );
  AOI22X1M U23 ( .A0(N34), .A1(n11), .B0(N25), .B1(n12), .Y(n15) );
  AOI22X1M U24 ( .A0(N61), .A1(n13), .B0(N43), .B1(n7), .Y(n14) );
  AOI22X1M U25 ( .A0(N35), .A1(n11), .B0(N26), .B1(n12), .Y(n10) );
  AOI22X1M U26 ( .A0(N62), .A1(n13), .B0(N44), .B1(n7), .Y(n9) );
  NAND2X2M U27 ( .A(n24), .B(n25), .Y(N90) );
  AOI22X1M U28 ( .A0(N29), .A1(n11), .B0(N20), .B1(n12), .Y(n25) );
  AOI22X1M U29 ( .A0(N56), .A1(n13), .B0(N38), .B1(n7), .Y(n24) );
  NAND2X2M U30 ( .A(n22), .B(n23), .Y(N91) );
  AOI22X1M U31 ( .A0(N30), .A1(n11), .B0(N21), .B1(n12), .Y(n23) );
  AOI22X1M U32 ( .A0(N57), .A1(n13), .B0(N39), .B1(n7), .Y(n22) );
  NAND2X2M U33 ( .A(n20), .B(n21), .Y(N92) );
  AOI22X1M U34 ( .A0(N31), .A1(n11), .B0(N22), .B1(n12), .Y(n21) );
  AOI22X1M U35 ( .A0(N58), .A1(n13), .B0(N40), .B1(n7), .Y(n20) );
  AND3X2M U36 ( .A(Arith_Enable), .B(n30), .C(n31), .Y(n13) );
  AND2X2M U37 ( .A(n29), .B(Arith_Enable), .Y(n11) );
  AND2X2M U38 ( .A(n28), .B(Arith_Enable), .Y(n12) );
  NAND2X2M U39 ( .A(Arith_Enable), .B(n32), .Y(n8) );
  OAI2BB1X2M U40 ( .A0N(N27), .A1N(n28), .B0(n33), .Y(n32) );
  AOI32X1M U41 ( .A0(n31), .A1(n30), .A2(N63), .B0(N36), .B1(n29), .Y(n33) );
  NAND2X2M U42 ( .A(n26), .B(n27), .Y(N89) );
  AOI22X1M U43 ( .A0(N28), .A1(n11), .B0(N19), .B1(n12), .Y(n27) );
  AOI22X1M U44 ( .A0(N55), .A1(n13), .B0(N37), .B1(n7), .Y(n26) );
  AND3X2M U45 ( .A(Arith_Enable), .B(ALU_FUN[1]), .C(n3), .Y(n7) );
  INVX2M U46 ( .A(ALU_FUN[0]), .Y(n3) );
  NOR2X2M U47 ( .A(n3), .B(ALU_FUN[1]), .Y(n29) );
  NOR2X2M U48 ( .A(ALU_FUN[0]), .B(ALU_FUN[1]), .Y(n28) );
  NOR2BX2M U49 ( .AN(ALU_FUN[1]), .B(n3), .Y(n31) );
  NAND2X2M U50 ( .A(n34), .B(n35), .Y(n30) );
endmodule


module LOGIC_UNIT ( A, B, ALU_FUN, Logic_Enable, CLK, RST, Logic_OUT, 
        Logic_Flag );
  input [7:0] A;
  input [7:0] B;
  input [2:0] ALU_FUN;
  output [15:0] Logic_OUT;
  input Logic_Enable, CLK, RST;
  output Logic_Flag;
  wire   N87, N88, N89, N90, N91, N92, N93, N94, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n50,
         n51;
  assign Logic_OUT[15] = 1'b0;
  assign Logic_OUT[14] = 1'b0;
  assign Logic_OUT[13] = 1'b0;
  assign Logic_OUT[12] = 1'b0;
  assign Logic_OUT[11] = 1'b0;
  assign Logic_OUT[10] = 1'b0;
  assign Logic_OUT[9] = 1'b0;
  assign Logic_OUT[8] = 1'b0;

  DFFRX1M Logic_Flag_reg ( .D(Logic_Enable), .CK(CLK), .RN(RST), .Q(Logic_Flag) );
  DFFRX1M \Logic_OUT_reg[7]  ( .D(N94), .CK(CLK), .RN(RST), .Q(Logic_OUT[7])
         );
  DFFRX1M \Logic_OUT_reg[5]  ( .D(N92), .CK(CLK), .RN(RST), .Q(Logic_OUT[5])
         );
  DFFRX1M \Logic_OUT_reg[4]  ( .D(N91), .CK(CLK), .RN(RST), .Q(Logic_OUT[4])
         );
  DFFRX1M \Logic_OUT_reg[3]  ( .D(N90), .CK(CLK), .RN(RST), .Q(Logic_OUT[3])
         );
  DFFRX1M \Logic_OUT_reg[2]  ( .D(N89), .CK(CLK), .RN(RST), .Q(Logic_OUT[2])
         );
  DFFRX1M \Logic_OUT_reg[6]  ( .D(N93), .CK(CLK), .RN(RST), .Q(Logic_OUT[6])
         );
  DFFRX1M \Logic_OUT_reg[1]  ( .D(N88), .CK(CLK), .RN(RST), .Q(Logic_OUT[1])
         );
  DFFRX1M \Logic_OUT_reg[0]  ( .D(N87), .CK(CLK), .RN(RST), .Q(Logic_OUT[0])
         );
  OAI2B2XLM U11 ( .A1N(B[2]), .A0(n39), .B0(B[2]), .B1(n40), .Y(n38) );
  OAI2B2XLM U12 ( .A1N(B[3]), .A0(n35), .B0(B[3]), .B1(n36), .Y(n34) );
  OAI2B2XLM U13 ( .A1N(B[4]), .A0(n31), .B0(B[4]), .B1(n32), .Y(n30) );
  OAI2B2XLM U14 ( .A1N(B[5]), .A0(n27), .B0(B[5]), .B1(n28), .Y(n26) );
  OAI2B2XLM U15 ( .A1N(B[6]), .A0(n20), .B0(B[6]), .B1(n21), .Y(n19) );
  AO22XLM U16 ( .A0(A[7]), .A1(ALU_FUN[0]), .B0(n15), .B1(B[7]), .Y(n14) );
  XOR2XLM U17 ( .A(B[7]), .B(n15), .Y(n12) );
  XOR2XLM U18 ( .A(A[7]), .B(ALU_FUN[0]), .Y(n15) );
  INVXLM U19 ( .A(A[0]), .Y(n51) );
  INVXLM U20 ( .A(A[1]), .Y(n50) );
  INVXLM U21 ( .A(A[2]), .Y(n10) );
  INVXLM U22 ( .A(A[3]), .Y(n9) );
  OAI21X2M U23 ( .A0(n5), .A1(n4), .B0(n49), .Y(n23) );
  INVX2M U24 ( .A(Logic_Enable), .Y(n3) );
  AOI221XLM U25 ( .A0(n2), .A1(n51), .B0(A[0]), .B1(n24), .C0(n18), .Y(n47) );
  AOI221XLM U26 ( .A0(n2), .A1(n50), .B0(A[1]), .B1(n24), .C0(n18), .Y(n43) );
  AOI221XLM U27 ( .A0(n2), .A1(n10), .B0(A[2]), .B1(n24), .C0(n18), .Y(n39) );
  AOI221XLM U28 ( .A0(n2), .A1(n9), .B0(A[3]), .B1(n24), .C0(n18), .Y(n35) );
  AOI221XLM U29 ( .A0(n2), .A1(n8), .B0(A[4]), .B1(n24), .C0(n18), .Y(n31) );
  AOI221XLM U30 ( .A0(n2), .A1(n7), .B0(A[5]), .B1(n24), .C0(n18), .Y(n27) );
  AOI221XLM U31 ( .A0(n2), .A1(n6), .B0(A[6]), .B1(n24), .C0(n18), .Y(n20) );
  OAI21X2M U32 ( .A0(ALU_FUN[1]), .A1(n4), .B0(n49), .Y(n24) );
  INVX2M U33 ( .A(ALU_FUN[1]), .Y(n5) );
  AND3X2M U34 ( .A(ALU_FUN[0]), .B(n5), .C(ALU_FUN[2]), .Y(n18) );
  INVX2M U35 ( .A(ALU_FUN[2]), .Y(n4) );
  NAND3X2M U36 ( .A(n5), .B(n4), .C(ALU_FUN[0]), .Y(n49) );
  NOR2X2M U37 ( .A(n11), .B(n3), .Y(N94) );
  AOI32X1M U38 ( .A0(n5), .A1(n4), .A2(n12), .B0(n13), .B1(ALU_FUN[2]), .Y(n11) );
  CLKXOR2X2M U39 ( .A(n14), .B(ALU_FUN[1]), .Y(n13) );
  NOR2X2M U40 ( .A(n41), .B(n3), .Y(N88) );
  AOI221XLM U41 ( .A0(n1), .A1(n50), .B0(A[1]), .B1(n18), .C0(n42), .Y(n41) );
  OAI2B2X1M U42 ( .A1N(B[1]), .A0(n43), .B0(B[1]), .B1(n44), .Y(n42) );
  AOI221XLM U43 ( .A0(A[1]), .A1(n2), .B0(n23), .B1(n50), .C0(n1), .Y(n44) );
  NOR2X2M U44 ( .A(n45), .B(n3), .Y(N87) );
  AOI221XLM U45 ( .A0(n1), .A1(n51), .B0(A[0]), .B1(n18), .C0(n46), .Y(n45) );
  OAI2B2X1M U46 ( .A1N(B[0]), .A0(n47), .B0(B[0]), .B1(n48), .Y(n46) );
  AOI221XLM U47 ( .A0(A[0]), .A1(n2), .B0(n23), .B1(n51), .C0(n1), .Y(n48) );
  NOR2X2M U48 ( .A(n37), .B(n3), .Y(N89) );
  AOI221XLM U49 ( .A0(n1), .A1(n10), .B0(A[2]), .B1(n18), .C0(n38), .Y(n37) );
  AOI221XLM U50 ( .A0(A[2]), .A1(n2), .B0(n23), .B1(n10), .C0(n1), .Y(n40) );
  NOR2X2M U51 ( .A(n33), .B(n3), .Y(N90) );
  AOI221XLM U52 ( .A0(n1), .A1(n9), .B0(A[3]), .B1(n18), .C0(n34), .Y(n33) );
  AOI221XLM U53 ( .A0(A[3]), .A1(n2), .B0(n23), .B1(n9), .C0(n1), .Y(n36) );
  NOR2X2M U54 ( .A(n29), .B(n3), .Y(N91) );
  AOI221XLM U55 ( .A0(n1), .A1(n8), .B0(A[4]), .B1(n18), .C0(n30), .Y(n29) );
  AOI221XLM U56 ( .A0(A[4]), .A1(n2), .B0(n23), .B1(n8), .C0(n1), .Y(n32) );
  NOR2X2M U57 ( .A(n25), .B(n3), .Y(N92) );
  AOI221XLM U58 ( .A0(n1), .A1(n7), .B0(A[5]), .B1(n18), .C0(n26), .Y(n25) );
  AOI221XLM U59 ( .A0(A[5]), .A1(n2), .B0(n23), .B1(n7), .C0(n1), .Y(n28) );
  NOR2X2M U60 ( .A(n16), .B(n3), .Y(N93) );
  AOI221XLM U61 ( .A0(n1), .A1(n6), .B0(n18), .B1(A[6]), .C0(n19), .Y(n16) );
  AOI221XLM U62 ( .A0(A[6]), .A1(n2), .B0(n23), .B1(n6), .C0(n1), .Y(n21) );
  BUFX2M U63 ( .A(n22), .Y(n2) );
  NOR3X2M U64 ( .A(ALU_FUN[1]), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n22) );
  BUFX2M U65 ( .A(n17), .Y(n1) );
  NOR3X2M U66 ( .A(n5), .B(ALU_FUN[0]), .C(n4), .Y(n17) );
  INVX2M U67 ( .A(A[6]), .Y(n6) );
  INVX2M U68 ( .A(A[4]), .Y(n8) );
  INVX2M U69 ( .A(A[5]), .Y(n7) );
endmodule


module CMP_UNIT ( A, B, ALU_FUN, CMP_Enable, CLK, RST, CMP_OUT, CMP_Flag );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] CMP_OUT;
  input CMP_Enable, CLK, RST;
  output CMP_Flag;
  wire   N27, N28, N29, N34, N35, n12, n13, n14, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43;
  assign CMP_OUT[15] = 1'b0;
  assign CMP_OUT[14] = 1'b0;
  assign CMP_OUT[13] = 1'b0;
  assign CMP_OUT[12] = 1'b0;
  assign CMP_OUT[11] = 1'b0;
  assign CMP_OUT[10] = 1'b0;
  assign CMP_OUT[9] = 1'b0;
  assign CMP_OUT[8] = 1'b0;
  assign CMP_OUT[7] = 1'b0;
  assign CMP_OUT[6] = 1'b0;
  assign CMP_OUT[5] = 1'b0;
  assign CMP_OUT[4] = 1'b0;
  assign CMP_OUT[3] = 1'b0;
  assign CMP_OUT[2] = 1'b0;

  DFFRX1M CMP_Flag_reg ( .D(CMP_Enable), .CK(CLK), .RN(RST), .Q(CMP_Flag) );
  DFFRX1M \CMP_OUT_reg[1]  ( .D(N35), .CK(CLK), .RN(RST), .Q(CMP_OUT[1]) );
  DFFRX1M \CMP_OUT_reg[0]  ( .D(N34), .CK(CLK), .RN(RST), .Q(CMP_OUT[0]) );
  NOR2XLM U5 ( .A(n30), .B(A[0]), .Y(n1) );
  NOR2XLM U18 ( .A(n32), .B(A[3]), .Y(n16) );
  INVXLM U19 ( .A(B[6]), .Y(n33) );
  NOR2XLM U20 ( .A(n31), .B(A[2]), .Y(n4) );
  NAND2BXLM U21 ( .AN(A[4]), .B(B[4]), .Y(n5) );
  NAND2XLM U22 ( .A(A[3]), .B(n32), .Y(n17) );
  NAND2XLM U23 ( .A(A[2]), .B(n31), .Y(n18) );
  NAND2XLM U24 ( .A(A[0]), .B(n30), .Y(n11) );
  INVXLM U25 ( .A(A[1]), .Y(n36) );
  INVXLM U26 ( .A(B[3]), .Y(n32) );
  INVXLM U27 ( .A(B[2]), .Y(n31) );
  XNOR2XLM U28 ( .A(A[6]), .B(B[6]), .Y(n23) );
  NOR2XLM U29 ( .A(n34), .B(A[7]), .Y(n26) );
  NAND2XLM U30 ( .A(A[7]), .B(n34), .Y(n27) );
  NAND2BXLM U31 ( .AN(A[5]), .B(B[5]), .Y(n24) );
  INVXLM U32 ( .A(B[7]), .Y(n34) );
  INVX2M U33 ( .A(n15), .Y(n37) );
  INVX2M U34 ( .A(CMP_Enable), .Y(n39) );
  INVX2M U35 ( .A(A[6]), .Y(n38) );
  INVX2M U36 ( .A(n1), .Y(n35) );
  NOR4X1M U37 ( .A(ALU_FUN[0]), .B(n14), .C(n40), .D(n39), .Y(N34) );
  AOI33X2M U38 ( .A0(ALU_FUN[1]), .A1(n41), .A2(N27), .B0(ALU_FUN[2]), .B1(n42), .B2(N29), .Y(n14) );
  INVX2M U39 ( .A(ALU_FUN[1]), .Y(n42) );
  NOR4X1M U40 ( .A(n12), .B(n40), .C(n39), .D(n13), .Y(N35) );
  CLKXOR2X2M U41 ( .A(ALU_FUN[1]), .B(ALU_FUN[0]), .Y(n13) );
  AOI33X2M U42 ( .A0(ALU_FUN[0]), .A1(n41), .A2(N28), .B0(ALU_FUN[2]), .B1(n43), .B2(N29), .Y(n12) );
  INVX2M U43 ( .A(ALU_FUN[0]), .Y(n43) );
  INVX2M U44 ( .A(n29), .Y(N28) );
  INVX2M U45 ( .A(B[0]), .Y(n30) );
  INVX2M U46 ( .A(ALU_FUN[3]), .Y(n40) );
  INVX2M U47 ( .A(ALU_FUN[2]), .Y(n41) );
  NAND2BX1M U48 ( .AN(B[4]), .B(A[4]), .Y(n19) );
  CLKNAND2X2M U49 ( .A(n19), .B(n5), .Y(n21) );
  NAND2BX1M U50 ( .AN(n4), .B(n18), .Y(n10) );
  AOI21X1M U51 ( .A0(n1), .A1(n36), .B0(B[1]), .Y(n2) );
  AOI211X1M U52 ( .A0(A[1]), .A1(n35), .B0(n10), .C0(n2), .Y(n3) );
  OAI31X1M U53 ( .A0(n16), .A1(n4), .A2(n3), .B0(n17), .Y(n6) );
  OAI211X1M U54 ( .A0(n21), .A1(n6), .B0(n5), .C0(n24), .Y(n7) );
  NAND2BX1M U55 ( .AN(B[5]), .B(A[5]), .Y(n20) );
  AOI32X1M U56 ( .A0(n7), .A1(n20), .A2(n23), .B0(B[6]), .B1(n38), .Y(n8) );
  OAI21X1M U57 ( .A0(n26), .A1(n8), .B0(n27), .Y(N29) );
  OA21X1M U58 ( .A0(n11), .A1(n36), .B0(B[1]), .Y(n9) );
  AOI211X1M U59 ( .A0(n11), .A1(n36), .B0(n10), .C0(n9), .Y(n15) );
  AOI31X1M U60 ( .A0(n37), .A1(n18), .A2(n17), .B0(n16), .Y(n22) );
  OAI2B11X1M U61 ( .A1N(n22), .A0(n21), .B0(n20), .C0(n19), .Y(n25) );
  AOI32X1M U62 ( .A0(n25), .A1(n24), .A2(n23), .B0(A[6]), .B1(n33), .Y(n28) );
  AOI2B1X1M U63 ( .A1N(n28), .A0(n27), .B0(n26), .Y(n29) );
  NOR2X1M U64 ( .A(N29), .B(N28), .Y(N27) );
endmodule


module SHIFT_UNIT ( A, ALU_FUN, Shift_Enable, CLK, RST, SHIFT_OUT, SHIFT_Flag
 );
  input [7:0] A;
  input [3:0] ALU_FUN;
  output [15:0] SHIFT_OUT;
  input Shift_Enable, CLK, RST;
  output SHIFT_Flag;
  wire   N37, N38, N39, N40, N41, N42, N43, N44, N45, n8, n9, n10, n11, n12,
         n1, n2, n3, n4, n5, n6, n7;
  assign SHIFT_OUT[15] = 1'b0;
  assign SHIFT_OUT[14] = 1'b0;
  assign SHIFT_OUT[13] = 1'b0;
  assign SHIFT_OUT[12] = 1'b0;
  assign SHIFT_OUT[11] = 1'b0;
  assign SHIFT_OUT[10] = 1'b0;
  assign SHIFT_OUT[9] = 1'b0;

  DFFRX1M SHIFT_Flag_reg ( .D(Shift_Enable), .CK(CLK), .RN(RST), .Q(SHIFT_Flag) );
  DFFRX1M \SHIFT_OUT_reg[8]  ( .D(N45), .CK(CLK), .RN(RST), .Q(SHIFT_OUT[8])
         );
  DFFRX1M \SHIFT_OUT_reg[7]  ( .D(N44), .CK(CLK), .RN(RST), .Q(SHIFT_OUT[7])
         );
  DFFRX1M \SHIFT_OUT_reg[0]  ( .D(N37), .CK(CLK), .RN(RST), .Q(SHIFT_OUT[0])
         );
  DFFRX1M \SHIFT_OUT_reg[6]  ( .D(N43), .CK(CLK), .RN(RST), .Q(SHIFT_OUT[6])
         );
  DFFRX1M \SHIFT_OUT_reg[4]  ( .D(N41), .CK(CLK), .RN(RST), .Q(SHIFT_OUT[4])
         );
  DFFRX1M \SHIFT_OUT_reg[3]  ( .D(N40), .CK(CLK), .RN(RST), .Q(SHIFT_OUT[3])
         );
  DFFRX1M \SHIFT_OUT_reg[2]  ( .D(N39), .CK(CLK), .RN(RST), .Q(SHIFT_OUT[2])
         );
  DFFRX1M \SHIFT_OUT_reg[5]  ( .D(N42), .CK(CLK), .RN(RST), .Q(SHIFT_OUT[5])
         );
  DFFRX1M \SHIFT_OUT_reg[1]  ( .D(N38), .CK(CLK), .RN(RST), .Q(SHIFT_OUT[1])
         );
  AND2X1M U10 ( .A(Shift_Enable), .B(A[7]), .Y(n8) );
  INVXLM U11 ( .A(A[1]), .Y(n7) );
  INVXLM U12 ( .A(A[3]), .Y(n5) );
  INVXLM U13 ( .A(A[2]), .Y(n6) );
  NAND2X2M U14 ( .A(n12), .B(n9), .Y(n10) );
  OAI22X1M U15 ( .A0(n10), .A1(n7), .B0(n11), .B1(n5), .Y(N39) );
  OAI22X1M U16 ( .A0(n10), .A1(n6), .B0(n11), .B1(n4), .Y(N40) );
  OAI22X1M U17 ( .A0(n10), .A1(n5), .B0(n11), .B1(n3), .Y(N41) );
  OAI22X1M U18 ( .A0(n10), .A1(n4), .B0(n2), .B1(n11), .Y(N42) );
  NOR2X2M U19 ( .A(n11), .B(n7), .Y(N37) );
  NOR2X2M U20 ( .A(n10), .B(n2), .Y(N44) );
  NAND3X2M U21 ( .A(n12), .B(n1), .C(ALU_FUN[0]), .Y(n11) );
  OAI2B2X1M U22 ( .A1N(A[0]), .A0(n10), .B0(n11), .B1(n6), .Y(N38) );
  OAI2B2X1M U23 ( .A1N(A[7]), .A0(n11), .B0(n10), .B1(n3), .Y(N43) );
  AND3X2M U24 ( .A(ALU_FUN[2]), .B(Shift_Enable), .C(ALU_FUN[3]), .Y(n12) );
  AND4X2M U25 ( .A(n8), .B(n9), .C(ALU_FUN[2]), .D(ALU_FUN[3]), .Y(N45) );
  NOR2X2M U26 ( .A(n1), .B(ALU_FUN[0]), .Y(n9) );
  INVX2M U27 ( .A(ALU_FUN[1]), .Y(n1) );
  INVX2M U28 ( .A(A[6]), .Y(n2) );
  INVX2M U29 ( .A(A[5]), .Y(n3) );
  INVX2M U30 ( .A(A[4]), .Y(n4) );
endmodule


module mux4x1 ( ALU_FUN, Arith_OUT, Logic_OUT, CMP_OUT, SHIFT_OUT, SHIFT_Flag, 
        CMP_Flag, Logic_Flag, Arith_Flag, alu_out, out_valid );
  input [3:0] ALU_FUN;
  input [15:0] Arith_OUT;
  input [15:0] Logic_OUT;
  input [15:0] CMP_OUT;
  input [15:0] SHIFT_OUT;
  output [15:0] alu_out;
  input SHIFT_Flag, CMP_Flag, Logic_Flag, Arith_Flag;
  output out_valid;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n1, n2, n3, n42;

  AND3X2M U2 ( .A(n41), .B(ALU_FUN[2]), .C(ALU_FUN[3]), .Y(n6) );
  XNOR2X2M U3 ( .A(n42), .B(ALU_FUN[0]), .Y(n41) );
  AND2X2M U4 ( .A(n40), .B(ALU_FUN[3]), .Y(n7) );
  OAI32X1M U5 ( .A0(n3), .A1(ALU_FUN[1]), .A2(ALU_FUN[0]), .B0(ALU_FUN[2]), 
        .B1(n42), .Y(n40) );
  INVX2M U6 ( .A(ALU_FUN[1]), .Y(n42) );
  INVX2M U7 ( .A(ALU_FUN[2]), .Y(n3) );
  OR4X1M U8 ( .A(CMP_Flag), .B(Arith_Flag), .C(SHIFT_Flag), .D(Logic_Flag), 
        .Y(out_valid) );
  NAND2X2M U9 ( .A(n38), .B(n39), .Y(alu_out[0]) );
  AOI22X1M U10 ( .A0(Logic_OUT[0]), .A1(n1), .B0(Arith_OUT[0]), .B1(n9), .Y(
        n38) );
  AOI22X1M U11 ( .A0(SHIFT_OUT[0]), .A1(n6), .B0(CMP_OUT[0]), .B1(n7), .Y(n39)
         );
  NAND2X2M U12 ( .A(n24), .B(n25), .Y(alu_out[1]) );
  AOI22X1M U13 ( .A0(Logic_OUT[1]), .A1(n1), .B0(Arith_OUT[1]), .B1(n9), .Y(
        n24) );
  AOI22X1M U14 ( .A0(SHIFT_OUT[1]), .A1(n6), .B0(CMP_OUT[1]), .B1(n7), .Y(n25)
         );
  BUFX2M U15 ( .A(n8), .Y(n1) );
  OAI32X1M U16 ( .A0(n2), .A1(ALU_FUN[2]), .A2(ALU_FUN[1]), .B0(ALU_FUN[3]), 
        .B1(n3), .Y(n8) );
  INVX2M U17 ( .A(ALU_FUN[3]), .Y(n2) );
  NAND2X2M U18 ( .A(n22), .B(n23), .Y(alu_out[2]) );
  AOI22X1M U19 ( .A0(Logic_OUT[2]), .A1(n1), .B0(Arith_OUT[2]), .B1(n9), .Y(
        n22) );
  AOI22X1M U20 ( .A0(SHIFT_OUT[2]), .A1(n6), .B0(CMP_OUT[2]), .B1(n7), .Y(n23)
         );
  NAND2X2M U21 ( .A(n20), .B(n21), .Y(alu_out[3]) );
  AOI22X1M U22 ( .A0(Logic_OUT[3]), .A1(n1), .B0(Arith_OUT[3]), .B1(n9), .Y(
        n20) );
  AOI22X1M U23 ( .A0(SHIFT_OUT[3]), .A1(n6), .B0(CMP_OUT[3]), .B1(n7), .Y(n21)
         );
  NAND2X2M U24 ( .A(n18), .B(n19), .Y(alu_out[4]) );
  AOI22X1M U25 ( .A0(Logic_OUT[4]), .A1(n1), .B0(Arith_OUT[4]), .B1(n9), .Y(
        n18) );
  AOI22X1M U26 ( .A0(SHIFT_OUT[4]), .A1(n6), .B0(CMP_OUT[4]), .B1(n7), .Y(n19)
         );
  NAND2X2M U27 ( .A(n16), .B(n17), .Y(alu_out[5]) );
  AOI22X1M U28 ( .A0(Logic_OUT[5]), .A1(n1), .B0(Arith_OUT[5]), .B1(n9), .Y(
        n16) );
  AOI22X1M U29 ( .A0(SHIFT_OUT[5]), .A1(n6), .B0(CMP_OUT[5]), .B1(n7), .Y(n17)
         );
  NAND2X2M U30 ( .A(n14), .B(n15), .Y(alu_out[6]) );
  AOI22X1M U31 ( .A0(Logic_OUT[6]), .A1(n1), .B0(Arith_OUT[6]), .B1(n9), .Y(
        n14) );
  AOI22X1M U32 ( .A0(SHIFT_OUT[6]), .A1(n6), .B0(CMP_OUT[6]), .B1(n7), .Y(n15)
         );
  NAND2X2M U33 ( .A(n12), .B(n13), .Y(alu_out[7]) );
  AOI22X1M U34 ( .A0(Logic_OUT[7]), .A1(n1), .B0(Arith_OUT[7]), .B1(n9), .Y(
        n12) );
  AOI22X1M U35 ( .A0(SHIFT_OUT[7]), .A1(n6), .B0(CMP_OUT[7]), .B1(n7), .Y(n13)
         );
  NAND2X2M U36 ( .A(n10), .B(n11), .Y(alu_out[8]) );
  AOI22X1M U37 ( .A0(Logic_OUT[8]), .A1(n1), .B0(Arith_OUT[8]), .B1(n9), .Y(
        n10) );
  AOI22X1M U38 ( .A0(SHIFT_OUT[8]), .A1(n6), .B0(CMP_OUT[8]), .B1(n7), .Y(n11)
         );
  NOR2X2M U39 ( .A(ALU_FUN[2]), .B(ALU_FUN[3]), .Y(n9) );
  NAND2X2M U40 ( .A(n4), .B(n5), .Y(alu_out[9]) );
  AOI22X1M U41 ( .A0(SHIFT_OUT[9]), .A1(n6), .B0(CMP_OUT[9]), .B1(n7), .Y(n5)
         );
  AOI22X1M U42 ( .A0(Logic_OUT[9]), .A1(n1), .B0(Arith_OUT[9]), .B1(n9), .Y(n4) );
  NAND2X2M U43 ( .A(n36), .B(n37), .Y(alu_out[10]) );
  AOI22X1M U44 ( .A0(SHIFT_OUT[10]), .A1(n6), .B0(CMP_OUT[10]), .B1(n7), .Y(
        n37) );
  AOI22X1M U45 ( .A0(Logic_OUT[10]), .A1(n1), .B0(Arith_OUT[10]), .B1(n9), .Y(
        n36) );
  NAND2X2M U46 ( .A(n34), .B(n35), .Y(alu_out[11]) );
  AOI22X1M U47 ( .A0(SHIFT_OUT[11]), .A1(n6), .B0(CMP_OUT[11]), .B1(n7), .Y(
        n35) );
  AOI22X1M U48 ( .A0(Logic_OUT[11]), .A1(n1), .B0(Arith_OUT[11]), .B1(n9), .Y(
        n34) );
  NAND2X2M U49 ( .A(n32), .B(n33), .Y(alu_out[12]) );
  AOI22X1M U50 ( .A0(SHIFT_OUT[12]), .A1(n6), .B0(CMP_OUT[12]), .B1(n7), .Y(
        n33) );
  AOI22X1M U51 ( .A0(Logic_OUT[12]), .A1(n1), .B0(Arith_OUT[12]), .B1(n9), .Y(
        n32) );
  NAND2X2M U52 ( .A(n30), .B(n31), .Y(alu_out[13]) );
  AOI22X1M U53 ( .A0(SHIFT_OUT[13]), .A1(n6), .B0(CMP_OUT[13]), .B1(n7), .Y(
        n31) );
  AOI22X1M U54 ( .A0(Logic_OUT[13]), .A1(n1), .B0(Arith_OUT[13]), .B1(n9), .Y(
        n30) );
  NAND2X2M U55 ( .A(n28), .B(n29), .Y(alu_out[14]) );
  AOI22X1M U56 ( .A0(SHIFT_OUT[14]), .A1(n6), .B0(CMP_OUT[14]), .B1(n7), .Y(
        n29) );
  AOI22X1M U57 ( .A0(Logic_OUT[14]), .A1(n1), .B0(Arith_OUT[14]), .B1(n9), .Y(
        n28) );
  NAND2X2M U58 ( .A(n26), .B(n27), .Y(alu_out[15]) );
  AOI22X1M U59 ( .A0(SHIFT_OUT[15]), .A1(n6), .B0(CMP_OUT[15]), .B1(n7), .Y(
        n27) );
  AOI22X1M U60 ( .A0(Logic_OUT[15]), .A1(n1), .B0(Arith_OUT[15]), .B1(n9), .Y(
        n26) );
endmodule


module ALU_TOP ( A, B, ALU_FUNC, enable, CLK, RST, ALU_OUT, out_valid );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUNC;
  output [15:0] ALU_OUT;
  input enable, CLK, RST;
  output out_valid;
  wire   Arith_Enable, Logic_Enable, CMP_Enable, Shift_Enable, Arith_Flag,
         Logic_Flag, CMP_Flag, SHIFT_Flag;
  wire   [15:0] Arith_OUT;
  wire   [15:0] Logic_OUT;
  wire   [15:0] CMP_OUT;
  wire   [15:0] SHIFT_OUT;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28;

  DECODER u_decoder ( .ALU_FUNC(ALU_FUNC), .enable(enable), .Arith_Enable(
        Arith_Enable), .Logic_Enable(Logic_Enable), .CMP_Enable(CMP_Enable), 
        .Shift_Enable(Shift_Enable) );
  ARITHMETIC_UNIT u_arith ( .A(A), .B(B), .ALU_FUN(ALU_FUNC[1:0]), 
        .Arith_Enable(Arith_Enable), .CLK(CLK), .RST(RST), .Arith_OUT(
        Arith_OUT), .Arith_Flag(Arith_Flag) );
  LOGIC_UNIT u_logic ( .A(A), .B(B), .ALU_FUN(ALU_FUNC[2:0]), .Logic_Enable(
        Logic_Enable), .CLK(CLK), .RST(RST), .Logic_OUT({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, Logic_OUT[7:0]}), 
        .Logic_Flag(Logic_Flag) );
  CMP_UNIT u_cmp ( .A(A), .B(B), .ALU_FUN(ALU_FUNC), .CMP_Enable(CMP_Enable), 
        .CLK(CLK), .RST(RST), .CMP_OUT({SYNOPSYS_UNCONNECTED__8, 
        SYNOPSYS_UNCONNECTED__9, SYNOPSYS_UNCONNECTED__10, 
        SYNOPSYS_UNCONNECTED__11, SYNOPSYS_UNCONNECTED__12, 
        SYNOPSYS_UNCONNECTED__13, SYNOPSYS_UNCONNECTED__14, 
        SYNOPSYS_UNCONNECTED__15, SYNOPSYS_UNCONNECTED__16, 
        SYNOPSYS_UNCONNECTED__17, SYNOPSYS_UNCONNECTED__18, 
        SYNOPSYS_UNCONNECTED__19, SYNOPSYS_UNCONNECTED__20, 
        SYNOPSYS_UNCONNECTED__21, CMP_OUT[1:0]}), .CMP_Flag(CMP_Flag) );
  SHIFT_UNIT u_shift ( .A(A), .ALU_FUN(ALU_FUNC), .Shift_Enable(Shift_Enable), 
        .CLK(CLK), .RST(RST), .SHIFT_OUT({SYNOPSYS_UNCONNECTED__22, 
        SYNOPSYS_UNCONNECTED__23, SYNOPSYS_UNCONNECTED__24, 
        SYNOPSYS_UNCONNECTED__25, SYNOPSYS_UNCONNECTED__26, 
        SYNOPSYS_UNCONNECTED__27, SYNOPSYS_UNCONNECTED__28, SHIFT_OUT[8:0]}), 
        .SHIFT_Flag(SHIFT_Flag) );
  mux4x1 u_mux4x1 ( .ALU_FUN(ALU_FUNC), .Arith_OUT(Arith_OUT), .Logic_OUT({
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, Logic_OUT[7:0]}), 
        .CMP_OUT({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, CMP_OUT[1:0]}), .SHIFT_OUT({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, SHIFT_OUT[8:0]}), .SHIFT_Flag(SHIFT_Flag), 
        .CMP_Flag(CMP_Flag), .Logic_Flag(Logic_Flag), .Arith_Flag(Arith_Flag), 
        .alu_out(ALU_OUT), .out_valid(out_valid) );
endmodule


module clk_divider_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module clk_divider ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en;
  output o_div_clk;
  wire   N6, N7, N8, N9, N10, N11, N12, N16, N21, N22, N23, N24, N25, N26, N27,
         N28, N29, N30, N31, N32, N33, N34, N35, N36, n7, n8, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n1, n2, n3, n4, n5, n6, n9, n10,
         n11, n12, n13, n14, n15, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45;
  wire   [7:0] terminal;
  wire   [7:0] counter;

  clk_divider_DW01_inc_0 add_39 ( .A(counter), .SUM({N28, N27, N26, N25, N24, 
        N23, N22, N21}) );
  DFFRQX2M o_div_clk_reg ( .D(n23), .CK(i_ref_clk), .RN(i_rst_n), .Q(o_div_clk) );
  DFFRX1M reference_reg ( .D(n25), .CK(i_ref_clk), .RN(i_rst_n), .QN(n7) );
  DFFRQX2M \counter_reg[7]  ( .D(N36), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[7]) );
  DFFRQX2M \counter_reg[6]  ( .D(N35), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[6]) );
  DFFRQX2M \counter_reg[0]  ( .D(N29), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[0]) );
  DFFRQX2M \counter_reg[1]  ( .D(N30), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[1]) );
  DFFRQX2M \counter_reg[5]  ( .D(N34), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[5]) );
  DFFRQX2M \counter_reg[3]  ( .D(N32), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[3]) );
  DFFRQX2M \counter_reg[4]  ( .D(N33), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[4]) );
  DFFRQX2M \counter_reg[2]  ( .D(N31), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[2]) );
  DFFRX1M out_clk_reg ( .D(n24), .CK(i_ref_clk), .RN(i_rst_n), .QN(n8) );
  BUFX2M U3 ( .A(n19), .Y(n2) );
  BUFX2M U4 ( .A(n19), .Y(n1) );
  NAND2BX2M U5 ( .AN(N16), .B(n18), .Y(n19) );
  NOR2BX2M U6 ( .AN(N22), .B(n1), .Y(N30) );
  NOR2BX2M U7 ( .AN(N23), .B(n1), .Y(N31) );
  NOR2BX2M U8 ( .AN(N24), .B(n1), .Y(N32) );
  NOR2BX2M U9 ( .AN(N25), .B(n1), .Y(N33) );
  NOR2BX2M U10 ( .AN(N26), .B(n2), .Y(N34) );
  NOR2BX2M U11 ( .AN(N27), .B(n2), .Y(N35) );
  INVX2M U12 ( .A(terminal[2]), .Y(n37) );
  INVX2M U13 ( .A(terminal[3]), .Y(n36) );
  INVX2M U14 ( .A(terminal[4]), .Y(n35) );
  INVX2M U15 ( .A(counter[7]), .Y(n38) );
  AND2X2M U16 ( .A(N12), .B(n16), .Y(terminal[7]) );
  INVX2M U17 ( .A(counter[5]), .Y(n32) );
  INVX2M U18 ( .A(terminal[5]), .Y(n34) );
  INVX2M U19 ( .A(counter[4]), .Y(n31) );
  INVX2M U20 ( .A(counter[3]), .Y(n30) );
  INVX2M U21 ( .A(counter[2]), .Y(n29) );
  OAI2BB2X1M U22 ( .B0(n16), .B1(n45), .A0N(n45), .A1N(n16), .Y(terminal[0])
         );
  NAND2X2M U23 ( .A(i_div_ratio[0]), .B(n8), .Y(n16) );
  OAI2BB2X1M U24 ( .B0(n16), .B1(n43), .A0N(N7), .A1N(n16), .Y(terminal[2]) );
  OAI2BB2X1M U25 ( .B0(n16), .B1(n42), .A0N(N8), .A1N(n16), .Y(terminal[3]) );
  OAI2BB2X1M U26 ( .B0(n16), .B1(n44), .A0N(N6), .A1N(n16), .Y(terminal[1]) );
  OAI2BB2X1M U27 ( .B0(n17), .B1(n8), .A0N(o_div_clk), .A1N(n17), .Y(n23) );
  NAND2X2M U28 ( .A(N16), .B(n18), .Y(n17) );
  OAI21X2M U29 ( .A0(n8), .A1(n2), .B0(n20), .Y(n24) );
  OAI21X2M U30 ( .A0(n2), .A1(n7), .B0(n20), .Y(n25) );
  NAND3X2M U31 ( .A(n2), .B(n7), .C(n18), .Y(n20) );
  NOR2BX2M U32 ( .AN(N28), .B(n2), .Y(N36) );
  NOR2BX2M U33 ( .AN(N21), .B(n1), .Y(N29) );
  OAI2BB2X1M U34 ( .B0(n16), .B1(n40), .A0N(N10), .A1N(n16), .Y(terminal[5])
         );
  OAI2BB2X1M U35 ( .B0(n16), .B1(n41), .A0N(N9), .A1N(n16), .Y(terminal[4]) );
  OAI2BB2X1M U36 ( .B0(n16), .B1(n39), .A0N(N11), .A1N(n16), .Y(terminal[6])
         );
  INVX2M U37 ( .A(counter[1]), .Y(n28) );
  INVX2M U38 ( .A(counter[6]), .Y(n33) );
  OA21X2M U39 ( .A0(n21), .A1(n22), .B0(i_clk_en), .Y(n18) );
  NAND3X2M U40 ( .A(n44), .B(n43), .C(n45), .Y(n22) );
  NAND4X2M U41 ( .A(n42), .B(n41), .C(n40), .D(n39), .Y(n21) );
  INVX2M U42 ( .A(i_div_ratio[1]), .Y(n45) );
  INVX2M U43 ( .A(i_div_ratio[6]), .Y(n40) );
  INVX2M U44 ( .A(i_div_ratio[7]), .Y(n39) );
  INVX2M U45 ( .A(i_div_ratio[4]), .Y(n42) );
  INVX2M U46 ( .A(i_div_ratio[5]), .Y(n41) );
  INVX2M U47 ( .A(i_div_ratio[2]), .Y(n44) );
  INVX2M U48 ( .A(i_div_ratio[3]), .Y(n43) );
  NAND2BX1M U49 ( .AN(i_div_ratio[2]), .B(n45), .Y(n3) );
  OAI2BB1X1M U50 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n3), .Y(N6)
         );
  OR2X1M U51 ( .A(n3), .B(i_div_ratio[3]), .Y(n4) );
  OAI2BB1X1M U52 ( .A0N(n3), .A1N(i_div_ratio[3]), .B0(n4), .Y(N7) );
  OR2X1M U53 ( .A(n4), .B(i_div_ratio[4]), .Y(n5) );
  OAI2BB1X1M U54 ( .A0N(n4), .A1N(i_div_ratio[4]), .B0(n5), .Y(N8) );
  OR2X1M U55 ( .A(n5), .B(i_div_ratio[5]), .Y(n6) );
  OAI2BB1X1M U56 ( .A0N(n5), .A1N(i_div_ratio[5]), .B0(n6), .Y(N9) );
  XNOR2X1M U57 ( .A(i_div_ratio[6]), .B(n6), .Y(N10) );
  NOR3X1M U58 ( .A(i_div_ratio[6]), .B(i_div_ratio[7]), .C(n6), .Y(N12) );
  OAI21X1M U59 ( .A0(i_div_ratio[6]), .A1(n6), .B0(i_div_ratio[7]), .Y(n9) );
  NAND2BX1M U60 ( .AN(N12), .B(n9), .Y(N11) );
  NOR2X1M U61 ( .A(terminal[6]), .B(n33), .Y(n26) );
  AOI2BB1X1M U62 ( .A0N(terminal[1]), .A1N(n28), .B0(counter[0]), .Y(n10) );
  AOI222X1M U63 ( .A0(terminal[2]), .A1(n29), .B0(n10), .B1(terminal[0]), .C0(
        terminal[1]), .C1(n28), .Y(n11) );
  AOI221XLM U64 ( .A0(counter[3]), .A1(n36), .B0(counter[2]), .B1(n37), .C0(
        n11), .Y(n12) );
  AOI221XLM U65 ( .A0(terminal[4]), .A1(n31), .B0(terminal[3]), .B1(n30), .C0(
        n12), .Y(n13) );
  AOI221XLM U66 ( .A0(counter[5]), .A1(n34), .B0(counter[4]), .B1(n35), .C0(
        n13), .Y(n14) );
  AOI221XLM U67 ( .A0(terminal[6]), .A1(n33), .B0(terminal[5]), .B1(n32), .C0(
        n14), .Y(n15) );
  OAI2BB2X1M U68 ( .B0(n26), .B1(n15), .A0N(n38), .A1N(terminal[7]), .Y(n27)
         );
  OAI21X1M U69 ( .A0(terminal[7]), .A1(n38), .B0(n27), .Y(N16) );
endmodule


module fsm ( clk, rst, RX_IN, parity_en, par_err, start_glitch, stop_err, 
        bit_cnt, edge_cnt, prescale, enable, data_sam_en, strt_ck_en, 
        stop_ck_en, desr_en, par_ck_en, data_valid_reg, stop_error, 
        parity_error );
  input [5:0] bit_cnt;
  input [5:0] edge_cnt;
  input [5:0] prescale;
  input clk, rst, RX_IN, parity_en, par_err, start_glitch, stop_err;
  output enable, data_sam_en, strt_ck_en, stop_ck_en, desr_en, par_ck_en,
         data_valid_reg, stop_error, parity_error;
  wire   enable, N14, N15, N16, N17, N18, N19, N20, N21, N58, N59, N60, N61,
         N62, N63, N64, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, \add_84/carry[4] , \add_84/carry[3] ,
         \add_84/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n39, n40,
         n41, n42, n43, n44;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign data_sam_en = enable;
  assign data_valid_reg = 1'b0;

  DFFRQX2M parity_error_reg ( .D(n38), .CK(clk), .RN(rst), .Q(parity_error) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(rst), .Q(
        current_state[0]) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(rst), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(clk), .RN(rst), .Q(
        current_state[2]) );
  NOR3X2M U4 ( .A(current_state[1]), .B(current_state[2]), .C(n41), .Y(
        strt_ck_en) );
  NOR2X2M U5 ( .A(n40), .B(n24), .Y(n28) );
  NAND3X2M U6 ( .A(n42), .B(n40), .C(n35), .Y(enable) );
  AND2X2M U7 ( .A(stop_ck_en), .B(N21), .Y(n25) );
  AOI2BB2XLM U8 ( .B0(n29), .B1(n34), .A0N(N21), .A1N(n35), .Y(n26) );
  OA21X2M U9 ( .A0(N21), .A1(n40), .B0(n26), .Y(n30) );
  INVX2M U10 ( .A(N21), .Y(n24) );
  NOR2X2M U11 ( .A(strt_ck_en), .B(stop_ck_en), .Y(n35) );
  INVX2M U12 ( .A(n34), .Y(n42) );
  INVX2M U13 ( .A(par_ck_en), .Y(n40) );
  AND2X2M U14 ( .A(stop_err), .B(n25), .Y(stop_error) );
  NOR3X2M U15 ( .A(current_state[0]), .B(current_state[1]), .C(n44), .Y(
        stop_ck_en) );
  INVX2M U16 ( .A(current_state[2]), .Y(n44) );
  OAI221X1M U17 ( .A0(RX_IN), .A1(n33), .B0(n30), .B1(n41), .C0(n32), .Y(
        next_state[0]) );
  AOI31X2M U18 ( .A0(n43), .A1(n44), .A2(n41), .B0(n25), .Y(n33) );
  NAND4BXLM U19 ( .AN(bit_cnt[0]), .B(N21), .C(bit_cnt[3]), .D(n36), .Y(n29)
         );
  NOR4X1M U20 ( .A(bit_cnt[5]), .B(bit_cnt[4]), .C(bit_cnt[2]), .D(bit_cnt[1]), 
        .Y(n36) );
  OAI211X2M U21 ( .A0(n26), .A1(n44), .B0(n27), .C0(n23), .Y(next_state[2]) );
  INVX2M U22 ( .A(n28), .Y(n23) );
  OR3X2M U23 ( .A(parity_en), .B(n42), .C(n29), .Y(n27) );
  NAND3BX2M U24 ( .AN(n29), .B(n34), .C(parity_en), .Y(n32) );
  OAI21BX1M U25 ( .A0(n30), .A1(n43), .B0N(n31), .Y(next_state[1]) );
  OAI31X1M U26 ( .A0(n39), .A1(start_glitch), .A2(n24), .B0(n32), .Y(n31) );
  INVX2M U27 ( .A(strt_ck_en), .Y(n39) );
  AO22X1M U28 ( .A0(parity_error), .A1(n37), .B0(par_err), .B1(n28), .Y(n38)
         );
  AOI21X2M U29 ( .A0(n44), .A1(n43), .B0(n28), .Y(n37) );
  NOR3X2M U30 ( .A(current_state[0]), .B(current_state[2]), .C(n43), .Y(n34)
         );
  NOR3X2M U31 ( .A(n41), .B(current_state[2]), .C(n43), .Y(par_ck_en) );
  AND2X2M U32 ( .A(N64), .B(n34), .Y(desr_en) );
  INVX2M U33 ( .A(current_state[1]), .Y(n43) );
  INVX2M U34 ( .A(current_state[0]), .Y(n41) );
  ADDHX1M U35 ( .A(prescale[4]), .B(\add_84/carry[3] ), .CO(\add_84/carry[4] ), 
        .S(N61) );
  ADDHX1M U36 ( .A(prescale[3]), .B(\add_84/carry[2] ), .CO(\add_84/carry[3] ), 
        .S(N60) );
  ADDHX1M U37 ( .A(prescale[2]), .B(prescale[1]), .CO(\add_84/carry[2] ), .S(
        N59) );
  INVX2M U38 ( .A(prescale[0]), .Y(N14) );
  INVX2M U39 ( .A(prescale[1]), .Y(N58) );
  ADDHX1M U40 ( .A(prescale[5]), .B(\add_84/carry[4] ), .CO(N63), .S(N62) );
  NAND2BX1M U41 ( .AN(prescale[1]), .B(N14), .Y(n1) );
  OAI2BB1X1M U42 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n1), .Y(N15) );
  OR2X1M U43 ( .A(n1), .B(prescale[2]), .Y(n2) );
  OAI2BB1X1M U44 ( .A0N(n1), .A1N(prescale[2]), .B0(n2), .Y(N16) );
  OR2X1M U45 ( .A(n2), .B(prescale[3]), .Y(n3) );
  OAI2BB1X1M U46 ( .A0N(n2), .A1N(prescale[3]), .B0(n3), .Y(N17) );
  OR2X1M U47 ( .A(n3), .B(prescale[4]), .Y(n4) );
  OAI2BB1X1M U48 ( .A0N(n3), .A1N(prescale[4]), .B0(n4), .Y(N18) );
  NOR2X1M U49 ( .A(n4), .B(prescale[5]), .Y(N20) );
  AO21XLM U50 ( .A0(n4), .A1(prescale[5]), .B0(N20), .Y(N19) );
  NOR2BX1M U51 ( .AN(N14), .B(edge_cnt[0]), .Y(n5) );
  OAI2B2X1M U52 ( .A1N(edge_cnt[1]), .A0(n5), .B0(N15), .B1(n5), .Y(n9) );
  XNOR2X1M U53 ( .A(N19), .B(edge_cnt[5]), .Y(n8) );
  NOR2BX1M U54 ( .AN(edge_cnt[0]), .B(N14), .Y(n6) );
  OAI2B2X1M U55 ( .A1N(N15), .A0(n6), .B0(edge_cnt[1]), .B1(n6), .Y(n7) );
  NAND4BX1M U56 ( .AN(N20), .B(n9), .C(n8), .D(n7), .Y(n13) );
  CLKXOR2X2M U57 ( .A(N18), .B(edge_cnt[4]), .Y(n12) );
  CLKXOR2X2M U58 ( .A(N16), .B(edge_cnt[2]), .Y(n11) );
  CLKXOR2X2M U59 ( .A(N17), .B(edge_cnt[3]), .Y(n10) );
  NOR4X1M U60 ( .A(n13), .B(n12), .C(n11), .D(n10), .Y(N21) );
  NOR2BX1M U61 ( .AN(edge_cnt[0]), .B(N58), .Y(n14) );
  OAI2B2X1M U62 ( .A1N(N59), .A0(n14), .B0(edge_cnt[1]), .B1(n14), .Y(n18) );
  NOR2BX1M U63 ( .AN(N58), .B(edge_cnt[0]), .Y(n15) );
  OAI2B2X1M U64 ( .A1N(edge_cnt[1]), .A0(n15), .B0(N59), .B1(n15), .Y(n17) );
  XNOR2X1M U65 ( .A(N63), .B(edge_cnt[5]), .Y(n16) );
  NAND3X1M U66 ( .A(n18), .B(n17), .C(n16), .Y(n22) );
  CLKXOR2X2M U67 ( .A(N62), .B(edge_cnt[4]), .Y(n21) );
  CLKXOR2X2M U68 ( .A(N60), .B(edge_cnt[2]), .Y(n20) );
  CLKXOR2X2M U69 ( .A(N61), .B(edge_cnt[3]), .Y(n19) );
  NOR4X1M U70 ( .A(n22), .B(n21), .C(n20), .D(n19), .Y(N64) );
endmodule


module edge_bit_counter ( clk, rst, enable, prescale, par_en, bit_cnt, 
        edge_cnt );
  input [5:0] prescale;
  output [5:0] bit_cnt;
  output [5:0] edge_cnt;
  input clk, rst, enable, par_en;
  wire   N9, N10, N11, N12, N13, N14, N15, N16, N19, N21, N22, N23, N24, N25,
         N26, N33, N34, N35, N36, N37, N38, N52, N53, N54, N55, N56, N57, n8,
         n9, n10, n11, n12, n13, n14, n15, \add_30/carry[5] ,
         \add_30/carry[4] , \add_30/carry[3] , \add_30/carry[2] ,
         \add_26/carry[5] , \add_26/carry[4] , \add_26/carry[3] ,
         \add_26/carry[2] , n1, n2, n3, n4, n5, n6, n7, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25;

  DFFRQX2M \bit_cnt_reg[5]  ( .D(n15), .CK(clk), .RN(rst), .Q(bit_cnt[5]) );
  DFFRQX2M \bit_cnt_reg[0]  ( .D(n14), .CK(clk), .RN(rst), .Q(bit_cnt[0]) );
  DFFRQX2M \bit_cnt_reg[3]  ( .D(n11), .CK(clk), .RN(rst), .Q(bit_cnt[3]) );
  DFFRQX2M \bit_cnt_reg[4]  ( .D(n10), .CK(clk), .RN(rst), .Q(bit_cnt[4]) );
  DFFRQX2M \bit_cnt_reg[1]  ( .D(n13), .CK(clk), .RN(rst), .Q(bit_cnt[1]) );
  DFFRQX2M \bit_cnt_reg[2]  ( .D(n12), .CK(clk), .RN(rst), .Q(bit_cnt[2]) );
  DFFRQX2M \edge_cnt_reg[5]  ( .D(N57), .CK(clk), .RN(rst), .Q(edge_cnt[5]) );
  DFFRQX2M \edge_cnt_reg[4]  ( .D(N56), .CK(clk), .RN(rst), .Q(edge_cnt[4]) );
  DFFRQX2M \edge_cnt_reg[3]  ( .D(N55), .CK(clk), .RN(rst), .Q(edge_cnt[3]) );
  DFFRQX2M \edge_cnt_reg[2]  ( .D(N54), .CK(clk), .RN(rst), .Q(edge_cnt[2]) );
  DFFRQX2M \edge_cnt_reg[0]  ( .D(N52), .CK(clk), .RN(rst), .Q(edge_cnt[0]) );
  DFFRQX2M \edge_cnt_reg[1]  ( .D(N53), .CK(clk), .RN(rst), .Q(edge_cnt[1]) );
  AND2X2M U3 ( .A(N34), .B(n8), .Y(N53) );
  AND2X2M U4 ( .A(N35), .B(n8), .Y(N54) );
  AND2X2M U5 ( .A(N36), .B(n8), .Y(N55) );
  AND2X2M U6 ( .A(N37), .B(n8), .Y(N56) );
  NOR2BX2M U7 ( .AN(enable), .B(N16), .Y(n8) );
  NOR3BX2M U8 ( .AN(enable), .B(N19), .C(n8), .Y(n9) );
  AO22X1M U9 ( .A0(bit_cnt[4]), .A1(n8), .B0(N25), .B1(n9), .Y(n10) );
  AO22X1M U10 ( .A0(bit_cnt[3]), .A1(n8), .B0(N24), .B1(n9), .Y(n11) );
  AO22X1M U11 ( .A0(bit_cnt[2]), .A1(n8), .B0(N23), .B1(n9), .Y(n12) );
  AO22X1M U12 ( .A0(bit_cnt[1]), .A1(n8), .B0(N22), .B1(n9), .Y(n13) );
  AO22X1M U13 ( .A0(bit_cnt[0]), .A1(n8), .B0(N21), .B1(n9), .Y(n14) );
  INVX2M U14 ( .A(bit_cnt[0]), .Y(N21) );
  AO22X1M U15 ( .A0(bit_cnt[5]), .A1(n8), .B0(N26), .B1(n9), .Y(n15) );
  ADDHX1M U16 ( .A(bit_cnt[2]), .B(\add_26/carry[2] ), .CO(\add_26/carry[3] ), 
        .S(N23) );
  ADDHX1M U17 ( .A(bit_cnt[1]), .B(bit_cnt[0]), .CO(\add_26/carry[2] ), .S(N22) );
  ADDHX1M U18 ( .A(bit_cnt[3]), .B(\add_26/carry[3] ), .CO(\add_26/carry[4] ), 
        .S(N24) );
  ADDHX1M U19 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .CO(\add_30/carry[2] ), .S(
        N34) );
  ADDHX1M U20 ( .A(edge_cnt[2]), .B(\add_30/carry[2] ), .CO(\add_30/carry[3] ), 
        .S(N35) );
  ADDHX1M U21 ( .A(edge_cnt[3]), .B(\add_30/carry[3] ), .CO(\add_30/carry[4] ), 
        .S(N36) );
  AND2X2M U22 ( .A(N38), .B(n8), .Y(N57) );
  AND2X2M U23 ( .A(N33), .B(n8), .Y(N52) );
  INVX2M U24 ( .A(edge_cnt[0]), .Y(N33) );
  ADDHX1M U25 ( .A(bit_cnt[4]), .B(\add_26/carry[4] ), .CO(\add_26/carry[5] ), 
        .S(N25) );
  ADDHX1M U26 ( .A(edge_cnt[4]), .B(\add_30/carry[4] ), .CO(\add_30/carry[5] ), 
        .S(N37) );
  INVX2M U27 ( .A(prescale[0]), .Y(N9) );
  NAND2BX1M U28 ( .AN(prescale[1]), .B(N9), .Y(n1) );
  OAI2BB1X1M U29 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n1), .Y(N10) );
  OR2X1M U30 ( .A(n1), .B(prescale[2]), .Y(n2) );
  OAI2BB1X1M U31 ( .A0N(n1), .A1N(prescale[2]), .B0(n2), .Y(N11) );
  OR2X1M U32 ( .A(n2), .B(prescale[3]), .Y(n3) );
  OAI2BB1X1M U33 ( .A0N(n2), .A1N(prescale[3]), .B0(n3), .Y(N12) );
  OR2X1M U34 ( .A(n3), .B(prescale[4]), .Y(n4) );
  OAI2BB1X1M U35 ( .A0N(n3), .A1N(prescale[4]), .B0(n4), .Y(N13) );
  NOR2X1M U36 ( .A(n4), .B(prescale[5]), .Y(N15) );
  AO21XLM U37 ( .A0(n4), .A1(prescale[5]), .B0(N15), .Y(N14) );
  CLKXOR2X2M U38 ( .A(\add_26/carry[5] ), .B(bit_cnt[5]), .Y(N26) );
  CLKXOR2X2M U39 ( .A(\add_30/carry[5] ), .B(edge_cnt[5]), .Y(N38) );
  NOR2BX1M U40 ( .AN(N9), .B(edge_cnt[0]), .Y(n5) );
  OAI2B2X1M U41 ( .A1N(edge_cnt[1]), .A0(n5), .B0(N10), .B1(n5), .Y(n17) );
  XNOR2X1M U42 ( .A(N14), .B(edge_cnt[5]), .Y(n16) );
  NOR2BX1M U43 ( .AN(edge_cnt[0]), .B(N9), .Y(n6) );
  OAI2B2X1M U44 ( .A1N(N10), .A0(n6), .B0(edge_cnt[1]), .B1(n6), .Y(n7) );
  NAND4BX1M U45 ( .AN(N15), .B(n17), .C(n16), .D(n7), .Y(n21) );
  CLKXOR2X2M U46 ( .A(N13), .B(edge_cnt[4]), .Y(n20) );
  CLKXOR2X2M U47 ( .A(N11), .B(edge_cnt[2]), .Y(n19) );
  CLKXOR2X2M U48 ( .A(N12), .B(edge_cnt[3]), .Y(n18) );
  NOR4X1M U49 ( .A(n21), .B(n20), .C(n19), .D(n18), .Y(N16) );
  NAND2BX1M U50 ( .AN(bit_cnt[1]), .B(bit_cnt[0]), .Y(n23) );
  NAND2BX1M U51 ( .AN(bit_cnt[0]), .B(bit_cnt[1]), .Y(n22) );
  MXI2X1M U52 ( .A(n23), .B(n22), .S0(par_en), .Y(n24) );
  CLKNAND2X2M U53 ( .A(n24), .B(bit_cnt[3]), .Y(n25) );
  NOR4X1M U54 ( .A(n25), .B(bit_cnt[2]), .C(bit_cnt[5]), .D(bit_cnt[4]), .Y(
        N19) );
endmodule


module Data_Sampling ( clk, rst, RX_IN, Prescale, data_sample_en, edge_cnt, 
        Sampled_bit );
  input [5:0] Prescale;
  input [5:0] edge_cnt;
  input clk, rst, RX_IN, data_sample_en;
  output Sampled_bit;
  wire   N5, n3, n4, n1, n2, n5, n6, n7, n8, n9, n10;

  DFFRQX2M Sampled_bit_reg ( .D(n4), .CK(clk), .RN(rst), .Q(Sampled_bit) );
  AO2B2X2M U2 ( .B0(Sampled_bit), .B1(n3), .A0(RX_IN), .A1N(n3), .Y(n4) );
  NAND2X2M U3 ( .A(data_sample_en), .B(N5), .Y(n3) );
  NOR2BX1M U4 ( .AN(edge_cnt[0]), .B(Prescale[1]), .Y(n1) );
  OAI2B2X1M U5 ( .A1N(Prescale[2]), .A0(n1), .B0(edge_cnt[1]), .B1(n1), .Y(n6)
         );
  NOR2BX1M U6 ( .AN(Prescale[1]), .B(edge_cnt[0]), .Y(n2) );
  OAI2B2X1M U7 ( .A1N(edge_cnt[1]), .A0(n2), .B0(Prescale[2]), .B1(n2), .Y(n5)
         );
  NAND3BX1M U8 ( .AN(edge_cnt[5]), .B(n6), .C(n5), .Y(n10) );
  CLKXOR2X2M U9 ( .A(Prescale[5]), .B(edge_cnt[4]), .Y(n9) );
  CLKXOR2X2M U10 ( .A(Prescale[3]), .B(edge_cnt[2]), .Y(n8) );
  CLKXOR2X2M U11 ( .A(Prescale[4]), .B(edge_cnt[3]), .Y(n7) );
  NOR4X1M U12 ( .A(n10), .B(n9), .C(n8), .D(n7), .Y(N5) );
endmodule


module deserializer ( clk, rst, sampled_bit, deser_en, p_data );
  output [7:0] p_data;
  input clk, rst, sampled_bit, deser_en;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n1, n2, n3, n4, n5, n6, n7, n8
;
  tri   [7:0] p_data;

  DFFRQX2M \p_data_reg[0]  ( .D(n9), .CK(clk), .RN(rst), .Q(p_data[0]) );
  DFFRQX2M \p_data_reg[7]  ( .D(n16), .CK(clk), .RN(rst), .Q(p_data[7]) );
  DFFRQX2M \p_data_reg[6]  ( .D(n15), .CK(clk), .RN(rst), .Q(p_data[6]) );
  DFFRQX2M \p_data_reg[5]  ( .D(n14), .CK(clk), .RN(rst), .Q(p_data[5]) );
  DFFRQX2M \p_data_reg[4]  ( .D(n13), .CK(clk), .RN(rst), .Q(p_data[4]) );
  DFFRQX2M \p_data_reg[3]  ( .D(n12), .CK(clk), .RN(rst), .Q(p_data[3]) );
  DFFRQX2M \p_data_reg[2]  ( .D(n11), .CK(clk), .RN(rst), .Q(p_data[2]) );
  DFFRQX2M \p_data_reg[1]  ( .D(n10), .CK(clk), .RN(rst), .Q(p_data[1]) );
  OAI22X1M U2 ( .A0(n8), .A1(n6), .B0(deser_en), .B1(n7), .Y(n10) );
  OAI22X1M U3 ( .A0(n8), .A1(n5), .B0(deser_en), .B1(n6), .Y(n11) );
  OAI22X1M U4 ( .A0(n8), .A1(n4), .B0(deser_en), .B1(n5), .Y(n12) );
  OAI22X1M U5 ( .A0(n8), .A1(n3), .B0(deser_en), .B1(n4), .Y(n13) );
  OAI22X1M U6 ( .A0(n8), .A1(n2), .B0(deser_en), .B1(n3), .Y(n14) );
  OAI22X1M U7 ( .A0(n8), .A1(n1), .B0(deser_en), .B1(n2), .Y(n15) );
  INVX2M U8 ( .A(deser_en), .Y(n8) );
  OAI2BB2X1M U9 ( .B0(deser_en), .B1(n1), .A0N(sampled_bit), .A1N(deser_en), 
        .Y(n16) );
  OAI2BB2X1M U10 ( .B0(n8), .B1(n7), .A0N(p_data[0]), .A1N(n8), .Y(n9) );
  INVX2M U11 ( .A(p_data[1]), .Y(n7) );
  INVX2M U12 ( .A(p_data[7]), .Y(n1) );
  INVX2M U13 ( .A(p_data[2]), .Y(n6) );
  INVX2M U14 ( .A(p_data[3]), .Y(n5) );
  INVX2M U15 ( .A(p_data[4]), .Y(n4) );
  INVX2M U16 ( .A(p_data[5]), .Y(n3) );
  INVX2M U17 ( .A(p_data[6]), .Y(n2) );
endmodule


module start_check ( strt_check_en, Sampled_bit, strt_glitch );
  input strt_check_en, Sampled_bit;
  output strt_glitch;


  AND2X2M U2 ( .A(strt_check_en), .B(Sampled_bit), .Y(strt_glitch) );
endmodule


module parity_check ( clk, rst, Sampled_bit, data_en, clr, parity_check_en, 
        parity_typ, par_err );
  input clk, rst, Sampled_bit, data_en, clr, parity_check_en, parity_typ;
  output par_err;
  wire   data_parity, n1, n2, n3, n4;

  DFFRQX2M data_parity_reg ( .D(n4), .CK(clk), .RN(rst), .Q(data_parity) );
  NOR2BX2M U3 ( .AN(parity_check_en), .B(n1), .Y(par_err) );
  XNOR3X2M U4 ( .A(parity_typ), .B(data_parity), .C(Sampled_bit), .Y(n1) );
  NOR2X2M U5 ( .A(clr), .B(n2), .Y(n4) );
  CLKXOR2X2M U6 ( .A(n3), .B(data_parity), .Y(n2) );
  NAND2X2M U7 ( .A(data_en), .B(Sampled_bit), .Y(n3) );
endmodule


module Stop_check ( stop_check_en, Sampled_bit, stop_err );
  input stop_check_en, Sampled_bit;
  output stop_err;


  NOR2BX2M U2 ( .AN(stop_check_en), .B(Sampled_bit), .Y(stop_err) );
endmodule


module Top ( clk, rst, RX_IN, Prescale, parity_en, parity_typ, p_data, 
        data_valid_top, stop_error, parity_error );
  input [5:0] Prescale;
  output [7:0] p_data;
  input clk, rst, RX_IN, parity_en, parity_typ;
  output data_valid_top, stop_error, parity_error;
  wire   par_err, start_glitch, stop_err, enable, data_sam_en, strt_ck_en,
         stop_ck_en, desr_en, par_ck_en, Sampled_bit, n1, n2;
  wire   [5:0] bit_cnt;
  wire   [5:0] edge_cnt;
  tri   [7:0] p_data;
  tri   data_valid_top;
  assign data_valid_top = 1'b0;

  fsm u_fsm ( .clk(clk), .rst(n1), .RX_IN(RX_IN), .parity_en(parity_en), 
        .par_err(par_err), .start_glitch(start_glitch), .stop_err(stop_err), 
        .bit_cnt(bit_cnt), .edge_cnt(edge_cnt), .prescale(Prescale), .enable(
        enable), .data_sam_en(data_sam_en), .strt_ck_en(strt_ck_en), 
        .stop_ck_en(stop_ck_en), .desr_en(desr_en), .par_ck_en(par_ck_en), 
        .stop_error(stop_error), .parity_error(parity_error) );
  edge_bit_counter u_edge_bit_counter ( .clk(clk), .rst(n1), .enable(enable), 
        .prescale(Prescale), .par_en(parity_en), .bit_cnt(bit_cnt), .edge_cnt(
        edge_cnt) );
  Data_Sampling u_data_sampling ( .clk(clk), .rst(n1), .RX_IN(RX_IN), 
        .Prescale(Prescale), .data_sample_en(data_sam_en), .edge_cnt(edge_cnt), 
        .Sampled_bit(Sampled_bit) );
  deserializer u_deserializer ( .clk(clk), .rst(n1), .sampled_bit(Sampled_bit), 
        .deser_en(desr_en), .p_data(p_data) );
  start_check u_start_check ( .strt_check_en(strt_ck_en), .Sampled_bit(
        Sampled_bit), .strt_glitch(start_glitch) );
  parity_check u_par ( .clk(clk), .rst(n1), .Sampled_bit(Sampled_bit), 
        .data_en(desr_en), .clr(strt_ck_en), .parity_check_en(par_ck_en), 
        .parity_typ(parity_typ), .par_err(par_err) );
  Stop_check u_stop_check ( .stop_check_en(stop_ck_en), .Sampled_bit(
        Sampled_bit), .stop_err(stop_err) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(rst), .Y(n2) );
endmodule


module FIFO_WR ( wclk, wrst_n, winc, wq2_rptr, wfull, waddr, wptr );
  input [4:0] wq2_rptr;
  output [3:0] waddr;
  output [4:0] wptr;
  input wclk, wrst_n, winc;
  output wfull;
  wire   N0, full_ck, \eq_20/B[4] , \add_16/carry[4] , \add_16/carry[3] ,
         \add_16/carry[2] , \add_16/carry[1] , n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [4:0] wbin;
  wire   [4:0] wbin_next;
  wire   [3:0] ptr_cal;
  tri   wclk;

  DFFRX1M \wbin_reg[0]  ( .D(wbin_next[0]), .CK(wclk), .RN(wrst_n), .Q(wbin[0]) );
  DFFRX1M \waddr_reg[0]  ( .D(wbin_next[0]), .CK(wclk), .RN(wrst_n), .Q(
        waddr[0]) );
  DFFRX1M \wbin_reg[1]  ( .D(wbin_next[1]), .CK(wclk), .RN(wrst_n), .Q(wbin[1]) );
  DFFRX1M \waddr_reg[1]  ( .D(wbin_next[1]), .CK(wclk), .RN(wrst_n), .Q(
        waddr[1]) );
  DFFRX1M \wbin_reg[2]  ( .D(wbin_next[2]), .CK(wclk), .RN(wrst_n), .Q(wbin[2]) );
  DFFRX1M \waddr_reg[2]  ( .D(wbin_next[2]), .CK(wclk), .RN(wrst_n), .Q(
        waddr[2]) );
  DFFRX1M \wptr_reg[0]  ( .D(ptr_cal[0]), .CK(wclk), .RN(wrst_n), .Q(wptr[0])
         );
  DFFRX1M \wbin_reg[3]  ( .D(wbin_next[3]), .CK(wclk), .RN(wrst_n), .Q(wbin[3]) );
  DFFRX1M \waddr_reg[3]  ( .D(wbin_next[3]), .CK(wclk), .RN(wrst_n), .Q(
        waddr[3]) );
  DFFRX1M \wptr_reg[1]  ( .D(ptr_cal[1]), .CK(wclk), .RN(wrst_n), .Q(wptr[1])
         );
  DFFRX1M \wptr_reg[4]  ( .D(wbin_next[4]), .CK(wclk), .RN(wrst_n), .Q(wptr[4]) );
  DFFRX1M \wbin_reg[4]  ( .D(wbin_next[4]), .CK(wclk), .RN(wrst_n), .Q(wbin[4]) );
  DFFRX1M \wptr_reg[2]  ( .D(ptr_cal[2]), .CK(wclk), .RN(wrst_n), .Q(wptr[2])
         );
  DFFRX1M \wptr_reg[3]  ( .D(ptr_cal[3]), .CK(wclk), .RN(wrst_n), .Q(wptr[3])
         );
  DFFRX1M wfull_reg ( .D(full_ck), .CK(wclk), .RN(wrst_n), .Q(wfull) );
  CLKXOR2X2M U3 ( .A(wbin_next[2]), .B(wbin_next[1]), .Y(ptr_cal[1]) );
  CLKXOR2X2M U4 ( .A(wbin_next[4]), .B(wbin_next[3]), .Y(ptr_cal[3]) );
  CLKXOR2X2M U5 ( .A(wbin_next[3]), .B(wbin_next[2]), .Y(ptr_cal[2]) );
  CLKXOR2X2M U6 ( .A(wbin_next[1]), .B(wbin_next[0]), .Y(ptr_cal[0]) );
  NOR2BX2M U7 ( .AN(winc), .B(wfull), .Y(N0) );
  XNOR2X2M U8 ( .A(wq2_rptr[3]), .B(ptr_cal[3]), .Y(n6) );
  INVX2M U9 ( .A(wq2_rptr[4]), .Y(\eq_20/B[4] ) );
  CLKXOR2X2M U10 ( .A(wbin[4]), .B(\add_16/carry[4] ), .Y(wbin_next[4]) );
  AND2X1M U11 ( .A(wbin[3]), .B(\add_16/carry[3] ), .Y(\add_16/carry[4] ) );
  CLKXOR2X2M U12 ( .A(wbin[3]), .B(\add_16/carry[3] ), .Y(wbin_next[3]) );
  AND2X1M U13 ( .A(wbin[2]), .B(\add_16/carry[2] ), .Y(\add_16/carry[3] ) );
  CLKXOR2X2M U14 ( .A(wbin[2]), .B(\add_16/carry[2] ), .Y(wbin_next[2]) );
  AND2X1M U15 ( .A(wbin[1]), .B(\add_16/carry[1] ), .Y(\add_16/carry[2] ) );
  CLKXOR2X2M U16 ( .A(wbin[1]), .B(\add_16/carry[1] ), .Y(wbin_next[1]) );
  AND2X1M U17 ( .A(N0), .B(wbin[0]), .Y(\add_16/carry[1] ) );
  CLKXOR2X2M U18 ( .A(N0), .B(wbin[0]), .Y(wbin_next[0]) );
  CLKXOR2X2M U19 ( .A(wq2_rptr[2]), .B(ptr_cal[2]), .Y(n8) );
  NOR2BX1M U20 ( .AN(wq2_rptr[0]), .B(ptr_cal[0]), .Y(n1) );
  OAI2B2X1M U21 ( .A1N(ptr_cal[1]), .A0(n1), .B0(wq2_rptr[1]), .B1(n1), .Y(n4)
         );
  NOR2BX1M U22 ( .AN(ptr_cal[0]), .B(wq2_rptr[0]), .Y(n2) );
  OAI2B2X1M U23 ( .A1N(wq2_rptr[1]), .A0(n2), .B0(ptr_cal[1]), .B1(n2), .Y(n3)
         );
  CLKNAND2X2M U24 ( .A(n4), .B(n3), .Y(n7) );
  CLKXOR2X2M U25 ( .A(\eq_20/B[4] ), .B(wbin_next[4]), .Y(n5) );
  NOR4X1M U26 ( .A(n8), .B(n7), .C(n6), .D(n5), .Y(full_ck) );
endmodule


module FIFO_RD ( rclk, rrst_n, rinc, rq2_wptr, rempty, raddr, rptr );
  input [4:0] rq2_wptr;
  output [3:0] raddr;
  output [4:0] rptr;
  input rclk, rrst_n, rinc;
  output rempty;
  wire   N0, empty_ck, \add_16/carry[4] , \add_16/carry[3] , \add_16/carry[2] ,
         \add_16/carry[1] , n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [4:0] rbin;
  wire   [4:0] rbin_next;
  wire   [3:0] ptr_cal;

  DFFRQX2M \rbin_reg[4]  ( .D(rbin_next[4]), .CK(rclk), .RN(rrst_n), .Q(
        rbin[4]) );
  DFFRQX2M \rbin_reg[1]  ( .D(rbin_next[1]), .CK(rclk), .RN(rrst_n), .Q(
        rbin[1]) );
  DFFRQX2M \rbin_reg[2]  ( .D(rbin_next[2]), .CK(rclk), .RN(rrst_n), .Q(
        rbin[2]) );
  DFFRQX2M \rbin_reg[3]  ( .D(rbin_next[3]), .CK(rclk), .RN(rrst_n), .Q(
        rbin[3]) );
  DFFRQX2M \rbin_reg[0]  ( .D(rbin_next[0]), .CK(rclk), .RN(rrst_n), .Q(
        rbin[0]) );
  DFFRQX2M \raddr_reg[3]  ( .D(rbin_next[3]), .CK(rclk), .RN(rrst_n), .Q(
        raddr[3]) );
  DFFRQX2M \raddr_reg[2]  ( .D(rbin_next[2]), .CK(rclk), .RN(rrst_n), .Q(
        raddr[2]) );
  DFFSQX2M rempty_reg ( .D(empty_ck), .CK(rclk), .SN(rrst_n), .Q(rempty) );
  DFFRQX2M \raddr_reg[1]  ( .D(rbin_next[1]), .CK(rclk), .RN(rrst_n), .Q(
        raddr[1]) );
  DFFRQX2M \raddr_reg[0]  ( .D(rbin_next[0]), .CK(rclk), .RN(rrst_n), .Q(
        raddr[0]) );
  DFFRQX2M \rptr_reg[4]  ( .D(rbin_next[4]), .CK(rclk), .RN(rrst_n), .Q(
        rptr[4]) );
  DFFRQX2M \rptr_reg[0]  ( .D(ptr_cal[0]), .CK(rclk), .RN(rrst_n), .Q(rptr[0])
         );
  DFFRQX2M \rptr_reg[1]  ( .D(ptr_cal[1]), .CK(rclk), .RN(rrst_n), .Q(rptr[1])
         );
  DFFRQX2M \rptr_reg[2]  ( .D(ptr_cal[2]), .CK(rclk), .RN(rrst_n), .Q(rptr[2])
         );
  DFFRQX2M \rptr_reg[3]  ( .D(ptr_cal[3]), .CK(rclk), .RN(rrst_n), .Q(rptr[3])
         );
  CLKXOR2X2M U3 ( .A(rbin_next[4]), .B(rbin_next[3]), .Y(ptr_cal[3]) );
  CLKXOR2X2M U4 ( .A(rbin_next[3]), .B(rbin_next[2]), .Y(ptr_cal[2]) );
  CLKXOR2X2M U5 ( .A(rbin_next[2]), .B(rbin_next[1]), .Y(ptr_cal[1]) );
  CLKXOR2X2M U6 ( .A(rbin_next[1]), .B(rbin_next[0]), .Y(ptr_cal[0]) );
  NOR2BX2M U7 ( .AN(rinc), .B(rempty), .Y(N0) );
  CLKXOR2X2M U8 ( .A(rbin[4]), .B(\add_16/carry[4] ), .Y(rbin_next[4]) );
  AND2X1M U9 ( .A(rbin[3]), .B(\add_16/carry[3] ), .Y(\add_16/carry[4] ) );
  CLKXOR2X2M U10 ( .A(rbin[3]), .B(\add_16/carry[3] ), .Y(rbin_next[3]) );
  AND2X1M U11 ( .A(rbin[2]), .B(\add_16/carry[2] ), .Y(\add_16/carry[3] ) );
  CLKXOR2X2M U12 ( .A(rbin[2]), .B(\add_16/carry[2] ), .Y(rbin_next[2]) );
  AND2X1M U13 ( .A(rbin[1]), .B(\add_16/carry[1] ), .Y(\add_16/carry[2] ) );
  CLKXOR2X2M U14 ( .A(rbin[1]), .B(\add_16/carry[1] ), .Y(rbin_next[1]) );
  AND2X1M U15 ( .A(N0), .B(rbin[0]), .Y(\add_16/carry[1] ) );
  CLKXOR2X2M U16 ( .A(N0), .B(rbin[0]), .Y(rbin_next[0]) );
  CLKXOR2X2M U17 ( .A(rq2_wptr[2]), .B(ptr_cal[2]), .Y(n8) );
  NOR2BX1M U18 ( .AN(rq2_wptr[0]), .B(ptr_cal[0]), .Y(n1) );
  OAI2B2X1M U19 ( .A1N(ptr_cal[1]), .A0(n1), .B0(rq2_wptr[1]), .B1(n1), .Y(n4)
         );
  NOR2BX1M U20 ( .AN(ptr_cal[0]), .B(rq2_wptr[0]), .Y(n2) );
  OAI2B2X1M U21 ( .A1N(rq2_wptr[1]), .A0(n2), .B0(ptr_cal[1]), .B1(n2), .Y(n3)
         );
  CLKNAND2X2M U22 ( .A(n4), .B(n3), .Y(n7) );
  CLKXOR2X2M U23 ( .A(rq2_wptr[3]), .B(ptr_cal[3]), .Y(n6) );
  CLKXOR2X2M U24 ( .A(rq2_wptr[4]), .B(rbin_next[4]), .Y(n5) );
  NOR4X1M U25 ( .A(n8), .B(n7), .C(n6), .D(n5), .Y(empty_ck) );
endmodule


module DF_SYNC_0 ( ptr_in, clk, rst_n, ptr_out );
  input [4:0] ptr_in;
  output [4:0] ptr_out;
  input clk, rst_n;
  wire   \FF[0][4] , \FF[0][3] , \FF[0][2] , \FF[0][1] , \FF[0][0] ;
  tri   clk;

  DFFRX1M \FF_reg[1][4]  ( .D(\FF[0][4] ), .CK(clk), .RN(rst_n), .Q(ptr_out[4]) );
  DFFRX1M \FF_reg[1][3]  ( .D(\FF[0][3] ), .CK(clk), .RN(rst_n), .Q(ptr_out[3]) );
  DFFRX1M \FF_reg[1][2]  ( .D(\FF[0][2] ), .CK(clk), .RN(rst_n), .Q(ptr_out[2]) );
  DFFRX1M \FF_reg[1][1]  ( .D(\FF[0][1] ), .CK(clk), .RN(rst_n), .Q(ptr_out[1]) );
  DFFRX1M \FF_reg[1][0]  ( .D(\FF[0][0] ), .CK(clk), .RN(rst_n), .Q(ptr_out[0]) );
  DFFRQX2M \FF_reg[0][4]  ( .D(ptr_in[4]), .CK(clk), .RN(rst_n), .Q(\FF[0][4] ) );
  DFFRQX2M \FF_reg[0][3]  ( .D(ptr_in[3]), .CK(clk), .RN(rst_n), .Q(\FF[0][3] ) );
  DFFRQX2M \FF_reg[0][2]  ( .D(ptr_in[2]), .CK(clk), .RN(rst_n), .Q(\FF[0][2] ) );
  DFFRQX2M \FF_reg[0][1]  ( .D(ptr_in[1]), .CK(clk), .RN(rst_n), .Q(\FF[0][1] ) );
  DFFRQX2M \FF_reg[0][0]  ( .D(ptr_in[0]), .CK(clk), .RN(rst_n), .Q(\FF[0][0] ) );
endmodule


module DF_SYNC_1 ( ptr_in, clk, rst_n, ptr_out );
  input [4:0] ptr_in;
  output [4:0] ptr_out;
  input clk, rst_n;
  wire   \FF[0][4] , \FF[0][3] , \FF[0][2] , \FF[0][1] , \FF[0][0] ;

  DFFRQX2M \FF_reg[1][0]  ( .D(\FF[0][0] ), .CK(clk), .RN(rst_n), .Q(
        ptr_out[0]) );
  DFFRQX2M \FF_reg[1][1]  ( .D(\FF[0][1] ), .CK(clk), .RN(rst_n), .Q(
        ptr_out[1]) );
  DFFRQX2M \FF_reg[1][4]  ( .D(\FF[0][4] ), .CK(clk), .RN(rst_n), .Q(
        ptr_out[4]) );
  DFFRQX2M \FF_reg[1][3]  ( .D(\FF[0][3] ), .CK(clk), .RN(rst_n), .Q(
        ptr_out[3]) );
  DFFRQX2M \FF_reg[1][2]  ( .D(\FF[0][2] ), .CK(clk), .RN(rst_n), .Q(
        ptr_out[2]) );
  DFFRQX2M \FF_reg[0][4]  ( .D(ptr_in[4]), .CK(clk), .RN(rst_n), .Q(\FF[0][4] ) );
  DFFRQX2M \FF_reg[0][3]  ( .D(ptr_in[3]), .CK(clk), .RN(rst_n), .Q(\FF[0][3] ) );
  DFFRQX2M \FF_reg[0][2]  ( .D(ptr_in[2]), .CK(clk), .RN(rst_n), .Q(\FF[0][2] ) );
  DFFRQX2M \FF_reg[0][1]  ( .D(ptr_in[1]), .CK(clk), .RN(rst_n), .Q(\FF[0][1] ) );
  DFFRQX2M \FF_reg[0][0]  ( .D(ptr_in[0]), .CK(clk), .RN(rst_n), .Q(\FF[0][0] ) );
endmodule


module FIFO_MEM_CNTRL ( wdata, winc, wfull, waddr, raddr, wclk, rdata );
  input [7:0] wdata;
  input [3:0] waddr;
  input [3:0] raddr;
  output [7:0] rdata;
  input winc, wfull, wclk;
  wire   N10, N11, N12, N13, \mem[0][7] , \mem[0][6] , \mem[0][5] ,
         \mem[0][4] , \mem[0][3] , \mem[0][2] , \mem[0][1] , \mem[0][0] ,
         \mem[1][7] , \mem[1][6] , \mem[1][5] , \mem[1][4] , \mem[1][3] ,
         \mem[1][2] , \mem[1][1] , \mem[1][0] , \mem[2][7] , \mem[2][6] ,
         \mem[2][5] , \mem[2][4] , \mem[2][3] , \mem[2][2] , \mem[2][1] ,
         \mem[2][0] , \mem[3][7] , \mem[3][6] , \mem[3][5] , \mem[3][4] ,
         \mem[3][3] , \mem[3][2] , \mem[3][1] , \mem[3][0] , \mem[4][7] ,
         \mem[4][6] , \mem[4][5] , \mem[4][4] , \mem[4][3] , \mem[4][2] ,
         \mem[4][1] , \mem[4][0] , \mem[5][7] , \mem[5][6] , \mem[5][5] ,
         \mem[5][4] , \mem[5][3] , \mem[5][2] , \mem[5][1] , \mem[5][0] ,
         \mem[6][7] , \mem[6][6] , \mem[6][5] , \mem[6][4] , \mem[6][3] ,
         \mem[6][2] , \mem[6][1] , \mem[6][0] , \mem[7][7] , \mem[7][6] ,
         \mem[7][5] , \mem[7][4] , \mem[7][3] , \mem[7][2] , \mem[7][1] ,
         \mem[7][0] , \mem[8][7] , \mem[8][6] , \mem[8][5] , \mem[8][4] ,
         \mem[8][3] , \mem[8][2] , \mem[8][1] , \mem[8][0] , \mem[9][7] ,
         \mem[9][6] , \mem[9][5] , \mem[9][4] , \mem[9][3] , \mem[9][2] ,
         \mem[9][1] , \mem[9][0] , \mem[10][7] , \mem[10][6] , \mem[10][5] ,
         \mem[10][4] , \mem[10][3] , \mem[10][2] , \mem[10][1] , \mem[10][0] ,
         \mem[11][7] , \mem[11][6] , \mem[11][5] , \mem[11][4] , \mem[11][3] ,
         \mem[11][2] , \mem[11][1] , \mem[11][0] , \mem[12][7] , \mem[12][6] ,
         \mem[12][5] , \mem[12][4] , \mem[12][3] , \mem[12][2] , \mem[12][1] ,
         \mem[12][0] , \mem[13][7] , \mem[13][6] , \mem[13][5] , \mem[13][4] ,
         \mem[13][3] , \mem[13][2] , \mem[13][1] , \mem[13][0] , \mem[14][7] ,
         \mem[14][6] , \mem[14][5] , \mem[14][4] , \mem[14][3] , \mem[14][2] ,
         \mem[14][1] , \mem[14][0] , \mem[15][7] , \mem[15][6] , \mem[15][5] ,
         \mem[15][4] , \mem[15][3] , \mem[15][2] , \mem[15][1] , \mem[15][0] ,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280;
  tri   wclk;
  assign N10 = raddr[0];
  assign N11 = raddr[1];
  assign N12 = raddr[2];
  assign N13 = raddr[3];

  DFFQX2M \mem_reg[1][7]  ( .D(n158), .CK(wclk), .Q(\mem[1][7] ) );
  DFFQX2M \mem_reg[1][6]  ( .D(n157), .CK(wclk), .Q(\mem[1][6] ) );
  DFFQX2M \mem_reg[1][5]  ( .D(n156), .CK(wclk), .Q(\mem[1][5] ) );
  DFFQX2M \mem_reg[1][4]  ( .D(n155), .CK(wclk), .Q(\mem[1][4] ) );
  DFFQX2M \mem_reg[1][3]  ( .D(n154), .CK(wclk), .Q(\mem[1][3] ) );
  DFFQX2M \mem_reg[1][2]  ( .D(n153), .CK(wclk), .Q(\mem[1][2] ) );
  DFFQX2M \mem_reg[1][1]  ( .D(n152), .CK(wclk), .Q(\mem[1][1] ) );
  DFFQX2M \mem_reg[1][0]  ( .D(n151), .CK(wclk), .Q(\mem[1][0] ) );
  DFFQX2M \mem_reg[3][7]  ( .D(n142), .CK(wclk), .Q(\mem[3][7] ) );
  DFFQX2M \mem_reg[3][6]  ( .D(n141), .CK(wclk), .Q(\mem[3][6] ) );
  DFFQX2M \mem_reg[3][5]  ( .D(n140), .CK(wclk), .Q(\mem[3][5] ) );
  DFFQX2M \mem_reg[3][4]  ( .D(n139), .CK(wclk), .Q(\mem[3][4] ) );
  DFFQX2M \mem_reg[3][3]  ( .D(n138), .CK(wclk), .Q(\mem[3][3] ) );
  DFFQX2M \mem_reg[3][2]  ( .D(n137), .CK(wclk), .Q(\mem[3][2] ) );
  DFFQX2M \mem_reg[3][1]  ( .D(n136), .CK(wclk), .Q(\mem[3][1] ) );
  DFFQX2M \mem_reg[3][0]  ( .D(n135), .CK(wclk), .Q(\mem[3][0] ) );
  DFFQX2M \mem_reg[5][7]  ( .D(n126), .CK(wclk), .Q(\mem[5][7] ) );
  DFFQX2M \mem_reg[5][6]  ( .D(n125), .CK(wclk), .Q(\mem[5][6] ) );
  DFFQX2M \mem_reg[5][5]  ( .D(n124), .CK(wclk), .Q(\mem[5][5] ) );
  DFFQX2M \mem_reg[5][4]  ( .D(n123), .CK(wclk), .Q(\mem[5][4] ) );
  DFFQX2M \mem_reg[5][3]  ( .D(n122), .CK(wclk), .Q(\mem[5][3] ) );
  DFFQX2M \mem_reg[5][2]  ( .D(n121), .CK(wclk), .Q(\mem[5][2] ) );
  DFFQX2M \mem_reg[5][1]  ( .D(n120), .CK(wclk), .Q(\mem[5][1] ) );
  DFFQX2M \mem_reg[5][0]  ( .D(n119), .CK(wclk), .Q(\mem[5][0] ) );
  DFFQX2M \mem_reg[7][7]  ( .D(n110), .CK(wclk), .Q(\mem[7][7] ) );
  DFFQX2M \mem_reg[7][6]  ( .D(n109), .CK(wclk), .Q(\mem[7][6] ) );
  DFFQX2M \mem_reg[7][5]  ( .D(n108), .CK(wclk), .Q(\mem[7][5] ) );
  DFFQX2M \mem_reg[7][4]  ( .D(n107), .CK(wclk), .Q(\mem[7][4] ) );
  DFFQX2M \mem_reg[7][3]  ( .D(n106), .CK(wclk), .Q(\mem[7][3] ) );
  DFFQX2M \mem_reg[7][2]  ( .D(n105), .CK(wclk), .Q(\mem[7][2] ) );
  DFFQX2M \mem_reg[7][1]  ( .D(n104), .CK(wclk), .Q(\mem[7][1] ) );
  DFFQX2M \mem_reg[7][0]  ( .D(n103), .CK(wclk), .Q(\mem[7][0] ) );
  DFFQX2M \mem_reg[9][7]  ( .D(n94), .CK(wclk), .Q(\mem[9][7] ) );
  DFFQX2M \mem_reg[9][6]  ( .D(n93), .CK(wclk), .Q(\mem[9][6] ) );
  DFFQX2M \mem_reg[9][5]  ( .D(n92), .CK(wclk), .Q(\mem[9][5] ) );
  DFFQX2M \mem_reg[9][4]  ( .D(n91), .CK(wclk), .Q(\mem[9][4] ) );
  DFFQX2M \mem_reg[9][3]  ( .D(n90), .CK(wclk), .Q(\mem[9][3] ) );
  DFFQX2M \mem_reg[9][2]  ( .D(n89), .CK(wclk), .Q(\mem[9][2] ) );
  DFFQX2M \mem_reg[9][1]  ( .D(n88), .CK(wclk), .Q(\mem[9][1] ) );
  DFFQX2M \mem_reg[9][0]  ( .D(n87), .CK(wclk), .Q(\mem[9][0] ) );
  DFFQX2M \mem_reg[11][7]  ( .D(n78), .CK(wclk), .Q(\mem[11][7] ) );
  DFFQX2M \mem_reg[11][6]  ( .D(n77), .CK(wclk), .Q(\mem[11][6] ) );
  DFFQX2M \mem_reg[11][5]  ( .D(n76), .CK(wclk), .Q(\mem[11][5] ) );
  DFFQX2M \mem_reg[11][4]  ( .D(n75), .CK(wclk), .Q(\mem[11][4] ) );
  DFFQX2M \mem_reg[11][3]  ( .D(n74), .CK(wclk), .Q(\mem[11][3] ) );
  DFFQX2M \mem_reg[11][2]  ( .D(n73), .CK(wclk), .Q(\mem[11][2] ) );
  DFFQX2M \mem_reg[11][1]  ( .D(n72), .CK(wclk), .Q(\mem[11][1] ) );
  DFFQX2M \mem_reg[11][0]  ( .D(n71), .CK(wclk), .Q(\mem[11][0] ) );
  DFFQX2M \mem_reg[13][7]  ( .D(n62), .CK(wclk), .Q(\mem[13][7] ) );
  DFFQX2M \mem_reg[13][6]  ( .D(n61), .CK(wclk), .Q(\mem[13][6] ) );
  DFFQX2M \mem_reg[13][5]  ( .D(n60), .CK(wclk), .Q(\mem[13][5] ) );
  DFFQX2M \mem_reg[13][4]  ( .D(n59), .CK(wclk), .Q(\mem[13][4] ) );
  DFFQX2M \mem_reg[13][3]  ( .D(n58), .CK(wclk), .Q(\mem[13][3] ) );
  DFFQX2M \mem_reg[13][2]  ( .D(n57), .CK(wclk), .Q(\mem[13][2] ) );
  DFFQX2M \mem_reg[13][1]  ( .D(n56), .CK(wclk), .Q(\mem[13][1] ) );
  DFFQX2M \mem_reg[13][0]  ( .D(n55), .CK(wclk), .Q(\mem[13][0] ) );
  DFFQX2M \mem_reg[15][7]  ( .D(n46), .CK(wclk), .Q(\mem[15][7] ) );
  DFFQX2M \mem_reg[15][6]  ( .D(n45), .CK(wclk), .Q(\mem[15][6] ) );
  DFFQX2M \mem_reg[15][5]  ( .D(n44), .CK(wclk), .Q(\mem[15][5] ) );
  DFFQX2M \mem_reg[15][4]  ( .D(n43), .CK(wclk), .Q(\mem[15][4] ) );
  DFFQX2M \mem_reg[15][3]  ( .D(n42), .CK(wclk), .Q(\mem[15][3] ) );
  DFFQX2M \mem_reg[15][2]  ( .D(n41), .CK(wclk), .Q(\mem[15][2] ) );
  DFFQX2M \mem_reg[15][1]  ( .D(n40), .CK(wclk), .Q(\mem[15][1] ) );
  DFFQX2M \mem_reg[15][0]  ( .D(n39), .CK(wclk), .Q(\mem[15][0] ) );
  DFFQX2M \mem_reg[0][7]  ( .D(n166), .CK(wclk), .Q(\mem[0][7] ) );
  DFFQX2M \mem_reg[0][6]  ( .D(n165), .CK(wclk), .Q(\mem[0][6] ) );
  DFFQX2M \mem_reg[0][5]  ( .D(n164), .CK(wclk), .Q(\mem[0][5] ) );
  DFFQX2M \mem_reg[0][4]  ( .D(n163), .CK(wclk), .Q(\mem[0][4] ) );
  DFFQX2M \mem_reg[0][3]  ( .D(n162), .CK(wclk), .Q(\mem[0][3] ) );
  DFFQX2M \mem_reg[0][2]  ( .D(n161), .CK(wclk), .Q(\mem[0][2] ) );
  DFFQX2M \mem_reg[0][1]  ( .D(n160), .CK(wclk), .Q(\mem[0][1] ) );
  DFFQX2M \mem_reg[0][0]  ( .D(n159), .CK(wclk), .Q(\mem[0][0] ) );
  DFFQX2M \mem_reg[2][7]  ( .D(n150), .CK(wclk), .Q(\mem[2][7] ) );
  DFFQX2M \mem_reg[2][6]  ( .D(n149), .CK(wclk), .Q(\mem[2][6] ) );
  DFFQX2M \mem_reg[2][5]  ( .D(n148), .CK(wclk), .Q(\mem[2][5] ) );
  DFFQX2M \mem_reg[2][4]  ( .D(n147), .CK(wclk), .Q(\mem[2][4] ) );
  DFFQX2M \mem_reg[2][3]  ( .D(n146), .CK(wclk), .Q(\mem[2][3] ) );
  DFFQX2M \mem_reg[2][2]  ( .D(n145), .CK(wclk), .Q(\mem[2][2] ) );
  DFFQX2M \mem_reg[2][1]  ( .D(n144), .CK(wclk), .Q(\mem[2][1] ) );
  DFFQX2M \mem_reg[2][0]  ( .D(n143), .CK(wclk), .Q(\mem[2][0] ) );
  DFFQX2M \mem_reg[4][7]  ( .D(n134), .CK(wclk), .Q(\mem[4][7] ) );
  DFFQX2M \mem_reg[4][6]  ( .D(n133), .CK(wclk), .Q(\mem[4][6] ) );
  DFFQX2M \mem_reg[4][5]  ( .D(n132), .CK(wclk), .Q(\mem[4][5] ) );
  DFFQX2M \mem_reg[4][4]  ( .D(n131), .CK(wclk), .Q(\mem[4][4] ) );
  DFFQX2M \mem_reg[4][3]  ( .D(n130), .CK(wclk), .Q(\mem[4][3] ) );
  DFFQX2M \mem_reg[4][2]  ( .D(n129), .CK(wclk), .Q(\mem[4][2] ) );
  DFFQX2M \mem_reg[4][1]  ( .D(n128), .CK(wclk), .Q(\mem[4][1] ) );
  DFFQX2M \mem_reg[4][0]  ( .D(n127), .CK(wclk), .Q(\mem[4][0] ) );
  DFFQX2M \mem_reg[6][7]  ( .D(n118), .CK(wclk), .Q(\mem[6][7] ) );
  DFFQX2M \mem_reg[6][6]  ( .D(n117), .CK(wclk), .Q(\mem[6][6] ) );
  DFFQX2M \mem_reg[6][5]  ( .D(n116), .CK(wclk), .Q(\mem[6][5] ) );
  DFFQX2M \mem_reg[6][4]  ( .D(n115), .CK(wclk), .Q(\mem[6][4] ) );
  DFFQX2M \mem_reg[6][3]  ( .D(n114), .CK(wclk), .Q(\mem[6][3] ) );
  DFFQX2M \mem_reg[6][2]  ( .D(n113), .CK(wclk), .Q(\mem[6][2] ) );
  DFFQX2M \mem_reg[6][1]  ( .D(n112), .CK(wclk), .Q(\mem[6][1] ) );
  DFFQX2M \mem_reg[6][0]  ( .D(n111), .CK(wclk), .Q(\mem[6][0] ) );
  DFFQX2M \mem_reg[8][7]  ( .D(n102), .CK(wclk), .Q(\mem[8][7] ) );
  DFFQX2M \mem_reg[8][6]  ( .D(n101), .CK(wclk), .Q(\mem[8][6] ) );
  DFFQX2M \mem_reg[8][5]  ( .D(n100), .CK(wclk), .Q(\mem[8][5] ) );
  DFFQX2M \mem_reg[8][4]  ( .D(n99), .CK(wclk), .Q(\mem[8][4] ) );
  DFFQX2M \mem_reg[8][3]  ( .D(n98), .CK(wclk), .Q(\mem[8][3] ) );
  DFFQX2M \mem_reg[8][2]  ( .D(n97), .CK(wclk), .Q(\mem[8][2] ) );
  DFFQX2M \mem_reg[8][1]  ( .D(n96), .CK(wclk), .Q(\mem[8][1] ) );
  DFFQX2M \mem_reg[8][0]  ( .D(n95), .CK(wclk), .Q(\mem[8][0] ) );
  DFFQX2M \mem_reg[10][7]  ( .D(n86), .CK(wclk), .Q(\mem[10][7] ) );
  DFFQX2M \mem_reg[10][6]  ( .D(n85), .CK(wclk), .Q(\mem[10][6] ) );
  DFFQX2M \mem_reg[10][5]  ( .D(n84), .CK(wclk), .Q(\mem[10][5] ) );
  DFFQX2M \mem_reg[10][4]  ( .D(n83), .CK(wclk), .Q(\mem[10][4] ) );
  DFFQX2M \mem_reg[10][3]  ( .D(n82), .CK(wclk), .Q(\mem[10][3] ) );
  DFFQX2M \mem_reg[10][2]  ( .D(n81), .CK(wclk), .Q(\mem[10][2] ) );
  DFFQX2M \mem_reg[10][1]  ( .D(n80), .CK(wclk), .Q(\mem[10][1] ) );
  DFFQX2M \mem_reg[10][0]  ( .D(n79), .CK(wclk), .Q(\mem[10][0] ) );
  DFFQX2M \mem_reg[12][7]  ( .D(n70), .CK(wclk), .Q(\mem[12][7] ) );
  DFFQX2M \mem_reg[12][6]  ( .D(n69), .CK(wclk), .Q(\mem[12][6] ) );
  DFFQX2M \mem_reg[12][5]  ( .D(n68), .CK(wclk), .Q(\mem[12][5] ) );
  DFFQX2M \mem_reg[12][4]  ( .D(n67), .CK(wclk), .Q(\mem[12][4] ) );
  DFFQX2M \mem_reg[12][3]  ( .D(n66), .CK(wclk), .Q(\mem[12][3] ) );
  DFFQX2M \mem_reg[12][2]  ( .D(n65), .CK(wclk), .Q(\mem[12][2] ) );
  DFFQX2M \mem_reg[12][1]  ( .D(n64), .CK(wclk), .Q(\mem[12][1] ) );
  DFFQX2M \mem_reg[12][0]  ( .D(n63), .CK(wclk), .Q(\mem[12][0] ) );
  DFFQX2M \mem_reg[14][7]  ( .D(n54), .CK(wclk), .Q(\mem[14][7] ) );
  DFFQX2M \mem_reg[14][6]  ( .D(n53), .CK(wclk), .Q(\mem[14][6] ) );
  DFFQX2M \mem_reg[14][5]  ( .D(n52), .CK(wclk), .Q(\mem[14][5] ) );
  DFFQX2M \mem_reg[14][4]  ( .D(n51), .CK(wclk), .Q(\mem[14][4] ) );
  DFFQX2M \mem_reg[14][3]  ( .D(n50), .CK(wclk), .Q(\mem[14][3] ) );
  DFFQX2M \mem_reg[14][2]  ( .D(n49), .CK(wclk), .Q(\mem[14][2] ) );
  DFFQX2M \mem_reg[14][1]  ( .D(n48), .CK(wclk), .Q(\mem[14][1] ) );
  DFFQX2M \mem_reg[14][0]  ( .D(n47), .CK(wclk), .Q(\mem[14][0] ) );
  NOR2X2M U2 ( .A(n271), .B(n272), .Y(n22) );
  NOR2X2M U3 ( .A(waddr[1]), .B(waddr[2]), .Y(n19) );
  NOR2X2M U4 ( .A(n271), .B(waddr[2]), .Y(n14) );
  NOR2X2M U5 ( .A(n272), .B(waddr[1]), .Y(n27) );
  INVX2M U6 ( .A(n264), .Y(n265) );
  NAND2X2M U7 ( .A(n22), .B(n17), .Y(n36) );
  NAND2X2M U8 ( .A(n25), .B(n22), .Y(n24) );
  BUFX2M U9 ( .A(n1), .Y(n264) );
  INVX2M U10 ( .A(n267), .Y(n268) );
  NAND2X2M U11 ( .A(n22), .B(n15), .Y(n35) );
  NAND2X2M U12 ( .A(n15), .B(n27), .Y(n37) );
  NAND2X2M U13 ( .A(n14), .B(n17), .Y(n16) );
  NAND2X2M U14 ( .A(n19), .B(n15), .Y(n18) );
  NAND2X2M U15 ( .A(n19), .B(n17), .Y(n20) );
  NAND2X2M U16 ( .A(n22), .B(n23), .Y(n21) );
  NAND2X2M U17 ( .A(n23), .B(n27), .Y(n26) );
  NAND2X2M U18 ( .A(n25), .B(n27), .Y(n28) );
  NAND2X2M U19 ( .A(n23), .B(n14), .Y(n29) );
  NAND2X2M U20 ( .A(n25), .B(n14), .Y(n30) );
  NAND2X2M U21 ( .A(n23), .B(n19), .Y(n31) );
  NAND2X2M U22 ( .A(n25), .B(n19), .Y(n33) );
  NAND2X2M U23 ( .A(n14), .B(n15), .Y(n13) );
  NAND2X2M U24 ( .A(n27), .B(n17), .Y(n12) );
  AND2X2M U25 ( .A(n38), .B(n270), .Y(n17) );
  AND2X2M U26 ( .A(n32), .B(n270), .Y(n25) );
  OR2X2M U27 ( .A(n262), .B(n263), .Y(n1) );
  BUFX2M U28 ( .A(n3), .Y(n267) );
  INVX2M U29 ( .A(n2), .Y(n266) );
  INVX2M U30 ( .A(n4), .Y(n269) );
  INVX2M U31 ( .A(wdata[0]), .Y(n280) );
  INVX2M U32 ( .A(wdata[1]), .Y(n279) );
  INVX2M U33 ( .A(wdata[2]), .Y(n278) );
  INVX2M U34 ( .A(wdata[3]), .Y(n277) );
  INVX2M U35 ( .A(wdata[4]), .Y(n276) );
  INVX2M U36 ( .A(wdata[5]), .Y(n275) );
  INVX2M U37 ( .A(wdata[6]), .Y(n274) );
  INVX2M U38 ( .A(wdata[7]), .Y(n273) );
  OAI2BB2X1M U39 ( .B0(n13), .B1(n280), .A0N(\mem[11][0] ), .A1N(n13), .Y(n71)
         );
  OAI2BB2X1M U40 ( .B0(n13), .B1(n279), .A0N(\mem[11][1] ), .A1N(n13), .Y(n72)
         );
  OAI2BB2X1M U41 ( .B0(n13), .B1(n278), .A0N(\mem[11][2] ), .A1N(n13), .Y(n73)
         );
  OAI2BB2X1M U42 ( .B0(n13), .B1(n277), .A0N(\mem[11][3] ), .A1N(n13), .Y(n74)
         );
  OAI2BB2X1M U43 ( .B0(n13), .B1(n276), .A0N(\mem[11][4] ), .A1N(n13), .Y(n75)
         );
  OAI2BB2X1M U44 ( .B0(n13), .B1(n275), .A0N(\mem[11][5] ), .A1N(n13), .Y(n76)
         );
  OAI2BB2X1M U45 ( .B0(n12), .B1(n280), .A0N(\mem[12][0] ), .A1N(n12), .Y(n63)
         );
  OAI2BB2X1M U46 ( .B0(n12), .B1(n279), .A0N(\mem[12][1] ), .A1N(n12), .Y(n64)
         );
  OAI2BB2X1M U47 ( .B0(n12), .B1(n278), .A0N(\mem[12][2] ), .A1N(n12), .Y(n65)
         );
  OAI2BB2X1M U48 ( .B0(n12), .B1(n277), .A0N(\mem[12][3] ), .A1N(n12), .Y(n66)
         );
  OAI2BB2X1M U49 ( .B0(n12), .B1(n276), .A0N(\mem[12][4] ), .A1N(n12), .Y(n67)
         );
  OAI2BB2X1M U50 ( .B0(n12), .B1(n275), .A0N(\mem[12][5] ), .A1N(n12), .Y(n68)
         );
  OAI2BB2X1M U51 ( .B0(n12), .B1(n274), .A0N(\mem[12][6] ), .A1N(n12), .Y(n69)
         );
  OAI2BB2X1M U52 ( .B0(n12), .B1(n273), .A0N(\mem[12][7] ), .A1N(n12), .Y(n70)
         );
  OAI2BB2X1M U53 ( .B0(n280), .B1(n16), .A0N(\mem[10][0] ), .A1N(n16), .Y(n79)
         );
  OAI2BB2X1M U54 ( .B0(n279), .B1(n16), .A0N(\mem[10][1] ), .A1N(n16), .Y(n80)
         );
  OAI2BB2X1M U55 ( .B0(n278), .B1(n16), .A0N(\mem[10][2] ), .A1N(n16), .Y(n81)
         );
  OAI2BB2X1M U56 ( .B0(n277), .B1(n16), .A0N(\mem[10][3] ), .A1N(n16), .Y(n82)
         );
  OAI2BB2X1M U57 ( .B0(n276), .B1(n16), .A0N(\mem[10][4] ), .A1N(n16), .Y(n83)
         );
  OAI2BB2X1M U58 ( .B0(n275), .B1(n16), .A0N(\mem[10][5] ), .A1N(n16), .Y(n84)
         );
  OAI2BB2X1M U59 ( .B0(n274), .B1(n16), .A0N(\mem[10][6] ), .A1N(n16), .Y(n85)
         );
  OAI2BB2X1M U60 ( .B0(n273), .B1(n16), .A0N(\mem[10][7] ), .A1N(n16), .Y(n86)
         );
  OAI2BB2X1M U61 ( .B0(n280), .B1(n18), .A0N(\mem[9][0] ), .A1N(n18), .Y(n87)
         );
  OAI2BB2X1M U62 ( .B0(n279), .B1(n18), .A0N(\mem[9][1] ), .A1N(n18), .Y(n88)
         );
  OAI2BB2X1M U63 ( .B0(n278), .B1(n18), .A0N(\mem[9][2] ), .A1N(n18), .Y(n89)
         );
  OAI2BB2X1M U64 ( .B0(n277), .B1(n18), .A0N(\mem[9][3] ), .A1N(n18), .Y(n90)
         );
  OAI2BB2X1M U65 ( .B0(n276), .B1(n18), .A0N(\mem[9][4] ), .A1N(n18), .Y(n91)
         );
  OAI2BB2X1M U66 ( .B0(n275), .B1(n18), .A0N(\mem[9][5] ), .A1N(n18), .Y(n92)
         );
  OAI2BB2X1M U67 ( .B0(n274), .B1(n18), .A0N(\mem[9][6] ), .A1N(n18), .Y(n93)
         );
  OAI2BB2X1M U68 ( .B0(n273), .B1(n18), .A0N(\mem[9][7] ), .A1N(n18), .Y(n94)
         );
  OAI2BB2X1M U69 ( .B0(n280), .B1(n20), .A0N(\mem[8][0] ), .A1N(n20), .Y(n95)
         );
  OAI2BB2X1M U70 ( .B0(n279), .B1(n20), .A0N(\mem[8][1] ), .A1N(n20), .Y(n96)
         );
  OAI2BB2X1M U71 ( .B0(n278), .B1(n20), .A0N(\mem[8][2] ), .A1N(n20), .Y(n97)
         );
  OAI2BB2X1M U72 ( .B0(n277), .B1(n20), .A0N(\mem[8][3] ), .A1N(n20), .Y(n98)
         );
  OAI2BB2X1M U73 ( .B0(n276), .B1(n20), .A0N(\mem[8][4] ), .A1N(n20), .Y(n99)
         );
  OAI2BB2X1M U74 ( .B0(n275), .B1(n20), .A0N(\mem[8][5] ), .A1N(n20), .Y(n100)
         );
  OAI2BB2X1M U75 ( .B0(n274), .B1(n20), .A0N(\mem[8][6] ), .A1N(n20), .Y(n101)
         );
  OAI2BB2X1M U76 ( .B0(n273), .B1(n20), .A0N(\mem[8][7] ), .A1N(n20), .Y(n102)
         );
  OAI2BB2X1M U77 ( .B0(n280), .B1(n35), .A0N(\mem[15][0] ), .A1N(n35), .Y(n39)
         );
  OAI2BB2X1M U78 ( .B0(n279), .B1(n35), .A0N(\mem[15][1] ), .A1N(n35), .Y(n40)
         );
  OAI2BB2X1M U79 ( .B0(n278), .B1(n35), .A0N(\mem[15][2] ), .A1N(n35), .Y(n41)
         );
  OAI2BB2X1M U80 ( .B0(n277), .B1(n35), .A0N(\mem[15][3] ), .A1N(n35), .Y(n42)
         );
  OAI2BB2X1M U81 ( .B0(n276), .B1(n35), .A0N(\mem[15][4] ), .A1N(n35), .Y(n43)
         );
  OAI2BB2X1M U82 ( .B0(n275), .B1(n35), .A0N(\mem[15][5] ), .A1N(n35), .Y(n44)
         );
  OAI2BB2X1M U83 ( .B0(n274), .B1(n35), .A0N(\mem[15][6] ), .A1N(n35), .Y(n45)
         );
  OAI2BB2X1M U84 ( .B0(n273), .B1(n35), .A0N(\mem[15][7] ), .A1N(n35), .Y(n46)
         );
  OAI2BB2X1M U85 ( .B0(n280), .B1(n36), .A0N(\mem[14][0] ), .A1N(n36), .Y(n47)
         );
  OAI2BB2X1M U86 ( .B0(n279), .B1(n36), .A0N(\mem[14][1] ), .A1N(n36), .Y(n48)
         );
  OAI2BB2X1M U87 ( .B0(n278), .B1(n36), .A0N(\mem[14][2] ), .A1N(n36), .Y(n49)
         );
  OAI2BB2X1M U88 ( .B0(n277), .B1(n36), .A0N(\mem[14][3] ), .A1N(n36), .Y(n50)
         );
  OAI2BB2X1M U89 ( .B0(n276), .B1(n36), .A0N(\mem[14][4] ), .A1N(n36), .Y(n51)
         );
  OAI2BB2X1M U90 ( .B0(n275), .B1(n36), .A0N(\mem[14][5] ), .A1N(n36), .Y(n52)
         );
  OAI2BB2X1M U91 ( .B0(n274), .B1(n36), .A0N(\mem[14][6] ), .A1N(n36), .Y(n53)
         );
  OAI2BB2X1M U92 ( .B0(n273), .B1(n36), .A0N(\mem[14][7] ), .A1N(n36), .Y(n54)
         );
  OAI2BB2X1M U93 ( .B0(n280), .B1(n21), .A0N(\mem[7][0] ), .A1N(n21), .Y(n103)
         );
  OAI2BB2X1M U94 ( .B0(n279), .B1(n21), .A0N(\mem[7][1] ), .A1N(n21), .Y(n104)
         );
  OAI2BB2X1M U95 ( .B0(n278), .B1(n21), .A0N(\mem[7][2] ), .A1N(n21), .Y(n105)
         );
  OAI2BB2X1M U96 ( .B0(n277), .B1(n21), .A0N(\mem[7][3] ), .A1N(n21), .Y(n106)
         );
  OAI2BB2X1M U97 ( .B0(n276), .B1(n21), .A0N(\mem[7][4] ), .A1N(n21), .Y(n107)
         );
  OAI2BB2X1M U98 ( .B0(n275), .B1(n21), .A0N(\mem[7][5] ), .A1N(n21), .Y(n108)
         );
  OAI2BB2X1M U99 ( .B0(n274), .B1(n21), .A0N(\mem[7][6] ), .A1N(n21), .Y(n109)
         );
  OAI2BB2X1M U100 ( .B0(n273), .B1(n21), .A0N(\mem[7][7] ), .A1N(n21), .Y(n110) );
  OAI2BB2X1M U101 ( .B0(n274), .B1(n13), .A0N(\mem[11][6] ), .A1N(n13), .Y(n77) );
  OAI2BB2X1M U102 ( .B0(n273), .B1(n13), .A0N(\mem[11][7] ), .A1N(n13), .Y(n78) );
  OAI2BB2X1M U103 ( .B0(n280), .B1(n37), .A0N(\mem[13][0] ), .A1N(n37), .Y(n55) );
  OAI2BB2X1M U104 ( .B0(n279), .B1(n37), .A0N(\mem[13][1] ), .A1N(n37), .Y(n56) );
  OAI2BB2X1M U105 ( .B0(n278), .B1(n37), .A0N(\mem[13][2] ), .A1N(n37), .Y(n57) );
  OAI2BB2X1M U106 ( .B0(n277), .B1(n37), .A0N(\mem[13][3] ), .A1N(n37), .Y(n58) );
  OAI2BB2X1M U107 ( .B0(n276), .B1(n37), .A0N(\mem[13][4] ), .A1N(n37), .Y(n59) );
  OAI2BB2X1M U108 ( .B0(n275), .B1(n37), .A0N(\mem[13][5] ), .A1N(n37), .Y(n60) );
  OAI2BB2X1M U109 ( .B0(n274), .B1(n37), .A0N(\mem[13][6] ), .A1N(n37), .Y(n61) );
  OAI2BB2X1M U110 ( .B0(n273), .B1(n37), .A0N(\mem[13][7] ), .A1N(n37), .Y(n62) );
  OAI2BB2X1M U111 ( .B0(n280), .B1(n26), .A0N(\mem[5][0] ), .A1N(n26), .Y(n119) );
  OAI2BB2X1M U112 ( .B0(n279), .B1(n26), .A0N(\mem[5][1] ), .A1N(n26), .Y(n120) );
  OAI2BB2X1M U113 ( .B0(n278), .B1(n26), .A0N(\mem[5][2] ), .A1N(n26), .Y(n121) );
  OAI2BB2X1M U114 ( .B0(n277), .B1(n26), .A0N(\mem[5][3] ), .A1N(n26), .Y(n122) );
  OAI2BB2X1M U115 ( .B0(n276), .B1(n26), .A0N(\mem[5][4] ), .A1N(n26), .Y(n123) );
  OAI2BB2X1M U116 ( .B0(n275), .B1(n26), .A0N(\mem[5][5] ), .A1N(n26), .Y(n124) );
  OAI2BB2X1M U117 ( .B0(n274), .B1(n26), .A0N(\mem[5][6] ), .A1N(n26), .Y(n125) );
  OAI2BB2X1M U118 ( .B0(n273), .B1(n26), .A0N(\mem[5][7] ), .A1N(n26), .Y(n126) );
  OAI2BB2X1M U119 ( .B0(n280), .B1(n28), .A0N(\mem[4][0] ), .A1N(n28), .Y(n127) );
  OAI2BB2X1M U120 ( .B0(n279), .B1(n28), .A0N(\mem[4][1] ), .A1N(n28), .Y(n128) );
  OAI2BB2X1M U121 ( .B0(n278), .B1(n28), .A0N(\mem[4][2] ), .A1N(n28), .Y(n129) );
  OAI2BB2X1M U122 ( .B0(n277), .B1(n28), .A0N(\mem[4][3] ), .A1N(n28), .Y(n130) );
  OAI2BB2X1M U123 ( .B0(n276), .B1(n28), .A0N(\mem[4][4] ), .A1N(n28), .Y(n131) );
  OAI2BB2X1M U124 ( .B0(n275), .B1(n28), .A0N(\mem[4][5] ), .A1N(n28), .Y(n132) );
  OAI2BB2X1M U125 ( .B0(n274), .B1(n28), .A0N(\mem[4][6] ), .A1N(n28), .Y(n133) );
  OAI2BB2X1M U126 ( .B0(n273), .B1(n28), .A0N(\mem[4][7] ), .A1N(n28), .Y(n134) );
  OAI2BB2X1M U127 ( .B0(n280), .B1(n29), .A0N(\mem[3][0] ), .A1N(n29), .Y(n135) );
  OAI2BB2X1M U128 ( .B0(n279), .B1(n29), .A0N(\mem[3][1] ), .A1N(n29), .Y(n136) );
  OAI2BB2X1M U129 ( .B0(n278), .B1(n29), .A0N(\mem[3][2] ), .A1N(n29), .Y(n137) );
  OAI2BB2X1M U130 ( .B0(n277), .B1(n29), .A0N(\mem[3][3] ), .A1N(n29), .Y(n138) );
  OAI2BB2X1M U131 ( .B0(n276), .B1(n29), .A0N(\mem[3][4] ), .A1N(n29), .Y(n139) );
  OAI2BB2X1M U132 ( .B0(n275), .B1(n29), .A0N(\mem[3][5] ), .A1N(n29), .Y(n140) );
  OAI2BB2X1M U133 ( .B0(n274), .B1(n29), .A0N(\mem[3][6] ), .A1N(n29), .Y(n141) );
  OAI2BB2X1M U134 ( .B0(n273), .B1(n29), .A0N(\mem[3][7] ), .A1N(n29), .Y(n142) );
  OAI2BB2X1M U135 ( .B0(n280), .B1(n30), .A0N(\mem[2][0] ), .A1N(n30), .Y(n143) );
  OAI2BB2X1M U136 ( .B0(n279), .B1(n30), .A0N(\mem[2][1] ), .A1N(n30), .Y(n144) );
  OAI2BB2X1M U137 ( .B0(n278), .B1(n30), .A0N(\mem[2][2] ), .A1N(n30), .Y(n145) );
  OAI2BB2X1M U138 ( .B0(n277), .B1(n30), .A0N(\mem[2][3] ), .A1N(n30), .Y(n146) );
  OAI2BB2X1M U139 ( .B0(n276), .B1(n30), .A0N(\mem[2][4] ), .A1N(n30), .Y(n147) );
  OAI2BB2X1M U140 ( .B0(n275), .B1(n30), .A0N(\mem[2][5] ), .A1N(n30), .Y(n148) );
  OAI2BB2X1M U141 ( .B0(n274), .B1(n30), .A0N(\mem[2][6] ), .A1N(n30), .Y(n149) );
  OAI2BB2X1M U142 ( .B0(n273), .B1(n30), .A0N(\mem[2][7] ), .A1N(n30), .Y(n150) );
  OAI2BB2X1M U143 ( .B0(n280), .B1(n31), .A0N(\mem[1][0] ), .A1N(n31), .Y(n151) );
  OAI2BB2X1M U144 ( .B0(n279), .B1(n31), .A0N(\mem[1][1] ), .A1N(n31), .Y(n152) );
  OAI2BB2X1M U145 ( .B0(n278), .B1(n31), .A0N(\mem[1][2] ), .A1N(n31), .Y(n153) );
  OAI2BB2X1M U146 ( .B0(n277), .B1(n31), .A0N(\mem[1][3] ), .A1N(n31), .Y(n154) );
  OAI2BB2X1M U147 ( .B0(n276), .B1(n31), .A0N(\mem[1][4] ), .A1N(n31), .Y(n155) );
  OAI2BB2X1M U148 ( .B0(n275), .B1(n31), .A0N(\mem[1][5] ), .A1N(n31), .Y(n156) );
  OAI2BB2X1M U149 ( .B0(n274), .B1(n31), .A0N(\mem[1][6] ), .A1N(n31), .Y(n157) );
  OAI2BB2X1M U150 ( .B0(n273), .B1(n31), .A0N(\mem[1][7] ), .A1N(n31), .Y(n158) );
  OAI2BB2X1M U151 ( .B0(n280), .B1(n33), .A0N(\mem[0][0] ), .A1N(n33), .Y(n159) );
  OAI2BB2X1M U152 ( .B0(n279), .B1(n33), .A0N(\mem[0][1] ), .A1N(n33), .Y(n160) );
  OAI2BB2X1M U153 ( .B0(n278), .B1(n33), .A0N(\mem[0][2] ), .A1N(n33), .Y(n161) );
  OAI2BB2X1M U154 ( .B0(n277), .B1(n33), .A0N(\mem[0][3] ), .A1N(n33), .Y(n162) );
  OAI2BB2X1M U155 ( .B0(n276), .B1(n33), .A0N(\mem[0][4] ), .A1N(n33), .Y(n163) );
  OAI2BB2X1M U156 ( .B0(n275), .B1(n33), .A0N(\mem[0][5] ), .A1N(n33), .Y(n164) );
  OAI2BB2X1M U157 ( .B0(n274), .B1(n33), .A0N(\mem[0][6] ), .A1N(n33), .Y(n165) );
  OAI2BB2X1M U158 ( .B0(n273), .B1(n33), .A0N(\mem[0][7] ), .A1N(n33), .Y(n166) );
  OAI2BB2X1M U159 ( .B0(n280), .B1(n24), .A0N(\mem[6][0] ), .A1N(n24), .Y(n111) );
  OAI2BB2X1M U160 ( .B0(n279), .B1(n24), .A0N(\mem[6][1] ), .A1N(n24), .Y(n112) );
  OAI2BB2X1M U161 ( .B0(n278), .B1(n24), .A0N(\mem[6][2] ), .A1N(n24), .Y(n113) );
  OAI2BB2X1M U162 ( .B0(n277), .B1(n24), .A0N(\mem[6][3] ), .A1N(n24), .Y(n114) );
  OAI2BB2X1M U163 ( .B0(n276), .B1(n24), .A0N(\mem[6][4] ), .A1N(n24), .Y(n115) );
  OAI2BB2X1M U164 ( .B0(n275), .B1(n24), .A0N(\mem[6][5] ), .A1N(n24), .Y(n116) );
  OAI2BB2X1M U165 ( .B0(n274), .B1(n24), .A0N(\mem[6][6] ), .A1N(n24), .Y(n117) );
  OAI2BB2X1M U166 ( .B0(n273), .B1(n24), .A0N(\mem[6][7] ), .A1N(n24), .Y(n118) );
  NOR2BX2M U167 ( .AN(winc), .B(wfull), .Y(n34) );
  AND2X2M U168 ( .A(n38), .B(waddr[0]), .Y(n15) );
  AND2X2M U169 ( .A(n32), .B(waddr[0]), .Y(n23) );
  NOR2BX2M U170 ( .AN(n34), .B(waddr[3]), .Y(n32) );
  AND2X2M U171 ( .A(waddr[3]), .B(n34), .Y(n38) );
  INVX2M U172 ( .A(waddr[1]), .Y(n271) );
  INVX2M U173 ( .A(waddr[2]), .Y(n272) );
  INVX2M U174 ( .A(waddr[0]), .Y(n270) );
  OR2X2M U175 ( .A(n262), .B(N10), .Y(n2) );
  OR2X2M U176 ( .A(n263), .B(N11), .Y(n3) );
  OR2X2M U177 ( .A(N10), .B(N11), .Y(n4) );
  INVX2M U178 ( .A(N11), .Y(n262) );
  INVX2M U179 ( .A(N10), .Y(n263) );
  INVX2M U180 ( .A(N13), .Y(n260) );
  INVX2M U181 ( .A(N12), .Y(n261) );
  AOI22X1M U182 ( .A0(\mem[10][0] ), .A1(n266), .B0(\mem[11][0] ), .B1(n265), 
        .Y(n6) );
  AOI22X1M U183 ( .A0(\mem[8][0] ), .A1(n269), .B0(\mem[9][0] ), .B1(n268), 
        .Y(n5) );
  CLKNAND2X2M U184 ( .A(N13), .B(n261), .Y(n244) );
  AOI21X1M U185 ( .A0(n6), .A1(n5), .B0(n244), .Y(n171) );
  AOI22X1M U186 ( .A0(\mem[14][0] ), .A1(n266), .B0(\mem[15][0] ), .B1(n265), 
        .Y(n8) );
  AOI22X1M U187 ( .A0(\mem[12][0] ), .A1(n269), .B0(\mem[13][0] ), .B1(n268), 
        .Y(n7) );
  CLKNAND2X2M U188 ( .A(N13), .B(N12), .Y(n247) );
  AOI21X1M U189 ( .A0(n8), .A1(n7), .B0(n247), .Y(n170) );
  AOI22X1M U190 ( .A0(\mem[2][0] ), .A1(n266), .B0(\mem[3][0] ), .B1(n265), 
        .Y(n10) );
  AOI22X1M U191 ( .A0(\mem[0][0] ), .A1(n269), .B0(\mem[1][0] ), .B1(n268), 
        .Y(n9) );
  CLKNAND2X2M U192 ( .A(n261), .B(n260), .Y(n250) );
  AOI21X1M U193 ( .A0(n10), .A1(n9), .B0(n250), .Y(n169) );
  AOI22X1M U194 ( .A0(\mem[6][0] ), .A1(n266), .B0(\mem[7][0] ), .B1(n265), 
        .Y(n167) );
  AOI22X1M U195 ( .A0(\mem[4][0] ), .A1(n269), .B0(\mem[5][0] ), .B1(n268), 
        .Y(n11) );
  CLKNAND2X2M U196 ( .A(N12), .B(n260), .Y(n253) );
  AOI21X1M U197 ( .A0(n167), .A1(n11), .B0(n253), .Y(n168) );
  OR4X1M U198 ( .A(n171), .B(n170), .C(n169), .D(n168), .Y(rdata[0]) );
  AOI22X1M U199 ( .A0(\mem[10][1] ), .A1(n266), .B0(\mem[11][1] ), .B1(n265), 
        .Y(n173) );
  AOI22X1M U200 ( .A0(\mem[8][1] ), .A1(n269), .B0(\mem[9][1] ), .B1(n268), 
        .Y(n172) );
  AOI21X1M U201 ( .A0(n173), .A1(n172), .B0(n244), .Y(n183) );
  AOI22X1M U202 ( .A0(\mem[14][1] ), .A1(n266), .B0(\mem[15][1] ), .B1(n265), 
        .Y(n175) );
  AOI22X1M U203 ( .A0(\mem[12][1] ), .A1(n269), .B0(\mem[13][1] ), .B1(n268), 
        .Y(n174) );
  AOI21X1M U204 ( .A0(n175), .A1(n174), .B0(n247), .Y(n182) );
  AOI22X1M U205 ( .A0(\mem[2][1] ), .A1(n266), .B0(\mem[3][1] ), .B1(n265), 
        .Y(n177) );
  AOI22X1M U206 ( .A0(\mem[0][1] ), .A1(n269), .B0(\mem[1][1] ), .B1(n268), 
        .Y(n176) );
  AOI21X1M U207 ( .A0(n177), .A1(n176), .B0(n250), .Y(n181) );
  AOI22X1M U208 ( .A0(\mem[6][1] ), .A1(n266), .B0(\mem[7][1] ), .B1(n265), 
        .Y(n179) );
  AOI22X1M U209 ( .A0(\mem[4][1] ), .A1(n269), .B0(\mem[5][1] ), .B1(n268), 
        .Y(n178) );
  AOI21X1M U210 ( .A0(n179), .A1(n178), .B0(n253), .Y(n180) );
  OR4X1M U211 ( .A(n183), .B(n182), .C(n181), .D(n180), .Y(rdata[1]) );
  AOI22X1M U212 ( .A0(\mem[10][2] ), .A1(n266), .B0(\mem[11][2] ), .B1(n265), 
        .Y(n185) );
  AOI22X1M U213 ( .A0(\mem[8][2] ), .A1(n269), .B0(\mem[9][2] ), .B1(n268), 
        .Y(n184) );
  AOI21X1M U214 ( .A0(n185), .A1(n184), .B0(n244), .Y(n195) );
  AOI22X1M U215 ( .A0(\mem[14][2] ), .A1(n266), .B0(\mem[15][2] ), .B1(n265), 
        .Y(n187) );
  AOI22X1M U216 ( .A0(\mem[12][2] ), .A1(n269), .B0(\mem[13][2] ), .B1(n268), 
        .Y(n186) );
  AOI21X1M U217 ( .A0(n187), .A1(n186), .B0(n247), .Y(n194) );
  AOI22X1M U218 ( .A0(\mem[2][2] ), .A1(n266), .B0(\mem[3][2] ), .B1(n265), 
        .Y(n189) );
  AOI22X1M U219 ( .A0(\mem[0][2] ), .A1(n269), .B0(\mem[1][2] ), .B1(n268), 
        .Y(n188) );
  AOI21X1M U220 ( .A0(n189), .A1(n188), .B0(n250), .Y(n193) );
  AOI22X1M U221 ( .A0(\mem[6][2] ), .A1(n266), .B0(\mem[7][2] ), .B1(n265), 
        .Y(n191) );
  AOI22X1M U222 ( .A0(\mem[4][2] ), .A1(n269), .B0(\mem[5][2] ), .B1(n268), 
        .Y(n190) );
  AOI21X1M U223 ( .A0(n191), .A1(n190), .B0(n253), .Y(n192) );
  OR4X1M U224 ( .A(n195), .B(n194), .C(n193), .D(n192), .Y(rdata[2]) );
  AOI22X1M U225 ( .A0(\mem[10][3] ), .A1(n266), .B0(\mem[11][3] ), .B1(n265), 
        .Y(n197) );
  AOI22X1M U226 ( .A0(\mem[8][3] ), .A1(n269), .B0(\mem[9][3] ), .B1(n268), 
        .Y(n196) );
  AOI21X1M U227 ( .A0(n197), .A1(n196), .B0(n244), .Y(n207) );
  AOI22X1M U228 ( .A0(\mem[14][3] ), .A1(n266), .B0(\mem[15][3] ), .B1(n265), 
        .Y(n199) );
  AOI22X1M U229 ( .A0(\mem[12][3] ), .A1(n269), .B0(\mem[13][3] ), .B1(n268), 
        .Y(n198) );
  AOI21X1M U230 ( .A0(n199), .A1(n198), .B0(n247), .Y(n206) );
  AOI22X1M U231 ( .A0(\mem[2][3] ), .A1(n266), .B0(\mem[3][3] ), .B1(n265), 
        .Y(n201) );
  AOI22X1M U232 ( .A0(\mem[0][3] ), .A1(n269), .B0(\mem[1][3] ), .B1(n268), 
        .Y(n200) );
  AOI21X1M U233 ( .A0(n201), .A1(n200), .B0(n250), .Y(n205) );
  AOI22X1M U234 ( .A0(\mem[6][3] ), .A1(n266), .B0(\mem[7][3] ), .B1(n265), 
        .Y(n203) );
  AOI22X1M U235 ( .A0(\mem[4][3] ), .A1(n269), .B0(\mem[5][3] ), .B1(n268), 
        .Y(n202) );
  AOI21X1M U236 ( .A0(n203), .A1(n202), .B0(n253), .Y(n204) );
  OR4X1M U237 ( .A(n207), .B(n206), .C(n205), .D(n204), .Y(rdata[3]) );
  AOI22X1M U238 ( .A0(\mem[10][4] ), .A1(n266), .B0(\mem[11][4] ), .B1(n265), 
        .Y(n209) );
  AOI22X1M U239 ( .A0(\mem[8][4] ), .A1(n269), .B0(\mem[9][4] ), .B1(n268), 
        .Y(n208) );
  AOI21X1M U240 ( .A0(n209), .A1(n208), .B0(n244), .Y(n219) );
  AOI22X1M U241 ( .A0(\mem[14][4] ), .A1(n266), .B0(\mem[15][4] ), .B1(n265), 
        .Y(n211) );
  AOI22X1M U242 ( .A0(\mem[12][4] ), .A1(n269), .B0(\mem[13][4] ), .B1(n268), 
        .Y(n210) );
  AOI21X1M U243 ( .A0(n211), .A1(n210), .B0(n247), .Y(n218) );
  AOI22X1M U244 ( .A0(\mem[2][4] ), .A1(n266), .B0(\mem[3][4] ), .B1(n265), 
        .Y(n213) );
  AOI22X1M U245 ( .A0(\mem[0][4] ), .A1(n269), .B0(\mem[1][4] ), .B1(n268), 
        .Y(n212) );
  AOI21X1M U246 ( .A0(n213), .A1(n212), .B0(n250), .Y(n217) );
  AOI22X1M U247 ( .A0(\mem[6][4] ), .A1(n266), .B0(\mem[7][4] ), .B1(n265), 
        .Y(n215) );
  AOI22X1M U248 ( .A0(\mem[4][4] ), .A1(n269), .B0(\mem[5][4] ), .B1(n268), 
        .Y(n214) );
  AOI21X1M U249 ( .A0(n215), .A1(n214), .B0(n253), .Y(n216) );
  OR4X1M U250 ( .A(n219), .B(n218), .C(n217), .D(n216), .Y(rdata[4]) );
  AOI22X1M U251 ( .A0(\mem[10][5] ), .A1(n266), .B0(\mem[11][5] ), .B1(n265), 
        .Y(n221) );
  AOI22X1M U252 ( .A0(\mem[8][5] ), .A1(n269), .B0(\mem[9][5] ), .B1(n268), 
        .Y(n220) );
  AOI21X1M U253 ( .A0(n221), .A1(n220), .B0(n244), .Y(n231) );
  AOI22X1M U254 ( .A0(\mem[14][5] ), .A1(n266), .B0(\mem[15][5] ), .B1(n265), 
        .Y(n223) );
  AOI22X1M U255 ( .A0(\mem[12][5] ), .A1(n269), .B0(\mem[13][5] ), .B1(n268), 
        .Y(n222) );
  AOI21X1M U256 ( .A0(n223), .A1(n222), .B0(n247), .Y(n230) );
  AOI22X1M U257 ( .A0(\mem[2][5] ), .A1(n266), .B0(\mem[3][5] ), .B1(n265), 
        .Y(n225) );
  AOI22X1M U258 ( .A0(\mem[0][5] ), .A1(n269), .B0(\mem[1][5] ), .B1(n268), 
        .Y(n224) );
  AOI21X1M U259 ( .A0(n225), .A1(n224), .B0(n250), .Y(n229) );
  AOI22X1M U260 ( .A0(\mem[6][5] ), .A1(n266), .B0(\mem[7][5] ), .B1(n265), 
        .Y(n227) );
  AOI22X1M U261 ( .A0(\mem[4][5] ), .A1(n269), .B0(\mem[5][5] ), .B1(n268), 
        .Y(n226) );
  AOI21X1M U262 ( .A0(n227), .A1(n226), .B0(n253), .Y(n228) );
  OR4X1M U263 ( .A(n231), .B(n230), .C(n229), .D(n228), .Y(rdata[5]) );
  AOI22X1M U264 ( .A0(\mem[10][6] ), .A1(n266), .B0(\mem[11][6] ), .B1(n265), 
        .Y(n233) );
  AOI22X1M U265 ( .A0(\mem[8][6] ), .A1(n269), .B0(\mem[9][6] ), .B1(n268), 
        .Y(n232) );
  AOI21X1M U266 ( .A0(n233), .A1(n232), .B0(n244), .Y(n243) );
  AOI22X1M U267 ( .A0(\mem[14][6] ), .A1(n266), .B0(\mem[15][6] ), .B1(n265), 
        .Y(n235) );
  AOI22X1M U268 ( .A0(\mem[12][6] ), .A1(n269), .B0(\mem[13][6] ), .B1(n268), 
        .Y(n234) );
  AOI21X1M U269 ( .A0(n235), .A1(n234), .B0(n247), .Y(n242) );
  AOI22X1M U270 ( .A0(\mem[2][6] ), .A1(n266), .B0(\mem[3][6] ), .B1(n265), 
        .Y(n237) );
  AOI22X1M U271 ( .A0(\mem[0][6] ), .A1(n269), .B0(\mem[1][6] ), .B1(n268), 
        .Y(n236) );
  AOI21X1M U272 ( .A0(n237), .A1(n236), .B0(n250), .Y(n241) );
  AOI22X1M U273 ( .A0(\mem[6][6] ), .A1(n266), .B0(\mem[7][6] ), .B1(n265), 
        .Y(n239) );
  AOI22X1M U274 ( .A0(\mem[4][6] ), .A1(n269), .B0(\mem[5][6] ), .B1(n268), 
        .Y(n238) );
  AOI21X1M U275 ( .A0(n239), .A1(n238), .B0(n253), .Y(n240) );
  OR4X1M U276 ( .A(n243), .B(n242), .C(n241), .D(n240), .Y(rdata[6]) );
  AOI22X1M U277 ( .A0(\mem[10][7] ), .A1(n266), .B0(\mem[11][7] ), .B1(n265), 
        .Y(n246) );
  AOI22X1M U278 ( .A0(\mem[8][7] ), .A1(n269), .B0(\mem[9][7] ), .B1(n268), 
        .Y(n245) );
  AOI21X1M U279 ( .A0(n246), .A1(n245), .B0(n244), .Y(n259) );
  AOI22X1M U280 ( .A0(\mem[14][7] ), .A1(n266), .B0(\mem[15][7] ), .B1(n265), 
        .Y(n249) );
  AOI22X1M U281 ( .A0(\mem[12][7] ), .A1(n269), .B0(\mem[13][7] ), .B1(n268), 
        .Y(n248) );
  AOI21X1M U282 ( .A0(n249), .A1(n248), .B0(n247), .Y(n258) );
  AOI22X1M U283 ( .A0(\mem[2][7] ), .A1(n266), .B0(\mem[3][7] ), .B1(n265), 
        .Y(n252) );
  AOI22X1M U284 ( .A0(\mem[0][7] ), .A1(n269), .B0(\mem[1][7] ), .B1(n268), 
        .Y(n251) );
  AOI21X1M U285 ( .A0(n252), .A1(n251), .B0(n250), .Y(n257) );
  AOI22X1M U286 ( .A0(\mem[6][7] ), .A1(n266), .B0(\mem[7][7] ), .B1(n265), 
        .Y(n255) );
  AOI22X1M U287 ( .A0(\mem[4][7] ), .A1(n269), .B0(\mem[5][7] ), .B1(n268), 
        .Y(n254) );
  AOI21X1M U288 ( .A0(n255), .A1(n254), .B0(n253), .Y(n256) );
  OR4X1M U289 ( .A(n259), .B(n258), .C(n257), .D(n256), .Y(rdata[7]) );
endmodule


module ASYNC_FIFO_TOP ( wclk, wrst_n, winc, wdata, wfull, rclk, rrst_n, rinc, 
        rdata, rempty );
  input [7:0] wdata;
  output [7:0] rdata;
  input wclk, wrst_n, winc, rclk, rrst_n, rinc;
  output wfull, rempty;
  wire   n1, n2;
  wire   [4:0] wq2_rptr;
  wire   [3:0] waddr;
  wire   [4:0] wptr;
  wire   [4:0] rq2_wptr;
  wire   [3:0] raddr;
  wire   [4:0] rptr;
  tri   wclk;

  FIFO_WR u_fifo_wr ( .wclk(wclk), .wrst_n(wrst_n), .winc(winc), .wq2_rptr(
        wq2_rptr), .wfull(wfull), .waddr(waddr), .wptr(wptr) );
  FIFO_RD u_fifo_rd ( .rclk(rclk), .rrst_n(n1), .rinc(rinc), .rq2_wptr(
        rq2_wptr), .rempty(rempty), .raddr(raddr), .rptr(rptr) );
  DF_SYNC_0 u_sync_r2w ( .ptr_in(rptr), .clk(wclk), .rst_n(wrst_n), .ptr_out(
        wq2_rptr) );
  DF_SYNC_1 u_sync_w2r ( .ptr_in(wptr), .clk(rclk), .rst_n(n1), .ptr_out(
        rq2_wptr) );
  FIFO_MEM_CNTRL u_mem ( .wdata(wdata), .winc(winc), .wfull(wfull), .waddr(
        waddr), .raddr(raddr), .wclk(wclk), .rdata(rdata) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(rrst_n), .Y(n2) );
endmodule


module Serializer ( P_Data, ser_en, data_valid, busy, clk, RST, ser_data, 
        ser_done );
  input [7:0] P_Data;
  input ser_en, data_valid, busy, clk, RST;
  output ser_data, ser_done;
  wire   done_next, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n1, n2, n3, n4, n26;
  wire   [7:1] shift_reg;
  wire   [2:0] bit_count;
  wire   [2:0] count_next;

  DFFRQX2M \shift_reg_reg[6]  ( .D(n20), .CK(clk), .RN(RST), .Q(shift_reg[6])
         );
  DFFRQX2M \shift_reg_reg[5]  ( .D(n21), .CK(clk), .RN(RST), .Q(shift_reg[5])
         );
  DFFRQX2M \shift_reg_reg[4]  ( .D(n22), .CK(clk), .RN(RST), .Q(shift_reg[4])
         );
  DFFRQX2M \shift_reg_reg[3]  ( .D(n23), .CK(clk), .RN(RST), .Q(shift_reg[3])
         );
  DFFRQX2M \shift_reg_reg[2]  ( .D(n24), .CK(clk), .RN(RST), .Q(shift_reg[2])
         );
  DFFRQX2M \shift_reg_reg[1]  ( .D(n25), .CK(clk), .RN(RST), .Q(shift_reg[1])
         );
  DFFRQX2M \shift_reg_reg[7]  ( .D(n19), .CK(clk), .RN(RST), .Q(shift_reg[7])
         );
  DFFRQX2M ser_done_reg ( .D(done_next), .CK(clk), .RN(RST), .Q(ser_done) );
  DFFRQX2M \bit_count_reg[1]  ( .D(count_next[1]), .CK(clk), .RN(RST), .Q(
        bit_count[1]) );
  DFFRQX2M \bit_count_reg[2]  ( .D(count_next[2]), .CK(clk), .RN(RST), .Q(
        bit_count[2]) );
  DFFRQX2M \bit_count_reg[0]  ( .D(count_next[0]), .CK(clk), .RN(RST), .Q(
        bit_count[0]) );
  DFFRQX2M \shift_reg_reg[0]  ( .D(n18), .CK(clk), .RN(RST), .Q(ser_data) );
  NOR2X2M U3 ( .A(n5), .B(n1), .Y(n7) );
  NOR2X2M U4 ( .A(ser_en), .B(n1), .Y(n5) );
  BUFX2M U5 ( .A(n8), .Y(n1) );
  NOR2BX2M U6 ( .AN(data_valid), .B(busy), .Y(n8) );
  OAI211X2M U7 ( .A0(n4), .A1(n26), .B0(n2), .C0(ser_en), .Y(n16) );
  INVX2M U8 ( .A(n1), .Y(n2) );
  OAI2BB1X2M U9 ( .A0N(ser_data), .A1N(n5), .B0(n6), .Y(n18) );
  AOI22X1M U10 ( .A0(shift_reg[1]), .A1(n7), .B0(P_Data[0]), .B1(n1), .Y(n6)
         );
  OAI2BB1X2M U11 ( .A0N(shift_reg[1]), .A1N(n5), .B0(n14), .Y(n25) );
  AOI22X1M U12 ( .A0(shift_reg[2]), .A1(n7), .B0(P_Data[1]), .B1(n1), .Y(n14)
         );
  OAI2BB1X2M U13 ( .A0N(n5), .A1N(shift_reg[2]), .B0(n13), .Y(n24) );
  AOI22X1M U14 ( .A0(shift_reg[3]), .A1(n7), .B0(P_Data[2]), .B1(n1), .Y(n13)
         );
  OAI2BB1X2M U15 ( .A0N(n5), .A1N(shift_reg[3]), .B0(n12), .Y(n23) );
  AOI22X1M U16 ( .A0(shift_reg[4]), .A1(n7), .B0(P_Data[3]), .B1(n1), .Y(n12)
         );
  OAI2BB1X2M U17 ( .A0N(n5), .A1N(shift_reg[4]), .B0(n11), .Y(n22) );
  AOI22X1M U18 ( .A0(shift_reg[5]), .A1(n7), .B0(P_Data[4]), .B1(n1), .Y(n11)
         );
  OAI2BB1X2M U19 ( .A0N(n5), .A1N(shift_reg[5]), .B0(n10), .Y(n21) );
  AOI22X1M U20 ( .A0(shift_reg[6]), .A1(n7), .B0(P_Data[5]), .B1(n1), .Y(n10)
         );
  OAI2BB1X2M U21 ( .A0N(n5), .A1N(shift_reg[6]), .B0(n9), .Y(n20) );
  AOI22X1M U22 ( .A0(shift_reg[7]), .A1(n7), .B0(P_Data[6]), .B1(n1), .Y(n9)
         );
  AO22X1M U23 ( .A0(n5), .A1(shift_reg[7]), .B0(P_Data[7]), .B1(n1), .Y(n19)
         );
  OAI32X1M U24 ( .A0(n3), .A1(n4), .A2(n16), .B0(n26), .B1(n16), .Y(
        count_next[2]) );
  INVX2M U25 ( .A(bit_count[0]), .Y(n3) );
  NOR4X1M U26 ( .A(n15), .B(n4), .C(bit_count[0]), .D(n1), .Y(done_next) );
  NAND2X2M U27 ( .A(ser_en), .B(bit_count[2]), .Y(n15) );
  NOR2X2M U28 ( .A(n17), .B(n16), .Y(count_next[1]) );
  XNOR2X2M U29 ( .A(bit_count[0]), .B(bit_count[1]), .Y(n17) );
  NOR2X2M U30 ( .A(bit_count[0]), .B(n16), .Y(count_next[0]) );
  INVX2M U31 ( .A(bit_count[1]), .Y(n4) );
  INVX2M U32 ( .A(bit_count[2]), .Y(n26) );
endmodule


module Fsm_tx ( data_valid, par_en, ser_done, clk, rst, busy, ser_en, mux_sel
 );
  output [1:0] mux_sel;
  input data_valid, par_en, ser_done, clk, rst;
  output busy, ser_en;
  wire   n7, n8, n9, n10, n11, n12, n13, n2, n3, n4, n5, n6;
  wire   [2:0] current_State;
  wire   [2:0] next_state;

  DFFRQX2M \current_State_reg[2]  ( .D(next_state[2]), .CK(clk), .RN(rst), .Q(
        current_State[2]) );
  DFFRQX2M \current_State_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(rst), .Q(
        current_State[1]) );
  DFFRQX2M \current_State_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(rst), .Q(
        current_State[0]) );
  INVX2M U3 ( .A(mux_sel[1]), .Y(n2) );
  AND2X2M U4 ( .A(n8), .B(n4), .Y(n11) );
  INVX2M U5 ( .A(n9), .Y(ser_en) );
  NOR2X2M U6 ( .A(n3), .B(current_State[2]), .Y(mux_sel[1]) );
  NAND2X2M U7 ( .A(n12), .B(n4), .Y(mux_sel[0]) );
  XNOR2X2M U8 ( .A(n3), .B(current_State[0]), .Y(n12) );
  INVX2M U9 ( .A(current_State[1]), .Y(n3) );
  INVX2M U10 ( .A(current_State[2]), .Y(n4) );
  NAND3X2M U11 ( .A(n8), .B(n2), .C(n13), .Y(busy) );
  NAND3BX2M U12 ( .AN(current_State[0]), .B(n3), .C(current_State[2]), .Y(n13)
         );
  NAND2X2M U13 ( .A(current_State[0]), .B(n4), .Y(n8) );
  NAND2X2M U14 ( .A(n11), .B(current_State[1]), .Y(n9) );
  OAI32X1M U15 ( .A0(n2), .A1(current_State[0]), .A2(n7), .B0(current_State[1]), .B1(n8), .Y(next_state[1]) );
  OAI31X1M U16 ( .A0(n6), .A1(n5), .A2(n9), .B0(n10), .Y(next_state[0]) );
  INVX2M U17 ( .A(par_en), .Y(n6) );
  NAND3X2M U18 ( .A(n11), .B(n3), .C(data_valid), .Y(n10) );
  NOR2X2M U19 ( .A(n5), .B(par_en), .Y(n7) );
  AOI2BB1X2M U20 ( .A0N(current_State[0]), .A1N(n7), .B0(n2), .Y(next_state[2]) );
  INVX2M U21 ( .A(ser_done), .Y(n5) );
endmodule


module parity_cal ( clk, RST, P_Data, busy, Data_Valid, par_typ, par_bit );
  input [7:0] P_Data;
  input clk, RST, busy, Data_Valid, par_typ;
  output par_bit;
  wire   n1, n2, n3, n4, n5, n6, n7;

  DFFRQX2M par_bit_reg ( .D(n7), .CK(clk), .RN(RST), .Q(par_bit) );
  XOR3XLM U2 ( .A(P_Data[5]), .B(P_Data[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U3 ( .A(P_Data[7]), .B(P_Data[6]), .Y(n6) );
  XNOR2X2M U4 ( .A(P_Data[3]), .B(P_Data[2]), .Y(n5) );
  OAI2BB2X1M U5 ( .B0(n1), .B1(n2), .A0N(par_bit), .A1N(n2), .Y(n7) );
  NAND2BX2M U6 ( .AN(busy), .B(Data_Valid), .Y(n2) );
  XOR3XLM U7 ( .A(n3), .B(par_typ), .C(n4), .Y(n1) );
  XOR3XLM U8 ( .A(P_Data[1]), .B(P_Data[0]), .C(n5), .Y(n4) );
endmodule


module Mux_4x1 ( mux_sel, ser_data, par_bit, tx_out_mux );
  input [1:0] mux_sel;
  input ser_data, par_bit;
  output tx_out_mux;
  wire   n2, n3, n1;

  OAI21X4M U3 ( .A0(n2), .A1(n1), .B0(n3), .Y(tx_out_mux) );
  NOR2BX2M U4 ( .AN(mux_sel[1]), .B(par_bit), .Y(n2) );
  NAND3X2M U5 ( .A(mux_sel[1]), .B(n1), .C(ser_data), .Y(n3) );
  INVX2M U6 ( .A(mux_sel[0]), .Y(n1) );
endmodule


module UART_TX_Top ( p_data_top, data_valid_top, par_en_top, par_typ_top, 
        clk_top, RST_top, TX_out_top, busy_top );
  input [7:0] p_data_top;
  input data_valid_top, par_en_top, par_typ_top, clk_top, RST_top;
  output TX_out_top, busy_top;
  wire   ser_data_top, ser_done_top, ser_en_top, par_bit_top;
  wire   [1:0] mux_sel_top;

  Serializer dut0 ( .P_Data(p_data_top), .ser_en(ser_en_top), .data_valid(
        data_valid_top), .busy(busy_top), .clk(clk_top), .RST(RST_top), 
        .ser_data(ser_data_top), .ser_done(ser_done_top) );
  Fsm_tx dut1 ( .data_valid(data_valid_top), .par_en(par_en_top), .ser_done(
        ser_done_top), .clk(clk_top), .rst(RST_top), .busy(busy_top), .ser_en(
        ser_en_top), .mux_sel(mux_sel_top) );
  parity_cal dut2 ( .clk(clk_top), .RST(RST_top), .P_Data(p_data_top), .busy(
        busy_top), .Data_Valid(data_valid_top), .par_typ(par_typ_top), 
        .par_bit(par_bit_top) );
  Mux_4x1 dut3 ( .mux_sel(mux_sel_top), .ser_data(ser_data_top), .par_bit(
        par_bit_top), .tx_out_mux(TX_out_top) );
endmodule


module PULSE_GEN ( CLK, RST, LVL_SIG, PULSE_SIG );
  input CLK, RST, LVL_SIG;
  output PULSE_SIG;
  wire   lvl_d, N1;

  DFFRQX2M lvl_d_reg ( .D(LVL_SIG), .CK(CLK), .RN(RST), .Q(lvl_d) );
  DFFRQX2M pulse_r_reg ( .D(N1), .CK(CLK), .RN(RST), .Q(PULSE_SIG) );
  NOR2BX2M U3 ( .AN(LVL_SIG), .B(lvl_d), .Y(N1) );
endmodule


module SYS_TOP ( REF_CLK, UART_CLK, RST, RX_IN, TX_OUT, parity_error, 
        stop_error );
  input REF_CLK, UART_CLK, RST, RX_IN;
  output TX_OUT, parity_error, stop_error;
  wire   RST_SYNC_2, WrEn, RdEn, RdData_Valid, ALU_OUT_VALID, FIFO_FULL,
         ALU_EN, CLK_EN, TX_D_VLD, ALU_CLK, UART_TX_CLK, FIFO_RD_INC,
         FIFO_EMPTY, TX_BUSY, n2, n3;
  wire   [4:0] Address;
  wire   [7:0] WrData;
  wire   [7:0] RdData;
  wire   [7:0] REG0;
  wire   [7:0] REG1;
  wire   [7:0] REG2;
  wire   [7:0] REG3;
  wire   [15:0] ALU_OUT;
  wire   [3:0] ALU_FUN;
  wire   [7:0] TX_P_DATA;
  wire   [7:0] FIFO_RD_DATA;
  tri   REF_CLK;
  tri   RST_SYNC_1;
  tri   [7:0] RX_SYNC_DATA;
  tri   RX_SYNC_VLD;
  tri   [7:0] RX_P_DATA;
  tri   RX_D_VLD;

  TLATNCAX4M u_clk_gate ( .E(CLK_EN), .CK(REF_CLK), .ECK(ALU_CLK) );
  rst_sych_0 u_rst_sync_1 ( .clk(REF_CLK), .rst(RST), .sych_rst(RST_SYNC_1) );
  rst_sych_1 u_rst_sync_2 ( .clk(UART_CLK), .rst(RST), .sych_rst(RST_SYNC_2)
         );
  regfile u_regfile ( .CLK(REF_CLK), .RST(n2), .Address(Address), .WrEn(WrEn), 
        .RdEn(RdEn), .WrData(WrData), .RdData(RdData), .RdData_Valid(
        RdData_Valid), .REG0(REG0), .REG1(REG1), .REG2(REG2), .REG3(REG3) );
  SYS_CTRL u_sys_ctrl ( .CLK(REF_CLK), .RST(n2), .ALU_OUT(ALU_OUT), 
        .OUT_Valid(ALU_OUT_VALID), .RdData_Valid(RdData_Valid), .RdData(RdData), .RX_P_DATA(RX_SYNC_DATA), .RX_D_VLD(RX_SYNC_VLD), .FIFO_FULL(FIFO_FULL), 
        .ALU_FUN(ALU_FUN), .EN(ALU_EN), .CLK_EN(CLK_EN), .Address(Address), 
        .WrEn(WrEn), .RdEn(RdEn), .WrData(WrData), .TX_P_DATA(TX_P_DATA), 
        .TX_D_VLD(TX_D_VLD) );
  ALU_TOP u_alu ( .A(REG0), .B(REG1), .ALU_FUNC(ALU_FUN), .enable(ALU_EN), 
        .CLK(ALU_CLK), .RST(n2), .ALU_OUT(ALU_OUT), .out_valid(ALU_OUT_VALID)
         );
  clk_divider u_clk_divider ( .i_ref_clk(UART_CLK), .i_rst_n(RST_SYNC_2), 
        .i_clk_en(1'b1), .i_div_ratio(REG3), .o_div_clk(UART_TX_CLK) );
  Top u_uart_rx ( .clk(UART_CLK), .rst(RST_SYNC_2), .RX_IN(RX_IN), .Prescale(
        REG2[7:2]), .parity_en(REG2[0]), .parity_typ(REG2[1]), .p_data(
        RX_P_DATA), .data_valid_top(RX_D_VLD), .stop_error(stop_error), 
        .parity_error(parity_error) );
  data_sync u_data_sync ( .Unsync_bus(RX_P_DATA), .bus_en(RX_D_VLD), .clk(
        REF_CLK), .rst(RST_SYNC_1), .enable_pulse(RX_SYNC_VLD), .sync_bus(
        RX_SYNC_DATA) );
  ASYNC_FIFO_TOP u_async_fifo ( .wclk(REF_CLK), .wrst_n(n2), .winc(TX_D_VLD), 
        .wdata(TX_P_DATA), .wfull(FIFO_FULL), .rclk(UART_TX_CLK), .rrst_n(
        RST_SYNC_2), .rinc(FIFO_RD_INC), .rdata(FIFO_RD_DATA), .rempty(
        FIFO_EMPTY) );
  UART_TX_Top u_uart_tx ( .p_data_top(FIFO_RD_DATA), .data_valid_top(n3), 
        .par_en_top(REG2[0]), .par_typ_top(REG2[1]), .clk_top(UART_TX_CLK), 
        .RST_top(RST_SYNC_2), .TX_out_top(TX_OUT), .busy_top(TX_BUSY) );
  PULSE_GEN u_pulse_gen ( .CLK(UART_TX_CLK), .RST(RST_SYNC_2), .LVL_SIG(
        TX_BUSY), .PULSE_SIG(FIFO_RD_INC) );
  CLKBUFX16M U2 ( .A(RST_SYNC_1), .Y(n2) );
  INVX2M U3 ( .A(FIFO_EMPTY), .Y(n3) );
endmodule

