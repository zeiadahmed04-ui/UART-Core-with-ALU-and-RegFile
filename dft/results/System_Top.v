/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Sat Oct 10 06:27:50 2026
/////////////////////////////////////////////////////////////


module rst_sych_test_0 ( clk, rst, sych_rst, test_si, test_se );
  input clk, rst, test_si, test_se;
  output sych_rst;

  wire   [1:0] ff;

  SDFFRQX2M \ff_reg[2]  ( .D(ff[1]), .SI(ff[1]), .SE(test_se), .CK(clk), .RN(
        rst), .Q(sych_rst) );
  SDFFRQX2M \ff_reg[0]  ( .D(1'b1), .SI(test_si), .SE(test_se), .CK(clk), .RN(
        rst), .Q(ff[0]) );
  SDFFRQX2M \ff_reg[1]  ( .D(ff[0]), .SI(ff[0]), .SE(test_se), .CK(clk), .RN(
        rst), .Q(ff[1]) );
endmodule


module rst_sych_test_1 ( clk, rst, sych_rst, test_si, test_se );
  input clk, rst, test_si, test_se;
  output sych_rst;

  wire   [1:0] ff;

  SDFFRQX2M \ff_reg[2]  ( .D(ff[1]), .SI(ff[1]), .SE(test_se), .CK(clk), .RN(
        rst), .Q(sych_rst) );
  SDFFRQX2M \ff_reg[0]  ( .D(1'b1), .SI(test_si), .SE(test_se), .CK(clk), .RN(
        rst), .Q(ff[0]) );
  SDFFRQX2M \ff_reg[1]  ( .D(ff[0]), .SI(ff[0]), .SE(test_se), .CK(clk), .RN(
        rst), .Q(ff[1]) );
endmodule


module regfile_test_1 ( CLK, RST, Address, WrEn, RdEn, WrData, RdData, 
        RdData_Valid, REG0, REG1, REG2, REG3, test_si3, test_si2, test_si1, 
        test_so2, test_so1, test_se );
  input [4:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, WrEn, RdEn, test_si3, test_si2, test_si1, test_se;
  output RdData_Valid, test_so2, test_so1;
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
         N84, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n309, n310, n311, n312, n313, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341,
         n342, n343, n344, n345, n346, n347, n348, n349, n350, n351, n352,
         n353, n354, n355, n356, n357, n358, n359, n360, n361, n362, n363,
         n364, n365, n366, n367, n368, n369, n370, n371, n372, n373, n374,
         n375, n376, n377, n378, n379, n380, n381, n382, n383, n384, n385,
         n386, n387, n388, n389, n390, n391, n392, n393, n394, n395, n396,
         n397, n398, n399, n400, n401, n402, n403, n404, n405, n406, n407,
         n408, n409, n410, n411, n412, n413, n414, n415, n416, n417, n418,
         n419, n420, n421, n422, n423, n424, n425, n426, n427, n428, n429,
         n430, n431, n432, n433, n434, n435, n436, n437, n438, n439, n440,
         n441, n442, n443, n444, n445, n446, n447, n448, n449, n450, n451,
         n452, n453, n454, n455, n456, n457, n458, n459, n460, n461, n462,
         n463, n464, n465, n466, n467, n468, n469, n470, n471, n472, n473,
         n474, n475, n476, n477, n478, n479, n480, n481, n482, n483, n484,
         n485, n486, n487, n488, n489, n490, n491, n492, n493, n494, n495,
         n496, n497, n498, n499, n500, n501, n502, n503, n504, n505, n506,
         n507, n508, n509, n510, n511, n512, n513, n514, n515, n516, n517,
         n518, n519, n520, n521, n522, n523, n524, n525, n526, n527, n528,
         n529, n530, n531, n532, n533, n534, n535, n536, n537, n538, n539,
         n540, n541, n542, n543, n544, n545, n546, n547, n548, n549, n550,
         n551, n552, n553, n554, n555, n556, n557, n558, n559, n560, n561,
         n562, n563, n564, n565, n566, n567, n568, n569, n570, n571, n572,
         n573, n574, n575, n576, n577, n578, n579, n580, n581, n582, n583,
         n584, n585, n586, n587, n588, n589, n590, n591, n592, n593, n594,
         n595, n596, n597, n598, n1, n2, n3, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n271, n272, n273, n599, n600, n601, n602, n603, n604,
         n605, n606, n607, n608, n609, n610, n611, n612, n613, n614, n615,
         n616, n617, n618, n619, n620, n621, n622, n623, n624, n625, n626,
         n627, n628, n629, n632, n633, n634, n635, n636, n637, n638, n639,
         n640, n641, n642, n643, n644, n645, n646, n647, n648, n649, n650,
         n651, n652, n653, n654, n655, n656, n657, n658, n659, n660, n661,
         n662, n663, n664, n665, n666, n667, n668, n669, n670, n671, n672,
         n673, n675, n676, n677, n678, n679, n680, n681, n682, n683, n684,
         n685, n686, n687, n688, n689, n690, n691, n692, n693, n694, n698,
         n699, n700, n701, n702, n703;

  SDFFRQX2M \RdData_reg[7]  ( .D(n422), .SI(RdData[6]), .SE(n702), .CK(CLK), 
        .RN(n273), .Q(RdData[7]) );
  SDFFRQX2M \RdData_reg[6]  ( .D(n421), .SI(RdData[5]), .SE(n702), .CK(CLK), 
        .RN(n273), .Q(RdData[6]) );
  SDFFRQX2M \RdData_reg[5]  ( .D(n420), .SI(RdData[4]), .SE(n702), .CK(CLK), 
        .RN(n273), .Q(RdData[5]) );
  SDFFRQX2M \RdData_reg[4]  ( .D(n419), .SI(RdData[3]), .SE(n702), .CK(CLK), 
        .RN(n273), .Q(RdData[4]) );
  SDFFRQX2M \RdData_reg[3]  ( .D(n418), .SI(RdData[2]), .SE(n703), .CK(CLK), 
        .RN(n273), .Q(RdData[3]) );
  SDFFRQX2M \RdData_reg[2]  ( .D(n417), .SI(RdData[1]), .SE(n703), .CK(CLK), 
        .RN(n273), .Q(RdData[2]) );
  SDFFRQX2M \RdData_reg[1]  ( .D(n416), .SI(RdData[0]), .SE(n703), .CK(CLK), 
        .RN(n273), .Q(RdData[1]) );
  SDFFRQX2M \RdData_reg[0]  ( .D(n415), .SI(RdData_Valid), .SE(n703), .CK(CLK), 
        .RN(n273), .Q(RdData[0]) );
  SDFFRQX2M \mem_reg[4][7]  ( .D(n566), .SI(\mem[4][6] ), .SE(n701), .CK(CLK), 
        .RN(n602), .Q(\mem[4][7] ) );
  SDFFRQX2M \mem_reg[4][6]  ( .D(n565), .SI(\mem[4][5] ), .SE(n701), .CK(CLK), 
        .RN(n602), .Q(\mem[4][6] ) );
  SDFFRQX2M \mem_reg[4][5]  ( .D(n564), .SI(\mem[4][4] ), .SE(n701), .CK(CLK), 
        .RN(n602), .Q(\mem[4][5] ) );
  SDFFRQX2M \mem_reg[4][4]  ( .D(n563), .SI(\mem[4][3] ), .SE(n701), .CK(CLK), 
        .RN(n602), .Q(\mem[4][4] ) );
  SDFFRQX2M \mem_reg[4][3]  ( .D(n562), .SI(\mem[4][2] ), .SE(n699), .CK(CLK), 
        .RN(n602), .Q(\mem[4][3] ) );
  SDFFRQX2M \mem_reg[4][2]  ( .D(n561), .SI(\mem[4][1] ), .SE(n699), .CK(CLK), 
        .RN(n602), .Q(\mem[4][2] ) );
  SDFFRQX2M \mem_reg[4][1]  ( .D(n560), .SI(\mem[4][0] ), .SE(n699), .CK(CLK), 
        .RN(n602), .Q(\mem[4][1] ) );
  SDFFRQX2M \mem_reg[4][0]  ( .D(n559), .SI(REG3[7]), .SE(n699), .CK(CLK), 
        .RN(n602), .Q(\mem[4][0] ) );
  SDFFRQX2M \mem_reg[7][7]  ( .D(n542), .SI(\mem[7][6] ), .SE(n698), .CK(CLK), 
        .RN(n601), .Q(\mem[7][7] ) );
  SDFFRQX2M \mem_reg[7][6]  ( .D(n541), .SI(\mem[7][5] ), .SE(n698), .CK(CLK), 
        .RN(n601), .Q(\mem[7][6] ) );
  SDFFRQX2M \mem_reg[7][5]  ( .D(n540), .SI(\mem[7][4] ), .SE(n698), .CK(CLK), 
        .RN(n601), .Q(\mem[7][5] ) );
  SDFFRQX2M \mem_reg[7][4]  ( .D(n539), .SI(\mem[7][3] ), .SE(n698), .CK(CLK), 
        .RN(n601), .Q(\mem[7][4] ) );
  SDFFRQX2M \mem_reg[7][3]  ( .D(n538), .SI(\mem[7][2] ), .SE(n700), .CK(CLK), 
        .RN(n601), .Q(\mem[7][3] ) );
  SDFFRQX2M \mem_reg[7][2]  ( .D(n537), .SI(\mem[7][1] ), .SE(n700), .CK(CLK), 
        .RN(n601), .Q(\mem[7][2] ) );
  SDFFRQX2M \mem_reg[7][1]  ( .D(n536), .SI(\mem[7][0] ), .SE(n700), .CK(CLK), 
        .RN(n601), .Q(\mem[7][1] ) );
  SDFFRQX2M \mem_reg[7][0]  ( .D(n535), .SI(\mem[6][7] ), .SE(n700), .CK(CLK), 
        .RN(n600), .Q(\mem[7][0] ) );
  SDFFRQX2M \mem_reg[10][7]  ( .D(n518), .SI(\mem[10][6] ), .SE(n702), .CK(CLK), .RN(n600), .Q(\mem[10][7] ) );
  SDFFRQX2M \mem_reg[10][6]  ( .D(n517), .SI(\mem[10][5] ), .SE(n702), .CK(CLK), .RN(n600), .Q(\mem[10][6] ) );
  SDFFRQX2M \mem_reg[10][5]  ( .D(n516), .SI(\mem[10][4] ), .SE(n702), .CK(CLK), .RN(n600), .Q(\mem[10][5] ) );
  SDFFRQX2M \mem_reg[10][4]  ( .D(n515), .SI(\mem[10][3] ), .SE(n702), .CK(CLK), .RN(n600), .Q(\mem[10][4] ) );
  SDFFRQX2M \mem_reg[10][3]  ( .D(n514), .SI(\mem[10][2] ), .SE(n703), .CK(CLK), .RN(n600), .Q(\mem[10][3] ) );
  SDFFRQX2M \mem_reg[10][2]  ( .D(n513), .SI(\mem[10][1] ), .SE(n703), .CK(CLK), .RN(n599), .Q(\mem[10][2] ) );
  SDFFRQX2M \mem_reg[10][1]  ( .D(n512), .SI(\mem[10][0] ), .SE(n703), .CK(CLK), .RN(n599), .Q(\mem[10][1] ) );
  SDFFRQX2M \mem_reg[10][0]  ( .D(n511), .SI(\mem[9][7] ), .SE(n703), .CK(CLK), 
        .RN(n599), .Q(\mem[10][0] ) );
  SDFFRQX2M \mem_reg[15][7]  ( .D(n478), .SI(\mem[15][6] ), .SE(n701), .CK(CLK), .RN(n599), .Q(\mem[15][7] ) );
  SDFFRQX2M \mem_reg[15][6]  ( .D(n477), .SI(\mem[15][5] ), .SE(n701), .CK(CLK), .RN(n599), .Q(\mem[15][6] ) );
  SDFFRQX2M \mem_reg[15][5]  ( .D(n476), .SI(\mem[15][4] ), .SE(n701), .CK(CLK), .RN(n273), .Q(\mem[15][5] ) );
  SDFFRQX2M \mem_reg[15][4]  ( .D(n475), .SI(\mem[15][3] ), .SE(n701), .CK(CLK), .RN(n273), .Q(\mem[15][4] ) );
  SDFFRQX2M \mem_reg[15][3]  ( .D(n474), .SI(\mem[15][2] ), .SE(n699), .CK(CLK), .RN(n599), .Q(\mem[15][3] ) );
  SDFFRQX2M \mem_reg[15][2]  ( .D(n473), .SI(\mem[15][1] ), .SE(n699), .CK(CLK), .RN(n273), .Q(\mem[15][2] ) );
  SDFFRQX2M \mem_reg[15][1]  ( .D(n472), .SI(\mem[15][0] ), .SE(n699), .CK(CLK), .RN(n599), .Q(\mem[15][1] ) );
  SDFFRQX2M \mem_reg[15][0]  ( .D(n471), .SI(\mem[14][7] ), .SE(n699), .CK(CLK), .RN(n599), .Q(\mem[15][0] ) );
  SDFFRQX2M \mem_reg[6][7]  ( .D(n550), .SI(\mem[6][6] ), .SE(n698), .CK(CLK), 
        .RN(n601), .Q(\mem[6][7] ) );
  SDFFRQX2M \mem_reg[6][6]  ( .D(n549), .SI(\mem[6][5] ), .SE(n698), .CK(CLK), 
        .RN(n601), .Q(\mem[6][6] ) );
  SDFFRQX2M \mem_reg[6][5]  ( .D(n548), .SI(\mem[6][4] ), .SE(n698), .CK(CLK), 
        .RN(n601), .Q(\mem[6][5] ) );
  SDFFRQX2M \mem_reg[6][4]  ( .D(n547), .SI(\mem[6][3] ), .SE(n698), .CK(CLK), 
        .RN(n601), .Q(\mem[6][4] ) );
  SDFFRQX2M \mem_reg[6][3]  ( .D(n546), .SI(\mem[6][2] ), .SE(n700), .CK(CLK), 
        .RN(n601), .Q(\mem[6][3] ) );
  SDFFRQX2M \mem_reg[6][2]  ( .D(n545), .SI(\mem[6][1] ), .SE(n700), .CK(CLK), 
        .RN(n601), .Q(\mem[6][2] ) );
  SDFFRQX2M \mem_reg[6][1]  ( .D(n544), .SI(\mem[6][0] ), .SE(n700), .CK(CLK), 
        .RN(n601), .Q(\mem[6][1] ) );
  SDFFRQX2M \mem_reg[6][0]  ( .D(n543), .SI(\mem[5][7] ), .SE(n700), .CK(CLK), 
        .RN(n601), .Q(\mem[6][0] ) );
  SDFFRQX2M \mem_reg[9][7]  ( .D(n526), .SI(\mem[9][6] ), .SE(n702), .CK(CLK), 
        .RN(n600), .Q(\mem[9][7] ) );
  SDFFRQX2M \mem_reg[9][6]  ( .D(n525), .SI(\mem[9][5] ), .SE(n702), .CK(CLK), 
        .RN(n600), .Q(\mem[9][6] ) );
  SDFFRQX2M \mem_reg[9][5]  ( .D(n524), .SI(\mem[9][4] ), .SE(n702), .CK(CLK), 
        .RN(n600), .Q(\mem[9][5] ) );
  SDFFRQX2M \mem_reg[9][4]  ( .D(n523), .SI(\mem[9][3] ), .SE(n702), .CK(CLK), 
        .RN(n600), .Q(\mem[9][4] ) );
  SDFFRQX2M \mem_reg[9][3]  ( .D(n522), .SI(\mem[9][2] ), .SE(n703), .CK(CLK), 
        .RN(n600), .Q(\mem[9][3] ) );
  SDFFRQX2M \mem_reg[9][2]  ( .D(n521), .SI(\mem[9][1] ), .SE(n703), .CK(CLK), 
        .RN(n600), .Q(\mem[9][2] ) );
  SDFFRQX2M \mem_reg[9][1]  ( .D(n520), .SI(\mem[9][0] ), .SE(n703), .CK(CLK), 
        .RN(n600), .Q(\mem[9][1] ) );
  SDFFRQX2M \mem_reg[9][0]  ( .D(n519), .SI(\mem[8][7] ), .SE(n703), .CK(CLK), 
        .RN(n600), .Q(\mem[9][0] ) );
  SDFFRQX2M \mem_reg[14][7]  ( .D(n486), .SI(\mem[14][6] ), .SE(n701), .CK(CLK), .RN(n599), .Q(\mem[14][7] ) );
  SDFFRQX2M \mem_reg[14][6]  ( .D(n485), .SI(\mem[14][5] ), .SE(n701), .CK(CLK), .RN(n599), .Q(\mem[14][6] ) );
  SDFFRQX2M \mem_reg[14][5]  ( .D(n484), .SI(\mem[14][4] ), .SE(n701), .CK(CLK), .RN(n599), .Q(\mem[14][5] ) );
  SDFFRQX2M \mem_reg[14][4]  ( .D(n483), .SI(\mem[14][3] ), .SE(n701), .CK(CLK), .RN(n599), .Q(\mem[14][4] ) );
  SDFFRQX2M \mem_reg[14][3]  ( .D(n482), .SI(\mem[14][2] ), .SE(n699), .CK(CLK), .RN(n273), .Q(\mem[14][3] ) );
  SDFFRQX2M \mem_reg[14][2]  ( .D(n481), .SI(\mem[14][1] ), .SE(n699), .CK(CLK), .RN(n273), .Q(\mem[14][2] ) );
  SDFFRQX2M \mem_reg[14][1]  ( .D(n480), .SI(\mem[14][0] ), .SE(n699), .CK(CLK), .RN(n599), .Q(\mem[14][1] ) );
  SDFFRQX2M \mem_reg[14][0]  ( .D(n479), .SI(\mem[13][7] ), .SE(n699), .CK(CLK), .RN(n273), .Q(\mem[14][0] ) );
  SDFFRQX2M \mem_reg[5][7]  ( .D(n558), .SI(\mem[5][6] ), .SE(n698), .CK(CLK), 
        .RN(n602), .Q(\mem[5][7] ) );
  SDFFRQX2M \mem_reg[5][6]  ( .D(n557), .SI(\mem[5][5] ), .SE(n698), .CK(CLK), 
        .RN(n601), .Q(\mem[5][6] ) );
  SDFFRQX2M \mem_reg[5][5]  ( .D(n556), .SI(\mem[5][4] ), .SE(n698), .CK(CLK), 
        .RN(n601), .Q(\mem[5][5] ) );
  SDFFRQX2M \mem_reg[5][4]  ( .D(n555), .SI(\mem[5][3] ), .SE(n698), .CK(CLK), 
        .RN(n601), .Q(\mem[5][4] ) );
  SDFFRQX2M \mem_reg[5][3]  ( .D(n554), .SI(\mem[5][2] ), .SE(n700), .CK(CLK), 
        .RN(n601), .Q(\mem[5][3] ) );
  SDFFRQX2M \mem_reg[5][2]  ( .D(n553), .SI(\mem[5][1] ), .SE(n700), .CK(CLK), 
        .RN(n601), .Q(\mem[5][2] ) );
  SDFFRQX2M \mem_reg[5][1]  ( .D(n552), .SI(\mem[5][0] ), .SE(n700), .CK(CLK), 
        .RN(n601), .Q(\mem[5][1] ) );
  SDFFRQX2M \mem_reg[5][0]  ( .D(n551), .SI(\mem[4][7] ), .SE(n700), .CK(CLK), 
        .RN(n601), .Q(\mem[5][0] ) );
  SDFFRQX2M \mem_reg[8][7]  ( .D(n534), .SI(\mem[8][6] ), .SE(n702), .CK(CLK), 
        .RN(n600), .Q(\mem[8][7] ) );
  SDFFRQX2M \mem_reg[8][6]  ( .D(n533), .SI(\mem[8][5] ), .SE(n702), .CK(CLK), 
        .RN(n600), .Q(\mem[8][6] ) );
  SDFFRQX2M \mem_reg[8][5]  ( .D(n532), .SI(\mem[8][4] ), .SE(n702), .CK(CLK), 
        .RN(n600), .Q(\mem[8][5] ) );
  SDFFRQX2M \mem_reg[8][4]  ( .D(n531), .SI(\mem[8][3] ), .SE(n702), .CK(CLK), 
        .RN(n600), .Q(\mem[8][4] ) );
  SDFFRQX2M \mem_reg[8][3]  ( .D(n530), .SI(\mem[8][2] ), .SE(n703), .CK(CLK), 
        .RN(n600), .Q(\mem[8][3] ) );
  SDFFRQX2M \mem_reg[8][2]  ( .D(n529), .SI(\mem[8][1] ), .SE(n703), .CK(CLK), 
        .RN(n600), .Q(\mem[8][2] ) );
  SDFFRQX2M \mem_reg[8][1]  ( .D(n528), .SI(\mem[8][0] ), .SE(n703), .CK(CLK), 
        .RN(n600), .Q(\mem[8][1] ) );
  SDFFRQX2M \mem_reg[8][0]  ( .D(n527), .SI(\mem[7][7] ), .SE(n703), .CK(CLK), 
        .RN(n600), .Q(\mem[8][0] ) );
  SDFFRQX2M \mem_reg[13][7]  ( .D(n494), .SI(\mem[13][6] ), .SE(n701), .CK(CLK), .RN(n599), .Q(\mem[13][7] ) );
  SDFFRQX2M \mem_reg[13][6]  ( .D(n493), .SI(\mem[13][5] ), .SE(n701), .CK(CLK), .RN(n599), .Q(\mem[13][6] ) );
  SDFFRQX2M \mem_reg[13][5]  ( .D(n492), .SI(\mem[13][4] ), .SE(n701), .CK(CLK), .RN(n599), .Q(\mem[13][5] ) );
  SDFFRQX2M \mem_reg[13][4]  ( .D(n491), .SI(\mem[13][3] ), .SE(n701), .CK(CLK), .RN(n599), .Q(\mem[13][4] ) );
  SDFFRQX2M \mem_reg[13][3]  ( .D(n490), .SI(\mem[13][2] ), .SE(n699), .CK(CLK), .RN(n599), .Q(\mem[13][3] ) );
  SDFFRQX2M \mem_reg[13][2]  ( .D(n489), .SI(\mem[13][1] ), .SE(n699), .CK(CLK), .RN(n599), .Q(\mem[13][2] ) );
  SDFFRQX2M \mem_reg[13][1]  ( .D(n488), .SI(\mem[13][0] ), .SE(n699), .CK(CLK), .RN(n599), .Q(\mem[13][1] ) );
  SDFFRQX2M \mem_reg[13][0]  ( .D(n487), .SI(n679), .SE(n699), .CK(CLK), .RN(
        n599), .Q(\mem[13][0] ) );
  SDFFRQX2M \mem_reg[2][1]  ( .D(n576), .SI(REG2[0]), .SE(n698), .CK(CLK), 
        .RN(n602), .Q(REG2[1]) );
  SDFFRX1M \mem_reg[17][7]  ( .D(n462), .SI(n664), .SE(n703), .CK(CLK), .RN(
        n270), .Q(n663), .QN(n213) );
  SDFFRX1M \mem_reg[17][6]  ( .D(n461), .SI(n665), .SE(n700), .CK(CLK), .RN(
        n271), .Q(n664), .QN(n214) );
  SDFFRX1M \mem_reg[17][5]  ( .D(n460), .SI(n666), .SE(n699), .CK(CLK), .RN(
        n271), .Q(n665), .QN(n215) );
  SDFFRX1M \mem_reg[17][4]  ( .D(n459), .SI(n667), .SE(n700), .CK(CLK), .RN(
        n270), .Q(n666), .QN(n216) );
  SDFFRX1M \mem_reg[17][3]  ( .D(n458), .SI(n668), .SE(n701), .CK(CLK), .RN(
        n271), .Q(n667), .QN(n217) );
  SDFFRX1M \mem_reg[17][2]  ( .D(n457), .SI(n669), .SE(n702), .CK(CLK), .RN(
        n271), .Q(n668), .QN(n218) );
  SDFFRX1M \mem_reg[17][1]  ( .D(n456), .SI(n670), .SE(n698), .CK(CLK), .RN(
        n270), .Q(n669), .QN(n219) );
  SDFFRX1M \mem_reg[17][0]  ( .D(n455), .SI(n671), .SE(n702), .CK(CLK), .RN(
        n271), .Q(n670), .QN(n220) );
  SDFFRX1M \mem_reg[20][7]  ( .D(n438), .SI(n640), .SE(n699), .CK(CLK), .RN(
        n268), .Q(n639), .QN(n237) );
  SDFFRX1M \mem_reg[20][6]  ( .D(n437), .SI(n641), .SE(n703), .CK(CLK), .RN(
        n269), .Q(n640), .QN(n238) );
  SDFFRX1M \mem_reg[20][5]  ( .D(n436), .SI(n642), .SE(n700), .CK(CLK), .RN(
        n269), .Q(n641), .QN(n239) );
  SDFFRX1M \mem_reg[20][4]  ( .D(n435), .SI(n643), .SE(n703), .CK(CLK), .RN(
        n268), .Q(n642), .QN(n240) );
  SDFFRX1M \mem_reg[20][3]  ( .D(n434), .SI(n644), .SE(n698), .CK(CLK), .RN(
        n268), .Q(n643), .QN(n241) );
  SDFFRX1M \mem_reg[20][2]  ( .D(n433), .SI(n645), .SE(n701), .CK(CLK), .RN(
        n269), .Q(n644), .QN(n242) );
  SDFFRX1M \mem_reg[20][1]  ( .D(n432), .SI(n646), .SE(n702), .CK(CLK), .RN(
        n268), .Q(n645), .QN(n243) );
  SDFFRX1M \mem_reg[20][0]  ( .D(n431), .SI(n647), .SE(n701), .CK(CLK), .RN(
        n269), .Q(n646), .QN(n244) );
  SDFFRX1M \mem_reg[12][7]  ( .D(n502), .SI(n680), .SE(n700), .CK(CLK), .RN(
        n270), .Q(n679), .QN(n197) );
  SDFFRX1M \mem_reg[12][6]  ( .D(n501), .SI(n681), .SE(n699), .CK(CLK), .RN(
        n272), .Q(n680), .QN(n198) );
  SDFFRX1M \mem_reg[12][5]  ( .D(n500), .SI(n682), .SE(n703), .CK(CLK), .RN(
        n272), .Q(n681), .QN(n199) );
  SDFFRX1M \mem_reg[12][4]  ( .D(n499), .SI(n683), .SE(n699), .CK(CLK), .RN(
        n272), .Q(n682), .QN(n200) );
  SDFFRX1M \mem_reg[12][3]  ( .D(n498), .SI(n684), .SE(n702), .CK(CLK), .RN(
        n272), .Q(n683), .QN(n201) );
  SDFFRX1M \mem_reg[12][2]  ( .D(n497), .SI(n685), .SE(n698), .CK(CLK), .RN(
        n272), .Q(n684), .QN(n202) );
  SDFFRX1M \mem_reg[12][1]  ( .D(n496), .SI(n686), .SE(n701), .CK(CLK), .RN(
        n272), .Q(n685), .QN(n203) );
  SDFFRX1M \mem_reg[12][0]  ( .D(n495), .SI(n687), .SE(n698), .CK(CLK), .RN(
        n271), .Q(n686), .QN(n204) );
  SDFFRX1M \mem_reg[11][7]  ( .D(n510), .SI(n688), .SE(n703), .CK(CLK), .RN(
        n271), .Q(n687), .QN(n189) );
  SDFFRX1M \mem_reg[11][6]  ( .D(n509), .SI(n689), .SE(n700), .CK(CLK), .RN(
        n272), .Q(n688), .QN(n190) );
  SDFFRX1M \mem_reg[11][5]  ( .D(n508), .SI(n690), .SE(n699), .CK(CLK), .RN(
        n272), .Q(n689), .QN(n191) );
  SDFFRX1M \mem_reg[11][4]  ( .D(n507), .SI(n691), .SE(n700), .CK(CLK), .RN(
        n273), .Q(n690), .QN(n192) );
  SDFFRX1M \mem_reg[11][3]  ( .D(n506), .SI(n692), .SE(n701), .CK(CLK), .RN(
        n273), .Q(n691), .QN(n193) );
  SDFFRX1M \mem_reg[11][2]  ( .D(n505), .SI(n693), .SE(n702), .CK(CLK), .RN(
        n272), .Q(n692), .QN(n194) );
  SDFFRX1M \mem_reg[11][1]  ( .D(n504), .SI(n694), .SE(n698), .CK(CLK), .RN(
        n273), .Q(n693), .QN(n195) );
  SDFFRX1M \mem_reg[11][0]  ( .D(n503), .SI(\mem[10][7] ), .SE(n702), .CK(CLK), 
        .RN(n273), .Q(n694), .QN(n196) );
  SDFFRX1M \mem_reg[18][7]  ( .D(n454), .SI(n656), .SE(n699), .CK(CLK), .RN(
        n269), .Q(n655), .QN(n221) );
  SDFFRX1M \mem_reg[18][6]  ( .D(n453), .SI(n657), .SE(n703), .CK(CLK), .RN(
        n269), .Q(n656), .QN(n222) );
  SDFFRX1M \mem_reg[18][5]  ( .D(n452), .SI(n658), .SE(n700), .CK(CLK), .RN(
        n270), .Q(n657), .QN(n223) );
  SDFFRX1M \mem_reg[18][4]  ( .D(n451), .SI(n659), .SE(n703), .CK(CLK), .RN(
        n270), .Q(n658), .QN(n224) );
  SDFFRX1M \mem_reg[18][3]  ( .D(n450), .SI(n660), .SE(n698), .CK(CLK), .RN(
        n270), .Q(n659), .QN(n225) );
  SDFFRX1M \mem_reg[18][2]  ( .D(n449), .SI(n661), .SE(n701), .CK(CLK), .RN(
        n270), .Q(n660), .QN(n226) );
  SDFFRX1M \mem_reg[18][1]  ( .D(n448), .SI(n662), .SE(n702), .CK(CLK), .RN(
        n270), .Q(n661), .QN(n227) );
  SDFFRX1M \mem_reg[18][0]  ( .D(n447), .SI(n663), .SE(n701), .CK(CLK), .RN(
        n269), .Q(n662), .QN(n228) );
  SDFFRX1M \mem_reg[21][7]  ( .D(n430), .SI(n632), .SE(n700), .CK(CLK), .RN(
        n268), .Q(test_so2), .QN(n245) );
  SDFFRX1M \mem_reg[21][6]  ( .D(n429), .SI(n633), .SE(n699), .CK(CLK), .RN(
        n268), .Q(n632), .QN(n246) );
  SDFFRX1M \mem_reg[21][5]  ( .D(n428), .SI(n634), .SE(n703), .CK(CLK), .RN(
        n268), .Q(n633), .QN(n247) );
  SDFFRX1M \mem_reg[21][4]  ( .D(n427), .SI(n635), .SE(n699), .CK(CLK), .RN(
        n268), .Q(n634), .QN(n248) );
  SDFFRX1M \mem_reg[21][3]  ( .D(n426), .SI(n636), .SE(n702), .CK(CLK), .RN(
        n268), .Q(n635), .QN(n249) );
  SDFFRX1M \mem_reg[21][2]  ( .D(n425), .SI(n637), .SE(n698), .CK(CLK), .RN(
        n268), .Q(n636), .QN(n250) );
  SDFFRX1M \mem_reg[21][1]  ( .D(n424), .SI(n638), .SE(n701), .CK(CLK), .RN(
        n268), .Q(n637), .QN(n251) );
  SDFFRX1M \mem_reg[21][0]  ( .D(n423), .SI(n639), .SE(n698), .CK(CLK), .RN(
        n268), .Q(n638), .QN(n252) );
  SDFFRX1M \mem_reg[16][7]  ( .D(n470), .SI(n672), .SE(n703), .CK(CLK), .RN(
        n271), .Q(n671), .QN(n205) );
  SDFFRX1M \mem_reg[16][6]  ( .D(n469), .SI(n673), .SE(n700), .CK(CLK), .RN(
        n272), .Q(n672), .QN(n206) );
  SDFFRX1M \mem_reg[16][5]  ( .D(n468), .SI(test_si3), .SE(n699), .CK(CLK), 
        .RN(n271), .Q(n673), .QN(n207) );
  SDFFRX1M \mem_reg[16][3]  ( .D(n466), .SI(n676), .SE(n701), .CK(CLK), .RN(
        n272), .Q(n675), .QN(n209) );
  SDFFRX1M \mem_reg[16][2]  ( .D(n465), .SI(n677), .SE(n702), .CK(CLK), .RN(
        n271), .Q(n676), .QN(n210) );
  SDFFRX1M \mem_reg[16][1]  ( .D(n464), .SI(n678), .SE(n698), .CK(CLK), .RN(
        n271), .Q(n677), .QN(n211) );
  SDFFRX1M \mem_reg[16][0]  ( .D(n463), .SI(\mem[15][7] ), .SE(n702), .CK(CLK), 
        .RN(n271), .Q(n678), .QN(n212) );
  SDFFRX1M \mem_reg[19][7]  ( .D(n446), .SI(n648), .SE(n699), .CK(CLK), .RN(
        n269), .Q(n647), .QN(n229) );
  SDFFRX1M \mem_reg[19][6]  ( .D(n445), .SI(n649), .SE(n703), .CK(CLK), .RN(
        n270), .Q(n648), .QN(n230) );
  SDFFRX1M \mem_reg[19][5]  ( .D(n444), .SI(n650), .SE(n700), .CK(CLK), .RN(
        n269), .Q(n649), .QN(n231) );
  SDFFRX1M \mem_reg[19][4]  ( .D(n443), .SI(n651), .SE(n703), .CK(CLK), .RN(
        n270), .Q(n650), .QN(n232) );
  SDFFRX1M \mem_reg[19][3]  ( .D(n442), .SI(n652), .SE(n698), .CK(CLK), .RN(
        n270), .Q(n651), .QN(n233) );
  SDFFRX1M \mem_reg[19][2]  ( .D(n441), .SI(n653), .SE(n701), .CK(CLK), .RN(
        n269), .Q(n652), .QN(n234) );
  SDFFRX1M \mem_reg[19][1]  ( .D(n440), .SI(n654), .SE(n702), .CK(CLK), .RN(
        n269), .Q(n653), .QN(n235) );
  SDFFRX1M \mem_reg[19][0]  ( .D(n439), .SI(n655), .SE(n701), .CK(CLK), .RN(
        n269), .Q(n654), .QN(n236) );
  SDFFRQX2M RdData_Valid_reg ( .D(n618), .SI(test_si1), .SE(n698), .CK(CLK), 
        .RN(n273), .Q(RdData_Valid) );
  SDFFRQX2M \mem_reg[2][3]  ( .D(n578), .SI(REG2[2]), .SE(n698), .CK(CLK), 
        .RN(n602), .Q(REG2[3]) );
  SDFFRQX2M \mem_reg[2][2]  ( .D(n577), .SI(REG2[1]), .SE(n698), .CK(CLK), 
        .RN(n602), .Q(REG2[2]) );
  SDFFRQX2M \mem_reg[2][4]  ( .D(n579), .SI(REG2[3]), .SE(n700), .CK(CLK), 
        .RN(n602), .Q(REG2[4]) );
  SDFFRQX2M \mem_reg[2][6]  ( .D(n581), .SI(REG2[5]), .SE(n700), .CK(CLK), 
        .RN(n603), .Q(REG2[6]) );
  SDFFRQX2M \mem_reg[2][5]  ( .D(n580), .SI(REG2[4]), .SE(n700), .CK(CLK), 
        .RN(n603), .Q(REG2[5]) );
  SDFFRQX2M \mem_reg[2][7]  ( .D(n582), .SI(REG2[6]), .SE(n700), .CK(CLK), 
        .RN(n603), .Q(REG2[7]) );
  SDFFRQX2M \mem_reg[2][0]  ( .D(n575), .SI(REG1[7]), .SE(n702), .CK(CLK), 
        .RN(n602), .Q(REG2[0]) );
  SDFFRQX2M \mem_reg[3][7]  ( .D(n574), .SI(REG3[6]), .SE(n702), .CK(CLK), 
        .RN(n602), .Q(REG3[7]) );
  SDFFRQX2M \mem_reg[3][6]  ( .D(n573), .SI(REG3[5]), .SE(n702), .CK(CLK), 
        .RN(n602), .Q(REG3[6]) );
  SDFFRQX2M \mem_reg[3][0]  ( .D(n567), .SI(REG2[7]), .SE(n702), .CK(CLK), 
        .RN(n602), .Q(REG3[0]) );
  SDFFRQX2M \mem_reg[3][2]  ( .D(n569), .SI(REG3[1]), .SE(n703), .CK(CLK), 
        .RN(n602), .Q(REG3[2]) );
  SDFFRQX2M \mem_reg[3][5]  ( .D(n572), .SI(REG3[4]), .SE(n703), .CK(CLK), 
        .RN(n602), .Q(REG3[5]) );
  SDFFRQX2M \mem_reg[3][4]  ( .D(n571), .SI(REG3[3]), .SE(n703), .CK(CLK), 
        .RN(n602), .Q(REG3[4]) );
  SDFFRQX2M \mem_reg[3][3]  ( .D(n570), .SI(REG3[2]), .SE(n703), .CK(CLK), 
        .RN(n602), .Q(REG3[3]) );
  SDFFRQX2M \mem_reg[3][1]  ( .D(n568), .SI(REG3[0]), .SE(n701), .CK(CLK), 
        .RN(n602), .Q(REG3[1]) );
  SDFFRQX2M \mem_reg[1][1]  ( .D(n584), .SI(REG1[0]), .SE(n701), .CK(CLK), 
        .RN(n603), .Q(REG1[1]) );
  SDFFRQX2M \mem_reg[0][5]  ( .D(n596), .SI(REG0[4]), .SE(n701), .CK(CLK), 
        .RN(n603), .Q(REG0[5]) );
  SDFFRQX2M \mem_reg[0][4]  ( .D(n595), .SI(test_si2), .SE(n701), .CK(CLK), 
        .RN(n603), .Q(REG0[4]) );
  SDFFRQX2M \mem_reg[0][3]  ( .D(n594), .SI(REG0[2]), .SE(n699), .CK(CLK), 
        .RN(n603), .Q(REG0[3]) );
  SDFFRQX2M \mem_reg[0][2]  ( .D(n593), .SI(REG0[1]), .SE(n699), .CK(CLK), 
        .RN(n603), .Q(REG0[2]) );
  SDFFRQX2M \mem_reg[1][4]  ( .D(n587), .SI(REG1[3]), .SE(n699), .CK(CLK), 
        .RN(n603), .Q(REG1[4]) );
  SDFFRQX2M \mem_reg[1][5]  ( .D(n588), .SI(REG1[4]), .SE(n699), .CK(CLK), 
        .RN(n603), .Q(REG1[5]) );
  SDFFRQX2M \mem_reg[1][2]  ( .D(n585), .SI(REG1[1]), .SE(n698), .CK(CLK), 
        .RN(n603), .Q(REG1[2]) );
  SDFFRQX2M \mem_reg[1][3]  ( .D(n586), .SI(REG1[2]), .SE(n698), .CK(CLK), 
        .RN(n603), .Q(REG1[3]) );
  SDFFRQX2M \mem_reg[1][6]  ( .D(n589), .SI(REG1[5]), .SE(n698), .CK(CLK), 
        .RN(n603), .Q(REG1[6]) );
  SDFFRQX2M \mem_reg[0][6]  ( .D(n597), .SI(REG0[5]), .SE(n698), .CK(CLK), 
        .RN(n603), .Q(REG0[6]) );
  SDFFRQX2M \mem_reg[1][0]  ( .D(n583), .SI(REG0[7]), .SE(n699), .CK(CLK), 
        .RN(n603), .Q(REG1[0]) );
  SDFFRQX2M \mem_reg[0][0]  ( .D(n591), .SI(RdData[7]), .SE(n700), .CK(CLK), 
        .RN(n603), .Q(REG0[0]) );
  SDFFRQX2M \mem_reg[0][1]  ( .D(n592), .SI(REG0[0]), .SE(n700), .CK(CLK), 
        .RN(n603), .Q(REG0[1]) );
  SDFFRQX2M \mem_reg[1][7]  ( .D(n590), .SI(REG1[6]), .SE(n700), .CK(CLK), 
        .RN(n603), .Q(REG1[7]) );
  SDFFRQX2M \mem_reg[0][7]  ( .D(n598), .SI(REG0[6]), .SE(n698), .CK(CLK), 
        .RN(n599), .Q(REG0[7]) );
  NOR3BX2M U5 ( .AN(n1), .B(Address[3]), .C(n394), .Y(n388) );
  NOR3X2M U189 ( .A(n394), .B(n621), .C(n1), .Y(n396) );
  NOR2X2M U190 ( .A(Address[3]), .B(n1), .Y(n405) );
  BUFX2M U191 ( .A(Address[4]), .Y(n1) );
  INVX2M U192 ( .A(n265), .Y(n609) );
  INVX2M U193 ( .A(n264), .Y(n617) );
  INVX2M U194 ( .A(n263), .Y(n611) );
  INVX2M U195 ( .A(n262), .Y(n615) );
  INVX2M U196 ( .A(n261), .Y(n612) );
  INVX2M U197 ( .A(n260), .Y(n614) );
  NAND2X2M U198 ( .A(n619), .B(n299), .Y(n407) );
  NAND2X2M U199 ( .A(n619), .B(n303), .Y(n408) );
  NAND2X2M U200 ( .A(n619), .B(n304), .Y(n409) );
  NAND2X2M U201 ( .A(n619), .B(n302), .Y(n411) );
  NAND2X2M U202 ( .A(n619), .B(n305), .Y(n412) );
  NAND2X2M U203 ( .A(n619), .B(n306), .Y(n414) );
  INVX2M U204 ( .A(n256), .Y(n616) );
  INVX2M U205 ( .A(n255), .Y(n610) );
  BUFX2M U206 ( .A(n387), .Y(n265) );
  NAND2X2M U207 ( .A(n388), .B(n379), .Y(n387) );
  BUFX2M U208 ( .A(n389), .Y(n264) );
  NAND2X2M U209 ( .A(n388), .B(n381), .Y(n389) );
  BUFX2M U210 ( .A(n390), .Y(n263) );
  NAND2X2M U211 ( .A(n388), .B(n380), .Y(n390) );
  BUFX2M U212 ( .A(n391), .Y(n262) );
  NAND2X2M U213 ( .A(n388), .B(n386), .Y(n391) );
  BUFX2M U214 ( .A(n392), .Y(n261) );
  NAND2XLM U215 ( .A(n388), .B(n373), .Y(n392) );
  BUFX2M U216 ( .A(n393), .Y(n260) );
  NAND2XLM U217 ( .A(n388), .B(n372), .Y(n393) );
  NOR2BX2M U218 ( .AN(n413), .B(n613), .Y(n373) );
  NAND3X2M U219 ( .A(n405), .B(n378), .C(n619), .Y(n404) );
  NAND3X2M U220 ( .A(n405), .B(n377), .C(n619), .Y(n406) );
  NOR2BX2M U221 ( .AN(n410), .B(n613), .Y(n380) );
  NOR2BX2M U222 ( .AN(n374), .B(n620), .Y(n378) );
  NOR2BX2M U223 ( .AN(n375), .B(n620), .Y(n377) );
  NOR2BX2M U224 ( .AN(n379), .B(n621), .Y(n289) );
  NOR2BX2M U225 ( .AN(n372), .B(n621), .Y(n296) );
  NOR2BX2M U226 ( .AN(n377), .B(n621), .Y(n291) );
  NOR2BX2M U227 ( .AN(n373), .B(n621), .Y(n298) );
  NOR2BX2M U228 ( .AN(n378), .B(n621), .Y(n290) );
  NOR2BX2M U229 ( .AN(n386), .B(n621), .Y(n297) );
  INVX2M U230 ( .A(n394), .Y(n619) );
  AND2X2M U231 ( .A(n405), .B(n386), .Y(n302) );
  AND2X2M U232 ( .A(n405), .B(n379), .Y(n299) );
  AND2X2M U233 ( .A(n405), .B(n372), .Y(n306) );
  AND2X2M U234 ( .A(n405), .B(n373), .Y(n305) );
  AND2X2M U235 ( .A(n405), .B(n380), .Y(n304) );
  AND2X2M U236 ( .A(n405), .B(n381), .Y(n303) );
  BUFX2M U237 ( .A(n403), .Y(n3) );
  NAND2X2M U238 ( .A(n396), .B(n372), .Y(n403) );
  BUFX2M U239 ( .A(n401), .Y(n254) );
  NAND2X2M U240 ( .A(n396), .B(n386), .Y(n401) );
  BUFX2M U241 ( .A(n398), .Y(n257) );
  NAND2X2M U242 ( .A(n396), .B(n379), .Y(n398) );
  BUFX2M U243 ( .A(n395), .Y(n259) );
  NAND2X2M U244 ( .A(n396), .B(n378), .Y(n395) );
  BUFX2M U245 ( .A(n397), .Y(n258) );
  NAND2X2M U246 ( .A(n396), .B(n377), .Y(n397) );
  BUFX2M U247 ( .A(n402), .Y(n253) );
  NAND2X2M U248 ( .A(n396), .B(n373), .Y(n402) );
  BUFX2M U249 ( .A(n399), .Y(n256) );
  NAND2X2M U250 ( .A(n396), .B(n381), .Y(n399) );
  BUFX2M U251 ( .A(n400), .Y(n255) );
  NAND2X2M U252 ( .A(n396), .B(n380), .Y(n400) );
  INVX2M U253 ( .A(n2), .Y(n618) );
  BUFX2M U254 ( .A(n605), .Y(n273) );
  BUFX2M U255 ( .A(n605), .Y(n600) );
  BUFX2M U256 ( .A(n604), .Y(n601) );
  BUFX2M U257 ( .A(n604), .Y(n602) );
  BUFX2M U258 ( .A(n605), .Y(n599) );
  BUFX2M U259 ( .A(n607), .Y(n268) );
  BUFX2M U260 ( .A(n607), .Y(n269) );
  BUFX2M U261 ( .A(n606), .Y(n270) );
  BUFX2M U262 ( .A(n606), .Y(n272) );
  BUFX2M U263 ( .A(n606), .Y(n271) );
  BUFX2M U264 ( .A(n604), .Y(n603) );
  NAND3BX2M U265 ( .AN(RdEn), .B(N84), .C(WrEn), .Y(n394) );
  NOR2BX2M U266 ( .AN(n413), .B(Address[0]), .Y(n372) );
  INVX2M U267 ( .A(Address[0]), .Y(n613) );
  NAND3X2M U268 ( .A(n1), .B(Address[0]), .C(Address[1]), .Y(n285) );
  INVX2M U269 ( .A(Address[3]), .Y(n621) );
  NOR2BX2M U270 ( .AN(n375), .B(Address[1]), .Y(n381) );
  NOR2BX2M U271 ( .AN(n410), .B(Address[0]), .Y(n386) );
  NOR2BX2M U272 ( .AN(n374), .B(Address[1]), .Y(n379) );
  NOR2BX2M U273 ( .AN(Address[2]), .B(Address[0]), .Y(n375) );
  NOR2BX2M U274 ( .AN(n377), .B(Address[3]), .Y(n301) );
  NOR2BX2M U275 ( .AN(n378), .B(Address[3]), .Y(n300) );
  NAND2X2M U276 ( .A(n381), .B(Address[3]), .Y(n286) );
  NAND2X2M U277 ( .A(n380), .B(Address[3]), .Y(n287) );
  NOR2BX2M U278 ( .AN(Address[2]), .B(n613), .Y(n374) );
  NAND3X2M U279 ( .A(n1), .B(n613), .C(Address[1]), .Y(n281) );
  INVX2M U280 ( .A(Address[1]), .Y(n620) );
  NAND2X2M U281 ( .A(n372), .B(n1), .Y(n282) );
  NAND2X2M U282 ( .A(n373), .B(n1), .Y(n280) );
  NAND2X2M U283 ( .A(n375), .B(n1), .Y(n283) );
  NOR2X2M U284 ( .A(Address[1]), .B(Address[2]), .Y(n413) );
  NAND2X2M U285 ( .A(n1), .B(n374), .Y(n284) );
  NOR2X2M U286 ( .A(n620), .B(Address[2]), .Y(n410) );
  BUFX2M U287 ( .A(n275), .Y(n2) );
  NAND3BX2M U288 ( .AN(WrEn), .B(N84), .C(RdEn), .Y(n275) );
  BUFX2M U289 ( .A(n267), .Y(n606) );
  BUFX2M U290 ( .A(n266), .Y(n604) );
  BUFX2M U291 ( .A(n266), .Y(n605) );
  BUFX2M U292 ( .A(n267), .Y(n607) );
  INVX2M U293 ( .A(WrData[0]), .Y(n622) );
  INVX2M U294 ( .A(WrData[1]), .Y(n623) );
  INVX2M U295 ( .A(WrData[2]), .Y(n624) );
  INVX2M U296 ( .A(WrData[3]), .Y(n625) );
  INVX2M U297 ( .A(WrData[4]), .Y(n626) );
  INVX2M U298 ( .A(WrData[5]), .Y(n627) );
  INVX2M U299 ( .A(WrData[6]), .Y(n628) );
  INVX2M U300 ( .A(WrData[7]), .Y(n629) );
  BUFX2M U301 ( .A(RST), .Y(n267) );
  BUFX2M U302 ( .A(RST), .Y(n266) );
  OAI22X1M U303 ( .A0(n265), .A1(n622), .B0(n609), .B1(n252), .Y(n423) );
  OAI22X1M U304 ( .A0(n265), .A1(n623), .B0(n609), .B1(n251), .Y(n424) );
  OAI22X1M U305 ( .A0(n265), .A1(n624), .B0(n609), .B1(n250), .Y(n425) );
  OAI22X1M U306 ( .A0(n265), .A1(n625), .B0(n609), .B1(n249), .Y(n426) );
  OAI22X1M U307 ( .A0(n265), .A1(n626), .B0(n609), .B1(n248), .Y(n427) );
  OAI22X1M U308 ( .A0(n265), .A1(n627), .B0(n609), .B1(n247), .Y(n428) );
  OAI22X1M U309 ( .A0(n265), .A1(n628), .B0(n609), .B1(n246), .Y(n429) );
  OAI22X1M U310 ( .A0(n265), .A1(n629), .B0(n609), .B1(n245), .Y(n430) );
  OAI22X1M U311 ( .A0(n622), .A1(n264), .B0(n617), .B1(n244), .Y(n431) );
  OAI22X1M U312 ( .A0(n623), .A1(n264), .B0(n617), .B1(n243), .Y(n432) );
  OAI22X1M U313 ( .A0(n624), .A1(n264), .B0(n617), .B1(n242), .Y(n433) );
  OAI22X1M U314 ( .A0(n625), .A1(n264), .B0(n617), .B1(n241), .Y(n434) );
  OAI22X1M U315 ( .A0(n626), .A1(n264), .B0(n617), .B1(n240), .Y(n435) );
  OAI22X1M U316 ( .A0(n627), .A1(n264), .B0(n617), .B1(n239), .Y(n436) );
  OAI22X1M U317 ( .A0(n628), .A1(n264), .B0(n617), .B1(n238), .Y(n437) );
  OAI22X1M U318 ( .A0(n629), .A1(n264), .B0(n617), .B1(n237), .Y(n438) );
  OAI22X1M U319 ( .A0(n622), .A1(n263), .B0(n611), .B1(n236), .Y(n439) );
  OAI22X1M U320 ( .A0(n623), .A1(n263), .B0(n611), .B1(n235), .Y(n440) );
  OAI22X1M U321 ( .A0(n624), .A1(n263), .B0(n611), .B1(n234), .Y(n441) );
  OAI22X1M U322 ( .A0(n625), .A1(n263), .B0(n611), .B1(n233), .Y(n442) );
  OAI22X1M U323 ( .A0(n626), .A1(n263), .B0(n611), .B1(n232), .Y(n443) );
  OAI22X1M U324 ( .A0(n627), .A1(n263), .B0(n611), .B1(n231), .Y(n444) );
  OAI22X1M U325 ( .A0(n628), .A1(n263), .B0(n611), .B1(n230), .Y(n445) );
  OAI22X1M U326 ( .A0(n629), .A1(n263), .B0(n611), .B1(n229), .Y(n446) );
  OAI22X1M U327 ( .A0(n622), .A1(n262), .B0(n615), .B1(n228), .Y(n447) );
  OAI22X1M U328 ( .A0(n623), .A1(n262), .B0(n615), .B1(n227), .Y(n448) );
  OAI22X1M U329 ( .A0(n624), .A1(n262), .B0(n615), .B1(n226), .Y(n449) );
  OAI22X1M U330 ( .A0(n625), .A1(n262), .B0(n615), .B1(n225), .Y(n450) );
  OAI22X1M U331 ( .A0(n626), .A1(n262), .B0(n615), .B1(n224), .Y(n451) );
  OAI22X1M U332 ( .A0(n627), .A1(n262), .B0(n615), .B1(n223), .Y(n452) );
  OAI22X1M U333 ( .A0(n628), .A1(n262), .B0(n615), .B1(n222), .Y(n453) );
  OAI22X1M U334 ( .A0(n629), .A1(n262), .B0(n615), .B1(n221), .Y(n454) );
  OAI22X1M U335 ( .A0(n622), .A1(n261), .B0(n612), .B1(n220), .Y(n455) );
  OAI22X1M U336 ( .A0(n623), .A1(n261), .B0(n612), .B1(n219), .Y(n456) );
  OAI22X1M U337 ( .A0(n624), .A1(n261), .B0(n612), .B1(n218), .Y(n457) );
  OAI22X1M U338 ( .A0(n625), .A1(n261), .B0(n612), .B1(n217), .Y(n458) );
  OAI22X1M U339 ( .A0(n626), .A1(n261), .B0(n612), .B1(n216), .Y(n459) );
  OAI22X1M U340 ( .A0(n627), .A1(n261), .B0(n612), .B1(n215), .Y(n460) );
  OAI22X1M U341 ( .A0(n628), .A1(n261), .B0(n612), .B1(n214), .Y(n461) );
  OAI22X1M U342 ( .A0(n629), .A1(n261), .B0(n612), .B1(n213), .Y(n462) );
  OAI22X1M U343 ( .A0(n622), .A1(n260), .B0(n614), .B1(n212), .Y(n463) );
  OAI22X1M U344 ( .A0(n623), .A1(n260), .B0(n614), .B1(n211), .Y(n464) );
  OAI22X1M U345 ( .A0(n624), .A1(n260), .B0(n614), .B1(n210), .Y(n465) );
  OAI22X1M U346 ( .A0(n625), .A1(n260), .B0(n614), .B1(n209), .Y(n466) );
  OAI22X1M U347 ( .A0(n626), .A1(n260), .B0(n614), .B1(n208), .Y(n467) );
  OAI22X1M U348 ( .A0(n627), .A1(n260), .B0(n614), .B1(n207), .Y(n468) );
  OAI22X1M U349 ( .A0(n628), .A1(n260), .B0(n614), .B1(n206), .Y(n469) );
  OAI22X1M U350 ( .A0(n629), .A1(n260), .B0(n614), .B1(n205), .Y(n470) );
  AOI222X1M U351 ( .A0(REG2[0]), .A1(n302), .B0(\mem[4][0] ), .B1(n303), .C0(
        REG3[0]), .C1(n304), .Y(n293) );
  AOI222X1M U352 ( .A0(REG2[1]), .A1(n302), .B0(\mem[4][1] ), .B1(n303), .C0(
        REG3[1]), .C1(n304), .Y(n314) );
  AOI222X1M U353 ( .A0(REG2[2]), .A1(n302), .B0(\mem[4][2] ), .B1(n303), .C0(
        REG3[2]), .C1(n304), .Y(n324) );
  AOI222X1M U354 ( .A0(REG2[3]), .A1(n302), .B0(\mem[4][3] ), .B1(n303), .C0(
        REG3[3]), .C1(n304), .Y(n334) );
  AOI222X1M U355 ( .A0(REG2[4]), .A1(n302), .B0(\mem[4][4] ), .B1(n303), .C0(
        REG3[4]), .C1(n304), .Y(n344) );
  AOI222X1M U356 ( .A0(REG2[5]), .A1(n302), .B0(\mem[4][5] ), .B1(n303), .C0(
        REG3[5]), .C1(n304), .Y(n354) );
  AOI222X1M U357 ( .A0(REG2[6]), .A1(n302), .B0(\mem[4][6] ), .B1(n303), .C0(
        REG3[6]), .C1(n304), .Y(n364) );
  AOI222X1M U358 ( .A0(REG2[7]), .A1(n302), .B0(\mem[4][7] ), .B1(n303), .C0(
        REG3[7]), .C1(n304), .Y(n383) );
  OAI221X1M U359 ( .A0(n286), .A1(n204), .B0(n287), .B1(n196), .C0(n288), .Y(
        n277) );
  AOI222X1M U360 ( .A0(\mem[13][0] ), .A1(n289), .B0(\mem[15][0] ), .B1(n290), 
        .C0(\mem[14][0] ), .C1(n291), .Y(n288) );
  OAI221X1M U361 ( .A0(n286), .A1(n203), .B0(n287), .B1(n195), .C0(n312), .Y(
        n309) );
  AOI222X1M U362 ( .A0(\mem[13][1] ), .A1(n289), .B0(\mem[15][1] ), .B1(n290), 
        .C0(\mem[14][1] ), .C1(n291), .Y(n312) );
  OAI221X1M U363 ( .A0(n286), .A1(n202), .B0(n287), .B1(n194), .C0(n322), .Y(
        n319) );
  AOI222X1M U364 ( .A0(\mem[13][2] ), .A1(n289), .B0(\mem[15][2] ), .B1(n290), 
        .C0(\mem[14][2] ), .C1(n291), .Y(n322) );
  OAI221X1M U365 ( .A0(n286), .A1(n201), .B0(n287), .B1(n193), .C0(n332), .Y(
        n329) );
  AOI222X1M U366 ( .A0(\mem[13][3] ), .A1(n289), .B0(\mem[15][3] ), .B1(n290), 
        .C0(\mem[14][3] ), .C1(n291), .Y(n332) );
  OAI221X1M U367 ( .A0(n286), .A1(n200), .B0(n287), .B1(n192), .C0(n342), .Y(
        n339) );
  AOI222X1M U368 ( .A0(\mem[13][4] ), .A1(n289), .B0(\mem[15][4] ), .B1(n290), 
        .C0(\mem[14][4] ), .C1(n291), .Y(n342) );
  OAI221X1M U369 ( .A0(n286), .A1(n199), .B0(n287), .B1(n191), .C0(n352), .Y(
        n349) );
  AOI222X1M U370 ( .A0(\mem[13][5] ), .A1(n289), .B0(\mem[15][5] ), .B1(n290), 
        .C0(\mem[14][5] ), .C1(n291), .Y(n352) );
  OAI221X1M U371 ( .A0(n286), .A1(n198), .B0(n287), .B1(n190), .C0(n362), .Y(
        n359) );
  AOI222X1M U372 ( .A0(\mem[13][6] ), .A1(n289), .B0(\mem[15][6] ), .B1(n290), 
        .C0(\mem[14][6] ), .C1(n291), .Y(n362) );
  OAI221X1M U373 ( .A0(n286), .A1(n197), .B0(n287), .B1(n189), .C0(n376), .Y(
        n369) );
  AOI222X1M U374 ( .A0(\mem[13][7] ), .A1(n289), .B0(\mem[15][7] ), .B1(n290), 
        .C0(\mem[14][7] ), .C1(n291), .Y(n376) );
  NAND4X2M U375 ( .A(n292), .B(n293), .C(n294), .D(n295), .Y(n276) );
  AOI22X1M U376 ( .A0(REG1[0]), .A1(n305), .B0(REG0[0]), .B1(n306), .Y(n292)
         );
  AOI222X1M U377 ( .A0(\mem[8][0] ), .A1(n296), .B0(\mem[10][0] ), .B1(n297), 
        .C0(\mem[9][0] ), .C1(n298), .Y(n295) );
  AOI222X1M U378 ( .A0(\mem[5][0] ), .A1(n299), .B0(\mem[7][0] ), .B1(n300), 
        .C0(\mem[6][0] ), .C1(n301), .Y(n294) );
  NAND4X2M U379 ( .A(n313), .B(n314), .C(n315), .D(n316), .Y(n308) );
  AOI22X1M U380 ( .A0(REG1[1]), .A1(n305), .B0(REG0[1]), .B1(n306), .Y(n313)
         );
  AOI222X1M U381 ( .A0(\mem[8][1] ), .A1(n296), .B0(\mem[10][1] ), .B1(n297), 
        .C0(\mem[9][1] ), .C1(n298), .Y(n316) );
  AOI222X1M U382 ( .A0(\mem[5][1] ), .A1(n299), .B0(\mem[7][1] ), .B1(n300), 
        .C0(\mem[6][1] ), .C1(n301), .Y(n315) );
  NAND4X2M U383 ( .A(n323), .B(n324), .C(n325), .D(n326), .Y(n318) );
  AOI22X1M U384 ( .A0(REG1[2]), .A1(n305), .B0(REG0[2]), .B1(n306), .Y(n323)
         );
  AOI222X1M U385 ( .A0(\mem[8][2] ), .A1(n296), .B0(\mem[10][2] ), .B1(n297), 
        .C0(\mem[9][2] ), .C1(n298), .Y(n326) );
  AOI222X1M U386 ( .A0(\mem[5][2] ), .A1(n299), .B0(\mem[7][2] ), .B1(n300), 
        .C0(\mem[6][2] ), .C1(n301), .Y(n325) );
  NAND4X2M U387 ( .A(n333), .B(n334), .C(n335), .D(n336), .Y(n328) );
  AOI22X1M U388 ( .A0(REG1[3]), .A1(n305), .B0(REG0[3]), .B1(n306), .Y(n333)
         );
  AOI222X1M U389 ( .A0(\mem[8][3] ), .A1(n296), .B0(\mem[10][3] ), .B1(n297), 
        .C0(\mem[9][3] ), .C1(n298), .Y(n336) );
  AOI222X1M U390 ( .A0(\mem[5][3] ), .A1(n299), .B0(\mem[7][3] ), .B1(n300), 
        .C0(\mem[6][3] ), .C1(n301), .Y(n335) );
  NAND4X2M U391 ( .A(n343), .B(n344), .C(n345), .D(n346), .Y(n338) );
  AOI22X1M U392 ( .A0(REG1[4]), .A1(n305), .B0(REG0[4]), .B1(n306), .Y(n343)
         );
  AOI222X1M U393 ( .A0(\mem[8][4] ), .A1(n296), .B0(\mem[10][4] ), .B1(n297), 
        .C0(\mem[9][4] ), .C1(n298), .Y(n346) );
  AOI222X1M U394 ( .A0(\mem[5][4] ), .A1(n299), .B0(\mem[7][4] ), .B1(n300), 
        .C0(\mem[6][4] ), .C1(n301), .Y(n345) );
  NAND4X2M U395 ( .A(n353), .B(n354), .C(n355), .D(n356), .Y(n348) );
  AOI22X1M U396 ( .A0(REG1[5]), .A1(n305), .B0(REG0[5]), .B1(n306), .Y(n353)
         );
  AOI222X1M U397 ( .A0(\mem[8][5] ), .A1(n296), .B0(\mem[10][5] ), .B1(n297), 
        .C0(\mem[9][5] ), .C1(n298), .Y(n356) );
  AOI222X1M U398 ( .A0(\mem[5][5] ), .A1(n299), .B0(\mem[7][5] ), .B1(n300), 
        .C0(\mem[6][5] ), .C1(n301), .Y(n355) );
  NAND4X2M U399 ( .A(n363), .B(n364), .C(n365), .D(n366), .Y(n358) );
  AOI22X1M U400 ( .A0(REG1[6]), .A1(n305), .B0(REG0[6]), .B1(n306), .Y(n363)
         );
  AOI222X1M U401 ( .A0(\mem[8][6] ), .A1(n296), .B0(\mem[10][6] ), .B1(n297), 
        .C0(\mem[9][6] ), .C1(n298), .Y(n366) );
  AOI222X1M U402 ( .A0(\mem[5][6] ), .A1(n299), .B0(\mem[7][6] ), .B1(n300), 
        .C0(\mem[6][6] ), .C1(n301), .Y(n365) );
  NAND4X2M U403 ( .A(n382), .B(n383), .C(n384), .D(n385), .Y(n368) );
  AOI22X1M U404 ( .A0(REG1[7]), .A1(n305), .B0(REG0[7]), .B1(n306), .Y(n382)
         );
  AOI222X1M U405 ( .A0(\mem[8][7] ), .A1(n296), .B0(\mem[10][7] ), .B1(n297), 
        .C0(\mem[9][7] ), .C1(n298), .Y(n385) );
  AOI222X1M U406 ( .A0(\mem[5][7] ), .A1(n299), .B0(\mem[7][7] ), .B1(n300), 
        .C0(\mem[6][7] ), .C1(n301), .Y(n384) );
  OAI22X1M U407 ( .A0(n622), .A1(n256), .B0(n616), .B1(n204), .Y(n495) );
  OAI22X1M U408 ( .A0(n623), .A1(n256), .B0(n616), .B1(n203), .Y(n496) );
  OAI22X1M U409 ( .A0(n624), .A1(n256), .B0(n616), .B1(n202), .Y(n497) );
  OAI22X1M U410 ( .A0(n625), .A1(n256), .B0(n616), .B1(n201), .Y(n498) );
  OAI22X1M U411 ( .A0(n626), .A1(n256), .B0(n616), .B1(n200), .Y(n499) );
  OAI22X1M U412 ( .A0(n627), .A1(n256), .B0(n616), .B1(n199), .Y(n500) );
  OAI22X1M U413 ( .A0(n628), .A1(n256), .B0(n616), .B1(n198), .Y(n501) );
  OAI22X1M U414 ( .A0(n629), .A1(n256), .B0(n616), .B1(n197), .Y(n502) );
  OAI22X1M U415 ( .A0(n622), .A1(n255), .B0(n610), .B1(n196), .Y(n503) );
  OAI22X1M U416 ( .A0(n623), .A1(n255), .B0(n610), .B1(n195), .Y(n504) );
  OAI22X1M U417 ( .A0(n624), .A1(n255), .B0(n610), .B1(n194), .Y(n505) );
  OAI22X1M U418 ( .A0(n625), .A1(n255), .B0(n610), .B1(n193), .Y(n506) );
  OAI22X1M U419 ( .A0(n626), .A1(n255), .B0(n610), .B1(n192), .Y(n507) );
  OAI22X1M U420 ( .A0(n627), .A1(n255), .B0(n610), .B1(n191), .Y(n508) );
  OAI22X1M U421 ( .A0(n628), .A1(n255), .B0(n610), .B1(n190), .Y(n509) );
  OAI22X1M U422 ( .A0(n629), .A1(n255), .B0(n610), .B1(n189), .Y(n510) );
  OAI2BB2X1M U423 ( .B0(n622), .B1(n404), .A0N(n404), .A1N(\mem[7][0] ), .Y(
        n535) );
  OAI2BB2X1M U424 ( .B0(n623), .B1(n404), .A0N(n404), .A1N(\mem[7][1] ), .Y(
        n536) );
  OAI2BB2X1M U425 ( .B0(n624), .B1(n404), .A0N(n404), .A1N(\mem[7][2] ), .Y(
        n537) );
  OAI2BB2X1M U426 ( .B0(n625), .B1(n404), .A0N(n404), .A1N(\mem[7][3] ), .Y(
        n538) );
  OAI2BB2X1M U427 ( .B0(n626), .B1(n404), .A0N(n404), .A1N(\mem[7][4] ), .Y(
        n539) );
  OAI2BB2X1M U428 ( .B0(n627), .B1(n404), .A0N(n404), .A1N(\mem[7][5] ), .Y(
        n540) );
  OAI2BB2X1M U429 ( .B0(n628), .B1(n404), .A0N(n404), .A1N(\mem[7][6] ), .Y(
        n541) );
  OAI2BB2X1M U430 ( .B0(n629), .B1(n404), .A0N(n404), .A1N(\mem[7][7] ), .Y(
        n542) );
  OAI2BB2X1M U431 ( .B0(n622), .B1(n406), .A0N(n406), .A1N(\mem[6][0] ), .Y(
        n543) );
  OAI2BB2X1M U432 ( .B0(n623), .B1(n406), .A0N(n406), .A1N(\mem[6][1] ), .Y(
        n544) );
  OAI2BB2X1M U433 ( .B0(n624), .B1(n406), .A0N(n406), .A1N(\mem[6][2] ), .Y(
        n545) );
  OAI2BB2X1M U434 ( .B0(n625), .B1(n406), .A0N(n406), .A1N(\mem[6][3] ), .Y(
        n546) );
  OAI2BB2X1M U435 ( .B0(n626), .B1(n406), .A0N(n406), .A1N(\mem[6][4] ), .Y(
        n547) );
  OAI2BB2X1M U436 ( .B0(n627), .B1(n406), .A0N(n406), .A1N(\mem[6][5] ), .Y(
        n548) );
  OAI2BB2X1M U437 ( .B0(n628), .B1(n406), .A0N(n406), .A1N(\mem[6][6] ), .Y(
        n549) );
  OAI2BB2X1M U438 ( .B0(n629), .B1(n406), .A0N(n406), .A1N(\mem[6][7] ), .Y(
        n550) );
  OAI2BB2X1M U439 ( .B0(n622), .B1(n407), .A0N(n407), .A1N(\mem[5][0] ), .Y(
        n551) );
  OAI2BB2X1M U440 ( .B0(n623), .B1(n407), .A0N(n407), .A1N(\mem[5][1] ), .Y(
        n552) );
  OAI2BB2X1M U441 ( .B0(n624), .B1(n407), .A0N(n407), .A1N(\mem[5][2] ), .Y(
        n553) );
  OAI2BB2X1M U442 ( .B0(n625), .B1(n407), .A0N(n407), .A1N(\mem[5][3] ), .Y(
        n554) );
  OAI2BB2X1M U443 ( .B0(n626), .B1(n407), .A0N(n407), .A1N(\mem[5][4] ), .Y(
        n555) );
  OAI2BB2X1M U444 ( .B0(n627), .B1(n407), .A0N(n407), .A1N(\mem[5][5] ), .Y(
        n556) );
  OAI2BB2X1M U445 ( .B0(n628), .B1(n407), .A0N(n407), .A1N(\mem[5][6] ), .Y(
        n557) );
  OAI2BB2X1M U446 ( .B0(n629), .B1(n407), .A0N(n407), .A1N(\mem[5][7] ), .Y(
        n558) );
  OAI2BB2X1M U447 ( .B0(n622), .B1(n408), .A0N(n408), .A1N(\mem[4][0] ), .Y(
        n559) );
  OAI2BB2X1M U448 ( .B0(n623), .B1(n408), .A0N(n408), .A1N(\mem[4][1] ), .Y(
        n560) );
  OAI2BB2X1M U449 ( .B0(n624), .B1(n408), .A0N(n408), .A1N(\mem[4][2] ), .Y(
        n561) );
  OAI2BB2X1M U450 ( .B0(n625), .B1(n408), .A0N(n408), .A1N(\mem[4][3] ), .Y(
        n562) );
  OAI2BB2X1M U451 ( .B0(n626), .B1(n408), .A0N(n408), .A1N(\mem[4][4] ), .Y(
        n563) );
  OAI2BB2X1M U452 ( .B0(n627), .B1(n408), .A0N(n408), .A1N(\mem[4][5] ), .Y(
        n564) );
  OAI2BB2X1M U453 ( .B0(n628), .B1(n408), .A0N(n408), .A1N(\mem[4][6] ), .Y(
        n565) );
  OAI2BB2X1M U454 ( .B0(n629), .B1(n408), .A0N(n408), .A1N(\mem[4][7] ), .Y(
        n566) );
  OAI2BB2X1M U455 ( .B0(n622), .B1(n409), .A0N(n409), .A1N(REG3[0]), .Y(n567)
         );
  OAI2BB2X1M U456 ( .B0(n623), .B1(n409), .A0N(n409), .A1N(REG3[1]), .Y(n568)
         );
  OAI2BB2X1M U457 ( .B0(n624), .B1(n409), .A0N(n409), .A1N(REG3[2]), .Y(n569)
         );
  OAI2BB2X1M U458 ( .B0(n625), .B1(n409), .A0N(n409), .A1N(REG3[3]), .Y(n570)
         );
  OAI2BB2X1M U459 ( .B0(n626), .B1(n409), .A0N(n409), .A1N(REG3[4]), .Y(n571)
         );
  OAI2BB2X1M U460 ( .B0(n627), .B1(n409), .A0N(n409), .A1N(REG3[5]), .Y(n572)
         );
  OAI2BB2X1M U461 ( .B0(n628), .B1(n409), .A0N(n409), .A1N(REG3[6]), .Y(n573)
         );
  OAI2BB2X1M U462 ( .B0(n629), .B1(n409), .A0N(n409), .A1N(REG3[7]), .Y(n574)
         );
  OAI2BB2X1M U463 ( .B0(n622), .B1(n411), .A0N(n411), .A1N(REG2[0]), .Y(n575)
         );
  OAI2BB2X1M U464 ( .B0(n623), .B1(n411), .A0N(n411), .A1N(REG2[1]), .Y(n576)
         );
  OAI2BB2X1M U465 ( .B0(n624), .B1(n411), .A0N(n411), .A1N(REG2[2]), .Y(n577)
         );
  OAI2BB2X1M U466 ( .B0(n625), .B1(n411), .A0N(n411), .A1N(REG2[3]), .Y(n578)
         );
  OAI2BB2X1M U467 ( .B0(n626), .B1(n411), .A0N(n411), .A1N(REG2[4]), .Y(n579)
         );
  OAI2BB2X1M U468 ( .B0(n627), .B1(n411), .A0N(n411), .A1N(REG2[5]), .Y(n580)
         );
  OAI2BB2X1M U469 ( .B0(n628), .B1(n411), .A0N(n411), .A1N(REG2[6]), .Y(n581)
         );
  OAI2BB2X1M U470 ( .B0(n629), .B1(n411), .A0N(n411), .A1N(REG2[7]), .Y(n582)
         );
  OAI2BB2X1M U471 ( .B0(n622), .B1(n412), .A0N(n412), .A1N(REG1[0]), .Y(n583)
         );
  OAI2BB2X1M U472 ( .B0(n623), .B1(n412), .A0N(n412), .A1N(REG1[1]), .Y(n584)
         );
  OAI2BB2X1M U473 ( .B0(n624), .B1(n412), .A0N(n412), .A1N(REG1[2]), .Y(n585)
         );
  OAI2BB2X1M U474 ( .B0(n625), .B1(n412), .A0N(n412), .A1N(REG1[3]), .Y(n586)
         );
  OAI2BB2X1M U475 ( .B0(n626), .B1(n412), .A0N(n412), .A1N(REG1[4]), .Y(n587)
         );
  OAI2BB2X1M U476 ( .B0(n627), .B1(n412), .A0N(n412), .A1N(REG1[5]), .Y(n588)
         );
  OAI2BB2X1M U477 ( .B0(n628), .B1(n412), .A0N(n412), .A1N(REG1[6]), .Y(n589)
         );
  OAI2BB2X1M U478 ( .B0(n629), .B1(n412), .A0N(n412), .A1N(REG1[7]), .Y(n590)
         );
  OAI2BB2X1M U479 ( .B0(n622), .B1(n414), .A0N(n414), .A1N(REG0[0]), .Y(n591)
         );
  OAI2BB2X1M U480 ( .B0(n623), .B1(n414), .A0N(n414), .A1N(REG0[1]), .Y(n592)
         );
  OAI2BB2X1M U481 ( .B0(n624), .B1(n414), .A0N(n414), .A1N(REG0[2]), .Y(n593)
         );
  OAI2BB2X1M U482 ( .B0(n625), .B1(n414), .A0N(n414), .A1N(REG0[3]), .Y(n594)
         );
  OAI2BB2X1M U483 ( .B0(n626), .B1(n414), .A0N(n414), .A1N(REG0[4]), .Y(n595)
         );
  OAI2BB2X1M U484 ( .B0(n627), .B1(n414), .A0N(n414), .A1N(REG0[5]), .Y(n596)
         );
  OAI2BB2X1M U485 ( .B0(n628), .B1(n414), .A0N(n414), .A1N(REG0[6]), .Y(n597)
         );
  OAI2BB2X1M U486 ( .B0(n629), .B1(n414), .A0N(n414), .A1N(REG0[7]), .Y(n598)
         );
  OAI2BB2X1M U487 ( .B0(n622), .B1(n259), .A0N(n259), .A1N(\mem[15][0] ), .Y(
        n471) );
  OAI2BB2X1M U488 ( .B0(n623), .B1(n259), .A0N(n259), .A1N(\mem[15][1] ), .Y(
        n472) );
  OAI2BB2X1M U489 ( .B0(n624), .B1(n259), .A0N(n259), .A1N(\mem[15][2] ), .Y(
        n473) );
  OAI2BB2X1M U490 ( .B0(n625), .B1(n259), .A0N(n259), .A1N(\mem[15][3] ), .Y(
        n474) );
  OAI2BB2X1M U491 ( .B0(n626), .B1(n259), .A0N(n259), .A1N(\mem[15][4] ), .Y(
        n475) );
  OAI2BB2X1M U492 ( .B0(n627), .B1(n259), .A0N(n259), .A1N(\mem[15][5] ), .Y(
        n476) );
  OAI2BB2X1M U493 ( .B0(n628), .B1(n259), .A0N(n259), .A1N(\mem[15][6] ), .Y(
        n477) );
  OAI2BB2X1M U494 ( .B0(n629), .B1(n259), .A0N(n259), .A1N(\mem[15][7] ), .Y(
        n478) );
  OAI2BB2X1M U495 ( .B0(n622), .B1(n258), .A0N(n258), .A1N(\mem[14][0] ), .Y(
        n479) );
  OAI2BB2X1M U496 ( .B0(n623), .B1(n258), .A0N(n258), .A1N(\mem[14][1] ), .Y(
        n480) );
  OAI2BB2X1M U497 ( .B0(n624), .B1(n258), .A0N(n258), .A1N(\mem[14][2] ), .Y(
        n481) );
  OAI2BB2X1M U498 ( .B0(n625), .B1(n258), .A0N(n258), .A1N(\mem[14][3] ), .Y(
        n482) );
  OAI2BB2X1M U499 ( .B0(n626), .B1(n258), .A0N(n258), .A1N(\mem[14][4] ), .Y(
        n483) );
  OAI2BB2X1M U500 ( .B0(n627), .B1(n258), .A0N(n258), .A1N(\mem[14][5] ), .Y(
        n484) );
  OAI2BB2X1M U501 ( .B0(n628), .B1(n258), .A0N(n258), .A1N(\mem[14][6] ), .Y(
        n485) );
  OAI2BB2X1M U502 ( .B0(n629), .B1(n258), .A0N(n258), .A1N(\mem[14][7] ), .Y(
        n486) );
  OAI2BB2X1M U503 ( .B0(n622), .B1(n257), .A0N(n257), .A1N(\mem[13][0] ), .Y(
        n487) );
  OAI2BB2X1M U504 ( .B0(n623), .B1(n257), .A0N(n257), .A1N(\mem[13][1] ), .Y(
        n488) );
  OAI2BB2X1M U505 ( .B0(n624), .B1(n257), .A0N(n257), .A1N(\mem[13][2] ), .Y(
        n489) );
  OAI2BB2X1M U506 ( .B0(n625), .B1(n257), .A0N(n257), .A1N(\mem[13][3] ), .Y(
        n490) );
  OAI2BB2X1M U507 ( .B0(n626), .B1(n257), .A0N(n257), .A1N(\mem[13][4] ), .Y(
        n491) );
  OAI2BB2X1M U508 ( .B0(n627), .B1(n257), .A0N(n257), .A1N(\mem[13][5] ), .Y(
        n492) );
  OAI2BB2X1M U509 ( .B0(n628), .B1(n257), .A0N(n257), .A1N(\mem[13][6] ), .Y(
        n493) );
  OAI2BB2X1M U510 ( .B0(n629), .B1(n257), .A0N(n257), .A1N(\mem[13][7] ), .Y(
        n494) );
  OAI2BB2X1M U511 ( .B0(n622), .B1(n254), .A0N(n254), .A1N(\mem[10][0] ), .Y(
        n511) );
  OAI2BB2X1M U512 ( .B0(n623), .B1(n254), .A0N(n254), .A1N(\mem[10][1] ), .Y(
        n512) );
  OAI2BB2X1M U513 ( .B0(n624), .B1(n254), .A0N(n254), .A1N(\mem[10][2] ), .Y(
        n513) );
  OAI2BB2X1M U514 ( .B0(n625), .B1(n254), .A0N(n254), .A1N(\mem[10][3] ), .Y(
        n514) );
  OAI2BB2X1M U515 ( .B0(n626), .B1(n254), .A0N(n254), .A1N(\mem[10][4] ), .Y(
        n515) );
  OAI2BB2X1M U516 ( .B0(n627), .B1(n254), .A0N(n254), .A1N(\mem[10][5] ), .Y(
        n516) );
  OAI2BB2X1M U517 ( .B0(n628), .B1(n254), .A0N(n254), .A1N(\mem[10][6] ), .Y(
        n517) );
  OAI2BB2X1M U518 ( .B0(n629), .B1(n254), .A0N(n254), .A1N(\mem[10][7] ), .Y(
        n518) );
  OAI2BB2X1M U519 ( .B0(n622), .B1(n253), .A0N(n253), .A1N(\mem[9][0] ), .Y(
        n519) );
  OAI2BB2X1M U520 ( .B0(n623), .B1(n253), .A0N(n253), .A1N(\mem[9][1] ), .Y(
        n520) );
  OAI2BB2X1M U521 ( .B0(n624), .B1(n253), .A0N(n253), .A1N(\mem[9][2] ), .Y(
        n521) );
  OAI2BB2X1M U522 ( .B0(n625), .B1(n253), .A0N(n253), .A1N(\mem[9][3] ), .Y(
        n522) );
  OAI2BB2X1M U523 ( .B0(n626), .B1(n253), .A0N(n253), .A1N(\mem[9][4] ), .Y(
        n523) );
  OAI2BB2X1M U524 ( .B0(n627), .B1(n253), .A0N(n253), .A1N(\mem[9][5] ), .Y(
        n524) );
  OAI2BB2X1M U525 ( .B0(n628), .B1(n253), .A0N(n253), .A1N(\mem[9][6] ), .Y(
        n525) );
  OAI2BB2X1M U526 ( .B0(n629), .B1(n253), .A0N(n253), .A1N(\mem[9][7] ), .Y(
        n526) );
  OAI2BB2X1M U527 ( .B0(n622), .B1(n3), .A0N(n3), .A1N(\mem[8][0] ), .Y(n527)
         );
  OAI2BB2X1M U528 ( .B0(n623), .B1(n3), .A0N(n3), .A1N(\mem[8][1] ), .Y(n528)
         );
  OAI2BB2X1M U529 ( .B0(n624), .B1(n3), .A0N(n3), .A1N(\mem[8][2] ), .Y(n529)
         );
  OAI2BB2X1M U530 ( .B0(n625), .B1(n3), .A0N(n3), .A1N(\mem[8][3] ), .Y(n530)
         );
  OAI2BB2X1M U531 ( .B0(n626), .B1(n3), .A0N(n3), .A1N(\mem[8][4] ), .Y(n531)
         );
  OAI2BB2X1M U532 ( .B0(n627), .B1(n3), .A0N(n3), .A1N(\mem[8][5] ), .Y(n532)
         );
  OAI2BB2X1M U533 ( .B0(n628), .B1(n3), .A0N(n3), .A1N(\mem[8][6] ), .Y(n533)
         );
  OAI2BB2X1M U534 ( .B0(n629), .B1(n3), .A0N(n3), .A1N(\mem[8][7] ), .Y(n534)
         );
  OAI2BB2X1M U535 ( .B0(n274), .B1(n2), .A0N(RdData[0]), .A1N(n2), .Y(n415) );
  NOR4X1M U536 ( .A(n276), .B(n277), .C(n278), .D(n279), .Y(n274) );
  OAI222X1M U537 ( .A0(n283), .A1(n244), .B0(n284), .B1(n252), .C0(n285), .C1(
        n236), .Y(n278) );
  OAI222X1M U538 ( .A0(n280), .A1(n220), .B0(n281), .B1(n228), .C0(n282), .C1(
        n212), .Y(n279) );
  OAI2BB2X1M U539 ( .B0(n307), .B1(n2), .A0N(RdData[1]), .A1N(n2), .Y(n416) );
  NOR4X1M U540 ( .A(n308), .B(n309), .C(n310), .D(n311), .Y(n307) );
  OAI222X1M U541 ( .A0(n283), .A1(n243), .B0(n284), .B1(n251), .C0(n285), .C1(
        n235), .Y(n310) );
  OAI222X1M U542 ( .A0(n280), .A1(n219), .B0(n281), .B1(n227), .C0(n282), .C1(
        n211), .Y(n311) );
  OAI2BB2X1M U543 ( .B0(n317), .B1(n2), .A0N(RdData[2]), .A1N(n2), .Y(n417) );
  NOR4X1M U544 ( .A(n318), .B(n319), .C(n320), .D(n321), .Y(n317) );
  OAI222X1M U545 ( .A0(n283), .A1(n242), .B0(n284), .B1(n250), .C0(n285), .C1(
        n234), .Y(n320) );
  OAI222X1M U546 ( .A0(n280), .A1(n218), .B0(n281), .B1(n226), .C0(n282), .C1(
        n210), .Y(n321) );
  OAI2BB2X1M U547 ( .B0(n327), .B1(n2), .A0N(RdData[3]), .A1N(n2), .Y(n418) );
  NOR4X1M U548 ( .A(n328), .B(n329), .C(n330), .D(n331), .Y(n327) );
  OAI222X1M U549 ( .A0(n283), .A1(n241), .B0(n284), .B1(n249), .C0(n285), .C1(
        n233), .Y(n330) );
  OAI222X1M U550 ( .A0(n280), .A1(n217), .B0(n281), .B1(n225), .C0(n282), .C1(
        n209), .Y(n331) );
  OAI2BB2X1M U551 ( .B0(n337), .B1(n2), .A0N(RdData[4]), .A1N(n2), .Y(n419) );
  NOR4X1M U552 ( .A(n338), .B(n339), .C(n340), .D(n341), .Y(n337) );
  OAI222X1M U553 ( .A0(n283), .A1(n240), .B0(n284), .B1(n248), .C0(n285), .C1(
        n232), .Y(n340) );
  OAI222X1M U554 ( .A0(n280), .A1(n216), .B0(n281), .B1(n224), .C0(n282), .C1(
        n208), .Y(n341) );
  OAI2BB2X1M U555 ( .B0(n347), .B1(n2), .A0N(RdData[5]), .A1N(n2), .Y(n420) );
  NOR4X1M U556 ( .A(n348), .B(n349), .C(n350), .D(n351), .Y(n347) );
  OAI222X1M U557 ( .A0(n283), .A1(n239), .B0(n284), .B1(n247), .C0(n285), .C1(
        n231), .Y(n350) );
  OAI222X1M U558 ( .A0(n280), .A1(n215), .B0(n281), .B1(n223), .C0(n282), .C1(
        n207), .Y(n351) );
  OAI2BB2X1M U559 ( .B0(n357), .B1(n2), .A0N(RdData[6]), .A1N(n2), .Y(n421) );
  NOR4X1M U560 ( .A(n358), .B(n359), .C(n360), .D(n361), .Y(n357) );
  OAI222X1M U561 ( .A0(n283), .A1(n238), .B0(n284), .B1(n246), .C0(n285), .C1(
        n230), .Y(n360) );
  OAI222X1M U562 ( .A0(n280), .A1(n214), .B0(n281), .B1(n222), .C0(n282), .C1(
        n206), .Y(n361) );
  OAI2BB2X1M U563 ( .B0(n367), .B1(n2), .A0N(RdData[7]), .A1N(n2), .Y(n422) );
  NOR4X1M U564 ( .A(n368), .B(n369), .C(n370), .D(n371), .Y(n367) );
  OAI222X1M U565 ( .A0(n283), .A1(n237), .B0(n284), .B1(n245), .C0(n285), .C1(
        n229), .Y(n370) );
  OAI222X1M U566 ( .A0(n280), .A1(n213), .B0(n281), .B1(n221), .C0(n282), .C1(
        n205), .Y(n371) );
  AOI21X1M U567 ( .A0(Address[2]), .A1(Address[1]), .B0(Address[3]), .Y(n608)
         );
  NAND2BX1M U568 ( .AN(n608), .B(n1), .Y(N84) );
  DLY1X1M U569 ( .A(test_se), .Y(n698) );
  DLY1X1M U570 ( .A(test_se), .Y(n699) );
  DLY1X1M U571 ( .A(test_se), .Y(n700) );
  DLY1X1M U572 ( .A(test_se), .Y(n701) );
  DLY1X1M U573 ( .A(test_se), .Y(n702) );
  DLY1X1M U574 ( .A(test_se), .Y(n703) );
  SDFFRX2M \mem_reg[16][4]  ( .D(n467), .SI(n675), .SE(n700), .CK(CLK), .RN(
        n272), .Q(test_so1), .QN(n208) );
endmodule


module SYS_CTRL_test_1 ( CLK, RST, ALU_OUT, OUT_Valid, RdData_Valid, RdData, 
        RX_P_DATA, RX_D_VLD, FIFO_FULL, ALU_FUN, EN, CLK_EN, Address, WrEn, 
        RdEn, WrData, TX_P_DATA, TX_D_VLD, clk_div_en, test_si, test_so, 
        test_se );
  input [15:0] ALU_OUT;
  input [7:0] RdData;
  input [7:0] RX_P_DATA;
  output [3:0] ALU_FUN;
  output [4:0] Address;
  output [7:0] WrData;
  output [7:0] TX_P_DATA;
  input CLK, RST, OUT_Valid, RdData_Valid, RX_D_VLD, FIFO_FULL, test_si,
         test_se;
  output EN, CLK_EN, WrEn, RdEn, TX_D_VLD, clk_div_en, test_so;
  wire   n1, n2, n3, n4, n5, n11, n22, n23, n26, n27, n28, n30, n31, n33, n34,
         n35, n38, n39, n40, n44, n45, n46, n47, n48, n49, n50, n51, n52, n54,
         n56, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n79, n81, n83, n85, n87, n89, n91, n93,
         n95, n97, n99, n101, n103, n105, n107, n109, n111, n113, n115, n117,
         n119, n121, n123, n125, n127, n129, n131, n133, n135, n137, n139,
         n141, n143, n150, n151, n152, n153, n6, n7, n8, n9, n10, n12, n13,
         n14, n15, n16, n17, n18, n21, n24, n25, n29, n32, n36, n37, n41, n42,
         n43, n53, n55, n57, n58, n148, n149, n154, n155, n156, n157, n158,
         n159, n160, n161, n164, n165;
  wire   [3:0] current_state;
  wire   [4:0] addr_reg;
  wire   [7:0] rd_reg;
  wire   [15:0] alu_res;
  assign clk_div_en = 1'b1;
  assign test_so = rd_reg[7];

  SDFFRQX2M \alu_res_reg[15]  ( .D(n109), .SI(alu_res[14]), .SE(n165), .CK(CLK), .RN(n13), .Q(alu_res[15]) );
  SDFFRQX2M \alu_res_reg[14]  ( .D(n107), .SI(alu_res[13]), .SE(n165), .CK(CLK), .RN(n13), .Q(alu_res[14]) );
  SDFFRQX2M \alu_res_reg[13]  ( .D(n105), .SI(alu_res[12]), .SE(n165), .CK(CLK), .RN(n13), .Q(alu_res[13]) );
  SDFFRQX2M \alu_res_reg[12]  ( .D(n103), .SI(alu_res[11]), .SE(test_se), .CK(
        CLK), .RN(n14), .Q(alu_res[12]) );
  SDFFRQX2M \alu_res_reg[11]  ( .D(n101), .SI(alu_res[10]), .SE(test_se), .CK(
        CLK), .RN(n14), .Q(alu_res[11]) );
  SDFFRQX2M \alu_res_reg[10]  ( .D(n99), .SI(alu_res[9]), .SE(test_se), .CK(
        CLK), .RN(n14), .Q(alu_res[10]) );
  SDFFRQX2M \alu_res_reg[9]  ( .D(n97), .SI(alu_res[8]), .SE(test_se), .CK(CLK), .RN(n14), .Q(alu_res[9]) );
  SDFFRQX2M \alu_res_reg[8]  ( .D(n95), .SI(alu_res[7]), .SE(test_se), .CK(CLK), .RN(n14), .Q(alu_res[8]) );
  SDFFRQX2M \rd_reg_reg[7]  ( .D(n125), .SI(rd_reg[6]), .SE(test_se), .CK(CLK), 
        .RN(n13), .Q(rd_reg[7]) );
  SDFFRQX2M \rd_reg_reg[6]  ( .D(n123), .SI(rd_reg[5]), .SE(test_se), .CK(CLK), 
        .RN(n13), .Q(rd_reg[6]) );
  SDFFRQX2M \rd_reg_reg[5]  ( .D(n121), .SI(rd_reg[4]), .SE(test_se), .CK(CLK), 
        .RN(n13), .Q(rd_reg[5]) );
  SDFFRQX2M \rd_reg_reg[4]  ( .D(n119), .SI(rd_reg[3]), .SE(test_se), .CK(CLK), 
        .RN(n13), .Q(rd_reg[4]) );
  SDFFRQX2M \rd_reg_reg[3]  ( .D(n117), .SI(rd_reg[2]), .SE(test_se), .CK(CLK), 
        .RN(n13), .Q(rd_reg[3]) );
  SDFFRQX2M \rd_reg_reg[2]  ( .D(n115), .SI(rd_reg[1]), .SE(test_se), .CK(CLK), 
        .RN(n13), .Q(rd_reg[2]) );
  SDFFRQX2M \rd_reg_reg[1]  ( .D(n113), .SI(rd_reg[0]), .SE(test_se), .CK(CLK), 
        .RN(n13), .Q(rd_reg[1]) );
  SDFFRQX2M \rd_reg_reg[0]  ( .D(n111), .SI(current_state[3]), .SE(test_se), 
        .CK(CLK), .RN(n13), .Q(rd_reg[0]) );
  SDFFRQX2M \alu_res_reg[7]  ( .D(n93), .SI(alu_res[6]), .SE(test_se), .CK(CLK), .RN(n14), .Q(alu_res[7]) );
  SDFFRQX2M \alu_res_reg[6]  ( .D(n91), .SI(alu_res[5]), .SE(test_se), .CK(CLK), .RN(n14), .Q(alu_res[6]) );
  SDFFRQX2M \alu_res_reg[5]  ( .D(n89), .SI(alu_res[4]), .SE(test_se), .CK(CLK), .RN(n14), .Q(alu_res[5]) );
  SDFFRQX2M \alu_res_reg[4]  ( .D(n87), .SI(alu_res[3]), .SE(test_se), .CK(CLK), .RN(n14), .Q(alu_res[4]) );
  SDFFRQX2M \alu_res_reg[3]  ( .D(n85), .SI(alu_res[2]), .SE(test_se), .CK(CLK), .RN(n14), .Q(alu_res[3]) );
  SDFFRQX2M \alu_res_reg[2]  ( .D(n83), .SI(alu_res[1]), .SE(test_se), .CK(CLK), .RN(n14), .Q(alu_res[2]) );
  SDFFRQX2M \alu_res_reg[1]  ( .D(n81), .SI(alu_res[0]), .SE(test_se), .CK(CLK), .RN(n14), .Q(alu_res[1]) );
  SDFFRQX2M \alu_res_reg[0]  ( .D(n79), .SI(ALU_FUN[3]), .SE(test_se), .CK(CLK), .RN(n10), .Q(alu_res[0]) );
  SDFFRQX2M \addr_reg_reg[4]  ( .D(n143), .SI(addr_reg[3]), .SE(test_se), .CK(
        CLK), .RN(n12), .Q(addr_reg[4]) );
  SDFFRQX2M \addr_reg_reg[3]  ( .D(n141), .SI(addr_reg[2]), .SE(test_se), .CK(
        CLK), .RN(n12), .Q(addr_reg[3]) );
  SDFFRQX2M \addr_reg_reg[2]  ( .D(n139), .SI(addr_reg[1]), .SE(test_se), .CK(
        CLK), .RN(n12), .Q(addr_reg[2]) );
  SDFFRQX2M \addr_reg_reg[1]  ( .D(n137), .SI(addr_reg[0]), .SE(test_se), .CK(
        CLK), .RN(n12), .Q(addr_reg[1]) );
  SDFFRQX2M \addr_reg_reg[0]  ( .D(n135), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(n12), .Q(addr_reg[0]) );
  SDFFRQX2M \current_state_reg[2]  ( .D(n152), .SI(current_state[1]), .SE(
        test_se), .CK(CLK), .RN(n12), .Q(current_state[2]) );
  SDFFRQX2M \current_state_reg[3]  ( .D(n150), .SI(current_state[2]), .SE(
        test_se), .CK(CLK), .RN(n12), .Q(current_state[3]) );
  SDFFRQX2M \current_state_reg[1]  ( .D(n151), .SI(current_state[0]), .SE(
        test_se), .CK(CLK), .RN(n12), .Q(current_state[1]) );
  SDFFRQX2M \alu_fun_reg_reg[3]  ( .D(n133), .SI(ALU_FUN[2]), .SE(test_se), 
        .CK(CLK), .RN(n12), .Q(ALU_FUN[3]) );
  SDFFRQX2M \alu_fun_reg_reg[2]  ( .D(n131), .SI(ALU_FUN[1]), .SE(test_se), 
        .CK(CLK), .RN(n12), .Q(ALU_FUN[2]) );
  SDFFRQX2M \alu_fun_reg_reg[1]  ( .D(n129), .SI(ALU_FUN[0]), .SE(test_se), 
        .CK(CLK), .RN(n12), .Q(ALU_FUN[1]) );
  SDFFRQX2M \alu_fun_reg_reg[0]  ( .D(n127), .SI(addr_reg[4]), .SE(test_se), 
        .CK(CLK), .RN(n13), .Q(ALU_FUN[0]) );
  SDFFRQX2M \current_state_reg[0]  ( .D(n153), .SI(alu_res[15]), .SE(test_se), 
        .CK(CLK), .RN(n12), .Q(current_state[0]) );
  OAI22X1M U3 ( .A0(n32), .A1(n22), .B0(n157), .B1(n77), .Y(Address[3]) );
  OAI222X1M U4 ( .A0(n160), .A1(n77), .B0(n18), .B1(n64), .C0(n41), .C1(n22), 
        .Y(Address[0]) );
  OAI22X1M U5 ( .A0(n36), .A1(n22), .B0(n158), .B1(n77), .Y(Address[2]) );
  OAI22X1M U6 ( .A0(n37), .A1(n22), .B0(n159), .B1(n77), .Y(Address[1]) );
  NAND2X2M U7 ( .A(RX_D_VLD), .B(n61), .Y(n23) );
  NOR3X2M U8 ( .A(current_state[2]), .B(current_state[3]), .C(current_state[1]), .Y(n34) );
  INVX2M U9 ( .A(n59), .Y(n43) );
  NOR3X2M U10 ( .A(n6), .B(n68), .C(n53), .Y(n59) );
  INVX2M U11 ( .A(n11), .Y(n17) );
  INVX2M U12 ( .A(n62), .Y(n55) );
  BUFX2M U13 ( .A(n10), .Y(n14) );
  BUFX2M U14 ( .A(n9), .Y(n13) );
  BUFX2M U15 ( .A(n9), .Y(n12) );
  NOR2X2M U16 ( .A(n63), .B(n57), .Y(n44) );
  NAND2X2M U17 ( .A(n65), .B(n57), .Y(n45) );
  INVX2M U18 ( .A(n23), .Y(WrEn) );
  BUFX2M U19 ( .A(n67), .Y(n6) );
  NOR3BX2M U20 ( .AN(n76), .B(n57), .C(n155), .Y(n67) );
  NOR2BX2M U21 ( .AN(n60), .B(n57), .Y(n68) );
  OAI22X1M U22 ( .A0(n29), .A1(n22), .B0(n156), .B1(n77), .Y(Address[4]) );
  NOR2X2M U23 ( .A(n8), .B(n59), .Y(TX_D_VLD) );
  INVX2M U24 ( .A(n50), .Y(n53) );
  INVX2M U25 ( .A(n22), .Y(RdEn) );
  NOR3X2M U26 ( .A(n18), .B(n57), .C(n149), .Y(n11) );
  NOR2X2M U27 ( .A(n41), .B(n23), .Y(WrData[0]) );
  NOR2X2M U28 ( .A(n37), .B(n23), .Y(WrData[1]) );
  NOR2X2M U29 ( .A(n36), .B(n23), .Y(WrData[2]) );
  NOR2X2M U30 ( .A(n32), .B(n23), .Y(WrData[3]) );
  NOR2X2M U31 ( .A(n29), .B(n23), .Y(WrData[4]) );
  NOR2X2M U32 ( .A(n25), .B(n23), .Y(WrData[5]) );
  NOR2X2M U33 ( .A(n24), .B(n23), .Y(WrData[6]) );
  NOR2X2M U34 ( .A(n21), .B(n23), .Y(WrData[7]) );
  NOR2X2M U35 ( .A(n2), .B(OUT_Valid), .Y(EN) );
  OAI22X1M U36 ( .A0(n11), .A1(n158), .B0(n36), .B1(n17), .Y(n139) );
  OAI22X1M U37 ( .A0(n11), .A1(n157), .B0(n32), .B1(n17), .Y(n141) );
  OAI22X1M U38 ( .A0(n11), .A1(n156), .B0(n17), .B1(n29), .Y(n143) );
  OAI22X1M U39 ( .A0(n11), .A1(n160), .B0(n41), .B1(n17), .Y(n135) );
  OAI22X1M U40 ( .A0(n11), .A1(n159), .B0(n37), .B1(n17), .Y(n137) );
  OAI211X2M U41 ( .A0(n15), .A1(n148), .B0(n38), .C0(n33), .Y(n152) );
  OAI31X1M U42 ( .A0(n42), .A1(n44), .A2(n4), .B0(n15), .Y(n38) );
  INVX2M U43 ( .A(n45), .Y(n42) );
  INVX2M U44 ( .A(n34), .Y(n149) );
  INVX2M U45 ( .A(n30), .Y(n15) );
  NAND3X2M U46 ( .A(n57), .B(n155), .C(n76), .Y(n62) );
  NAND3X2M U47 ( .A(n41), .B(n29), .C(n27), .Y(n33) );
  AND2X2M U48 ( .A(n60), .B(n57), .Y(n4) );
  NOR2BX2M U49 ( .AN(OUT_Valid), .B(n2), .Y(n7) );
  NOR2BX2M U50 ( .AN(OUT_Valid), .B(n2), .Y(n1) );
  NAND3X2M U51 ( .A(n2), .B(n62), .C(n64), .Y(CLK_EN) );
  BUFX2M U52 ( .A(RST), .Y(n10) );
  BUFX2M U53 ( .A(RST), .Y(n9) );
  OAI211X2M U54 ( .A0(current_state[0]), .A1(n63), .B0(n45), .C0(n64), .Y(n61)
         );
  NOR3X2M U55 ( .A(n148), .B(current_state[3]), .C(n155), .Y(n65) );
  NAND2X2M U56 ( .A(n44), .B(RX_D_VLD), .Y(n22) );
  INVX2M U57 ( .A(current_state[0]), .Y(n57) );
  NAND2X2M U58 ( .A(n65), .B(current_state[0]), .Y(n64) );
  NAND3X2M U59 ( .A(n148), .B(n154), .C(current_state[1]), .Y(n63) );
  INVX2M U60 ( .A(current_state[1]), .Y(n155) );
  OR3X2M U61 ( .A(n63), .B(n18), .C(current_state[0]), .Y(n77) );
  INVX2M U62 ( .A(current_state[2]), .Y(n148) );
  INVX2M U63 ( .A(current_state[3]), .Y(n154) );
  OAI211X2M U64 ( .A0(RX_D_VLD), .A1(n54), .B0(n16), .C0(n56), .Y(n30) );
  INVX2M U65 ( .A(EN), .Y(n16) );
  AOI22X1M U66 ( .A0(n4), .A1(n161), .B0(n8), .B1(n43), .Y(n56) );
  NOR4X1M U67 ( .A(n44), .B(n55), .C(n34), .D(n61), .Y(n54) );
  NOR2X2M U68 ( .A(n154), .B(current_state[2]), .Y(n76) );
  NOR3X2M U69 ( .A(current_state[1]), .B(current_state[3]), .C(n148), .Y(n60)
         );
  NAND3X2M U70 ( .A(n76), .B(n57), .C(current_state[1]), .Y(n50) );
  BUFX2M U71 ( .A(FIFO_FULL), .Y(n8) );
  INVX2M U72 ( .A(RX_P_DATA[1]), .Y(n37) );
  OAI21X2M U73 ( .A0(n15), .A1(n154), .B0(n26), .Y(n150) );
  AOI31X2M U74 ( .A0(RX_P_DATA[4]), .A1(RX_P_DATA[0]), .A2(n27), .B0(n28), .Y(
        n26) );
  AOI2BB1X2M U75 ( .A0N(CLK_EN), .A1N(n53), .B0(n30), .Y(n28) );
  INVX2M U76 ( .A(RX_P_DATA[0]), .Y(n41) );
  INVX2M U77 ( .A(RX_P_DATA[4]), .Y(n29) );
  INVX2M U78 ( .A(RX_P_DATA[2]), .Y(n36) );
  AND4X2M U79 ( .A(RX_P_DATA[3]), .B(RX_P_DATA[2]), .C(n39), .D(n40), .Y(n27)
         );
  NOR3X2M U80 ( .A(RX_P_DATA[1]), .B(current_state[0]), .C(RX_P_DATA[5]), .Y(
        n39) );
  NOR4X1M U81 ( .A(n149), .B(n30), .C(n24), .D(n21), .Y(n40) );
  INVX2M U82 ( .A(RX_D_VLD), .Y(n18) );
  INVX2M U83 ( .A(RX_P_DATA[3]), .Y(n32) );
  INVX2M U84 ( .A(addr_reg[2]), .Y(n158) );
  INVX2M U85 ( .A(addr_reg[4]), .Y(n156) );
  INVX2M U86 ( .A(addr_reg[3]), .Y(n157) );
  INVX2M U87 ( .A(addr_reg[1]), .Y(n159) );
  INVX2M U88 ( .A(addr_reg[0]), .Y(n160) );
  OAI211X2M U89 ( .A0(n48), .A1(n49), .B0(n50), .C0(n45), .Y(n35) );
  NAND2X2M U90 ( .A(RX_P_DATA[4]), .B(RX_P_DATA[0]), .Y(n49) );
  NOR2X2M U91 ( .A(n8), .B(n75), .Y(TX_P_DATA[0]) );
  AOI222X1M U92 ( .A0(n53), .A1(alu_res[0]), .B0(n6), .B1(alu_res[8]), .C0(n68), .C1(rd_reg[0]), .Y(n75) );
  NOR2X2M U93 ( .A(n8), .B(n74), .Y(TX_P_DATA[1]) );
  AOI222X1M U94 ( .A0(n53), .A1(alu_res[1]), .B0(n6), .B1(alu_res[9]), .C0(n68), .C1(rd_reg[1]), .Y(n74) );
  NOR2X2M U95 ( .A(n8), .B(n73), .Y(TX_P_DATA[2]) );
  AOI222X1M U96 ( .A0(n53), .A1(alu_res[2]), .B0(n6), .B1(alu_res[10]), .C0(
        n68), .C1(rd_reg[2]), .Y(n73) );
  NOR2X2M U97 ( .A(n8), .B(n72), .Y(TX_P_DATA[3]) );
  AOI222X1M U98 ( .A0(n53), .A1(alu_res[3]), .B0(n6), .B1(alu_res[11]), .C0(
        n68), .C1(rd_reg[3]), .Y(n72) );
  NOR2X2M U99 ( .A(n8), .B(n71), .Y(TX_P_DATA[4]) );
  AOI222X1M U100 ( .A0(n53), .A1(alu_res[4]), .B0(n6), .B1(alu_res[12]), .C0(
        n68), .C1(rd_reg[4]), .Y(n71) );
  NOR2X2M U101 ( .A(n8), .B(n70), .Y(TX_P_DATA[5]) );
  AOI222X1M U102 ( .A0(n53), .A1(alu_res[5]), .B0(n6), .B1(alu_res[13]), .C0(
        n68), .C1(rd_reg[5]), .Y(n70) );
  NOR2X2M U103 ( .A(n8), .B(n69), .Y(TX_P_DATA[6]) );
  AOI222X1M U104 ( .A0(n53), .A1(alu_res[6]), .B0(n6), .B1(alu_res[14]), .C0(
        n68), .C1(rd_reg[6]), .Y(n69) );
  NOR2X2M U105 ( .A(n8), .B(n66), .Y(TX_P_DATA[7]) );
  AOI222X1M U106 ( .A0(n53), .A1(alu_res[7]), .B0(n6), .B1(alu_res[15]), .C0(
        n68), .C1(rd_reg[7]), .Y(n66) );
  OAI221X1M U107 ( .A0(n31), .A1(n30), .B0(n15), .B1(n155), .C0(n33), .Y(n151)
         );
  AOI211X2M U108 ( .A0(n34), .A1(current_state[0]), .B0(n35), .C0(n58), .Y(n31) );
  INVX2M U109 ( .A(n2), .Y(n58) );
  NAND3X2M U110 ( .A(n76), .B(n155), .C(current_state[0]), .Y(n2) );
  NAND4X2M U111 ( .A(n34), .B(RX_P_DATA[3]), .C(n51), .D(n52), .Y(n48) );
  NOR2X2M U112 ( .A(n21), .B(n25), .Y(n51) );
  NOR4X1M U113 ( .A(current_state[0]), .B(RX_P_DATA[6]), .C(RX_P_DATA[2]), .D(
        n37), .Y(n52) );
  OAI22X1M U114 ( .A0(n15), .A1(n57), .B0(n46), .B1(n30), .Y(n153) );
  NOR4X1M U115 ( .A(n55), .B(n4), .C(n47), .D(n35), .Y(n46) );
  NOR3X2M U116 ( .A(n48), .B(RX_P_DATA[4]), .C(RX_P_DATA[0]), .Y(n47) );
  AO2B2X2M U117 ( .B0(ALU_OUT[8]), .B1(n7), .A0(alu_res[8]), .A1N(n7), .Y(n95)
         );
  AO2B2X2M U118 ( .B0(ALU_OUT[0]), .B1(n7), .A0(alu_res[0]), .A1N(n7), .Y(n79)
         );
  AO2B2X2M U119 ( .B0(ALU_OUT[1]), .B1(n1), .A0(alu_res[1]), .A1N(n1), .Y(n81)
         );
  AO2B2X2M U120 ( .B0(ALU_OUT[2]), .B1(n7), .A0(alu_res[2]), .A1N(n7), .Y(n83)
         );
  AO2B2X2M U121 ( .B0(ALU_OUT[3]), .B1(n1), .A0(alu_res[3]), .A1N(n1), .Y(n85)
         );
  AO2B2X2M U122 ( .B0(ALU_OUT[4]), .B1(n7), .A0(alu_res[4]), .A1N(n7), .Y(n87)
         );
  AO2B2X2M U123 ( .B0(ALU_OUT[5]), .B1(n1), .A0(alu_res[5]), .A1N(n1), .Y(n89)
         );
  AO2B2X2M U124 ( .B0(ALU_OUT[6]), .B1(n7), .A0(alu_res[6]), .A1N(n7), .Y(n91)
         );
  AO2B2X2M U125 ( .B0(ALU_OUT[7]), .B1(n1), .A0(alu_res[7]), .A1N(n1), .Y(n93)
         );
  NAND2X2M U126 ( .A(RX_D_VLD), .B(n55), .Y(n5) );
  OAI2BB2X1M U127 ( .B0(n5), .B1(n32), .A0N(ALU_FUN[3]), .A1N(n5), .Y(n133) );
  OAI2BB2X1M U128 ( .B0(n5), .B1(n41), .A0N(ALU_FUN[0]), .A1N(n5), .Y(n127) );
  OAI2BB2X1M U129 ( .B0(n5), .B1(n37), .A0N(ALU_FUN[1]), .A1N(n5), .Y(n129) );
  OAI2BB2X1M U130 ( .B0(n5), .B1(n36), .A0N(ALU_FUN[2]), .A1N(n5), .Y(n131) );
  INVX2M U131 ( .A(RX_P_DATA[7]), .Y(n21) );
  INVX2M U132 ( .A(RX_P_DATA[6]), .Y(n24) );
  AND2X2M U133 ( .A(n4), .B(RdData_Valid), .Y(n3) );
  INVX2M U134 ( .A(RX_P_DATA[5]), .Y(n25) );
  AO2B2X2M U135 ( .B0(RdData[0]), .B1(n3), .A0(rd_reg[0]), .A1N(n3), .Y(n111)
         );
  AO2B2X2M U136 ( .B0(RdData[1]), .B1(n3), .A0(rd_reg[1]), .A1N(n3), .Y(n113)
         );
  AO2B2X2M U137 ( .B0(RdData[2]), .B1(n3), .A0(rd_reg[2]), .A1N(n3), .Y(n115)
         );
  AO2B2X2M U138 ( .B0(RdData[3]), .B1(n3), .A0(rd_reg[3]), .A1N(n3), .Y(n117)
         );
  AO2B2X2M U139 ( .B0(RdData[4]), .B1(n3), .A0(rd_reg[4]), .A1N(n3), .Y(n119)
         );
  AO2B2X2M U140 ( .B0(RdData[5]), .B1(n3), .A0(rd_reg[5]), .A1N(n3), .Y(n121)
         );
  AO2B2X2M U141 ( .B0(RdData[6]), .B1(n3), .A0(rd_reg[6]), .A1N(n3), .Y(n123)
         );
  AO2B2X2M U142 ( .B0(RdData[7]), .B1(n3), .A0(rd_reg[7]), .A1N(n3), .Y(n125)
         );
  AO2B2X2M U180 ( .B0(ALU_OUT[9]), .B1(n1), .A0(alu_res[9]), .A1N(n1), .Y(n97)
         );
  AO2B2X2M U181 ( .B0(ALU_OUT[10]), .B1(n7), .A0(alu_res[10]), .A1N(n7), .Y(
        n99) );
  AO2B2X2M U182 ( .B0(ALU_OUT[11]), .B1(n1), .A0(alu_res[11]), .A1N(n1), .Y(
        n101) );
  AO2B2X2M U183 ( .B0(ALU_OUT[12]), .B1(n7), .A0(alu_res[12]), .A1N(n7), .Y(
        n103) );
  AO2B2X2M U184 ( .B0(ALU_OUT[13]), .B1(n1), .A0(alu_res[13]), .A1N(n1), .Y(
        n105) );
  AO2B2X2M U185 ( .B0(ALU_OUT[14]), .B1(n7), .A0(alu_res[14]), .A1N(n7), .Y(
        n107) );
  AO2B2X2M U186 ( .B0(ALU_OUT[15]), .B1(n1), .A0(alu_res[15]), .A1N(n1), .Y(
        n109) );
  INVX2M U187 ( .A(RdData_Valid), .Y(n161) );
  INVXLM U188 ( .A(test_se), .Y(n164) );
  INVXLM U189 ( .A(n164), .Y(n165) );
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
  INVX2M U10 ( .A(ALU_FUNC[3]), .Y(n2) );
  AND3X2M U11 ( .A(n7), .B(enable), .C(ALU_FUNC[3]), .Y(CMP_Enable) );
  OAI32X1M U12 ( .A0(ALU_FUNC[0]), .A1(ALU_FUNC[1]), .A2(n3), .B0(n4), .B1(
        ALU_FUNC[2]), .Y(n7) );
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
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20;
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
  ADDHX1M \u_div/u_ha_AInc_6  ( .A(\u_div/AInv [6]), .B(\u_div/AIncCry [6]), 
        .CO(\u_div/AIncCry [7]), .S(\u_div/PartRem[7][0] ) );
  ADDHX1M \u_div/u_ha_AInc_0  ( .A(\u_div/AInv [0]), .B(a[8]), .CO(
        \u_div/AIncCry [1]), .S(\u_div/PartRem[1][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_1_0  ( .A(\u_div/PartRem[2][0] ), .B(n6), .CI(
        n7), .CO(\u_div/CryTmp[1][1] ), .S(\u_div/SumTmp[1][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_2_0  ( .A(\u_div/PartRem[3][0] ), .B(n6), .CI(
        n7), .CO(\u_div/CryTmp[2][1] ), .S(\u_div/SumTmp[2][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_3_0  ( .A(\u_div/PartRem[4][0] ), .B(n6), .CI(
        n7), .CO(\u_div/CryTmp[3][1] ), .S(\u_div/SumTmp[3][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_4_0  ( .A(\u_div/PartRem[5][0] ), .B(n6), .CI(
        n7), .CO(\u_div/CryTmp[4][1] ), .S(\u_div/SumTmp[4][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_5_0  ( .A(\u_div/PartRem[6][0] ), .B(n6), .CI(
        n7), .CO(\u_div/CryTmp[5][1] ), .S(\u_div/SumTmp[5][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_6_0  ( .A(\u_div/PartRem[7][0] ), .B(n6), .CI(
        n7), .CO(\u_div/CryTmp[6][1] ), .S(\u_div/SumTmp[6][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_0_5  ( .A(\u_div/PartRem[1][5] ), .B(
        \u_div/BInv [5]), .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] )
         );
  ADDFX2M \u_div/u_fa_PartRem_1_0_6  ( .A(\u_div/PartRem[1][6] ), .B(
        \u_div/BInv [6]), .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] )
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
  ADDFX2M \u_div/u_fa_PartRem_1_3_5  ( .A(\u_div/PartRem[4][5] ), .B(
        \u_div/BInv [5]), .CI(\u_div/CryTmp[3][5] ), .CO(\u_div/CryTmp[3][6] ), 
        .S(\u_div/SumTmp[3][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_4_4  ( .A(\u_div/PartRem[5][4] ), .B(
        \u_div/BInv [4]), .CI(\u_div/CryTmp[4][4] ), .CO(\u_div/CryTmp[4][5] ), 
        .S(\u_div/SumTmp[4][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_5_3  ( .A(\u_div/PartRem[6][3] ), .B(
        \u_div/BInv [3]), .CI(\u_div/CryTmp[5][3] ), .CO(\u_div/CryTmp[5][4] ), 
        .S(\u_div/SumTmp[5][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_6_2  ( .A(\u_div/PartRem[7][2] ), .B(
        \u_div/BInv [2]), .CI(\u_div/CryTmp[6][2] ), .CO(\u_div/CryTmp[6][3] ), 
        .S(\u_div/SumTmp[6][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_7_1  ( .A(n1), .B(n2), .CI(
        \u_div/CryTmp[7][1] ), .CO(\u_div/CryTmp[7][2] ), .S(
        \u_div/SumTmp[7][1] ) );
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
  ADDFX2M \u_div/u_fa_PartRem_1_0_0  ( .A(\u_div/PartRem[1][0] ), .B(n6), .CI(
        n7), .CO(\u_div/CryTmp[0][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n2), .CI(
        \u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_0_2  ( .A(\u_div/PartRem[1][2] ), .B(
        \u_div/BInv [2]), .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] )
         );
  ADDFX2M \u_div/u_fa_PartRem_1_2_5  ( .A(\u_div/PartRem[3][5] ), .B(
        \u_div/BInv [5]), .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), 
        .S(\u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_1_2  ( .A(\u_div/PartRem[2][2] ), .B(
        \u_div/BInv [2]), .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), 
        .S(\u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_2_4  ( .A(\u_div/PartRem[3][4] ), .B(
        \u_div/BInv [4]), .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), 
        .S(\u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n2), .CI(
        \u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_2_3  ( .A(\u_div/PartRem[3][3] ), .B(
        \u_div/BInv [3]), .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), 
        .S(\u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_2_2  ( .A(\u_div/PartRem[3][2] ), .B(
        \u_div/BInv [2]), .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), 
        .S(\u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n2), .CI(
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
  ADDFX2M \u_div/u_fa_PartRem_1_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n2), .CI(
        \u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_4_3  ( .A(\u_div/PartRem[5][3] ), .B(
        \u_div/BInv [3]), .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), 
        .S(\u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_4_2  ( .A(\u_div/PartRem[5][2] ), .B(
        \u_div/BInv [2]), .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), 
        .S(\u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n2), .CI(
        \u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_5_2  ( .A(\u_div/PartRem[6][2] ), .B(
        \u_div/BInv [2]), .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), 
        .S(\u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n2), .CI(
        \u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n2), .CI(
        \u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_7_0  ( .A(\u_div/AIncCry [7]), .B(n6), .CI(n7), 
        .CO(\u_div/CryTmp[7][1] ), .S(\u_div/SumTmp[7][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_1_6  ( .A(\u_div/PartRem[2][6] ), .B(
        \u_div/BInv [6]), .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), 
        .S(\u_div/SumTmp[1][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_1_2_6  ( .A(\u_div/PartRem[3][6] ), .B(
        \u_div/BInv [6]), .CI(\u_div/CryTmp[2][6] ), .CO(\u_div/CryTmp[2][7] ), 
        .S(\u_div/SumTmp[2][6] ) );
  CLKXOR2X2M \u_div/u_ha_QInc_8  ( .A(\u_div/QInv [8]), .B(\u_div/QIncCry [8]), 
        .Y(quotient[8]) );
  AND2X2M U1 ( .A(n8), .B(\u_div/SumTmp[8][0] ), .Y(n1) );
  CLKXOR2X2M U2 ( .A(n7), .B(b[1]), .Y(n2) );
  INVX2M U3 ( .A(b[7]), .Y(n7) );
  BUFX2M U4 ( .A(\u_div/BInv [0]), .Y(n6) );
  OR2X2M U5 ( .A(\u_div/PartRem[2][7] ), .B(\u_div/CryTmp[1][7] ), .Y(
        \u_div/QAbs [1]) );
  MXI2X1M U6 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        \u_div/QAbs [1]), .Y(n3) );
  AND2X2M U7 ( .A(n7), .B(n6), .Y(n4) );
  NAND2X2M U8 ( .A(n3), .B(n5), .Y(\u_div/QAbs [0]) );
  XNOR2X2M U9 ( .A(n6), .B(b[7]), .Y(\u_div/SumTmp[8][0] ) );
  INVX2M U10 ( .A(\u_div/CryTmp[0][7] ), .Y(n5) );
  CLKXOR2X2M U11 ( .A(b[0]), .B(n7), .Y(\u_div/BInv [0]) );
  CLKXOR2X2M U12 ( .A(a[8]), .B(b[7]), .Y(n9) );
  CLKXOR2X2M U13 ( .A(n8), .B(n9), .Y(\u_div/QInv [8]) );
  CLKXOR2X2M U14 ( .A(n10), .B(n9), .Y(\u_div/QInv [7]) );
  CLKXOR2X2M U15 ( .A(n11), .B(n9), .Y(\u_div/QInv [6]) );
  CLKXOR2X2M U16 ( .A(n12), .B(n9), .Y(\u_div/QInv [5]) );
  CLKXOR2X2M U17 ( .A(n13), .B(n9), .Y(\u_div/QInv [4]) );
  CLKXOR2X2M U18 ( .A(n14), .B(n9), .Y(\u_div/QInv [3]) );
  CLKXOR2X2M U19 ( .A(\u_div/CryTmp[2][7] ), .B(n9), .Y(\u_div/QInv [2]) );
  CLKXOR2X2M U20 ( .A(\u_div/QAbs [1]), .B(n9), .Y(\u_div/QInv [1]) );
  CLKXOR2X2M U21 ( .A(\u_div/QAbs [0]), .B(n9), .Y(\u_div/QInv [0]) );
  AND2X1M U22 ( .A(n15), .B(n9), .Y(\u_div/QIncCry [0]) );
  CLKMX2X2M U23 ( .A(\u_div/PartRem[3][6] ), .B(\u_div/SumTmp[2][6] ), .S0(
        \u_div/CryTmp[2][7] ), .Y(\u_div/PartRem[2][7] ) );
  CLKMX2X2M U24 ( .A(\u_div/PartRem[4][5] ), .B(\u_div/SumTmp[3][5] ), .S0(n14), .Y(\u_div/PartRem[3][6] ) );
  CLKMX2X2M U25 ( .A(\u_div/PartRem[5][4] ), .B(\u_div/SumTmp[4][4] ), .S0(n13), .Y(\u_div/PartRem[4][5] ) );
  CLKMX2X2M U26 ( .A(\u_div/PartRem[6][3] ), .B(\u_div/SumTmp[5][3] ), .S0(n12), .Y(\u_div/PartRem[5][4] ) );
  CLKMX2X2M U27 ( .A(\u_div/PartRem[7][2] ), .B(\u_div/SumTmp[6][2] ), .S0(n11), .Y(\u_div/PartRem[6][3] ) );
  CLKMX2X2M U28 ( .A(n1), .B(\u_div/SumTmp[7][1] ), .S0(n10), .Y(
        \u_div/PartRem[7][2] ) );
  AND3X1M U29 ( .A(n16), .B(n15), .C(n4), .Y(n8) );
  NAND3BX1M U30 ( .AN(b[0]), .B(n7), .C(n16), .Y(n15) );
  AND2X1M U31 ( .A(n17), .B(n2), .Y(n16) );
  CLKMX2X2M U32 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        \u_div/CryTmp[2][7] ), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U33 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(n14), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U34 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(n13), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(n12), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(n11), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U37 ( .A(\u_div/AIncCry [7]), .B(\u_div/SumTmp[7][0] ), .S0(n10), 
        .Y(\u_div/PartRem[7][1] ) );
  AND2X1M U38 ( .A(\u_div/CryTmp[7][2] ), .B(n17), .Y(n10) );
  AND2X1M U39 ( .A(n18), .B(\u_div/BInv [2]), .Y(n17) );
  CLKMX2X2M U40 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        \u_div/QAbs [1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U41 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        \u_div/CryTmp[2][7] ), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(n14), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(n13), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(n12), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[7][0] ), .B(\u_div/SumTmp[6][0] ), .S0(n11), .Y(\u_div/PartRem[6][1] ) );
  AND2X1M U46 ( .A(\u_div/CryTmp[6][3] ), .B(n18), .Y(n11) );
  AND2X1M U47 ( .A(n19), .B(\u_div/BInv [3]), .Y(n18) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        \u_div/QAbs [1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        \u_div/CryTmp[2][7] ), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(n14), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U51 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(n13), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U52 ( .A(\u_div/PartRem[6][0] ), .B(\u_div/SumTmp[5][0] ), .S0(n12), .Y(\u_div/PartRem[5][1] ) );
  AND2X1M U53 ( .A(\u_div/CryTmp[5][4] ), .B(n19), .Y(n12) );
  AND2X1M U54 ( .A(n20), .B(\u_div/BInv [4]), .Y(n19) );
  CLKMX2X2M U55 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        \u_div/QAbs [1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U56 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        \u_div/CryTmp[2][7] ), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(n14), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U58 ( .A(\u_div/PartRem[5][0] ), .B(\u_div/SumTmp[4][0] ), .S0(n13), .Y(\u_div/PartRem[4][1] ) );
  AND2X1M U59 ( .A(\u_div/CryTmp[4][5] ), .B(n20), .Y(n13) );
  AND2X1M U60 ( .A(\u_div/BInv [6]), .B(\u_div/BInv [5]), .Y(n20) );
  CLKMX2X2M U61 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        \u_div/QAbs [1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U62 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        \u_div/CryTmp[2][7] ), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U63 ( .A(\u_div/PartRem[4][0] ), .B(\u_div/SumTmp[3][0] ), .S0(n14), .Y(\u_div/PartRem[3][1] ) );
  AND2X1M U64 ( .A(\u_div/CryTmp[3][6] ), .B(\u_div/BInv [6]), .Y(n14) );
  CLKMX2X2M U65 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        \u_div/QAbs [1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U66 ( .A(\u_div/PartRem[3][0] ), .B(\u_div/SumTmp[2][0] ), .S0(
        \u_div/CryTmp[2][7] ), .Y(\u_div/PartRem[2][1] ) );
  CLKMX2X2M U67 ( .A(\u_div/PartRem[2][0] ), .B(\u_div/SumTmp[1][0] ), .S0(
        \u_div/QAbs [1]), .Y(\u_div/PartRem[1][1] ) );
  CLKXOR2X2M U68 ( .A(n7), .B(b[6]), .Y(\u_div/BInv [6]) );
  CLKXOR2X2M U69 ( .A(n7), .B(b[5]), .Y(\u_div/BInv [5]) );
  CLKXOR2X2M U70 ( .A(n7), .B(b[4]), .Y(\u_div/BInv [4]) );
  CLKXOR2X2M U71 ( .A(n7), .B(b[3]), .Y(\u_div/BInv [3]) );
  CLKXOR2X2M U72 ( .A(n7), .B(b[2]), .Y(\u_div/BInv [2]) );
  CLKXOR2X2M U73 ( .A(a[8]), .B(a[6]), .Y(\u_div/AInv [6]) );
  CLKXOR2X2M U74 ( .A(a[8]), .B(a[5]), .Y(\u_div/AInv [5]) );
  CLKXOR2X2M U75 ( .A(a[8]), .B(a[4]), .Y(\u_div/AInv [4]) );
  CLKXOR2X2M U76 ( .A(a[8]), .B(a[3]), .Y(\u_div/AInv [3]) );
  CLKXOR2X2M U77 ( .A(a[8]), .B(a[2]), .Y(\u_div/AInv [2]) );
  CLKXOR2X2M U78 ( .A(a[8]), .B(a[1]), .Y(\u_div/AInv [1]) );
  CLKXOR2X2M U79 ( .A(a[8]), .B(a[0]), .Y(\u_div/AInv [0]) );
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
  XNOR2X2M U1 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U2 ( .A(B[0]), .Y(n9) );
  INVX2M U3 ( .A(B[2]), .Y(n7) );
  INVX2M U4 ( .A(B[3]), .Y(n6) );
  INVX2M U5 ( .A(B[4]), .Y(n5) );
  INVX2M U6 ( .A(B[5]), .Y(n4) );
  INVX2M U7 ( .A(B[6]), .Y(n3) );
  INVX2M U8 ( .A(B[1]), .Y(n8) );
  NAND2X2M U9 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U10 ( .A(A[0]), .Y(n1) );
  INVX2M U11 ( .A(B[8]), .Y(n2) );
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
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
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

  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S14_7_0 ( .A(ZA), .B(ZB), .CI(\SUMB[7][0] ), .CO(\A2[6] ), .S(
        \A1[5] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n7), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
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
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n6), .CI(\SUMB[1][2] ), .CO(
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
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n4), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n9), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n3), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n8), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  AND2X2M U2 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\SUMB[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][2] ), .Y(n19) );
  INVX2M U11 ( .A(\ab[0][3] ), .Y(n20) );
  INVX2M U12 ( .A(\ab[0][4] ), .Y(n21) );
  INVX2M U13 ( .A(\ab[0][6] ), .Y(n23) );
  INVX2M U14 ( .A(\ab[0][5] ), .Y(n22) );
  INVX2M U15 ( .A(\ab[0][1] ), .Y(n18) );
  INVX2M U16 ( .A(\CARRYB[7][7] ), .Y(n25) );
  XNOR2X2M U17 ( .A(\ab[1][0] ), .B(n18), .Y(PRODUCT[1]) );
  XNOR2X2M U18 ( .A(\ab[1][6] ), .B(n24), .Y(\SUMB[1][6] ) );
  XNOR2X2M U19 ( .A(\ab[1][4] ), .B(n22), .Y(\SUMB[1][4] ) );
  CLKXOR2X2M U20 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U21 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  CLKXOR2X2M U22 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  INVX2M U23 ( .A(\ab[0][7] ), .Y(n24) );
  XNOR2X2M U24 ( .A(\ab[1][5] ), .B(n23), .Y(\SUMB[1][5] ) );
  XNOR2X2M U25 ( .A(\ab[1][3] ), .B(n21), .Y(\SUMB[1][3] ) );
  XNOR2X2M U26 ( .A(\ab[1][1] ), .B(n19), .Y(\SUMB[1][1] ) );
  XNOR2X2M U27 ( .A(\ab[1][2] ), .B(n20), .Y(\SUMB[1][2] ) );
  XNOR2X2M U28 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U29 ( .A(\SUMB[7][1] ), .Y(n17) );
  AND2X2M U30 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n11) );
  AND2X2M U31 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n12) );
  CLKXOR2X2M U32 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U33 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  AND2X2M U34 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n13) );
  AND2X2M U35 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n14) );
  AND2X2M U36 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n15) );
  CLKXOR2X2M U37 ( .A(\CARRYB[7][6] ), .B(\SUMB[7][7] ), .Y(\A1[12] ) );
  AND2X2M U38 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  INVX2M U39 ( .A(ZB), .Y(n34) );
  INVX2M U40 ( .A(B[0]), .Y(n41) );
  INVX2M U41 ( .A(A[1]), .Y(n32) );
  INVX2M U42 ( .A(A[0]), .Y(n33) );
  INVX2M U43 ( .A(B[6]), .Y(n35) );
  INVX2M U44 ( .A(A[2]), .Y(n31) );
  INVX2M U45 ( .A(B[3]), .Y(n38) );
  INVX2M U46 ( .A(B[2]), .Y(n39) );
  INVX2M U47 ( .A(B[1]), .Y(n40) );
  INVX2M U48 ( .A(B[5]), .Y(n36) );
  INVX2M U49 ( .A(B[4]), .Y(n37) );
  INVX2M U50 ( .A(A[6]), .Y(n27) );
  INVX2M U51 ( .A(A[3]), .Y(n30) );
  INVX2M U52 ( .A(A[4]), .Y(n29) );
  INVX2M U53 ( .A(A[5]), .Y(n28) );
  INVX2M U54 ( .A(ZA), .Y(n26) );
  NOR2X1M U55 ( .A(n34), .B(n26), .Y(\ab[7][7] ) );
  NOR2X1M U56 ( .A(B[6]), .B(n26), .Y(\ab[7][6] ) );
  NOR2X1M U57 ( .A(B[5]), .B(n26), .Y(\ab[7][5] ) );
  NOR2X1M U58 ( .A(B[4]), .B(n26), .Y(\ab[7][4] ) );
  NOR2X1M U59 ( .A(B[3]), .B(n26), .Y(\ab[7][3] ) );
  NOR2X1M U60 ( .A(B[2]), .B(n26), .Y(\ab[7][2] ) );
  NOR2X1M U61 ( .A(B[1]), .B(n26), .Y(\ab[7][1] ) );
  NOR2X1M U62 ( .A(B[0]), .B(n26), .Y(\ab[7][0] ) );
  NOR2X1M U63 ( .A(A[6]), .B(n34), .Y(\ab[6][7] ) );
  NOR2X1M U64 ( .A(n27), .B(n35), .Y(\ab[6][6] ) );
  NOR2X1M U65 ( .A(n27), .B(n36), .Y(\ab[6][5] ) );
  NOR2X1M U66 ( .A(n27), .B(n37), .Y(\ab[6][4] ) );
  NOR2X1M U67 ( .A(n27), .B(n38), .Y(\ab[6][3] ) );
  NOR2X1M U68 ( .A(n27), .B(n39), .Y(\ab[6][2] ) );
  NOR2X1M U69 ( .A(n27), .B(n40), .Y(\ab[6][1] ) );
  NOR2X1M U70 ( .A(n27), .B(n41), .Y(\ab[6][0] ) );
  NOR2X1M U71 ( .A(A[5]), .B(n34), .Y(\ab[5][7] ) );
  NOR2X1M U72 ( .A(n35), .B(n28), .Y(\ab[5][6] ) );
  NOR2X1M U73 ( .A(n36), .B(n28), .Y(\ab[5][5] ) );
  NOR2X1M U74 ( .A(n37), .B(n28), .Y(\ab[5][4] ) );
  NOR2X1M U75 ( .A(n38), .B(n28), .Y(\ab[5][3] ) );
  NOR2X1M U76 ( .A(n39), .B(n28), .Y(\ab[5][2] ) );
  NOR2X1M U77 ( .A(n40), .B(n28), .Y(\ab[5][1] ) );
  NOR2X1M U78 ( .A(n41), .B(n28), .Y(\ab[5][0] ) );
  NOR2X1M U79 ( .A(A[4]), .B(n34), .Y(\ab[4][7] ) );
  NOR2X1M U80 ( .A(n35), .B(n29), .Y(\ab[4][6] ) );
  NOR2X1M U81 ( .A(n36), .B(n29), .Y(\ab[4][5] ) );
  NOR2X1M U82 ( .A(n37), .B(n29), .Y(\ab[4][4] ) );
  NOR2X1M U83 ( .A(n38), .B(n29), .Y(\ab[4][3] ) );
  NOR2X1M U84 ( .A(n39), .B(n29), .Y(\ab[4][2] ) );
  NOR2X1M U85 ( .A(n40), .B(n29), .Y(\ab[4][1] ) );
  NOR2X1M U86 ( .A(n41), .B(n29), .Y(\ab[4][0] ) );
  NOR2X1M U87 ( .A(A[3]), .B(n34), .Y(\ab[3][7] ) );
  NOR2X1M U88 ( .A(n35), .B(n30), .Y(\ab[3][6] ) );
  NOR2X1M U89 ( .A(n36), .B(n30), .Y(\ab[3][5] ) );
  NOR2X1M U90 ( .A(n37), .B(n30), .Y(\ab[3][4] ) );
  NOR2X1M U91 ( .A(n38), .B(n30), .Y(\ab[3][3] ) );
  NOR2X1M U92 ( .A(n39), .B(n30), .Y(\ab[3][2] ) );
  NOR2X1M U93 ( .A(n40), .B(n30), .Y(\ab[3][1] ) );
  NOR2X1M U94 ( .A(n41), .B(n30), .Y(\ab[3][0] ) );
  NOR2X1M U95 ( .A(A[2]), .B(n34), .Y(\ab[2][7] ) );
  NOR2X1M U96 ( .A(n35), .B(n31), .Y(\ab[2][6] ) );
  NOR2X1M U97 ( .A(n36), .B(n31), .Y(\ab[2][5] ) );
  NOR2X1M U98 ( .A(n37), .B(n31), .Y(\ab[2][4] ) );
  NOR2X1M U99 ( .A(n38), .B(n31), .Y(\ab[2][3] ) );
  NOR2X1M U100 ( .A(n39), .B(n31), .Y(\ab[2][2] ) );
  NOR2X1M U101 ( .A(n40), .B(n31), .Y(\ab[2][1] ) );
  NOR2X1M U102 ( .A(n41), .B(n31), .Y(\ab[2][0] ) );
  NOR2X1M U103 ( .A(A[1]), .B(n34), .Y(\ab[1][7] ) );
  NOR2X1M U104 ( .A(n35), .B(n32), .Y(\ab[1][6] ) );
  NOR2X1M U105 ( .A(n36), .B(n32), .Y(\ab[1][5] ) );
  NOR2X1M U106 ( .A(n37), .B(n32), .Y(\ab[1][4] ) );
  NOR2X1M U107 ( .A(n38), .B(n32), .Y(\ab[1][3] ) );
  NOR2X1M U108 ( .A(n39), .B(n32), .Y(\ab[1][2] ) );
  NOR2X1M U109 ( .A(n40), .B(n32), .Y(\ab[1][1] ) );
  NOR2X1M U110 ( .A(n41), .B(n32), .Y(\ab[1][0] ) );
  NOR2X1M U111 ( .A(A[0]), .B(n34), .Y(\ab[0][7] ) );
  NOR2X1M U112 ( .A(n35), .B(n33), .Y(\ab[0][6] ) );
  NOR2X1M U113 ( .A(n36), .B(n33), .Y(\ab[0][5] ) );
  NOR2X1M U114 ( .A(n37), .B(n33), .Y(\ab[0][4] ) );
  NOR2X1M U115 ( .A(n38), .B(n33), .Y(\ab[0][3] ) );
  NOR2X1M U116 ( .A(n39), .B(n33), .Y(\ab[0][2] ) );
  NOR2X1M U117 ( .A(n40), .B(n33), .Y(\ab[0][1] ) );
  NOR2X1M U118 ( .A(n41), .B(n33), .Y(PRODUCT[0]) );
  ARITHMETIC_UNIT_DW01_add_1 FS_1 ( .A({n25, \A1[12] , \A1[11] , \A1[10] , 
        \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[5] , \A1[4] , \A1[3] , \A1[2] , 
        \A1[1] , \A1[0] }), .B({n10, n16, n15, n13, n14, n11, n12, \A2[6] , 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2])
         );
endmodule


module ARITHMETIC_UNIT_test_1 ( A, B, ALU_FUN, Arith_Enable, CLK, RST, 
        Arith_OUT, Arith_Flag, test_si, test_se );
  input [7:0] A;
  input [7:0] B;
  input [1:0] ALU_FUN;
  output [15:0] Arith_OUT;
  input Arith_Enable, CLK, RST, test_si, test_se;
  output Arith_Flag;
  wire   N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32,
         N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N46,
         N47, N48, N49, N50, N51, N52, N55, N56, N57, N58, N59, N60, N61, N62,
         N63, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100,
         N101, N102, N103, N104, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n3, n7, n8;

  SDFFRQX2M \Arith_OUT_reg[15]  ( .D(N104), .SI(Arith_OUT[14]), .SE(n8), .CK(
        CLK), .RN(RST), .Q(Arith_OUT[15]) );
  SDFFRQX2M \Arith_OUT_reg[14]  ( .D(N103), .SI(Arith_OUT[13]), .SE(n8), .CK(
        CLK), .RN(RST), .Q(Arith_OUT[14]) );
  SDFFRQX2M \Arith_OUT_reg[13]  ( .D(N102), .SI(Arith_OUT[12]), .SE(n8), .CK(
        CLK), .RN(RST), .Q(Arith_OUT[13]) );
  SDFFRQX2M \Arith_OUT_reg[12]  ( .D(N101), .SI(Arith_OUT[11]), .SE(n8), .CK(
        CLK), .RN(RST), .Q(Arith_OUT[12]) );
  SDFFRQX2M \Arith_OUT_reg[11]  ( .D(N100), .SI(Arith_OUT[10]), .SE(n8), .CK(
        CLK), .RN(RST), .Q(Arith_OUT[11]) );
  SDFFRQX2M \Arith_OUT_reg[10]  ( .D(N99), .SI(Arith_OUT[9]), .SE(n8), .CK(CLK), .RN(RST), .Q(Arith_OUT[10]) );
  SDFFRQX2M \Arith_OUT_reg[9]  ( .D(N98), .SI(Arith_OUT[8]), .SE(n8), .CK(CLK), 
        .RN(RST), .Q(Arith_OUT[9]) );
  SDFFRQX2M \Arith_OUT_reg[8]  ( .D(N97), .SI(Arith_OUT[7]), .SE(n8), .CK(CLK), 
        .RN(RST), .Q(Arith_OUT[8]) );
  SDFFRQX2M \Arith_OUT_reg[7]  ( .D(N96), .SI(Arith_OUT[6]), .SE(n8), .CK(CLK), 
        .RN(RST), .Q(Arith_OUT[7]) );
  SDFFRQX2M \Arith_OUT_reg[6]  ( .D(N95), .SI(Arith_OUT[5]), .SE(n8), .CK(CLK), 
        .RN(RST), .Q(Arith_OUT[6]) );
  SDFFRQX2M \Arith_OUT_reg[5]  ( .D(N94), .SI(Arith_OUT[4]), .SE(n8), .CK(CLK), 
        .RN(RST), .Q(Arith_OUT[5]) );
  SDFFRQX2M \Arith_OUT_reg[4]  ( .D(N93), .SI(Arith_OUT[3]), .SE(n8), .CK(CLK), 
        .RN(RST), .Q(Arith_OUT[4]) );
  SDFFRQX2M \Arith_OUT_reg[3]  ( .D(N92), .SI(Arith_OUT[2]), .SE(n8), .CK(CLK), 
        .RN(RST), .Q(Arith_OUT[3]) );
  SDFFRQX2M \Arith_OUT_reg[2]  ( .D(N91), .SI(Arith_OUT[1]), .SE(n8), .CK(CLK), 
        .RN(RST), .Q(Arith_OUT[2]) );
  SDFFRQX2M \Arith_OUT_reg[1]  ( .D(N90), .SI(Arith_OUT[0]), .SE(n8), .CK(CLK), 
        .RN(RST), .Q(Arith_OUT[1]) );
  SDFFRQX2M \Arith_OUT_reg[0]  ( .D(N89), .SI(Arith_Flag), .SE(n8), .CK(CLK), 
        .RN(RST), .Q(Arith_OUT[0]) );
  SDFFRQX2M Arith_Flag_reg ( .D(Arith_Enable), .SI(test_si), .SE(n8), .CK(CLK), 
        .RN(RST), .Q(Arith_Flag) );
  NAND2X2M U22 ( .A(n37), .B(n38), .Y(N92) );
  AOI22X1M U23 ( .A0(N31), .A1(n28), .B0(N22), .B1(n29), .Y(n38) );
  AOI22X1M U24 ( .A0(N58), .A1(n30), .B0(N40), .B1(n24), .Y(n37) );
  NAND2X2M U25 ( .A(n35), .B(n36), .Y(N93) );
  AOI22X1M U26 ( .A0(N32), .A1(n28), .B0(N23), .B1(n29), .Y(n36) );
  AOI22X1M U27 ( .A0(N59), .A1(n30), .B0(N41), .B1(n24), .Y(n35) );
  NAND2X2M U28 ( .A(n33), .B(n34), .Y(N94) );
  AOI22X1M U29 ( .A0(N33), .A1(n28), .B0(N24), .B1(n29), .Y(n34) );
  AOI22X1M U30 ( .A0(N60), .A1(n30), .B0(N42), .B1(n24), .Y(n33) );
  NAND2X2M U31 ( .A(n31), .B(n32), .Y(N95) );
  AOI22X1M U32 ( .A0(N34), .A1(n28), .B0(N25), .B1(n29), .Y(n32) );
  AOI22X1M U33 ( .A0(N61), .A1(n30), .B0(N43), .B1(n24), .Y(n31) );
  NAND2X2M U34 ( .A(n26), .B(n27), .Y(N96) );
  AOI22X1M U35 ( .A0(N35), .A1(n28), .B0(N26), .B1(n29), .Y(n27) );
  AOI22X1M U36 ( .A0(N62), .A1(n30), .B0(N44), .B1(n24), .Y(n26) );
  OAI2BB1X2M U37 ( .A0N(N45), .A1N(n24), .B0(n25), .Y(N97) );
  OAI2BB1X2M U38 ( .A0N(N46), .A1N(n24), .B0(n25), .Y(N98) );
  OAI2BB1X2M U39 ( .A0N(N47), .A1N(n24), .B0(n25), .Y(N99) );
  OAI2BB1X2M U40 ( .A0N(N48), .A1N(n24), .B0(n25), .Y(N100) );
  OAI2BB1X2M U41 ( .A0N(N49), .A1N(n24), .B0(n25), .Y(N101) );
  OAI2BB1X2M U42 ( .A0N(N50), .A1N(n24), .B0(n25), .Y(N102) );
  OAI2BB1X2M U43 ( .A0N(N51), .A1N(n24), .B0(n25), .Y(N103) );
  OAI2BB1X2M U44 ( .A0N(N52), .A1N(n24), .B0(n25), .Y(N104) );
  NAND2X2M U45 ( .A(n41), .B(n42), .Y(N90) );
  AOI22X1M U46 ( .A0(N29), .A1(n28), .B0(N20), .B1(n29), .Y(n42) );
  AOI22X1M U47 ( .A0(N56), .A1(n30), .B0(N38), .B1(n24), .Y(n41) );
  NAND2X2M U48 ( .A(n39), .B(n40), .Y(N91) );
  AOI22X1M U49 ( .A0(N30), .A1(n28), .B0(N21), .B1(n29), .Y(n40) );
  AOI22X1M U50 ( .A0(N57), .A1(n30), .B0(N39), .B1(n24), .Y(n39) );
  AND3X2M U51 ( .A(Arith_Enable), .B(n47), .C(n48), .Y(n30) );
  AND2X2M U52 ( .A(n46), .B(Arith_Enable), .Y(n28) );
  AND2X2M U53 ( .A(n45), .B(Arith_Enable), .Y(n29) );
  NAND2X2M U54 ( .A(Arith_Enable), .B(n49), .Y(n25) );
  OAI2BB1X2M U55 ( .A0N(N27), .A1N(n45), .B0(n50), .Y(n49) );
  AOI32X1M U56 ( .A0(n48), .A1(n47), .A2(N63), .B0(N36), .B1(n46), .Y(n50) );
  NAND2X2M U57 ( .A(n43), .B(n44), .Y(N89) );
  AOI22X1M U58 ( .A0(N28), .A1(n28), .B0(N19), .B1(n29), .Y(n44) );
  AOI22X1M U59 ( .A0(N55), .A1(n30), .B0(N37), .B1(n24), .Y(n43) );
  INVX2M U60 ( .A(ALU_FUN[0]), .Y(n3) );
  AND3X2M U61 ( .A(Arith_Enable), .B(ALU_FUN[1]), .C(n3), .Y(n24) );
  NAND2X2M U62 ( .A(n51), .B(n52), .Y(n47) );
  NOR4X1M U63 ( .A(B[7]), .B(B[6]), .C(B[5]), .D(B[4]), .Y(n52) );
  NOR4X1M U64 ( .A(B[3]), .B(B[2]), .C(B[1]), .D(B[0]), .Y(n51) );
  NOR2X2M U65 ( .A(n3), .B(ALU_FUN[1]), .Y(n46) );
  NOR2X2M U66 ( .A(ALU_FUN[0]), .B(ALU_FUN[1]), .Y(n45) );
  NOR2BX2M U67 ( .AN(ALU_FUN[1]), .B(n3), .Y(n48) );
  INVXLM U69 ( .A(test_se), .Y(n7) );
  INVXLM U70 ( .A(n7), .Y(n8) );
  ARITHMETIC_UNIT_DW_div_tc_0 div_24 ( .a({A[7], A}), .b(B), .quotient({N63, 
        N62, N61, N60, N59, N58, N57, N56, N55}) );
  ARITHMETIC_UNIT_DW01_sub_0 sub_22 ( .A({A[7], A}), .B({B[7], B}), .CI(1'b0), 
        .DIFF({N36, N35, N34, N33, N32, N31, N30, N29, N28}) );
  ARITHMETIC_UNIT_DW01_add_0 add_21 ( .A({A[7], A}), .B({B[7], B}), .CI(1'b0), 
        .SUM({N27, N26, N25, N24, N23, N22, N21, N20, N19}) );
  ARITHMETIC_UNIT_DW02_mult_0 mult_23 ( .A(A), .B(B), .TC(1'b1), .PRODUCT({N52, 
        N51, N50, N49, N48, N47, N46, N45, N44, N43, N42, N41, N40, N39, N38, 
        N37}) );
endmodule


module LOGIC_UNIT_test_1 ( A, B, ALU_FUN, Logic_Enable, CLK, RST, Logic_OUT, 
        Logic_Flag, test_si, test_se );
  input [7:0] A;
  input [7:0] B;
  input [2:0] ALU_FUN;
  output [15:0] Logic_OUT;
  input Logic_Enable, CLK, RST, test_si, test_se;
  output Logic_Flag;
  wire   N87, N88, N89, N90, N91, N92, N93, N94, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n59, n60;
  assign Logic_OUT[15] = 1'b0;
  assign Logic_OUT[14] = 1'b0;
  assign Logic_OUT[13] = 1'b0;
  assign Logic_OUT[12] = 1'b0;
  assign Logic_OUT[11] = 1'b0;
  assign Logic_OUT[10] = 1'b0;
  assign Logic_OUT[9] = 1'b0;
  assign Logic_OUT[8] = 1'b0;

  SDFFRQX2M \Logic_OUT_reg[7]  ( .D(N94), .SI(Logic_OUT[6]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(Logic_OUT[7]) );
  SDFFRQX2M \Logic_OUT_reg[6]  ( .D(N93), .SI(Logic_OUT[5]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(Logic_OUT[6]) );
  SDFFRQX2M \Logic_OUT_reg[5]  ( .D(N92), .SI(Logic_OUT[4]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(Logic_OUT[5]) );
  SDFFRQX2M \Logic_OUT_reg[4]  ( .D(N91), .SI(Logic_OUT[3]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(Logic_OUT[4]) );
  SDFFRQX2M \Logic_OUT_reg[3]  ( .D(N90), .SI(Logic_OUT[2]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(Logic_OUT[3]) );
  SDFFRQX2M \Logic_OUT_reg[2]  ( .D(N89), .SI(Logic_OUT[1]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(Logic_OUT[2]) );
  SDFFRQX2M \Logic_OUT_reg[1]  ( .D(N88), .SI(Logic_OUT[0]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(Logic_OUT[1]) );
  SDFFRQX2M \Logic_OUT_reg[0]  ( .D(N87), .SI(Logic_Flag), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(Logic_OUT[0]) );
  SDFFRQX2M Logic_Flag_reg ( .D(Logic_Enable), .SI(test_si), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(Logic_Flag) );
  OAI21X2M U20 ( .A0(n14), .A1(n13), .B0(n58), .Y(n32) );
  INVX2M U21 ( .A(Logic_Enable), .Y(n12) );
  NOR2X2M U22 ( .A(n54), .B(n12), .Y(N87) );
  AOI221XLM U23 ( .A0(n10), .A1(n60), .B0(A[0]), .B1(n27), .C0(n55), .Y(n54)
         );
  OAI2B2X1M U24 ( .A1N(B[0]), .A0(n56), .B0(B[0]), .B1(n57), .Y(n55) );
  AOI221XLM U25 ( .A0(A[0]), .A1(n11), .B0(n32), .B1(n60), .C0(n10), .Y(n57)
         );
  NOR2X2M U26 ( .A(n50), .B(n12), .Y(N88) );
  AOI221XLM U27 ( .A0(n10), .A1(n59), .B0(A[1]), .B1(n27), .C0(n51), .Y(n50)
         );
  OAI2B2X1M U28 ( .A1N(B[1]), .A0(n52), .B0(B[1]), .B1(n53), .Y(n51) );
  AOI221XLM U29 ( .A0(A[1]), .A1(n11), .B0(n32), .B1(n59), .C0(n10), .Y(n53)
         );
  NOR2X2M U30 ( .A(n46), .B(n12), .Y(N89) );
  AOI221XLM U31 ( .A0(n10), .A1(n19), .B0(A[2]), .B1(n27), .C0(n47), .Y(n46)
         );
  OAI2B2X1M U32 ( .A1N(B[2]), .A0(n48), .B0(B[2]), .B1(n49), .Y(n47) );
  AOI221XLM U33 ( .A0(A[2]), .A1(n11), .B0(n32), .B1(n19), .C0(n10), .Y(n49)
         );
  NOR2X2M U34 ( .A(n42), .B(n12), .Y(N90) );
  AOI221XLM U35 ( .A0(n10), .A1(n18), .B0(A[3]), .B1(n27), .C0(n43), .Y(n42)
         );
  OAI2B2X1M U36 ( .A1N(B[3]), .A0(n44), .B0(B[3]), .B1(n45), .Y(n43) );
  AOI221XLM U37 ( .A0(A[3]), .A1(n11), .B0(n32), .B1(n18), .C0(n10), .Y(n45)
         );
  NOR2X2M U38 ( .A(n38), .B(n12), .Y(N91) );
  AOI221XLM U39 ( .A0(n10), .A1(n17), .B0(A[4]), .B1(n27), .C0(n39), .Y(n38)
         );
  OAI2B2X1M U40 ( .A1N(B[4]), .A0(n40), .B0(B[4]), .B1(n41), .Y(n39) );
  AOI221XLM U41 ( .A0(A[4]), .A1(n11), .B0(n32), .B1(n17), .C0(n10), .Y(n41)
         );
  NOR2X2M U42 ( .A(n34), .B(n12), .Y(N92) );
  AOI221XLM U43 ( .A0(n10), .A1(n16), .B0(A[5]), .B1(n27), .C0(n35), .Y(n34)
         );
  OAI2B2X1M U44 ( .A1N(B[5]), .A0(n36), .B0(B[5]), .B1(n37), .Y(n35) );
  AOI221XLM U45 ( .A0(A[5]), .A1(n11), .B0(n32), .B1(n16), .C0(n10), .Y(n37)
         );
  NOR2X2M U46 ( .A(n25), .B(n12), .Y(N93) );
  AOI221XLM U47 ( .A0(n10), .A1(n15), .B0(n27), .B1(A[6]), .C0(n28), .Y(n25)
         );
  OAI2B2X1M U48 ( .A1N(B[6]), .A0(n29), .B0(B[6]), .B1(n30), .Y(n28) );
  AOI221XLM U49 ( .A0(A[6]), .A1(n11), .B0(n32), .B1(n15), .C0(n10), .Y(n30)
         );
  AOI221XLM U50 ( .A0(n11), .A1(n60), .B0(A[0]), .B1(n33), .C0(n27), .Y(n56)
         );
  AOI221XLM U51 ( .A0(n11), .A1(n59), .B0(A[1]), .B1(n33), .C0(n27), .Y(n52)
         );
  AOI221XLM U52 ( .A0(n11), .A1(n19), .B0(A[2]), .B1(n33), .C0(n27), .Y(n48)
         );
  AOI221XLM U53 ( .A0(n11), .A1(n18), .B0(A[3]), .B1(n33), .C0(n27), .Y(n44)
         );
  AOI221XLM U54 ( .A0(n11), .A1(n17), .B0(A[4]), .B1(n33), .C0(n27), .Y(n40)
         );
  AOI221XLM U55 ( .A0(n11), .A1(n16), .B0(A[5]), .B1(n33), .C0(n27), .Y(n36)
         );
  AOI221XLM U56 ( .A0(n11), .A1(n15), .B0(A[6]), .B1(n33), .C0(n27), .Y(n29)
         );
  OAI21X2M U57 ( .A0(ALU_FUN[1]), .A1(n13), .B0(n58), .Y(n33) );
  INVX2M U58 ( .A(ALU_FUN[1]), .Y(n14) );
  AND3X2M U59 ( .A(ALU_FUN[0]), .B(n14), .C(ALU_FUN[2]), .Y(n27) );
  INVX2M U60 ( .A(ALU_FUN[2]), .Y(n13) );
  NAND3X2M U61 ( .A(n14), .B(n13), .C(ALU_FUN[0]), .Y(n58) );
  INVX2M U62 ( .A(A[6]), .Y(n15) );
  INVX2M U63 ( .A(A[1]), .Y(n59) );
  INVX2M U64 ( .A(A[0]), .Y(n60) );
  INVX2M U65 ( .A(A[2]), .Y(n19) );
  INVX2M U66 ( .A(A[3]), .Y(n18) );
  INVX2M U67 ( .A(A[4]), .Y(n17) );
  INVX2M U68 ( .A(A[5]), .Y(n16) );
  NOR2X2M U69 ( .A(n20), .B(n12), .Y(N94) );
  AOI32X1M U70 ( .A0(n14), .A1(n13), .A2(n21), .B0(n22), .B1(ALU_FUN[2]), .Y(
        n20) );
  CLKXOR2X2M U71 ( .A(B[7]), .B(n24), .Y(n21) );
  CLKXOR2X2M U72 ( .A(n23), .B(ALU_FUN[1]), .Y(n22) );
  AO22X1M U73 ( .A0(A[7]), .A1(ALU_FUN[0]), .B0(n24), .B1(B[7]), .Y(n23) );
  BUFX2M U74 ( .A(n31), .Y(n11) );
  NOR3X2M U75 ( .A(ALU_FUN[1]), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n31) );
  CLKXOR2X2M U76 ( .A(A[7]), .B(ALU_FUN[0]), .Y(n24) );
  BUFX2M U77 ( .A(n26), .Y(n10) );
  NOR3X2M U78 ( .A(n14), .B(ALU_FUN[0]), .C(n13), .Y(n26) );
endmodule


module CMP_UNIT_test_1 ( A, B, ALU_FUN, CMP_Enable, CLK, RST, CMP_OUT, 
        CMP_Flag, test_si, test_se );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] CMP_OUT;
  input CMP_Enable, CLK, RST, test_si, test_se;
  output CMP_Flag;
  wire   N27, N28, N29, N34, N35, n15, n16, n17, n1, n2, n3, n4, n5, n6, n10,
         n11, n12, n13, n14, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46;
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

  SDFFRQX2M \CMP_OUT_reg[1]  ( .D(N35), .SI(CMP_OUT[0]), .SE(test_se), .CK(CLK), .RN(RST), .Q(CMP_OUT[1]) );
  SDFFRQX2M \CMP_OUT_reg[0]  ( .D(N34), .SI(CMP_Flag), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(CMP_OUT[0]) );
  SDFFRQX2M CMP_Flag_reg ( .D(CMP_Enable), .SI(test_si), .SE(test_se), .CK(CLK), .RN(RST), .Q(CMP_Flag) );
  INVX2M U5 ( .A(n18), .Y(n40) );
  INVX2M U21 ( .A(CMP_Enable), .Y(n42) );
  INVX2M U22 ( .A(n32), .Y(N28) );
  INVX2M U23 ( .A(B[6]), .Y(n36) );
  INVX2M U24 ( .A(A[6]), .Y(n41) );
  INVX2M U25 ( .A(n1), .Y(n38) );
  NOR4X1M U26 ( .A(ALU_FUN[0]), .B(n17), .C(n43), .D(n42), .Y(N34) );
  AOI33X2M U27 ( .A0(ALU_FUN[1]), .A1(n44), .A2(N27), .B0(ALU_FUN[2]), .B1(n45), .B2(N29), .Y(n17) );
  INVX2M U28 ( .A(ALU_FUN[1]), .Y(n45) );
  NOR4X1M U29 ( .A(n15), .B(n43), .C(n42), .D(n16), .Y(N35) );
  CLKXOR2X2M U30 ( .A(ALU_FUN[1]), .B(ALU_FUN[0]), .Y(n16) );
  AOI33X2M U31 ( .A0(ALU_FUN[0]), .A1(n44), .A2(N28), .B0(ALU_FUN[2]), .B1(n46), .B2(N29), .Y(n15) );
  INVX2M U32 ( .A(ALU_FUN[0]), .Y(n46) );
  INVX2M U33 ( .A(A[1]), .Y(n39) );
  INVX2M U34 ( .A(B[0]), .Y(n33) );
  INVX2M U35 ( .A(B[2]), .Y(n34) );
  INVX2M U36 ( .A(B[7]), .Y(n37) );
  INVX2M U37 ( .A(B[3]), .Y(n35) );
  INVX2M U38 ( .A(ALU_FUN[3]), .Y(n43) );
  INVX2M U39 ( .A(ALU_FUN[2]), .Y(n44) );
  NOR2X1M U40 ( .A(n37), .B(A[7]), .Y(n29) );
  NAND2BX1M U41 ( .AN(B[4]), .B(A[4]), .Y(n22) );
  NAND2BX1M U42 ( .AN(A[4]), .B(B[4]), .Y(n5) );
  CLKNAND2X2M U43 ( .A(n22), .B(n5), .Y(n24) );
  NOR2X1M U44 ( .A(n35), .B(A[3]), .Y(n19) );
  NOR2X1M U45 ( .A(n34), .B(A[2]), .Y(n4) );
  NOR2X1M U46 ( .A(n33), .B(A[0]), .Y(n1) );
  CLKNAND2X2M U47 ( .A(A[2]), .B(n34), .Y(n21) );
  NAND2BX1M U48 ( .AN(n4), .B(n21), .Y(n13) );
  AOI21X1M U49 ( .A0(n1), .A1(n39), .B0(B[1]), .Y(n2) );
  AOI211X1M U50 ( .A0(A[1]), .A1(n38), .B0(n13), .C0(n2), .Y(n3) );
  CLKNAND2X2M U51 ( .A(A[3]), .B(n35), .Y(n20) );
  OAI31X1M U52 ( .A0(n19), .A1(n4), .A2(n3), .B0(n20), .Y(n6) );
  NAND2BX1M U53 ( .AN(A[5]), .B(B[5]), .Y(n27) );
  OAI211X1M U54 ( .A0(n24), .A1(n6), .B0(n5), .C0(n27), .Y(n10) );
  NAND2BX1M U55 ( .AN(B[5]), .B(A[5]), .Y(n23) );
  XNOR2X1M U56 ( .A(A[6]), .B(B[6]), .Y(n26) );
  AOI32X1M U57 ( .A0(n10), .A1(n23), .A2(n26), .B0(B[6]), .B1(n41), .Y(n11) );
  CLKNAND2X2M U58 ( .A(A[7]), .B(n37), .Y(n30) );
  OAI21X1M U59 ( .A0(n29), .A1(n11), .B0(n30), .Y(N29) );
  CLKNAND2X2M U60 ( .A(A[0]), .B(n33), .Y(n14) );
  OA21X1M U61 ( .A0(n14), .A1(n39), .B0(B[1]), .Y(n12) );
  AOI211X1M U62 ( .A0(n14), .A1(n39), .B0(n13), .C0(n12), .Y(n18) );
  AOI31X1M U63 ( .A0(n40), .A1(n21), .A2(n20), .B0(n19), .Y(n25) );
  OAI2B11X1M U64 ( .A1N(n25), .A0(n24), .B0(n23), .C0(n22), .Y(n28) );
  AOI32X1M U65 ( .A0(n28), .A1(n27), .A2(n26), .B0(A[6]), .B1(n36), .Y(n31) );
  AOI2B1X1M U66 ( .A1N(n31), .A0(n30), .B0(n29), .Y(n32) );
  NOR2X1M U67 ( .A(N29), .B(N28), .Y(N27) );
endmodule


module SHIFT_UNIT_test_1 ( A, ALU_FUN, Shift_Enable, CLK, RST, SHIFT_OUT, 
        SHIFT_Flag, test_si, test_se );
  input [7:0] A;
  input [3:0] ALU_FUN;
  output [15:0] SHIFT_OUT;
  input Shift_Enable, CLK, RST, test_si, test_se;
  output SHIFT_Flag;
  wire   N37, N38, N39, N40, N41, N42, N43, N44, N45, n18, n19, n20, n21, n22,
         n11, n12, n13, n14, n15, n16, n17;
  assign SHIFT_OUT[15] = 1'b0;
  assign SHIFT_OUT[14] = 1'b0;
  assign SHIFT_OUT[13] = 1'b0;
  assign SHIFT_OUT[12] = 1'b0;
  assign SHIFT_OUT[11] = 1'b0;
  assign SHIFT_OUT[10] = 1'b0;
  assign SHIFT_OUT[9] = 1'b0;

  SDFFRQX2M \SHIFT_OUT_reg[8]  ( .D(N45), .SI(SHIFT_OUT[7]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(SHIFT_OUT[8]) );
  SDFFRQX2M \SHIFT_OUT_reg[7]  ( .D(N44), .SI(SHIFT_OUT[6]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(SHIFT_OUT[7]) );
  SDFFRQX2M \SHIFT_OUT_reg[6]  ( .D(N43), .SI(SHIFT_OUT[5]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(SHIFT_OUT[6]) );
  SDFFRQX2M \SHIFT_OUT_reg[5]  ( .D(N42), .SI(SHIFT_OUT[4]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(SHIFT_OUT[5]) );
  SDFFRQX2M \SHIFT_OUT_reg[4]  ( .D(N41), .SI(SHIFT_OUT[3]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(SHIFT_OUT[4]) );
  SDFFRQX2M \SHIFT_OUT_reg[3]  ( .D(N40), .SI(SHIFT_OUT[2]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(SHIFT_OUT[3]) );
  SDFFRQX2M \SHIFT_OUT_reg[2]  ( .D(N39), .SI(SHIFT_OUT[1]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(SHIFT_OUT[2]) );
  SDFFRQX2M \SHIFT_OUT_reg[1]  ( .D(N38), .SI(SHIFT_OUT[0]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(SHIFT_OUT[1]) );
  SDFFRQX2M \SHIFT_OUT_reg[0]  ( .D(N37), .SI(SHIFT_Flag), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(SHIFT_OUT[0]) );
  SDFFRQX2M SHIFT_Flag_reg ( .D(Shift_Enable), .SI(test_si), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(SHIFT_Flag) );
  NAND2X2M U20 ( .A(n22), .B(n19), .Y(n20) );
  OAI22X1M U21 ( .A0(n20), .A1(n17), .B0(n21), .B1(n15), .Y(N39) );
  OAI22X1M U22 ( .A0(n20), .A1(n16), .B0(n21), .B1(n14), .Y(N40) );
  OAI22X1M U23 ( .A0(n20), .A1(n15), .B0(n21), .B1(n13), .Y(N41) );
  OAI22X1M U24 ( .A0(n20), .A1(n14), .B0(n12), .B1(n21), .Y(N42) );
  NOR2X2M U25 ( .A(n21), .B(n17), .Y(N37) );
  NOR2X2M U26 ( .A(n20), .B(n12), .Y(N44) );
  NAND3X2M U27 ( .A(n22), .B(n11), .C(ALU_FUN[0]), .Y(n21) );
  OAI2B2X1M U28 ( .A1N(A[0]), .A0(n20), .B0(n21), .B1(n16), .Y(N38) );
  OAI2B2X1M U29 ( .A1N(A[7]), .A0(n21), .B0(n20), .B1(n13), .Y(N43) );
  AND3X2M U30 ( .A(ALU_FUN[2]), .B(Shift_Enable), .C(ALU_FUN[3]), .Y(n22) );
  AND4X2M U31 ( .A(n18), .B(n19), .C(ALU_FUN[2]), .D(ALU_FUN[3]), .Y(N45) );
  AND2X2M U32 ( .A(Shift_Enable), .B(A[7]), .Y(n18) );
  NOR2X2M U33 ( .A(n11), .B(ALU_FUN[0]), .Y(n19) );
  INVX2M U34 ( .A(ALU_FUN[1]), .Y(n11) );
  INVX2M U35 ( .A(A[6]), .Y(n12) );
  INVX2M U36 ( .A(A[1]), .Y(n17) );
  INVX2M U37 ( .A(A[2]), .Y(n16) );
  INVX2M U38 ( .A(A[5]), .Y(n13) );
  INVX2M U39 ( .A(A[3]), .Y(n15) );
  INVX2M U40 ( .A(A[4]), .Y(n14) );
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

  AND2X2M U2 ( .A(n40), .B(ALU_FUN[3]), .Y(n7) );
  OAI32X1M U3 ( .A0(n3), .A1(ALU_FUN[1]), .A2(ALU_FUN[0]), .B0(ALU_FUN[2]), 
        .B1(n42), .Y(n40) );
  AND3X2M U4 ( .A(n41), .B(ALU_FUN[2]), .C(ALU_FUN[3]), .Y(n6) );
  XNOR2X2M U5 ( .A(n42), .B(ALU_FUN[0]), .Y(n41) );
  INVX2M U6 ( .A(ALU_FUN[1]), .Y(n42) );
  INVX2M U7 ( .A(ALU_FUN[2]), .Y(n3) );
  OR4X1M U8 ( .A(CMP_Flag), .B(Arith_Flag), .C(SHIFT_Flag), .D(Logic_Flag), 
        .Y(out_valid) );
  BUFX2M U9 ( .A(n8), .Y(n1) );
  OAI32X1M U10 ( .A0(n2), .A1(ALU_FUN[2]), .A2(ALU_FUN[1]), .B0(ALU_FUN[3]), 
        .B1(n3), .Y(n8) );
  INVX2M U11 ( .A(ALU_FUN[3]), .Y(n2) );
  NAND2X2M U12 ( .A(n10), .B(n11), .Y(alu_out[8]) );
  AOI22X1M U13 ( .A0(Logic_OUT[8]), .A1(n1), .B0(Arith_OUT[8]), .B1(n9), .Y(
        n10) );
  AOI22X1M U14 ( .A0(SHIFT_OUT[8]), .A1(n6), .B0(CMP_OUT[8]), .B1(n7), .Y(n11)
         );
  NAND2X2M U15 ( .A(n38), .B(n39), .Y(alu_out[0]) );
  AOI22X1M U16 ( .A0(Logic_OUT[0]), .A1(n1), .B0(Arith_OUT[0]), .B1(n9), .Y(
        n38) );
  AOI22X1M U17 ( .A0(SHIFT_OUT[0]), .A1(n6), .B0(CMP_OUT[0]), .B1(n7), .Y(n39)
         );
  NAND2X2M U18 ( .A(n24), .B(n25), .Y(alu_out[1]) );
  AOI22X1M U19 ( .A0(Logic_OUT[1]), .A1(n1), .B0(Arith_OUT[1]), .B1(n9), .Y(
        n24) );
  AOI22X1M U20 ( .A0(SHIFT_OUT[1]), .A1(n6), .B0(CMP_OUT[1]), .B1(n7), .Y(n25)
         );
  NAND2X2M U21 ( .A(n22), .B(n23), .Y(alu_out[2]) );
  AOI22X1M U22 ( .A0(Logic_OUT[2]), .A1(n1), .B0(Arith_OUT[2]), .B1(n9), .Y(
        n22) );
  AOI22X1M U23 ( .A0(SHIFT_OUT[2]), .A1(n6), .B0(CMP_OUT[2]), .B1(n7), .Y(n23)
         );
  NAND2X2M U24 ( .A(n20), .B(n21), .Y(alu_out[3]) );
  AOI22X1M U25 ( .A0(Logic_OUT[3]), .A1(n1), .B0(Arith_OUT[3]), .B1(n9), .Y(
        n20) );
  AOI22X1M U26 ( .A0(SHIFT_OUT[3]), .A1(n6), .B0(CMP_OUT[3]), .B1(n7), .Y(n21)
         );
  NAND2X2M U27 ( .A(n18), .B(n19), .Y(alu_out[4]) );
  AOI22X1M U28 ( .A0(Logic_OUT[4]), .A1(n1), .B0(Arith_OUT[4]), .B1(n9), .Y(
        n18) );
  AOI22X1M U29 ( .A0(SHIFT_OUT[4]), .A1(n6), .B0(CMP_OUT[4]), .B1(n7), .Y(n19)
         );
  NAND2X2M U30 ( .A(n16), .B(n17), .Y(alu_out[5]) );
  AOI22X1M U31 ( .A0(Logic_OUT[5]), .A1(n1), .B0(Arith_OUT[5]), .B1(n9), .Y(
        n16) );
  AOI22X1M U32 ( .A0(SHIFT_OUT[5]), .A1(n6), .B0(CMP_OUT[5]), .B1(n7), .Y(n17)
         );
  NAND2X2M U33 ( .A(n14), .B(n15), .Y(alu_out[6]) );
  AOI22X1M U34 ( .A0(Logic_OUT[6]), .A1(n1), .B0(Arith_OUT[6]), .B1(n9), .Y(
        n14) );
  AOI22X1M U35 ( .A0(SHIFT_OUT[6]), .A1(n6), .B0(CMP_OUT[6]), .B1(n7), .Y(n15)
         );
  NAND2X2M U36 ( .A(n12), .B(n13), .Y(alu_out[7]) );
  AOI22X1M U37 ( .A0(Logic_OUT[7]), .A1(n1), .B0(Arith_OUT[7]), .B1(n9), .Y(
        n12) );
  AOI22X1M U38 ( .A0(SHIFT_OUT[7]), .A1(n6), .B0(CMP_OUT[7]), .B1(n7), .Y(n13)
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


module ALU_TOP_test_1 ( A, B, ALU_FUNC, enable, CLK, RST, ALU_OUT, out_valid, 
        test_si, test_so, test_se );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUNC;
  output [15:0] ALU_OUT;
  input enable, CLK, RST, test_si, test_se;
  output out_valid, test_so;
  wire   Arith_Enable, Logic_Enable, CMP_Enable, Shift_Enable, Arith_Flag,
         Logic_Flag, CMP_Flag, SHIFT_Flag, n1, n2;
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
  assign test_so = SHIFT_OUT[8];

  INVX4M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
  DECODER u_decoder ( .ALU_FUNC(ALU_FUNC), .enable(enable), .Arith_Enable(
        Arith_Enable), .Logic_Enable(Logic_Enable), .CMP_Enable(CMP_Enable), 
        .Shift_Enable(Shift_Enable) );
  ARITHMETIC_UNIT_test_1 u_arith ( .A(A), .B(B), .ALU_FUN(ALU_FUNC[1:0]), 
        .Arith_Enable(Arith_Enable), .CLK(CLK), .RST(n1), .Arith_OUT(Arith_OUT), .Arith_Flag(Arith_Flag), .test_si(test_si), .test_se(test_se) );
  LOGIC_UNIT_test_1 u_logic ( .A(A), .B(B), .ALU_FUN(ALU_FUNC[2:0]), 
        .Logic_Enable(Logic_Enable), .CLK(CLK), .RST(n1), .Logic_OUT({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, Logic_OUT[7:0]}), 
        .Logic_Flag(Logic_Flag), .test_si(CMP_OUT[1]), .test_se(test_se) );
  CMP_UNIT_test_1 u_cmp ( .A(A), .B(B), .ALU_FUN(ALU_FUNC), .CMP_Enable(
        CMP_Enable), .CLK(CLK), .RST(n1), .CMP_OUT({SYNOPSYS_UNCONNECTED__8, 
        SYNOPSYS_UNCONNECTED__9, SYNOPSYS_UNCONNECTED__10, 
        SYNOPSYS_UNCONNECTED__11, SYNOPSYS_UNCONNECTED__12, 
        SYNOPSYS_UNCONNECTED__13, SYNOPSYS_UNCONNECTED__14, 
        SYNOPSYS_UNCONNECTED__15, SYNOPSYS_UNCONNECTED__16, 
        SYNOPSYS_UNCONNECTED__17, SYNOPSYS_UNCONNECTED__18, 
        SYNOPSYS_UNCONNECTED__19, SYNOPSYS_UNCONNECTED__20, 
        SYNOPSYS_UNCONNECTED__21, CMP_OUT[1:0]}), .CMP_Flag(CMP_Flag), 
        .test_si(Arith_OUT[15]), .test_se(test_se) );
  SHIFT_UNIT_test_1 u_shift ( .A(A), .ALU_FUN(ALU_FUNC), .Shift_Enable(
        Shift_Enable), .CLK(CLK), .RST(n1), .SHIFT_OUT({
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SHIFT_OUT[8:0]}), .SHIFT_Flag(SHIFT_Flag), 
        .test_si(Logic_OUT[7]), .test_se(test_se) );
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


module clk_divider_test_1 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, 
        o_div_clk, test_si, test_so, test_se );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en, test_si, test_se;
  output o_div_clk, test_so;
  wire   N6, N7, N8, N9, N10, N11, N12, N16, N21, N22, N23, N24, N25, N26, N27,
         N28, N29, N30, N31, N32, N33, N34, N35, N36, n18, n19, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n1, n2, n3, n4, n5, n6, n20, n21,
         n22, n23, n24, n25, n26, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n59;
  wire   [7:0] terminal;
  wire   [7:0] counter;

  SDFFRQX2M o_div_clk_reg ( .D(n34), .SI(counter[7]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(o_div_clk) );
  SDFFRQX2M \counter_reg[7]  ( .D(N36), .SI(counter[6]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[7]) );
  SDFFRX1M reference_reg ( .D(n36), .SI(n59), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rst_n), .Q(test_so), .QN(n18) );
  SDFFRQX2M \counter_reg[6]  ( .D(N35), .SI(counter[5]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[6]) );
  SDFFRQX2M \counter_reg[5]  ( .D(N34), .SI(counter[4]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[5]) );
  SDFFRQX2M \counter_reg[3]  ( .D(N32), .SI(counter[2]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[3]) );
  SDFFRQX2M \counter_reg[4]  ( .D(N33), .SI(counter[3]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[4]) );
  SDFFRQX2M \counter_reg[2]  ( .D(N31), .SI(counter[1]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[2]) );
  SDFFRQX2M \counter_reg[0]  ( .D(N29), .SI(test_si), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[0]) );
  SDFFRQX2M \counter_reg[1]  ( .D(N30), .SI(counter[0]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[1]) );
  SDFFRX1M out_clk_reg ( .D(n35), .SI(o_div_clk), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rst_n), .Q(n59), .QN(n19) );
  BUFX2M U6 ( .A(n30), .Y(n2) );
  BUFX2M U7 ( .A(n30), .Y(n1) );
  NAND2BX2M U8 ( .AN(N16), .B(n29), .Y(n30) );
  NOR2BX2M U17 ( .AN(N22), .B(n1), .Y(N30) );
  NOR2BX2M U18 ( .AN(N23), .B(n1), .Y(N31) );
  NOR2BX2M U19 ( .AN(N24), .B(n1), .Y(N32) );
  NOR2BX2M U20 ( .AN(N25), .B(n1), .Y(N33) );
  NOR2BX2M U21 ( .AN(N26), .B(n2), .Y(N34) );
  NOR2BX2M U22 ( .AN(N27), .B(n2), .Y(N35) );
  INVX2M U23 ( .A(terminal[2]), .Y(n48) );
  INVX2M U24 ( .A(terminal[3]), .Y(n47) );
  INVX2M U25 ( .A(terminal[5]), .Y(n45) );
  INVX2M U26 ( .A(counter[5]), .Y(n43) );
  INVX2M U27 ( .A(terminal[4]), .Y(n46) );
  INVX2M U28 ( .A(counter[4]), .Y(n42) );
  INVX2M U29 ( .A(counter[3]), .Y(n41) );
  INVX2M U30 ( .A(counter[2]), .Y(n40) );
  OAI2BB2X1M U31 ( .B0(n27), .B1(n56), .A0N(n56), .A1N(n27), .Y(terminal[0])
         );
  NAND2X2M U32 ( .A(i_div_ratio[0]), .B(n19), .Y(n27) );
  OAI2BB2X1M U33 ( .B0(n27), .B1(n54), .A0N(N7), .A1N(n27), .Y(terminal[2]) );
  OAI2BB2X1M U34 ( .B0(n27), .B1(n53), .A0N(N8), .A1N(n27), .Y(terminal[3]) );
  OAI2BB2X1M U35 ( .B0(n27), .B1(n51), .A0N(N10), .A1N(n27), .Y(terminal[5])
         );
  OAI2BB2X1M U36 ( .B0(n27), .B1(n52), .A0N(N9), .A1N(n27), .Y(terminal[4]) );
  OAI2BB2X1M U37 ( .B0(n28), .B1(n19), .A0N(o_div_clk), .A1N(n28), .Y(n34) );
  NAND2X2M U38 ( .A(N16), .B(n29), .Y(n28) );
  INVX2M U39 ( .A(counter[7]), .Y(n49) );
  AND2X2M U40 ( .A(N12), .B(n27), .Y(terminal[7]) );
  OAI2BB2X1M U41 ( .B0(n27), .B1(n50), .A0N(N11), .A1N(n27), .Y(terminal[6])
         );
  OAI2BB2X1M U42 ( .B0(n27), .B1(n55), .A0N(N6), .A1N(n27), .Y(terminal[1]) );
  OAI21X2M U43 ( .A0(n19), .A1(n2), .B0(n31), .Y(n35) );
  OAI21X2M U44 ( .A0(n2), .A1(n18), .B0(n31), .Y(n36) );
  NAND3X2M U45 ( .A(n2), .B(n18), .C(n29), .Y(n31) );
  NOR2BX2M U46 ( .AN(N28), .B(n2), .Y(N36) );
  NOR2BX2M U47 ( .AN(N21), .B(n1), .Y(N29) );
  INVX2M U48 ( .A(i_div_ratio[1]), .Y(n56) );
  INVX2M U49 ( .A(i_div_ratio[4]), .Y(n53) );
  INVX2M U50 ( .A(i_div_ratio[2]), .Y(n55) );
  INVX2M U51 ( .A(i_div_ratio[3]), .Y(n54) );
  INVX2M U52 ( .A(counter[1]), .Y(n39) );
  INVX2M U53 ( .A(i_div_ratio[6]), .Y(n51) );
  INVX2M U54 ( .A(i_div_ratio[7]), .Y(n50) );
  INVX2M U55 ( .A(i_div_ratio[5]), .Y(n52) );
  INVX2M U56 ( .A(counter[6]), .Y(n44) );
  OA21X2M U57 ( .A0(n32), .A1(n33), .B0(i_clk_en), .Y(n29) );
  NAND3X2M U58 ( .A(n55), .B(n54), .C(n56), .Y(n33) );
  NAND4X2M U59 ( .A(n53), .B(n52), .C(n51), .D(n50), .Y(n32) );
  NAND2BX1M U60 ( .AN(i_div_ratio[2]), .B(n56), .Y(n3) );
  OAI2BB1X1M U61 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n3), .Y(N6)
         );
  OR2X1M U62 ( .A(n3), .B(i_div_ratio[3]), .Y(n4) );
  OAI2BB1X1M U63 ( .A0N(n3), .A1N(i_div_ratio[3]), .B0(n4), .Y(N7) );
  OR2X1M U64 ( .A(n4), .B(i_div_ratio[4]), .Y(n5) );
  OAI2BB1X1M U65 ( .A0N(n4), .A1N(i_div_ratio[4]), .B0(n5), .Y(N8) );
  OR2X1M U66 ( .A(n5), .B(i_div_ratio[5]), .Y(n6) );
  OAI2BB1X1M U67 ( .A0N(n5), .A1N(i_div_ratio[5]), .B0(n6), .Y(N9) );
  XNOR2X1M U68 ( .A(i_div_ratio[6]), .B(n6), .Y(N10) );
  NOR3X1M U69 ( .A(i_div_ratio[6]), .B(i_div_ratio[7]), .C(n6), .Y(N12) );
  OAI21X1M U70 ( .A0(i_div_ratio[6]), .A1(n6), .B0(i_div_ratio[7]), .Y(n20) );
  NAND2BX1M U71 ( .AN(N12), .B(n20), .Y(N11) );
  NOR2X1M U72 ( .A(terminal[6]), .B(n44), .Y(n37) );
  AOI2BB1X1M U73 ( .A0N(terminal[1]), .A1N(n39), .B0(counter[0]), .Y(n21) );
  AOI222X1M U74 ( .A0(terminal[2]), .A1(n40), .B0(n21), .B1(terminal[0]), .C0(
        terminal[1]), .C1(n39), .Y(n22) );
  AOI221XLM U75 ( .A0(counter[3]), .A1(n47), .B0(counter[2]), .B1(n48), .C0(
        n22), .Y(n23) );
  AOI221XLM U76 ( .A0(terminal[4]), .A1(n42), .B0(terminal[3]), .B1(n41), .C0(
        n23), .Y(n24) );
  AOI221XLM U77 ( .A0(counter[5]), .A1(n45), .B0(counter[4]), .B1(n46), .C0(
        n24), .Y(n25) );
  AOI221XLM U78 ( .A0(terminal[6]), .A1(n44), .B0(terminal[5]), .B1(n43), .C0(
        n25), .Y(n26) );
  OAI2BB2X1M U79 ( .B0(n37), .B1(n26), .A0N(n49), .A1N(terminal[7]), .Y(n38)
         );
  OAI21X1M U80 ( .A0(terminal[7]), .A1(n49), .B0(n38), .Y(N16) );
  clk_divider_DW01_inc_0 add_39 ( .A(counter), .SUM({N28, N27, N26, N25, N24, 
        N23, N22, N21}) );
endmodule


module fsm_test_1 ( clk, rst, RX_IN, parity_en, par_err, start_glitch, 
        stop_err, bit_cnt, edge_cnt, prescale, enable, data_sam_en, strt_ck_en, 
        stop_ck_en, desr_en, par_ck_en, data_valid_reg, stop_error, 
        parity_error, test_si2, test_si1, test_so1, test_se );
  input [5:0] bit_cnt;
  input [5:0] edge_cnt;
  input [5:0] prescale;
  input clk, rst, RX_IN, parity_en, par_err, start_glitch, stop_err, test_si2,
         test_si1, test_se;
  output enable, data_sam_en, strt_ck_en, stop_ck_en, desr_en, par_ck_en,
         data_valid_reg, stop_error, parity_error, test_so1;
  wire   enable, N14, N15, N16, N17, N18, N19, N20, N21, N58, N59, N60, N61,
         N62, N63, N64, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, \add_84/carry[4] , \add_84/carry[3] ,
         \add_84/carry[2] , n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n21, n22, n23, n24, n25, n26, n27, n28, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n56, n57;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign data_sam_en = enable;
  assign data_valid_reg = 1'b0;
  assign test_so1 = current_state[2];

  SDFFRX1M \current_state_reg[0]  ( .D(next_state[0]), .SI(test_si1), .SE(
        test_se), .CK(clk), .RN(rst), .Q(current_state[0]), .QN(n49) );
  SDFFRX1M \current_state_reg[2]  ( .D(next_state[2]), .SI(n51), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(current_state[2]), .QN(n52) );
  SDFFRX1M \current_state_reg[1]  ( .D(next_state[1]), .SI(n49), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(current_state[1]), .QN(n51) );
  SDFFRX2M parity_error_reg ( .D(n42), .SI(test_si2), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(parity_error), .QN(n56) );
  NOR3X2M U12 ( .A(current_state[1]), .B(current_state[2]), .C(n49), .Y(
        strt_ck_en) );
  NOR2X2M U13 ( .A(n48), .B(n46), .Y(n32) );
  NAND3X2M U14 ( .A(n50), .B(n48), .C(n39), .Y(enable) );
  AND2X2M U15 ( .A(stop_ck_en), .B(N21), .Y(n29) );
  AOI2BB2XLM U16 ( .B0(n33), .B1(n38), .A0N(N21), .A1N(n39), .Y(n30) );
  OA21X2M U17 ( .A0(N21), .A1(n48), .B0(n30), .Y(n34) );
  INVX2M U18 ( .A(N21), .Y(n46) );
  NOR2X2M U19 ( .A(strt_ck_en), .B(stop_ck_en), .Y(n39) );
  INVX2M U20 ( .A(n38), .Y(n50) );
  INVX2M U21 ( .A(par_ck_en), .Y(n48) );
  AND2X2M U22 ( .A(stop_err), .B(n29), .Y(stop_error) );
  NOR3X2M U23 ( .A(current_state[0]), .B(current_state[1]), .C(n52), .Y(
        stop_ck_en) );
  OAI221X1M U24 ( .A0(RX_IN), .A1(n37), .B0(n34), .B1(n49), .C0(n36), .Y(
        next_state[0]) );
  AOI31X2M U25 ( .A0(n51), .A1(n52), .A2(n49), .B0(n29), .Y(n37) );
  NAND4BXLM U26 ( .AN(bit_cnt[0]), .B(N21), .C(bit_cnt[3]), .D(n40), .Y(n33)
         );
  NOR4X1M U27 ( .A(bit_cnt[5]), .B(bit_cnt[4]), .C(bit_cnt[2]), .D(bit_cnt[1]), 
        .Y(n40) );
  OAI211X2M U28 ( .A0(n30), .A1(n52), .B0(n31), .C0(n45), .Y(next_state[2]) );
  INVX2M U29 ( .A(n32), .Y(n45) );
  OR3X2M U30 ( .A(parity_en), .B(n50), .C(n33), .Y(n31) );
  NAND3BX2M U31 ( .AN(n33), .B(n38), .C(parity_en), .Y(n36) );
  OAI21BX1M U32 ( .A0(n34), .A1(n51), .B0N(n35), .Y(next_state[1]) );
  OAI31X1M U33 ( .A0(n47), .A1(start_glitch), .A2(n46), .B0(n36), .Y(n35) );
  INVX2M U34 ( .A(strt_ck_en), .Y(n47) );
  NOR3X2M U35 ( .A(current_state[0]), .B(current_state[2]), .C(n51), .Y(n38)
         );
  AND2X2M U36 ( .A(N64), .B(n38), .Y(desr_en) );
  AO22X1M U37 ( .A0(n57), .A1(n41), .B0(par_err), .B1(n32), .Y(n42) );
  AOI21X2M U38 ( .A0(n52), .A1(n51), .B0(n32), .Y(n41) );
  NOR3X2M U39 ( .A(n49), .B(current_state[2]), .C(n51), .Y(par_ck_en) );
  ADDHX1M U40 ( .A(prescale[4]), .B(\add_84/carry[3] ), .CO(\add_84/carry[4] ), 
        .S(N61) );
  ADDHX1M U41 ( .A(prescale[3]), .B(\add_84/carry[2] ), .CO(\add_84/carry[3] ), 
        .S(N60) );
  ADDHX1M U42 ( .A(prescale[2]), .B(prescale[1]), .CO(\add_84/carry[2] ), .S(
        N59) );
  INVX2M U43 ( .A(prescale[0]), .Y(N14) );
  INVX2M U44 ( .A(prescale[1]), .Y(N58) );
  ADDHX1M U45 ( .A(prescale[5]), .B(\add_84/carry[4] ), .CO(N63), .S(N62) );
  NAND2BX1M U46 ( .AN(prescale[1]), .B(N14), .Y(n5) );
  OAI2BB1X1M U47 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n5), .Y(N15) );
  OR2X1M U48 ( .A(n5), .B(prescale[2]), .Y(n6) );
  OAI2BB1X1M U49 ( .A0N(n5), .A1N(prescale[2]), .B0(n6), .Y(N16) );
  OR2X1M U50 ( .A(n6), .B(prescale[3]), .Y(n7) );
  OAI2BB1X1M U51 ( .A0N(n6), .A1N(prescale[3]), .B0(n7), .Y(N17) );
  OR2X1M U52 ( .A(n7), .B(prescale[4]), .Y(n8) );
  OAI2BB1X1M U53 ( .A0N(n7), .A1N(prescale[4]), .B0(n8), .Y(N18) );
  NOR2X1M U54 ( .A(n8), .B(prescale[5]), .Y(N20) );
  AO21XLM U55 ( .A0(n8), .A1(prescale[5]), .B0(N20), .Y(N19) );
  NOR2BX1M U56 ( .AN(N14), .B(edge_cnt[0]), .Y(n9) );
  OAI2B2X1M U57 ( .A1N(edge_cnt[1]), .A0(n9), .B0(N15), .B1(n9), .Y(n13) );
  XNOR2X1M U58 ( .A(N19), .B(edge_cnt[5]), .Y(n12) );
  NOR2BX1M U59 ( .AN(edge_cnt[0]), .B(N14), .Y(n10) );
  OAI2B2X1M U60 ( .A1N(N15), .A0(n10), .B0(edge_cnt[1]), .B1(n10), .Y(n11) );
  NAND4BX1M U61 ( .AN(N20), .B(n13), .C(n12), .D(n11), .Y(n21) );
  CLKXOR2X2M U62 ( .A(N18), .B(edge_cnt[4]), .Y(n16) );
  CLKXOR2X2M U63 ( .A(N16), .B(edge_cnt[2]), .Y(n15) );
  CLKXOR2X2M U64 ( .A(N17), .B(edge_cnt[3]), .Y(n14) );
  NOR4X1M U65 ( .A(n21), .B(n16), .C(n15), .D(n14), .Y(N21) );
  NOR2BX1M U66 ( .AN(edge_cnt[0]), .B(N58), .Y(n22) );
  OAI2B2X1M U67 ( .A1N(N59), .A0(n22), .B0(edge_cnt[1]), .B1(n22), .Y(n26) );
  NOR2BX1M U68 ( .AN(N58), .B(edge_cnt[0]), .Y(n23) );
  OAI2B2X1M U69 ( .A1N(edge_cnt[1]), .A0(n23), .B0(N59), .B1(n23), .Y(n25) );
  XNOR2X1M U70 ( .A(N63), .B(edge_cnt[5]), .Y(n24) );
  NAND3X1M U71 ( .A(n26), .B(n25), .C(n24), .Y(n44) );
  CLKXOR2X2M U72 ( .A(N62), .B(edge_cnt[4]), .Y(n43) );
  CLKXOR2X2M U73 ( .A(N60), .B(edge_cnt[2]), .Y(n28) );
  CLKXOR2X2M U74 ( .A(N61), .B(edge_cnt[3]), .Y(n27) );
  NOR4X1M U75 ( .A(n44), .B(n43), .C(n28), .D(n27), .Y(N64) );
  INVXLM U76 ( .A(n56), .Y(n57) );
endmodule


module edge_bit_counter_test_1 ( clk, rst, enable, prescale, par_en, bit_cnt, 
        edge_cnt, test_si, test_so, test_se );
  input [5:0] prescale;
  output [5:0] bit_cnt;
  output [5:0] edge_cnt;
  input clk, rst, enable, par_en, test_si, test_se;
  output test_so;
  wire   N9, N10, N11, N12, N13, N14, N15, N16, N19, N21, N22, N23, N24, N25,
         N26, N33, N34, N35, N36, N37, N38, N52, N53, N54, N55, N56, N57, n20,
         n21, n22, n23, n24, n25, n26, n27, \add_30/carry[5] ,
         \add_30/carry[4] , \add_30/carry[3] , \add_30/carry[2] ,
         \add_26/carry[5] , \add_26/carry[4] , \add_26/carry[3] ,
         \add_26/carry[2] , n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n52, n53, n54, n55, n56, n57, n58,
         n59, n60;

  SDFFRX1M \edge_cnt_reg[5]  ( .D(N57), .SI(n52), .SE(test_se), .CK(clk), .RN(
        rst), .Q(edge_cnt[5]), .QN(test_so) );
  SDFFRX1M \edge_cnt_reg[4]  ( .D(N56), .SI(n53), .SE(test_se), .CK(clk), .RN(
        rst), .Q(edge_cnt[4]), .QN(n52) );
  SDFFRX1M \edge_cnt_reg[3]  ( .D(N55), .SI(n54), .SE(test_se), .CK(clk), .RN(
        rst), .Q(edge_cnt[3]), .QN(n53) );
  SDFFRX1M \edge_cnt_reg[2]  ( .D(N54), .SI(n55), .SE(test_se), .CK(clk), .RN(
        rst), .Q(edge_cnt[2]), .QN(n54) );
  SDFFRX1M \edge_cnt_reg[1]  ( .D(N53), .SI(N33), .SE(test_se), .CK(clk), .RN(
        rst), .Q(edge_cnt[1]), .QN(n55) );
  SDFFRX1M \edge_cnt_reg[0]  ( .D(N52), .SI(n56), .SE(test_se), .CK(clk), .RN(
        rst), .Q(edge_cnt[0]), .QN(N33) );
  SDFFRX1M \bit_cnt_reg[5]  ( .D(n27), .SI(n57), .SE(test_se), .CK(clk), .RN(
        rst), .Q(bit_cnt[5]), .QN(n56) );
  SDFFRX1M \bit_cnt_reg[4]  ( .D(n22), .SI(n58), .SE(test_se), .CK(clk), .RN(
        rst), .Q(bit_cnt[4]), .QN(n57) );
  SDFFRX1M \bit_cnt_reg[3]  ( .D(n23), .SI(n59), .SE(test_se), .CK(clk), .RN(
        rst), .Q(bit_cnt[3]), .QN(n58) );
  SDFFRX1M \bit_cnt_reg[2]  ( .D(n24), .SI(n60), .SE(test_se), .CK(clk), .RN(
        rst), .Q(bit_cnt[2]), .QN(n59) );
  SDFFRX1M \bit_cnt_reg[1]  ( .D(n25), .SI(N21), .SE(test_se), .CK(clk), .RN(
        rst), .Q(bit_cnt[1]), .QN(n60) );
  SDFFRX1M \bit_cnt_reg[0]  ( .D(n26), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(bit_cnt[0]), .QN(N21) );
  AND2X2M U27 ( .A(N34), .B(n20), .Y(N53) );
  AND2X2M U28 ( .A(N35), .B(n20), .Y(N54) );
  AND2X2M U29 ( .A(N36), .B(n20), .Y(N55) );
  AND2X2M U30 ( .A(N37), .B(n20), .Y(N56) );
  NOR3BX2M U31 ( .AN(enable), .B(N19), .C(n20), .Y(n21) );
  NOR2BX2M U32 ( .AN(enable), .B(N16), .Y(n20) );
  AO22X1M U33 ( .A0(bit_cnt[4]), .A1(n20), .B0(N25), .B1(n21), .Y(n22) );
  AO22X1M U34 ( .A0(bit_cnt[3]), .A1(n20), .B0(N24), .B1(n21), .Y(n23) );
  AO22X1M U35 ( .A0(bit_cnt[2]), .A1(n20), .B0(N23), .B1(n21), .Y(n24) );
  AO22X1M U36 ( .A0(bit_cnt[1]), .A1(n20), .B0(N22), .B1(n21), .Y(n25) );
  AO22X1M U37 ( .A0(bit_cnt[0]), .A1(n20), .B0(N21), .B1(n21), .Y(n26) );
  AO22X1M U38 ( .A0(bit_cnt[5]), .A1(n20), .B0(N26), .B1(n21), .Y(n27) );
  AND2X2M U39 ( .A(N38), .B(n20), .Y(N57) );
  AND2X2M U40 ( .A(N33), .B(n20), .Y(N52) );
  ADDHX1M U41 ( .A(bit_cnt[2]), .B(\add_26/carry[2] ), .CO(\add_26/carry[3] ), 
        .S(N23) );
  ADDHX1M U42 ( .A(bit_cnt[1]), .B(bit_cnt[0]), .CO(\add_26/carry[2] ), .S(N22) );
  ADDHX1M U43 ( .A(bit_cnt[3]), .B(\add_26/carry[3] ), .CO(\add_26/carry[4] ), 
        .S(N24) );
  ADDHX1M U44 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .CO(\add_30/carry[2] ), .S(
        N34) );
  ADDHX1M U45 ( .A(edge_cnt[2]), .B(\add_30/carry[2] ), .CO(\add_30/carry[3] ), 
        .S(N35) );
  ADDHX1M U46 ( .A(edge_cnt[3]), .B(\add_30/carry[3] ), .CO(\add_30/carry[4] ), 
        .S(N36) );
  ADDHX1M U47 ( .A(bit_cnt[4]), .B(\add_26/carry[4] ), .CO(\add_26/carry[5] ), 
        .S(N25) );
  ADDHX1M U48 ( .A(edge_cnt[4]), .B(\add_30/carry[4] ), .CO(\add_30/carry[5] ), 
        .S(N37) );
  INVX2M U49 ( .A(prescale[0]), .Y(N9) );
  NAND2BX1M U50 ( .AN(prescale[1]), .B(N9), .Y(n33) );
  OAI2BB1X1M U51 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n33), .Y(N10) );
  OR2X1M U52 ( .A(n33), .B(prescale[2]), .Y(n34) );
  OAI2BB1X1M U53 ( .A0N(n33), .A1N(prescale[2]), .B0(n34), .Y(N11) );
  OR2X1M U54 ( .A(n34), .B(prescale[3]), .Y(n35) );
  OAI2BB1X1M U55 ( .A0N(n34), .A1N(prescale[3]), .B0(n35), .Y(N12) );
  OR2X1M U56 ( .A(n35), .B(prescale[4]), .Y(n36) );
  OAI2BB1X1M U57 ( .A0N(n35), .A1N(prescale[4]), .B0(n36), .Y(N13) );
  NOR2X1M U58 ( .A(n36), .B(prescale[5]), .Y(N15) );
  AO21XLM U59 ( .A0(n36), .A1(prescale[5]), .B0(N15), .Y(N14) );
  CLKXOR2X2M U60 ( .A(\add_26/carry[5] ), .B(bit_cnt[5]), .Y(N26) );
  CLKXOR2X2M U61 ( .A(\add_30/carry[5] ), .B(edge_cnt[5]), .Y(N38) );
  NOR2BX1M U62 ( .AN(N9), .B(edge_cnt[0]), .Y(n37) );
  OAI2B2X1M U63 ( .A1N(edge_cnt[1]), .A0(n37), .B0(N10), .B1(n37), .Y(n41) );
  XNOR2X1M U64 ( .A(N14), .B(edge_cnt[5]), .Y(n40) );
  NOR2BX1M U65 ( .AN(edge_cnt[0]), .B(N9), .Y(n38) );
  OAI2B2X1M U66 ( .A1N(N10), .A0(n38), .B0(edge_cnt[1]), .B1(n38), .Y(n39) );
  NAND4BX1M U67 ( .AN(N15), .B(n41), .C(n40), .D(n39), .Y(n45) );
  CLKXOR2X2M U68 ( .A(N13), .B(edge_cnt[4]), .Y(n44) );
  CLKXOR2X2M U69 ( .A(N11), .B(edge_cnt[2]), .Y(n43) );
  CLKXOR2X2M U70 ( .A(N12), .B(edge_cnt[3]), .Y(n42) );
  NOR4X1M U71 ( .A(n45), .B(n44), .C(n43), .D(n42), .Y(N16) );
  NAND2BX1M U72 ( .AN(bit_cnt[1]), .B(bit_cnt[0]), .Y(n47) );
  NAND2BX1M U73 ( .AN(bit_cnt[0]), .B(bit_cnt[1]), .Y(n46) );
  MXI2X1M U74 ( .A(n47), .B(n46), .S0(par_en), .Y(n48) );
  CLKNAND2X2M U75 ( .A(n48), .B(bit_cnt[3]), .Y(n49) );
  NOR4X1M U76 ( .A(n49), .B(bit_cnt[2]), .C(bit_cnt[5]), .D(bit_cnt[4]), .Y(
        N19) );
endmodule


module Data_Sampling_test_1 ( clk, rst, RX_IN, Prescale, data_sample_en, 
        edge_cnt, Sampled_bit, test_si, test_so, test_se );
  input [5:0] Prescale;
  input [5:0] edge_cnt;
  input clk, rst, RX_IN, data_sample_en, test_si, test_se;
  output Sampled_bit, test_so;
  wire   N5, n4, n5, n2, n6, n7, n8, n9, n10, n11, n12;

  SDFFRX1M Sampled_bit_reg ( .D(n5), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(Sampled_bit), .QN(test_so) );
  AO2B2X2M U4 ( .B0(Sampled_bit), .B1(n4), .A0(RX_IN), .A1N(n4), .Y(n5) );
  NAND2X2M U5 ( .A(data_sample_en), .B(N5), .Y(n4) );
  NOR2BX1M U6 ( .AN(edge_cnt[0]), .B(Prescale[1]), .Y(n2) );
  OAI2B2X1M U7 ( .A1N(Prescale[2]), .A0(n2), .B0(edge_cnt[1]), .B1(n2), .Y(n8)
         );
  NOR2BX1M U8 ( .AN(Prescale[1]), .B(edge_cnt[0]), .Y(n6) );
  OAI2B2X1M U9 ( .A1N(edge_cnt[1]), .A0(n6), .B0(Prescale[2]), .B1(n6), .Y(n7)
         );
  NAND3BX1M U10 ( .AN(edge_cnt[5]), .B(n8), .C(n7), .Y(n12) );
  CLKXOR2X2M U11 ( .A(Prescale[5]), .B(edge_cnt[4]), .Y(n11) );
  CLKXOR2X2M U12 ( .A(Prescale[3]), .B(edge_cnt[2]), .Y(n10) );
  CLKXOR2X2M U13 ( .A(Prescale[4]), .B(edge_cnt[3]), .Y(n9) );
  NOR4X1M U14 ( .A(n12), .B(n11), .C(n10), .D(n9), .Y(N5) );
endmodule


module deserializer_test_1 ( clk, rst, sampled_bit, deser_en, p_data, test_si, 
        test_se );
  output [7:0] p_data;
  input clk, rst, sampled_bit, deser_en, test_si, test_se;
  wire   n10, n12, n14, n16, n18, n20, n22, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n34;

  SDFFRX1M \p_data_reg[7]  ( .D(n24), .SI(p_data[6]), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(p_data[7]), .QN(n25) );
  SDFFRX1M \p_data_reg[6]  ( .D(n22), .SI(p_data[5]), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(p_data[6]), .QN(n26) );
  SDFFRX1M \p_data_reg[5]  ( .D(n20), .SI(p_data[4]), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(p_data[5]), .QN(n27) );
  SDFFRX1M \p_data_reg[4]  ( .D(n18), .SI(p_data[3]), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(p_data[4]), .QN(n28) );
  SDFFRX1M \p_data_reg[3]  ( .D(n16), .SI(p_data[2]), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(p_data[3]), .QN(n29) );
  SDFFRX1M \p_data_reg[2]  ( .D(n14), .SI(p_data[1]), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(p_data[2]), .QN(n30) );
  SDFFRX1M \p_data_reg[1]  ( .D(n12), .SI(n34), .SE(test_se), .CK(clk), .RN(
        rst), .Q(p_data[1]), .QN(n31) );
  SDFFRX1M \p_data_reg[0]  ( .D(n10), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(p_data[0]), .QN(n34) );
  INVX2M U10 ( .A(deser_en), .Y(n32) );
  OAI22X1M U11 ( .A0(n32), .A1(n30), .B0(deser_en), .B1(n31), .Y(n12) );
  OAI22X1M U12 ( .A0(n32), .A1(n29), .B0(deser_en), .B1(n30), .Y(n14) );
  OAI22X1M U13 ( .A0(n32), .A1(n28), .B0(deser_en), .B1(n29), .Y(n16) );
  OAI22X1M U14 ( .A0(n32), .A1(n27), .B0(deser_en), .B1(n28), .Y(n18) );
  OAI22X1M U15 ( .A0(n32), .A1(n26), .B0(deser_en), .B1(n27), .Y(n20) );
  OAI22X1M U16 ( .A0(n32), .A1(n25), .B0(deser_en), .B1(n26), .Y(n22) );
  OAI2BB2X1M U17 ( .B0(n32), .B1(n31), .A0N(p_data[0]), .A1N(n32), .Y(n10) );
  OAI2BB2X1M U26 ( .B0(deser_en), .B1(n25), .A0N(sampled_bit), .A1N(deser_en), 
        .Y(n24) );
endmodule


module start_check ( strt_check_en, Sampled_bit, strt_glitch );
  input strt_check_en, Sampled_bit;
  output strt_glitch;


  AND2X2M U2 ( .A(strt_check_en), .B(Sampled_bit), .Y(strt_glitch) );
endmodule


module parity_check_test_1 ( clk, rst, Sampled_bit, data_en, clr, 
        parity_check_en, parity_typ, par_err, test_si, test_so, test_se );
  input clk, rst, Sampled_bit, data_en, clr, parity_check_en, parity_typ,
         test_si, test_se;
  output par_err, test_so;
  wire   data_parity, n2, n3, n4, n5;

  SDFFRX1M data_parity_reg ( .D(n5), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(data_parity), .QN(test_so) );
  NOR2X2M U5 ( .A(clr), .B(n3), .Y(n5) );
  CLKXOR2X2M U6 ( .A(n4), .B(data_parity), .Y(n3) );
  NAND2X2M U7 ( .A(data_en), .B(Sampled_bit), .Y(n4) );
  NOR2BX2M U8 ( .AN(parity_check_en), .B(n2), .Y(par_err) );
  XNOR3X2M U9 ( .A(parity_typ), .B(data_parity), .C(Sampled_bit), .Y(n2) );
endmodule


module Stop_check ( stop_check_en, Sampled_bit, stop_err );
  input stop_check_en, Sampled_bit;
  output stop_err;


  NOR2BX2M U2 ( .AN(stop_check_en), .B(Sampled_bit), .Y(stop_err) );
endmodule


module Top_test_1 ( clk, rst, RX_IN, Prescale, parity_en, parity_typ, p_data, 
        data_valid_top, stop_error, parity_error, test_si2, test_si1, test_so1, 
        test_se );
  input [5:0] Prescale;
  output [7:0] p_data;
  input clk, rst, RX_IN, parity_en, parity_typ, test_si2, test_si1, test_se;
  output data_valid_top, stop_error, parity_error, test_so1;
  wire   par_err, start_glitch, stop_err, enable, data_sam_en, strt_ck_en,
         stop_ck_en, desr_en, par_ck_en, Sampled_bit, n1, n2, n5, n6, n7;
  wire   [5:0] bit_cnt;
  wire   [5:0] edge_cnt;
  assign data_valid_top = 1'b0;

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(rst), .Y(n2) );
  fsm_test_1 u_fsm ( .clk(clk), .rst(n1), .RX_IN(RX_IN), .parity_en(parity_en), 
        .par_err(par_err), .start_glitch(start_glitch), .stop_err(stop_err), 
        .bit_cnt(bit_cnt), .edge_cnt(edge_cnt), .prescale(Prescale), .enable(
        enable), .data_sam_en(data_sam_en), .strt_ck_en(strt_ck_en), 
        .stop_ck_en(stop_ck_en), .desr_en(desr_en), .par_ck_en(par_ck_en), 
        .stop_error(stop_error), .parity_error(parity_error), .test_si2(
        test_si2), .test_si1(n6), .test_so1(n5), .test_se(test_se) );
  edge_bit_counter_test_1 u_edge_bit_counter ( .clk(clk), .rst(n1), .enable(
        enable), .prescale(Prescale), .par_en(parity_en), .bit_cnt(bit_cnt), 
        .edge_cnt(edge_cnt), .test_si(p_data[7]), .test_so(n6), .test_se(
        test_se) );
  Data_Sampling_test_1 u_data_sampling ( .clk(clk), .rst(n1), .RX_IN(RX_IN), 
        .Prescale(Prescale), .data_sample_en(data_sam_en), .edge_cnt(edge_cnt), 
        .Sampled_bit(Sampled_bit), .test_si(test_si1), .test_so(n7), .test_se(
        test_se) );
  deserializer_test_1 u_deserializer ( .clk(clk), .rst(n1), .sampled_bit(
        Sampled_bit), .deser_en(desr_en), .p_data(p_data), .test_si(n7), 
        .test_se(test_se) );
  start_check u_start_check ( .strt_check_en(strt_ck_en), .Sampled_bit(
        Sampled_bit), .strt_glitch(start_glitch) );
  parity_check_test_1 u_par ( .clk(clk), .rst(n1), .Sampled_bit(Sampled_bit), 
        .data_en(desr_en), .clr(strt_ck_en), .parity_check_en(par_ck_en), 
        .parity_typ(parity_typ), .par_err(par_err), .test_si(n5), .test_so(
        test_so1), .test_se(test_se) );
  Stop_check u_stop_check ( .stop_check_en(stop_ck_en), .Sampled_bit(
        Sampled_bit), .stop_err(stop_err) );
endmodule


module data_sync_n8_test_1 ( Unsync_bus, bus_en, clk, rst, enable_pulse, 
        sync_bus, test_si, test_se );
  input [7:0] Unsync_bus;
  output [7:0] sync_bus;
  input bus_en, clk, rst, test_si, test_se;
  output enable_pulse;
  wire   hold, n1, n3, n5, n7, n9, n11, n13, n15, n17, n25;
  wire   [4:0] multi_FF;

  SDFFRQX2M hold_reg ( .D(multi_FF[4]), .SI(enable_pulse), .SE(test_se), .CK(
        clk), .RN(rst), .Q(hold) );
  SDFFRQX2M \multi_FF_reg[4]  ( .D(multi_FF[3]), .SI(multi_FF[3]), .SE(test_se), .CK(clk), .RN(rst), .Q(multi_FF[4]) );
  SDFFRQX2M \sync_bus_reg[7]  ( .D(n17), .SI(sync_bus[6]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sync_bus[7]) );
  SDFFRQX2M \sync_bus_reg[5]  ( .D(n13), .SI(sync_bus[4]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sync_bus[5]) );
  SDFFRQX2M \sync_bus_reg[6]  ( .D(n15), .SI(sync_bus[5]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sync_bus[6]) );
  SDFFRQX2M \sync_bus_reg[1]  ( .D(n5), .SI(sync_bus[0]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sync_bus[1]) );
  SDFFRQX2M \sync_bus_reg[3]  ( .D(n9), .SI(sync_bus[2]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sync_bus[3]) );
  SDFFRQX2M \sync_bus_reg[2]  ( .D(n7), .SI(sync_bus[1]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sync_bus[2]) );
  SDFFRQX2M \sync_bus_reg[4]  ( .D(n11), .SI(sync_bus[3]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sync_bus[4]) );
  SDFFRQX2M \sync_bus_reg[0]  ( .D(n3), .SI(multi_FF[4]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sync_bus[0]) );
  SDFFRQX2M enable_pulse_reg ( .D(n25), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(enable_pulse) );
  SDFFRQX2M \multi_FF_reg[0]  ( .D(bus_en), .SI(hold), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(multi_FF[0]) );
  SDFFRQX2M \multi_FF_reg[1]  ( .D(multi_FF[0]), .SI(multi_FF[0]), .SE(test_se), .CK(clk), .RN(rst), .Q(multi_FF[1]) );
  SDFFRQX2M \multi_FF_reg[2]  ( .D(multi_FF[1]), .SI(multi_FF[1]), .SE(test_se), .CK(clk), .RN(rst), .Q(multi_FF[2]) );
  SDFFRQX2M \multi_FF_reg[3]  ( .D(multi_FF[2]), .SI(multi_FF[2]), .SE(test_se), .CK(clk), .RN(rst), .Q(multi_FF[3]) );
  INVX2M U3 ( .A(n1), .Y(n25) );
  NAND2BX2M U4 ( .AN(hold), .B(multi_FF[4]), .Y(n1) );
  AO22X1M U5 ( .A0(Unsync_bus[0]), .A1(n25), .B0(sync_bus[0]), .B1(n1), .Y(n3)
         );
  AO22X1M U6 ( .A0(Unsync_bus[1]), .A1(n25), .B0(sync_bus[1]), .B1(n1), .Y(n5)
         );
  AO22X1M U7 ( .A0(Unsync_bus[2]), .A1(n25), .B0(sync_bus[2]), .B1(n1), .Y(n7)
         );
  AO22X1M U8 ( .A0(Unsync_bus[3]), .A1(n25), .B0(sync_bus[3]), .B1(n1), .Y(n9)
         );
  AO22X1M U9 ( .A0(Unsync_bus[4]), .A1(n25), .B0(sync_bus[4]), .B1(n1), .Y(n11) );
  AO22X1M U10 ( .A0(Unsync_bus[5]), .A1(n25), .B0(sync_bus[5]), .B1(n1), .Y(
        n13) );
  AO22X1M U11 ( .A0(Unsync_bus[6]), .A1(n25), .B0(sync_bus[6]), .B1(n1), .Y(
        n15) );
  AO22X1M U12 ( .A0(Unsync_bus[7]), .A1(n25), .B0(sync_bus[7]), .B1(n1), .Y(
        n17) );
endmodule


module FIFO_WR_test_1 ( wclk, wrst_n, winc, wq2_rptr, wfull, waddr, wptr, 
        test_si, test_se );
  input [4:0] wq2_rptr;
  output [3:0] waddr;
  output [4:0] wptr;
  input wclk, wrst_n, winc, test_si, test_se;
  output wfull;
  wire   N0, full_ck, \eq_20/B[4] , \add_16/carry[4] , \add_16/carry[3] ,
         \add_16/carry[2] , \add_16/carry[1] , n16, n17, n18, n19, n20, n21,
         n22, n23;
  wire   [4:0] wbin;
  wire   [4:0] wbin_next;
  wire   [3:0] ptr_cal;

  SDFFRQX2M \wbin_reg[4]  ( .D(wbin_next[4]), .SI(wbin[3]), .SE(test_se), .CK(
        wclk), .RN(wrst_n), .Q(wbin[4]) );
  SDFFRQX2M \waddr_reg[3]  ( .D(wbin_next[3]), .SI(waddr[2]), .SE(test_se), 
        .CK(wclk), .RN(wrst_n), .Q(waddr[3]) );
  SDFFRQX2M \waddr_reg[0]  ( .D(wbin_next[0]), .SI(test_si), .SE(test_se), 
        .CK(wclk), .RN(wrst_n), .Q(waddr[0]) );
  SDFFRQX2M \waddr_reg[1]  ( .D(wbin_next[1]), .SI(waddr[0]), .SE(test_se), 
        .CK(wclk), .RN(wrst_n), .Q(waddr[1]) );
  SDFFRQX2M \waddr_reg[2]  ( .D(wbin_next[2]), .SI(waddr[1]), .SE(test_se), 
        .CK(wclk), .RN(wrst_n), .Q(waddr[2]) );
  SDFFRQX2M \wbin_reg[0]  ( .D(wbin_next[0]), .SI(waddr[3]), .SE(test_se), 
        .CK(wclk), .RN(wrst_n), .Q(wbin[0]) );
  SDFFRQX2M \wbin_reg[1]  ( .D(wbin_next[1]), .SI(wbin[0]), .SE(test_se), .CK(
        wclk), .RN(wrst_n), .Q(wbin[1]) );
  SDFFRQX2M \wbin_reg[2]  ( .D(wbin_next[2]), .SI(wbin[1]), .SE(test_se), .CK(
        wclk), .RN(wrst_n), .Q(wbin[2]) );
  SDFFRQX2M \wbin_reg[3]  ( .D(wbin_next[3]), .SI(wbin[2]), .SE(test_se), .CK(
        wclk), .RN(wrst_n), .Q(wbin[3]) );
  SDFFRQX2M wfull_reg ( .D(full_ck), .SI(wbin[4]), .SE(test_se), .CK(wclk), 
        .RN(wrst_n), .Q(wfull) );
  SDFFRQX2M \wptr_reg[4]  ( .D(wbin_next[4]), .SI(wptr[3]), .SE(test_se), .CK(
        wclk), .RN(wrst_n), .Q(wptr[4]) );
  SDFFRQX2M \wptr_reg[0]  ( .D(ptr_cal[0]), .SI(wfull), .SE(test_se), .CK(wclk), .RN(wrst_n), .Q(wptr[0]) );
  SDFFRQX2M \wptr_reg[1]  ( .D(ptr_cal[1]), .SI(wptr[0]), .SE(test_se), .CK(
        wclk), .RN(wrst_n), .Q(wptr[1]) );
  SDFFRQX2M \wptr_reg[2]  ( .D(ptr_cal[2]), .SI(wptr[1]), .SE(test_se), .CK(
        wclk), .RN(wrst_n), .Q(wptr[2]) );
  SDFFRQX2M \wptr_reg[3]  ( .D(ptr_cal[3]), .SI(wptr[2]), .SE(test_se), .CK(
        wclk), .RN(wrst_n), .Q(wptr[3]) );
  CLKXOR2X2M U18 ( .A(wbin_next[2]), .B(wbin_next[1]), .Y(ptr_cal[1]) );
  CLKXOR2X2M U19 ( .A(wbin_next[4]), .B(wbin_next[3]), .Y(ptr_cal[3]) );
  CLKXOR2X2M U20 ( .A(wbin_next[3]), .B(wbin_next[2]), .Y(ptr_cal[2]) );
  CLKXOR2X2M U21 ( .A(wbin_next[1]), .B(wbin_next[0]), .Y(ptr_cal[0]) );
  NOR2BX2M U22 ( .AN(winc), .B(wfull), .Y(N0) );
  XNOR2X2M U23 ( .A(wq2_rptr[3]), .B(ptr_cal[3]), .Y(n21) );
  INVX2M U24 ( .A(wq2_rptr[4]), .Y(\eq_20/B[4] ) );
  CLKXOR2X2M U25 ( .A(wbin[4]), .B(\add_16/carry[4] ), .Y(wbin_next[4]) );
  AND2X1M U26 ( .A(wbin[3]), .B(\add_16/carry[3] ), .Y(\add_16/carry[4] ) );
  CLKXOR2X2M U27 ( .A(wbin[3]), .B(\add_16/carry[3] ), .Y(wbin_next[3]) );
  AND2X1M U28 ( .A(wbin[2]), .B(\add_16/carry[2] ), .Y(\add_16/carry[3] ) );
  CLKXOR2X2M U29 ( .A(wbin[2]), .B(\add_16/carry[2] ), .Y(wbin_next[2]) );
  AND2X1M U30 ( .A(wbin[1]), .B(\add_16/carry[1] ), .Y(\add_16/carry[2] ) );
  CLKXOR2X2M U31 ( .A(wbin[1]), .B(\add_16/carry[1] ), .Y(wbin_next[1]) );
  AND2X1M U32 ( .A(N0), .B(wbin[0]), .Y(\add_16/carry[1] ) );
  CLKXOR2X2M U33 ( .A(N0), .B(wbin[0]), .Y(wbin_next[0]) );
  CLKXOR2X2M U34 ( .A(wq2_rptr[2]), .B(ptr_cal[2]), .Y(n23) );
  NOR2BX1M U35 ( .AN(wq2_rptr[0]), .B(ptr_cal[0]), .Y(n16) );
  OAI2B2X1M U36 ( .A1N(ptr_cal[1]), .A0(n16), .B0(wq2_rptr[1]), .B1(n16), .Y(
        n19) );
  NOR2BX1M U37 ( .AN(ptr_cal[0]), .B(wq2_rptr[0]), .Y(n17) );
  OAI2B2X1M U38 ( .A1N(wq2_rptr[1]), .A0(n17), .B0(ptr_cal[1]), .B1(n17), .Y(
        n18) );
  CLKNAND2X2M U39 ( .A(n19), .B(n18), .Y(n22) );
  CLKXOR2X2M U40 ( .A(\eq_20/B[4] ), .B(wbin_next[4]), .Y(n20) );
  NOR4X1M U41 ( .A(n23), .B(n22), .C(n21), .D(n20), .Y(full_ck) );
endmodule


module FIFO_RD_test_1 ( rclk, rrst_n, rinc, rq2_wptr, rempty, raddr, rptr, 
        test_si, test_se );
  input [4:0] rq2_wptr;
  output [3:0] raddr;
  output [4:0] rptr;
  input rclk, rrst_n, rinc, test_si, test_se;
  output rempty;
  wire   N0, empty_ck, \add_16/carry[4] , \add_16/carry[3] , \add_16/carry[2] ,
         \add_16/carry[1] , n16, n17, n18, n19, n20, n21, n22, n23, n24;
  wire   [4:0] rbin;
  wire   [4:0] rbin_next;
  wire   [3:0] ptr_cal;

  SDFFRQX2M \rbin_reg[0]  ( .D(rbin_next[0]), .SI(raddr[3]), .SE(test_se), 
        .CK(rclk), .RN(rrst_n), .Q(rbin[0]) );
  SDFFRQX2M \rbin_reg[4]  ( .D(rbin_next[4]), .SI(rbin[3]), .SE(test_se), .CK(
        rclk), .RN(n16), .Q(rbin[4]) );
  SDFFRQX2M \rbin_reg[1]  ( .D(rbin_next[1]), .SI(rbin[0]), .SE(test_se), .CK(
        rclk), .RN(n16), .Q(rbin[1]) );
  SDFFRQX2M \rbin_reg[2]  ( .D(rbin_next[2]), .SI(rbin[1]), .SE(test_se), .CK(
        rclk), .RN(n16), .Q(rbin[2]) );
  SDFFRQX2M \rbin_reg[3]  ( .D(rbin_next[3]), .SI(rbin[2]), .SE(test_se), .CK(
        rclk), .RN(n16), .Q(rbin[3]) );
  SDFFRQX2M \raddr_reg[3]  ( .D(rbin_next[3]), .SI(raddr[2]), .SE(test_se), 
        .CK(rclk), .RN(n16), .Q(raddr[3]) );
  SDFFRQX2M \raddr_reg[2]  ( .D(rbin_next[2]), .SI(raddr[1]), .SE(test_se), 
        .CK(rclk), .RN(n16), .Q(raddr[2]) );
  SDFFSQX2M rempty_reg ( .D(empty_ck), .SI(rbin[4]), .SE(test_se), .CK(rclk), 
        .SN(n16), .Q(rempty) );
  SDFFRQX2M \raddr_reg[1]  ( .D(rbin_next[1]), .SI(raddr[0]), .SE(test_se), 
        .CK(rclk), .RN(n16), .Q(raddr[1]) );
  SDFFRQX2M \raddr_reg[0]  ( .D(rbin_next[0]), .SI(test_si), .SE(test_se), 
        .CK(rclk), .RN(n16), .Q(raddr[0]) );
  SDFFRQX2M \rptr_reg[4]  ( .D(rbin_next[4]), .SI(rptr[3]), .SE(test_se), .CK(
        rclk), .RN(n16), .Q(rptr[4]) );
  SDFFRQX2M \rptr_reg[0]  ( .D(ptr_cal[0]), .SI(rempty), .SE(test_se), .CK(
        rclk), .RN(n16), .Q(rptr[0]) );
  SDFFRQX2M \rptr_reg[1]  ( .D(ptr_cal[1]), .SI(rptr[0]), .SE(test_se), .CK(
        rclk), .RN(n16), .Q(rptr[1]) );
  SDFFRQX2M \rptr_reg[2]  ( .D(ptr_cal[2]), .SI(rptr[1]), .SE(test_se), .CK(
        rclk), .RN(n16), .Q(rptr[2]) );
  SDFFRQX2M \rptr_reg[3]  ( .D(ptr_cal[3]), .SI(rptr[2]), .SE(test_se), .CK(
        rclk), .RN(n16), .Q(rptr[3]) );
  BUFX2M U18 ( .A(rrst_n), .Y(n16) );
  CLKXOR2X2M U19 ( .A(rbin_next[2]), .B(rbin_next[1]), .Y(ptr_cal[1]) );
  CLKXOR2X2M U20 ( .A(rbin_next[4]), .B(rbin_next[3]), .Y(ptr_cal[3]) );
  CLKXOR2X2M U21 ( .A(rbin_next[3]), .B(rbin_next[2]), .Y(ptr_cal[2]) );
  CLKXOR2X2M U22 ( .A(rbin_next[1]), .B(rbin_next[0]), .Y(ptr_cal[0]) );
  NOR2BX2M U23 ( .AN(rinc), .B(rempty), .Y(N0) );
  CLKXOR2X2M U24 ( .A(rbin[4]), .B(\add_16/carry[4] ), .Y(rbin_next[4]) );
  AND2X1M U25 ( .A(rbin[3]), .B(\add_16/carry[3] ), .Y(\add_16/carry[4] ) );
  CLKXOR2X2M U26 ( .A(rbin[3]), .B(\add_16/carry[3] ), .Y(rbin_next[3]) );
  AND2X1M U27 ( .A(rbin[2]), .B(\add_16/carry[2] ), .Y(\add_16/carry[3] ) );
  CLKXOR2X2M U28 ( .A(rbin[2]), .B(\add_16/carry[2] ), .Y(rbin_next[2]) );
  AND2X1M U29 ( .A(rbin[1]), .B(\add_16/carry[1] ), .Y(\add_16/carry[2] ) );
  CLKXOR2X2M U30 ( .A(rbin[1]), .B(\add_16/carry[1] ), .Y(rbin_next[1]) );
  AND2X1M U31 ( .A(N0), .B(rbin[0]), .Y(\add_16/carry[1] ) );
  CLKXOR2X2M U32 ( .A(N0), .B(rbin[0]), .Y(rbin_next[0]) );
  CLKXOR2X2M U33 ( .A(rq2_wptr[2]), .B(ptr_cal[2]), .Y(n24) );
  NOR2BX1M U34 ( .AN(rq2_wptr[0]), .B(ptr_cal[0]), .Y(n17) );
  OAI2B2X1M U35 ( .A1N(ptr_cal[1]), .A0(n17), .B0(rq2_wptr[1]), .B1(n17), .Y(
        n20) );
  NOR2BX1M U36 ( .AN(ptr_cal[0]), .B(rq2_wptr[0]), .Y(n18) );
  OAI2B2X1M U37 ( .A1N(rq2_wptr[1]), .A0(n18), .B0(ptr_cal[1]), .B1(n18), .Y(
        n19) );
  CLKNAND2X2M U38 ( .A(n20), .B(n19), .Y(n23) );
  CLKXOR2X2M U39 ( .A(rq2_wptr[3]), .B(ptr_cal[3]), .Y(n22) );
  CLKXOR2X2M U40 ( .A(rq2_wptr[4]), .B(rbin_next[4]), .Y(n21) );
  NOR4X1M U41 ( .A(n24), .B(n23), .C(n22), .D(n21), .Y(empty_ck) );
endmodule


module DF_SYNC_test_0 ( ptr_in, clk, rst_n, ptr_out, test_si, test_se );
  input [4:0] ptr_in;
  output [4:0] ptr_out;
  input clk, rst_n, test_si, test_se;
  wire   \FF[0][4] , \FF[0][3] , \FF[0][2] , \FF[0][1] , \FF[0][0] ;

  SDFFRQX2M \FF_reg[1][0]  ( .D(\FF[0][0] ), .SI(\FF[0][4] ), .SE(test_se), 
        .CK(clk), .RN(rst_n), .Q(ptr_out[0]) );
  SDFFRQX2M \FF_reg[1][1]  ( .D(\FF[0][1] ), .SI(ptr_out[0]), .SE(test_se), 
        .CK(clk), .RN(rst_n), .Q(ptr_out[1]) );
  SDFFRQX2M \FF_reg[1][2]  ( .D(\FF[0][2] ), .SI(ptr_out[1]), .SE(test_se), 
        .CK(clk), .RN(rst_n), .Q(ptr_out[2]) );
  SDFFRQX2M \FF_reg[1][4]  ( .D(\FF[0][4] ), .SI(ptr_out[3]), .SE(test_se), 
        .CK(clk), .RN(rst_n), .Q(ptr_out[4]) );
  SDFFRQX2M \FF_reg[1][3]  ( .D(\FF[0][3] ), .SI(ptr_out[2]), .SE(test_se), 
        .CK(clk), .RN(rst_n), .Q(ptr_out[3]) );
  SDFFRQX2M \FF_reg[0][4]  ( .D(ptr_in[4]), .SI(\FF[0][3] ), .SE(test_se), 
        .CK(clk), .RN(rst_n), .Q(\FF[0][4] ) );
  SDFFRQX2M \FF_reg[0][3]  ( .D(ptr_in[3]), .SI(\FF[0][2] ), .SE(test_se), 
        .CK(clk), .RN(rst_n), .Q(\FF[0][3] ) );
  SDFFRQX2M \FF_reg[0][2]  ( .D(ptr_in[2]), .SI(\FF[0][1] ), .SE(test_se), 
        .CK(clk), .RN(rst_n), .Q(\FF[0][2] ) );
  SDFFRQX2M \FF_reg[0][1]  ( .D(ptr_in[1]), .SI(\FF[0][0] ), .SE(test_se), 
        .CK(clk), .RN(rst_n), .Q(\FF[0][1] ) );
  SDFFRQX2M \FF_reg[0][0]  ( .D(ptr_in[0]), .SI(test_si), .SE(test_se), .CK(
        clk), .RN(rst_n), .Q(\FF[0][0] ) );
endmodule


module DF_SYNC_test_1 ( ptr_in, clk, rst_n, ptr_out, test_si, test_se );
  input [4:0] ptr_in;
  output [4:0] ptr_out;
  input clk, rst_n, test_si, test_se;
  wire   \FF[0][4] , \FF[0][3] , \FF[0][2] , \FF[0][1] , \FF[0][0] ;

  SDFFRQX2M \FF_reg[1][0]  ( .D(\FF[0][0] ), .SI(\FF[0][4] ), .SE(test_se), 
        .CK(clk), .RN(rst_n), .Q(ptr_out[0]) );
  SDFFRQX2M \FF_reg[1][1]  ( .D(\FF[0][1] ), .SI(ptr_out[0]), .SE(test_se), 
        .CK(clk), .RN(rst_n), .Q(ptr_out[1]) );
  SDFFRQX2M \FF_reg[1][4]  ( .D(\FF[0][4] ), .SI(ptr_out[3]), .SE(test_se), 
        .CK(clk), .RN(rst_n), .Q(ptr_out[4]) );
  SDFFRQX2M \FF_reg[1][3]  ( .D(\FF[0][3] ), .SI(ptr_out[2]), .SE(test_se), 
        .CK(clk), .RN(rst_n), .Q(ptr_out[3]) );
  SDFFRQX2M \FF_reg[1][2]  ( .D(\FF[0][2] ), .SI(ptr_out[1]), .SE(test_se), 
        .CK(clk), .RN(rst_n), .Q(ptr_out[2]) );
  SDFFRQX2M \FF_reg[0][4]  ( .D(ptr_in[4]), .SI(\FF[0][3] ), .SE(test_se), 
        .CK(clk), .RN(rst_n), .Q(\FF[0][4] ) );
  SDFFRQX2M \FF_reg[0][3]  ( .D(ptr_in[3]), .SI(\FF[0][2] ), .SE(test_se), 
        .CK(clk), .RN(rst_n), .Q(\FF[0][3] ) );
  SDFFRQX2M \FF_reg[0][2]  ( .D(ptr_in[2]), .SI(\FF[0][1] ), .SE(test_se), 
        .CK(clk), .RN(rst_n), .Q(\FF[0][2] ) );
  SDFFRQX2M \FF_reg[0][1]  ( .D(ptr_in[1]), .SI(\FF[0][0] ), .SE(test_se), 
        .CK(clk), .RN(rst_n), .Q(\FF[0][1] ) );
  SDFFRQX2M \FF_reg[0][0]  ( .D(ptr_in[0]), .SI(test_si), .SE(test_se), .CK(
        clk), .RN(rst_n), .Q(\FF[0][0] ) );
endmodule


module FIFO_MEM_CNTRL_test_1 ( wdata, winc, wfull, waddr, raddr, wclk, rdata, 
        test_si2, test_si1, test_so2, test_so1, test_se );
  input [7:0] wdata;
  input [3:0] waddr;
  input [3:0] raddr;
  output [7:0] rdata;
  input winc, wfull, wclk, test_si2, test_si1, test_se;
  output test_so2, test_so1;
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
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
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
         n404, n405, n406, n410, n411, n412, n413, n414;
  assign N10 = raddr[0];
  assign N11 = raddr[1];
  assign N12 = raddr[2];
  assign N13 = raddr[3];
  assign test_so1 = \mem[7][3] ;
  assign test_so2 = \mem[15][7] ;

  SDFFQX2M \mem_reg[1][7]  ( .D(n285), .SI(\mem[1][6] ), .SE(n412), .CK(wclk), 
        .Q(\mem[1][7] ) );
  SDFFQX2M \mem_reg[1][6]  ( .D(n284), .SI(\mem[1][5] ), .SE(n414), .CK(wclk), 
        .Q(\mem[1][6] ) );
  SDFFQX2M \mem_reg[1][5]  ( .D(n283), .SI(\mem[1][4] ), .SE(n411), .CK(wclk), 
        .Q(\mem[1][5] ) );
  SDFFQX2M \mem_reg[1][4]  ( .D(n282), .SI(\mem[1][3] ), .SE(n413), .CK(wclk), 
        .Q(\mem[1][4] ) );
  SDFFQX2M \mem_reg[1][3]  ( .D(n281), .SI(\mem[1][2] ), .SE(n413), .CK(wclk), 
        .Q(\mem[1][3] ) );
  SDFFQX2M \mem_reg[1][2]  ( .D(n280), .SI(\mem[1][1] ), .SE(n410), .CK(wclk), 
        .Q(\mem[1][2] ) );
  SDFFQX2M \mem_reg[1][1]  ( .D(n279), .SI(\mem[1][0] ), .SE(n412), .CK(wclk), 
        .Q(\mem[1][1] ) );
  SDFFQX2M \mem_reg[1][0]  ( .D(n278), .SI(\mem[0][7] ), .SE(n414), .CK(wclk), 
        .Q(\mem[1][0] ) );
  SDFFQX2M \mem_reg[3][7]  ( .D(n269), .SI(\mem[3][6] ), .SE(n414), .CK(wclk), 
        .Q(\mem[3][7] ) );
  SDFFQX2M \mem_reg[3][6]  ( .D(n268), .SI(\mem[3][5] ), .SE(n411), .CK(wclk), 
        .Q(\mem[3][6] ) );
  SDFFQX2M \mem_reg[3][5]  ( .D(n267), .SI(\mem[3][4] ), .SE(n413), .CK(wclk), 
        .Q(\mem[3][5] ) );
  SDFFQX2M \mem_reg[3][4]  ( .D(n266), .SI(\mem[3][3] ), .SE(n410), .CK(wclk), 
        .Q(\mem[3][4] ) );
  SDFFQX2M \mem_reg[3][3]  ( .D(n265), .SI(\mem[3][2] ), .SE(n410), .CK(wclk), 
        .Q(\mem[3][3] ) );
  SDFFQX2M \mem_reg[3][2]  ( .D(n264), .SI(\mem[3][1] ), .SE(n412), .CK(wclk), 
        .Q(\mem[3][2] ) );
  SDFFQX2M \mem_reg[3][1]  ( .D(n263), .SI(\mem[3][0] ), .SE(n414), .CK(wclk), 
        .Q(\mem[3][1] ) );
  SDFFQX2M \mem_reg[3][0]  ( .D(n262), .SI(\mem[2][7] ), .SE(n411), .CK(wclk), 
        .Q(\mem[3][0] ) );
  SDFFQX2M \mem_reg[5][7]  ( .D(n253), .SI(\mem[5][6] ), .SE(n411), .CK(wclk), 
        .Q(\mem[5][7] ) );
  SDFFQX2M \mem_reg[5][6]  ( .D(n252), .SI(\mem[5][5] ), .SE(n413), .CK(wclk), 
        .Q(\mem[5][6] ) );
  SDFFQX2M \mem_reg[5][5]  ( .D(n251), .SI(\mem[5][4] ), .SE(n410), .CK(wclk), 
        .Q(\mem[5][5] ) );
  SDFFQX2M \mem_reg[5][4]  ( .D(n250), .SI(\mem[5][3] ), .SE(n412), .CK(wclk), 
        .Q(\mem[5][4] ) );
  SDFFQX2M \mem_reg[5][3]  ( .D(n249), .SI(\mem[5][2] ), .SE(n412), .CK(wclk), 
        .Q(\mem[5][3] ) );
  SDFFQX2M \mem_reg[5][2]  ( .D(n248), .SI(\mem[5][1] ), .SE(n414), .CK(wclk), 
        .Q(\mem[5][2] ) );
  SDFFQX2M \mem_reg[5][1]  ( .D(n247), .SI(\mem[5][0] ), .SE(n411), .CK(wclk), 
        .Q(\mem[5][1] ) );
  SDFFQX2M \mem_reg[5][0]  ( .D(n246), .SI(\mem[4][7] ), .SE(n413), .CK(wclk), 
        .Q(\mem[5][0] ) );
  SDFFQX2M \mem_reg[7][7]  ( .D(n237), .SI(\mem[7][6] ), .SE(n413), .CK(wclk), 
        .Q(\mem[7][7] ) );
  SDFFQX2M \mem_reg[7][6]  ( .D(n236), .SI(\mem[7][5] ), .SE(n410), .CK(wclk), 
        .Q(\mem[7][6] ) );
  SDFFQX2M \mem_reg[7][5]  ( .D(n235), .SI(\mem[7][4] ), .SE(n412), .CK(wclk), 
        .Q(\mem[7][5] ) );
  SDFFQX2M \mem_reg[7][4]  ( .D(n234), .SI(test_si2), .SE(n414), .CK(wclk), 
        .Q(\mem[7][4] ) );
  SDFFQX2M \mem_reg[7][3]  ( .D(n233), .SI(\mem[7][2] ), .SE(n414), .CK(wclk), 
        .Q(\mem[7][3] ) );
  SDFFQX2M \mem_reg[7][2]  ( .D(n232), .SI(\mem[7][1] ), .SE(n411), .CK(wclk), 
        .Q(\mem[7][2] ) );
  SDFFQX2M \mem_reg[7][1]  ( .D(n231), .SI(\mem[7][0] ), .SE(n413), .CK(wclk), 
        .Q(\mem[7][1] ) );
  SDFFQX2M \mem_reg[7][0]  ( .D(n230), .SI(\mem[6][7] ), .SE(n410), .CK(wclk), 
        .Q(\mem[7][0] ) );
  SDFFQX2M \mem_reg[9][7]  ( .D(n221), .SI(\mem[9][6] ), .SE(n410), .CK(wclk), 
        .Q(\mem[9][7] ) );
  SDFFQX2M \mem_reg[9][6]  ( .D(n220), .SI(\mem[9][5] ), .SE(n412), .CK(wclk), 
        .Q(\mem[9][6] ) );
  SDFFQX2M \mem_reg[9][5]  ( .D(n219), .SI(\mem[9][4] ), .SE(n414), .CK(wclk), 
        .Q(\mem[9][5] ) );
  SDFFQX2M \mem_reg[9][4]  ( .D(n218), .SI(\mem[9][3] ), .SE(n411), .CK(wclk), 
        .Q(\mem[9][4] ) );
  SDFFQX2M \mem_reg[9][3]  ( .D(n217), .SI(\mem[9][2] ), .SE(n411), .CK(wclk), 
        .Q(\mem[9][3] ) );
  SDFFQX2M \mem_reg[9][2]  ( .D(n216), .SI(\mem[9][1] ), .SE(n413), .CK(wclk), 
        .Q(\mem[9][2] ) );
  SDFFQX2M \mem_reg[9][1]  ( .D(n215), .SI(\mem[9][0] ), .SE(n410), .CK(wclk), 
        .Q(\mem[9][1] ) );
  SDFFQX2M \mem_reg[9][0]  ( .D(n214), .SI(\mem[8][7] ), .SE(n412), .CK(wclk), 
        .Q(\mem[9][0] ) );
  SDFFQX2M \mem_reg[11][7]  ( .D(n205), .SI(\mem[11][6] ), .SE(n412), .CK(wclk), .Q(\mem[11][7] ) );
  SDFFQX2M \mem_reg[11][6]  ( .D(n204), .SI(\mem[11][5] ), .SE(n414), .CK(wclk), .Q(\mem[11][6] ) );
  SDFFQX2M \mem_reg[11][5]  ( .D(n203), .SI(\mem[11][4] ), .SE(n411), .CK(wclk), .Q(\mem[11][5] ) );
  SDFFQX2M \mem_reg[11][4]  ( .D(n202), .SI(\mem[11][3] ), .SE(n413), .CK(wclk), .Q(\mem[11][4] ) );
  SDFFQX2M \mem_reg[11][3]  ( .D(n201), .SI(\mem[11][2] ), .SE(n413), .CK(wclk), .Q(\mem[11][3] ) );
  SDFFQX2M \mem_reg[11][2]  ( .D(n200), .SI(\mem[11][1] ), .SE(n410), .CK(wclk), .Q(\mem[11][2] ) );
  SDFFQX2M \mem_reg[11][1]  ( .D(n199), .SI(\mem[11][0] ), .SE(n412), .CK(wclk), .Q(\mem[11][1] ) );
  SDFFQX2M \mem_reg[11][0]  ( .D(n198), .SI(\mem[10][7] ), .SE(n414), .CK(wclk), .Q(\mem[11][0] ) );
  SDFFQX2M \mem_reg[13][7]  ( .D(n189), .SI(\mem[13][6] ), .SE(n414), .CK(wclk), .Q(\mem[13][7] ) );
  SDFFQX2M \mem_reg[13][6]  ( .D(n188), .SI(\mem[13][5] ), .SE(n411), .CK(wclk), .Q(\mem[13][6] ) );
  SDFFQX2M \mem_reg[13][5]  ( .D(n187), .SI(\mem[13][4] ), .SE(n413), .CK(wclk), .Q(\mem[13][5] ) );
  SDFFQX2M \mem_reg[13][4]  ( .D(n186), .SI(\mem[13][3] ), .SE(n410), .CK(wclk), .Q(\mem[13][4] ) );
  SDFFQX2M \mem_reg[13][3]  ( .D(n185), .SI(\mem[13][2] ), .SE(n410), .CK(wclk), .Q(\mem[13][3] ) );
  SDFFQX2M \mem_reg[13][2]  ( .D(n184), .SI(\mem[13][1] ), .SE(n412), .CK(wclk), .Q(\mem[13][2] ) );
  SDFFQX2M \mem_reg[13][1]  ( .D(n183), .SI(\mem[13][0] ), .SE(n414), .CK(wclk), .Q(\mem[13][1] ) );
  SDFFQX2M \mem_reg[13][0]  ( .D(n182), .SI(\mem[12][7] ), .SE(n411), .CK(wclk), .Q(\mem[13][0] ) );
  SDFFQX2M \mem_reg[15][7]  ( .D(n173), .SI(\mem[15][6] ), .SE(n411), .CK(wclk), .Q(\mem[15][7] ) );
  SDFFQX2M \mem_reg[15][6]  ( .D(n172), .SI(\mem[15][5] ), .SE(n413), .CK(wclk), .Q(\mem[15][6] ) );
  SDFFQX2M \mem_reg[15][5]  ( .D(n171), .SI(\mem[15][4] ), .SE(n410), .CK(wclk), .Q(\mem[15][5] ) );
  SDFFQX2M \mem_reg[15][4]  ( .D(n170), .SI(\mem[15][3] ), .SE(n412), .CK(wclk), .Q(\mem[15][4] ) );
  SDFFQX2M \mem_reg[15][3]  ( .D(n169), .SI(\mem[15][2] ), .SE(n412), .CK(wclk), .Q(\mem[15][3] ) );
  SDFFQX2M \mem_reg[15][2]  ( .D(n168), .SI(\mem[15][1] ), .SE(n414), .CK(wclk), .Q(\mem[15][2] ) );
  SDFFQX2M \mem_reg[15][1]  ( .D(n167), .SI(\mem[15][0] ), .SE(n411), .CK(wclk), .Q(\mem[15][1] ) );
  SDFFQX2M \mem_reg[15][0]  ( .D(n166), .SI(\mem[14][7] ), .SE(n413), .CK(wclk), .Q(\mem[15][0] ) );
  SDFFQX2M \mem_reg[0][7]  ( .D(n293), .SI(\mem[0][6] ), .SE(n413), .CK(wclk), 
        .Q(\mem[0][7] ) );
  SDFFQX2M \mem_reg[0][6]  ( .D(n292), .SI(\mem[0][5] ), .SE(n410), .CK(wclk), 
        .Q(\mem[0][6] ) );
  SDFFQX2M \mem_reg[0][5]  ( .D(n291), .SI(\mem[0][4] ), .SE(n412), .CK(wclk), 
        .Q(\mem[0][5] ) );
  SDFFQX2M \mem_reg[0][4]  ( .D(n290), .SI(\mem[0][3] ), .SE(n414), .CK(wclk), 
        .Q(\mem[0][4] ) );
  SDFFQX2M \mem_reg[0][3]  ( .D(n289), .SI(\mem[0][2] ), .SE(n414), .CK(wclk), 
        .Q(\mem[0][3] ) );
  SDFFQX2M \mem_reg[0][2]  ( .D(n288), .SI(\mem[0][1] ), .SE(n411), .CK(wclk), 
        .Q(\mem[0][2] ) );
  SDFFQX2M \mem_reg[0][1]  ( .D(n287), .SI(\mem[0][0] ), .SE(n413), .CK(wclk), 
        .Q(\mem[0][1] ) );
  SDFFQX2M \mem_reg[0][0]  ( .D(n286), .SI(test_si1), .SE(n410), .CK(wclk), 
        .Q(\mem[0][0] ) );
  SDFFQX2M \mem_reg[2][7]  ( .D(n277), .SI(\mem[2][6] ), .SE(n410), .CK(wclk), 
        .Q(\mem[2][7] ) );
  SDFFQX2M \mem_reg[2][6]  ( .D(n276), .SI(\mem[2][5] ), .SE(n412), .CK(wclk), 
        .Q(\mem[2][6] ) );
  SDFFQX2M \mem_reg[2][5]  ( .D(n275), .SI(\mem[2][4] ), .SE(n414), .CK(wclk), 
        .Q(\mem[2][5] ) );
  SDFFQX2M \mem_reg[2][4]  ( .D(n274), .SI(\mem[2][3] ), .SE(n411), .CK(wclk), 
        .Q(\mem[2][4] ) );
  SDFFQX2M \mem_reg[2][3]  ( .D(n273), .SI(\mem[2][2] ), .SE(n411), .CK(wclk), 
        .Q(\mem[2][3] ) );
  SDFFQX2M \mem_reg[2][2]  ( .D(n272), .SI(\mem[2][1] ), .SE(n413), .CK(wclk), 
        .Q(\mem[2][2] ) );
  SDFFQX2M \mem_reg[2][1]  ( .D(n271), .SI(\mem[2][0] ), .SE(n410), .CK(wclk), 
        .Q(\mem[2][1] ) );
  SDFFQX2M \mem_reg[2][0]  ( .D(n270), .SI(\mem[1][7] ), .SE(n412), .CK(wclk), 
        .Q(\mem[2][0] ) );
  SDFFQX2M \mem_reg[4][7]  ( .D(n261), .SI(\mem[4][6] ), .SE(n412), .CK(wclk), 
        .Q(\mem[4][7] ) );
  SDFFQX2M \mem_reg[4][6]  ( .D(n260), .SI(\mem[4][5] ), .SE(n414), .CK(wclk), 
        .Q(\mem[4][6] ) );
  SDFFQX2M \mem_reg[4][5]  ( .D(n259), .SI(\mem[4][4] ), .SE(n411), .CK(wclk), 
        .Q(\mem[4][5] ) );
  SDFFQX2M \mem_reg[4][4]  ( .D(n258), .SI(\mem[4][3] ), .SE(n413), .CK(wclk), 
        .Q(\mem[4][4] ) );
  SDFFQX2M \mem_reg[4][3]  ( .D(n257), .SI(\mem[4][2] ), .SE(n413), .CK(wclk), 
        .Q(\mem[4][3] ) );
  SDFFQX2M \mem_reg[4][2]  ( .D(n256), .SI(\mem[4][1] ), .SE(n410), .CK(wclk), 
        .Q(\mem[4][2] ) );
  SDFFQX2M \mem_reg[4][1]  ( .D(n255), .SI(\mem[4][0] ), .SE(n412), .CK(wclk), 
        .Q(\mem[4][1] ) );
  SDFFQX2M \mem_reg[4][0]  ( .D(n254), .SI(\mem[3][7] ), .SE(n414), .CK(wclk), 
        .Q(\mem[4][0] ) );
  SDFFQX2M \mem_reg[6][7]  ( .D(n245), .SI(\mem[6][6] ), .SE(n414), .CK(wclk), 
        .Q(\mem[6][7] ) );
  SDFFQX2M \mem_reg[6][6]  ( .D(n244), .SI(\mem[6][5] ), .SE(n411), .CK(wclk), 
        .Q(\mem[6][6] ) );
  SDFFQX2M \mem_reg[6][5]  ( .D(n243), .SI(\mem[6][4] ), .SE(n413), .CK(wclk), 
        .Q(\mem[6][5] ) );
  SDFFQX2M \mem_reg[6][4]  ( .D(n242), .SI(\mem[6][3] ), .SE(n410), .CK(wclk), 
        .Q(\mem[6][4] ) );
  SDFFQX2M \mem_reg[6][3]  ( .D(n241), .SI(\mem[6][2] ), .SE(n410), .CK(wclk), 
        .Q(\mem[6][3] ) );
  SDFFQX2M \mem_reg[6][2]  ( .D(n240), .SI(\mem[6][1] ), .SE(n412), .CK(wclk), 
        .Q(\mem[6][2] ) );
  SDFFQX2M \mem_reg[6][1]  ( .D(n239), .SI(\mem[6][0] ), .SE(n414), .CK(wclk), 
        .Q(\mem[6][1] ) );
  SDFFQX2M \mem_reg[6][0]  ( .D(n238), .SI(\mem[5][7] ), .SE(n411), .CK(wclk), 
        .Q(\mem[6][0] ) );
  SDFFQX2M \mem_reg[8][7]  ( .D(n229), .SI(\mem[8][6] ), .SE(n411), .CK(wclk), 
        .Q(\mem[8][7] ) );
  SDFFQX2M \mem_reg[8][6]  ( .D(n228), .SI(\mem[8][5] ), .SE(n413), .CK(wclk), 
        .Q(\mem[8][6] ) );
  SDFFQX2M \mem_reg[8][5]  ( .D(n227), .SI(\mem[8][4] ), .SE(n410), .CK(wclk), 
        .Q(\mem[8][5] ) );
  SDFFQX2M \mem_reg[8][4]  ( .D(n226), .SI(\mem[8][3] ), .SE(n412), .CK(wclk), 
        .Q(\mem[8][4] ) );
  SDFFQX2M \mem_reg[8][3]  ( .D(n225), .SI(\mem[8][2] ), .SE(n412), .CK(wclk), 
        .Q(\mem[8][3] ) );
  SDFFQX2M \mem_reg[8][2]  ( .D(n224), .SI(\mem[8][1] ), .SE(n414), .CK(wclk), 
        .Q(\mem[8][2] ) );
  SDFFQX2M \mem_reg[8][1]  ( .D(n223), .SI(\mem[8][0] ), .SE(n411), .CK(wclk), 
        .Q(\mem[8][1] ) );
  SDFFQX2M \mem_reg[8][0]  ( .D(n222), .SI(\mem[7][7] ), .SE(n413), .CK(wclk), 
        .Q(\mem[8][0] ) );
  SDFFQX2M \mem_reg[10][7]  ( .D(n213), .SI(\mem[10][6] ), .SE(n413), .CK(wclk), .Q(\mem[10][7] ) );
  SDFFQX2M \mem_reg[10][6]  ( .D(n212), .SI(\mem[10][5] ), .SE(n410), .CK(wclk), .Q(\mem[10][6] ) );
  SDFFQX2M \mem_reg[10][5]  ( .D(n211), .SI(\mem[10][4] ), .SE(n412), .CK(wclk), .Q(\mem[10][5] ) );
  SDFFQX2M \mem_reg[10][4]  ( .D(n210), .SI(\mem[10][3] ), .SE(n414), .CK(wclk), .Q(\mem[10][4] ) );
  SDFFQX2M \mem_reg[10][3]  ( .D(n209), .SI(\mem[10][2] ), .SE(n414), .CK(wclk), .Q(\mem[10][3] ) );
  SDFFQX2M \mem_reg[10][2]  ( .D(n208), .SI(\mem[10][1] ), .SE(n411), .CK(wclk), .Q(\mem[10][2] ) );
  SDFFQX2M \mem_reg[10][1]  ( .D(n207), .SI(\mem[10][0] ), .SE(n413), .CK(wclk), .Q(\mem[10][1] ) );
  SDFFQX2M \mem_reg[10][0]  ( .D(n206), .SI(\mem[9][7] ), .SE(n410), .CK(wclk), 
        .Q(\mem[10][0] ) );
  SDFFQX2M \mem_reg[12][7]  ( .D(n197), .SI(\mem[12][6] ), .SE(n410), .CK(wclk), .Q(\mem[12][7] ) );
  SDFFQX2M \mem_reg[12][6]  ( .D(n196), .SI(\mem[12][5] ), .SE(n412), .CK(wclk), .Q(\mem[12][6] ) );
  SDFFQX2M \mem_reg[12][5]  ( .D(n195), .SI(\mem[12][4] ), .SE(n414), .CK(wclk), .Q(\mem[12][5] ) );
  SDFFQX2M \mem_reg[12][4]  ( .D(n194), .SI(\mem[12][3] ), .SE(n411), .CK(wclk), .Q(\mem[12][4] ) );
  SDFFQX2M \mem_reg[12][3]  ( .D(n193), .SI(\mem[12][2] ), .SE(n411), .CK(wclk), .Q(\mem[12][3] ) );
  SDFFQX2M \mem_reg[12][2]  ( .D(n192), .SI(\mem[12][1] ), .SE(n413), .CK(wclk), .Q(\mem[12][2] ) );
  SDFFQX2M \mem_reg[12][1]  ( .D(n191), .SI(\mem[12][0] ), .SE(n410), .CK(wclk), .Q(\mem[12][1] ) );
  SDFFQX2M \mem_reg[12][0]  ( .D(n190), .SI(\mem[11][7] ), .SE(n412), .CK(wclk), .Q(\mem[12][0] ) );
  SDFFQX2M \mem_reg[14][7]  ( .D(n181), .SI(\mem[14][6] ), .SE(n412), .CK(wclk), .Q(\mem[14][7] ) );
  SDFFQX2M \mem_reg[14][6]  ( .D(n180), .SI(\mem[14][5] ), .SE(n414), .CK(wclk), .Q(\mem[14][6] ) );
  SDFFQX2M \mem_reg[14][5]  ( .D(n179), .SI(\mem[14][4] ), .SE(n411), .CK(wclk), .Q(\mem[14][5] ) );
  SDFFQX2M \mem_reg[14][4]  ( .D(n178), .SI(\mem[14][3] ), .SE(n413), .CK(wclk), .Q(\mem[14][4] ) );
  SDFFQX2M \mem_reg[14][3]  ( .D(n177), .SI(\mem[14][2] ), .SE(n413), .CK(wclk), .Q(\mem[14][3] ) );
  SDFFQX2M \mem_reg[14][2]  ( .D(n176), .SI(\mem[14][1] ), .SE(n410), .CK(wclk), .Q(\mem[14][2] ) );
  SDFFQX2M \mem_reg[14][1]  ( .D(n175), .SI(\mem[14][0] ), .SE(n412), .CK(wclk), .Q(\mem[14][1] ) );
  SDFFQX2M \mem_reg[14][0]  ( .D(n174), .SI(\mem[13][7] ), .SE(n414), .CK(wclk), .Q(\mem[14][0] ) );
  NOR2X2M U130 ( .A(waddr[1]), .B(waddr[2]), .Y(n141) );
  NOR2X2M U131 ( .A(n398), .B(waddr[2]), .Y(n154) );
  INVX2M U132 ( .A(n395), .Y(n396) );
  INVX2M U133 ( .A(n129), .Y(n392) );
  OR2X2M U134 ( .A(n390), .B(n391), .Y(n129) );
  BUFX2M U135 ( .A(n132), .Y(n395) );
  INVX2M U136 ( .A(n130), .Y(n393) );
  INVX2M U137 ( .A(n131), .Y(n394) );
  NAND2X2M U138 ( .A(n146), .B(n142), .Y(n160) );
  NAND2X2M U139 ( .A(n146), .B(n144), .Y(n161) );
  NAND2X2M U140 ( .A(n151), .B(n142), .Y(n162) );
  NAND2X2M U141 ( .A(n151), .B(n144), .Y(n163) );
  NAND2X2M U142 ( .A(n142), .B(n154), .Y(n164) );
  NAND2X2M U143 ( .A(n141), .B(n144), .Y(n143) );
  NAND2X2M U144 ( .A(n146), .B(n147), .Y(n145) );
  NAND2X2M U145 ( .A(n149), .B(n146), .Y(n148) );
  NAND2X2M U146 ( .A(n151), .B(n147), .Y(n150) );
  NAND2X2M U147 ( .A(n151), .B(n149), .Y(n152) );
  NAND2X2M U148 ( .A(n147), .B(n154), .Y(n153) );
  NAND2X2M U149 ( .A(n149), .B(n154), .Y(n155) );
  NAND2X2M U150 ( .A(n147), .B(n141), .Y(n156) );
  NAND2X2M U151 ( .A(n149), .B(n141), .Y(n158) );
  NAND2X2M U152 ( .A(n141), .B(n142), .Y(n140) );
  NAND2X2M U153 ( .A(n154), .B(n144), .Y(n139) );
  AND2X2M U154 ( .A(n165), .B(n397), .Y(n144) );
  AND2X2M U155 ( .A(n157), .B(n397), .Y(n149) );
  OR2X2M U156 ( .A(n390), .B(N10), .Y(n130) );
  OR2X2M U157 ( .A(n391), .B(N11), .Y(n131) );
  OR2X2M U158 ( .A(N10), .B(N11), .Y(n132) );
  INVX2M U159 ( .A(N11), .Y(n390) );
  INVX2M U160 ( .A(N10), .Y(n391) );
  INVX2M U161 ( .A(wdata[0]), .Y(n406) );
  INVX2M U162 ( .A(wdata[1]), .Y(n405) );
  INVX2M U163 ( .A(wdata[2]), .Y(n404) );
  INVX2M U164 ( .A(wdata[3]), .Y(n403) );
  INVX2M U165 ( .A(wdata[4]), .Y(n402) );
  INVX2M U166 ( .A(wdata[5]), .Y(n401) );
  INVX2M U167 ( .A(wdata[6]), .Y(n400) );
  INVX2M U168 ( .A(wdata[7]), .Y(n399) );
  OAI2BB2X1M U169 ( .B0(n140), .B1(n406), .A0N(\mem[9][0] ), .A1N(n140), .Y(
        n214) );
  OAI2BB2X1M U170 ( .B0(n139), .B1(n406), .A0N(\mem[10][0] ), .A1N(n139), .Y(
        n206) );
  OAI2BB2X1M U171 ( .B0(n139), .B1(n405), .A0N(\mem[10][1] ), .A1N(n139), .Y(
        n207) );
  OAI2BB2X1M U172 ( .B0(n139), .B1(n404), .A0N(\mem[10][2] ), .A1N(n139), .Y(
        n208) );
  OAI2BB2X1M U173 ( .B0(n139), .B1(n403), .A0N(\mem[10][3] ), .A1N(n139), .Y(
        n209) );
  OAI2BB2X1M U174 ( .B0(n139), .B1(n402), .A0N(\mem[10][4] ), .A1N(n139), .Y(
        n210) );
  OAI2BB2X1M U175 ( .B0(n139), .B1(n401), .A0N(\mem[10][5] ), .A1N(n139), .Y(
        n211) );
  OAI2BB2X1M U176 ( .B0(n139), .B1(n400), .A0N(\mem[10][6] ), .A1N(n139), .Y(
        n212) );
  OAI2BB2X1M U177 ( .B0(n139), .B1(n399), .A0N(\mem[10][7] ), .A1N(n139), .Y(
        n213) );
  OAI2BB2X1M U178 ( .B0(n406), .B1(n143), .A0N(\mem[8][0] ), .A1N(n143), .Y(
        n222) );
  OAI2BB2X1M U179 ( .B0(n405), .B1(n143), .A0N(\mem[8][1] ), .A1N(n143), .Y(
        n223) );
  OAI2BB2X1M U180 ( .B0(n404), .B1(n143), .A0N(\mem[8][2] ), .A1N(n143), .Y(
        n224) );
  OAI2BB2X1M U181 ( .B0(n403), .B1(n143), .A0N(\mem[8][3] ), .A1N(n143), .Y(
        n225) );
  OAI2BB2X1M U182 ( .B0(n402), .B1(n143), .A0N(\mem[8][4] ), .A1N(n143), .Y(
        n226) );
  OAI2BB2X1M U183 ( .B0(n401), .B1(n143), .A0N(\mem[8][5] ), .A1N(n143), .Y(
        n227) );
  OAI2BB2X1M U184 ( .B0(n400), .B1(n143), .A0N(\mem[8][6] ), .A1N(n143), .Y(
        n228) );
  OAI2BB2X1M U185 ( .B0(n399), .B1(n143), .A0N(\mem[8][7] ), .A1N(n143), .Y(
        n229) );
  OAI2BB2X1M U186 ( .B0(n405), .B1(n140), .A0N(\mem[9][1] ), .A1N(n140), .Y(
        n215) );
  OAI2BB2X1M U187 ( .B0(n404), .B1(n140), .A0N(\mem[9][2] ), .A1N(n140), .Y(
        n216) );
  OAI2BB2X1M U188 ( .B0(n403), .B1(n140), .A0N(\mem[9][3] ), .A1N(n140), .Y(
        n217) );
  OAI2BB2X1M U189 ( .B0(n402), .B1(n140), .A0N(\mem[9][4] ), .A1N(n140), .Y(
        n218) );
  OAI2BB2X1M U190 ( .B0(n401), .B1(n140), .A0N(\mem[9][5] ), .A1N(n140), .Y(
        n219) );
  OAI2BB2X1M U191 ( .B0(n400), .B1(n140), .A0N(\mem[9][6] ), .A1N(n140), .Y(
        n220) );
  OAI2BB2X1M U192 ( .B0(n399), .B1(n140), .A0N(\mem[9][7] ), .A1N(n140), .Y(
        n221) );
  OAI2BB2X1M U193 ( .B0(n406), .B1(n164), .A0N(\mem[11][0] ), .A1N(n164), .Y(
        n198) );
  OAI2BB2X1M U194 ( .B0(n405), .B1(n164), .A0N(\mem[11][1] ), .A1N(n164), .Y(
        n199) );
  OAI2BB2X1M U195 ( .B0(n404), .B1(n164), .A0N(\mem[11][2] ), .A1N(n164), .Y(
        n200) );
  OAI2BB2X1M U196 ( .B0(n403), .B1(n164), .A0N(\mem[11][3] ), .A1N(n164), .Y(
        n201) );
  OAI2BB2X1M U197 ( .B0(n402), .B1(n164), .A0N(\mem[11][4] ), .A1N(n164), .Y(
        n202) );
  OAI2BB2X1M U198 ( .B0(n401), .B1(n164), .A0N(\mem[11][5] ), .A1N(n164), .Y(
        n203) );
  OAI2BB2X1M U199 ( .B0(n400), .B1(n164), .A0N(\mem[11][6] ), .A1N(n164), .Y(
        n204) );
  OAI2BB2X1M U200 ( .B0(n399), .B1(n164), .A0N(\mem[11][7] ), .A1N(n164), .Y(
        n205) );
  OAI2BB2X1M U201 ( .B0(n406), .B1(n153), .A0N(\mem[3][0] ), .A1N(n153), .Y(
        n262) );
  OAI2BB2X1M U202 ( .B0(n405), .B1(n153), .A0N(\mem[3][1] ), .A1N(n153), .Y(
        n263) );
  OAI2BB2X1M U203 ( .B0(n404), .B1(n153), .A0N(\mem[3][2] ), .A1N(n153), .Y(
        n264) );
  OAI2BB2X1M U204 ( .B0(n403), .B1(n153), .A0N(\mem[3][3] ), .A1N(n153), .Y(
        n265) );
  OAI2BB2X1M U205 ( .B0(n402), .B1(n153), .A0N(\mem[3][4] ), .A1N(n153), .Y(
        n266) );
  OAI2BB2X1M U206 ( .B0(n401), .B1(n153), .A0N(\mem[3][5] ), .A1N(n153), .Y(
        n267) );
  OAI2BB2X1M U207 ( .B0(n400), .B1(n153), .A0N(\mem[3][6] ), .A1N(n153), .Y(
        n268) );
  OAI2BB2X1M U208 ( .B0(n399), .B1(n153), .A0N(\mem[3][7] ), .A1N(n153), .Y(
        n269) );
  OAI2BB2X1M U209 ( .B0(n406), .B1(n155), .A0N(\mem[2][0] ), .A1N(n155), .Y(
        n270) );
  OAI2BB2X1M U210 ( .B0(n405), .B1(n155), .A0N(\mem[2][1] ), .A1N(n155), .Y(
        n271) );
  OAI2BB2X1M U211 ( .B0(n404), .B1(n155), .A0N(\mem[2][2] ), .A1N(n155), .Y(
        n272) );
  OAI2BB2X1M U212 ( .B0(n403), .B1(n155), .A0N(\mem[2][3] ), .A1N(n155), .Y(
        n273) );
  OAI2BB2X1M U213 ( .B0(n402), .B1(n155), .A0N(\mem[2][4] ), .A1N(n155), .Y(
        n274) );
  OAI2BB2X1M U214 ( .B0(n401), .B1(n155), .A0N(\mem[2][5] ), .A1N(n155), .Y(
        n275) );
  OAI2BB2X1M U215 ( .B0(n400), .B1(n155), .A0N(\mem[2][6] ), .A1N(n155), .Y(
        n276) );
  OAI2BB2X1M U216 ( .B0(n399), .B1(n155), .A0N(\mem[2][7] ), .A1N(n155), .Y(
        n277) );
  OAI2BB2X1M U217 ( .B0(n406), .B1(n156), .A0N(\mem[1][0] ), .A1N(n156), .Y(
        n278) );
  OAI2BB2X1M U218 ( .B0(n405), .B1(n156), .A0N(\mem[1][1] ), .A1N(n156), .Y(
        n279) );
  OAI2BB2X1M U219 ( .B0(n404), .B1(n156), .A0N(\mem[1][2] ), .A1N(n156), .Y(
        n280) );
  OAI2BB2X1M U220 ( .B0(n403), .B1(n156), .A0N(\mem[1][3] ), .A1N(n156), .Y(
        n281) );
  OAI2BB2X1M U221 ( .B0(n402), .B1(n156), .A0N(\mem[1][4] ), .A1N(n156), .Y(
        n282) );
  OAI2BB2X1M U222 ( .B0(n401), .B1(n156), .A0N(\mem[1][5] ), .A1N(n156), .Y(
        n283) );
  OAI2BB2X1M U223 ( .B0(n400), .B1(n156), .A0N(\mem[1][6] ), .A1N(n156), .Y(
        n284) );
  OAI2BB2X1M U224 ( .B0(n399), .B1(n156), .A0N(\mem[1][7] ), .A1N(n156), .Y(
        n285) );
  OAI2BB2X1M U225 ( .B0(n406), .B1(n158), .A0N(\mem[0][0] ), .A1N(n158), .Y(
        n286) );
  OAI2BB2X1M U226 ( .B0(n405), .B1(n158), .A0N(\mem[0][1] ), .A1N(n158), .Y(
        n287) );
  OAI2BB2X1M U227 ( .B0(n404), .B1(n158), .A0N(\mem[0][2] ), .A1N(n158), .Y(
        n288) );
  OAI2BB2X1M U228 ( .B0(n403), .B1(n158), .A0N(\mem[0][3] ), .A1N(n158), .Y(
        n289) );
  OAI2BB2X1M U229 ( .B0(n402), .B1(n158), .A0N(\mem[0][4] ), .A1N(n158), .Y(
        n290) );
  OAI2BB2X1M U230 ( .B0(n401), .B1(n158), .A0N(\mem[0][5] ), .A1N(n158), .Y(
        n291) );
  OAI2BB2X1M U231 ( .B0(n400), .B1(n158), .A0N(\mem[0][6] ), .A1N(n158), .Y(
        n292) );
  OAI2BB2X1M U232 ( .B0(n399), .B1(n158), .A0N(\mem[0][7] ), .A1N(n158), .Y(
        n293) );
  OAI2BB2X1M U233 ( .B0(n406), .B1(n160), .A0N(\mem[15][0] ), .A1N(n160), .Y(
        n166) );
  OAI2BB2X1M U234 ( .B0(n405), .B1(n160), .A0N(\mem[15][1] ), .A1N(n160), .Y(
        n167) );
  OAI2BB2X1M U235 ( .B0(n404), .B1(n160), .A0N(\mem[15][2] ), .A1N(n160), .Y(
        n168) );
  OAI2BB2X1M U236 ( .B0(n403), .B1(n160), .A0N(\mem[15][3] ), .A1N(n160), .Y(
        n169) );
  OAI2BB2X1M U237 ( .B0(n402), .B1(n160), .A0N(\mem[15][4] ), .A1N(n160), .Y(
        n170) );
  OAI2BB2X1M U238 ( .B0(n401), .B1(n160), .A0N(\mem[15][5] ), .A1N(n160), .Y(
        n171) );
  OAI2BB2X1M U239 ( .B0(n400), .B1(n160), .A0N(\mem[15][6] ), .A1N(n160), .Y(
        n172) );
  OAI2BB2X1M U240 ( .B0(n399), .B1(n160), .A0N(\mem[15][7] ), .A1N(n160), .Y(
        n173) );
  OAI2BB2X1M U241 ( .B0(n406), .B1(n161), .A0N(\mem[14][0] ), .A1N(n161), .Y(
        n174) );
  OAI2BB2X1M U242 ( .B0(n405), .B1(n161), .A0N(\mem[14][1] ), .A1N(n161), .Y(
        n175) );
  OAI2BB2X1M U243 ( .B0(n404), .B1(n161), .A0N(\mem[14][2] ), .A1N(n161), .Y(
        n176) );
  OAI2BB2X1M U244 ( .B0(n403), .B1(n161), .A0N(\mem[14][3] ), .A1N(n161), .Y(
        n177) );
  OAI2BB2X1M U245 ( .B0(n402), .B1(n161), .A0N(\mem[14][4] ), .A1N(n161), .Y(
        n178) );
  OAI2BB2X1M U246 ( .B0(n401), .B1(n161), .A0N(\mem[14][5] ), .A1N(n161), .Y(
        n179) );
  OAI2BB2X1M U247 ( .B0(n400), .B1(n161), .A0N(\mem[14][6] ), .A1N(n161), .Y(
        n180) );
  OAI2BB2X1M U248 ( .B0(n399), .B1(n161), .A0N(\mem[14][7] ), .A1N(n161), .Y(
        n181) );
  OAI2BB2X1M U249 ( .B0(n406), .B1(n162), .A0N(\mem[13][0] ), .A1N(n162), .Y(
        n182) );
  OAI2BB2X1M U250 ( .B0(n405), .B1(n162), .A0N(\mem[13][1] ), .A1N(n162), .Y(
        n183) );
  OAI2BB2X1M U251 ( .B0(n404), .B1(n162), .A0N(\mem[13][2] ), .A1N(n162), .Y(
        n184) );
  OAI2BB2X1M U252 ( .B0(n403), .B1(n162), .A0N(\mem[13][3] ), .A1N(n162), .Y(
        n185) );
  OAI2BB2X1M U253 ( .B0(n402), .B1(n162), .A0N(\mem[13][4] ), .A1N(n162), .Y(
        n186) );
  OAI2BB2X1M U254 ( .B0(n401), .B1(n162), .A0N(\mem[13][5] ), .A1N(n162), .Y(
        n187) );
  OAI2BB2X1M U255 ( .B0(n400), .B1(n162), .A0N(\mem[13][6] ), .A1N(n162), .Y(
        n188) );
  OAI2BB2X1M U256 ( .B0(n399), .B1(n162), .A0N(\mem[13][7] ), .A1N(n162), .Y(
        n189) );
  OAI2BB2X1M U257 ( .B0(n406), .B1(n163), .A0N(\mem[12][0] ), .A1N(n163), .Y(
        n190) );
  OAI2BB2X1M U258 ( .B0(n405), .B1(n163), .A0N(\mem[12][1] ), .A1N(n163), .Y(
        n191) );
  OAI2BB2X1M U259 ( .B0(n404), .B1(n163), .A0N(\mem[12][2] ), .A1N(n163), .Y(
        n192) );
  OAI2BB2X1M U260 ( .B0(n403), .B1(n163), .A0N(\mem[12][3] ), .A1N(n163), .Y(
        n193) );
  OAI2BB2X1M U261 ( .B0(n402), .B1(n163), .A0N(\mem[12][4] ), .A1N(n163), .Y(
        n194) );
  OAI2BB2X1M U262 ( .B0(n401), .B1(n163), .A0N(\mem[12][5] ), .A1N(n163), .Y(
        n195) );
  OAI2BB2X1M U263 ( .B0(n400), .B1(n163), .A0N(\mem[12][6] ), .A1N(n163), .Y(
        n196) );
  OAI2BB2X1M U264 ( .B0(n399), .B1(n163), .A0N(\mem[12][7] ), .A1N(n163), .Y(
        n197) );
  OAI2BB2X1M U265 ( .B0(n406), .B1(n145), .A0N(\mem[7][0] ), .A1N(n145), .Y(
        n230) );
  OAI2BB2X1M U266 ( .B0(n405), .B1(n145), .A0N(\mem[7][1] ), .A1N(n145), .Y(
        n231) );
  OAI2BB2X1M U267 ( .B0(n404), .B1(n145), .A0N(\mem[7][2] ), .A1N(n145), .Y(
        n232) );
  OAI2BB2X1M U268 ( .B0(n403), .B1(n145), .A0N(\mem[7][3] ), .A1N(n145), .Y(
        n233) );
  OAI2BB2X1M U269 ( .B0(n402), .B1(n145), .A0N(\mem[7][4] ), .A1N(n145), .Y(
        n234) );
  OAI2BB2X1M U270 ( .B0(n401), .B1(n145), .A0N(\mem[7][5] ), .A1N(n145), .Y(
        n235) );
  OAI2BB2X1M U271 ( .B0(n400), .B1(n145), .A0N(\mem[7][6] ), .A1N(n145), .Y(
        n236) );
  OAI2BB2X1M U272 ( .B0(n399), .B1(n145), .A0N(\mem[7][7] ), .A1N(n145), .Y(
        n237) );
  OAI2BB2X1M U273 ( .B0(n406), .B1(n148), .A0N(\mem[6][0] ), .A1N(n148), .Y(
        n238) );
  OAI2BB2X1M U274 ( .B0(n405), .B1(n148), .A0N(\mem[6][1] ), .A1N(n148), .Y(
        n239) );
  OAI2BB2X1M U275 ( .B0(n404), .B1(n148), .A0N(\mem[6][2] ), .A1N(n148), .Y(
        n240) );
  OAI2BB2X1M U276 ( .B0(n403), .B1(n148), .A0N(\mem[6][3] ), .A1N(n148), .Y(
        n241) );
  OAI2BB2X1M U277 ( .B0(n402), .B1(n148), .A0N(\mem[6][4] ), .A1N(n148), .Y(
        n242) );
  OAI2BB2X1M U278 ( .B0(n401), .B1(n148), .A0N(\mem[6][5] ), .A1N(n148), .Y(
        n243) );
  OAI2BB2X1M U279 ( .B0(n400), .B1(n148), .A0N(\mem[6][6] ), .A1N(n148), .Y(
        n244) );
  OAI2BB2X1M U280 ( .B0(n399), .B1(n148), .A0N(\mem[6][7] ), .A1N(n148), .Y(
        n245) );
  OAI2BB2X1M U281 ( .B0(n406), .B1(n150), .A0N(\mem[5][0] ), .A1N(n150), .Y(
        n246) );
  OAI2BB2X1M U282 ( .B0(n405), .B1(n150), .A0N(\mem[5][1] ), .A1N(n150), .Y(
        n247) );
  OAI2BB2X1M U283 ( .B0(n404), .B1(n150), .A0N(\mem[5][2] ), .A1N(n150), .Y(
        n248) );
  OAI2BB2X1M U284 ( .B0(n403), .B1(n150), .A0N(\mem[5][3] ), .A1N(n150), .Y(
        n249) );
  OAI2BB2X1M U285 ( .B0(n402), .B1(n150), .A0N(\mem[5][4] ), .A1N(n150), .Y(
        n250) );
  OAI2BB2X1M U286 ( .B0(n401), .B1(n150), .A0N(\mem[5][5] ), .A1N(n150), .Y(
        n251) );
  OAI2BB2X1M U287 ( .B0(n400), .B1(n150), .A0N(\mem[5][6] ), .A1N(n150), .Y(
        n252) );
  OAI2BB2X1M U288 ( .B0(n399), .B1(n150), .A0N(\mem[5][7] ), .A1N(n150), .Y(
        n253) );
  OAI2BB2X1M U289 ( .B0(n406), .B1(n152), .A0N(\mem[4][0] ), .A1N(n152), .Y(
        n254) );
  OAI2BB2X1M U290 ( .B0(n405), .B1(n152), .A0N(\mem[4][1] ), .A1N(n152), .Y(
        n255) );
  OAI2BB2X1M U291 ( .B0(n404), .B1(n152), .A0N(\mem[4][2] ), .A1N(n152), .Y(
        n256) );
  OAI2BB2X1M U292 ( .B0(n403), .B1(n152), .A0N(\mem[4][3] ), .A1N(n152), .Y(
        n257) );
  OAI2BB2X1M U293 ( .B0(n402), .B1(n152), .A0N(\mem[4][4] ), .A1N(n152), .Y(
        n258) );
  OAI2BB2X1M U294 ( .B0(n401), .B1(n152), .A0N(\mem[4][5] ), .A1N(n152), .Y(
        n259) );
  OAI2BB2X1M U295 ( .B0(n400), .B1(n152), .A0N(\mem[4][6] ), .A1N(n152), .Y(
        n260) );
  OAI2BB2X1M U296 ( .B0(n399), .B1(n152), .A0N(\mem[4][7] ), .A1N(n152), .Y(
        n261) );
  NOR2BX2M U297 ( .AN(winc), .B(wfull), .Y(n159) );
  AND2X2M U298 ( .A(n165), .B(waddr[0]), .Y(n142) );
  AND2X2M U299 ( .A(n157), .B(waddr[0]), .Y(n147) );
  NOR2BX2M U300 ( .AN(n159), .B(waddr[3]), .Y(n157) );
  AND2X2M U301 ( .A(waddr[3]), .B(n159), .Y(n165) );
  INVX2M U302 ( .A(N13), .Y(n388) );
  INVX2M U303 ( .A(N12), .Y(n389) );
  AND2X2M U304 ( .A(waddr[2]), .B(waddr[1]), .Y(n146) );
  AND2X2M U305 ( .A(waddr[2]), .B(n398), .Y(n151) );
  INVX2M U306 ( .A(waddr[1]), .Y(n398) );
  INVX2M U307 ( .A(waddr[0]), .Y(n397) );
  AOI22X1M U308 ( .A0(\mem[10][0] ), .A1(n393), .B0(\mem[11][0] ), .B1(n392), 
        .Y(n134) );
  AOI22X1M U309 ( .A0(\mem[8][0] ), .A1(n396), .B0(\mem[9][0] ), .B1(n394), 
        .Y(n133) );
  CLKNAND2X2M U310 ( .A(N13), .B(n389), .Y(n372) );
  AOI21X1M U311 ( .A0(n134), .A1(n133), .B0(n372), .Y(n299) );
  AOI22X1M U312 ( .A0(\mem[14][0] ), .A1(n393), .B0(\mem[15][0] ), .B1(n392), 
        .Y(n136) );
  AOI22X1M U313 ( .A0(\mem[12][0] ), .A1(n396), .B0(\mem[13][0] ), .B1(n394), 
        .Y(n135) );
  CLKNAND2X2M U314 ( .A(N13), .B(N12), .Y(n375) );
  AOI21X1M U315 ( .A0(n136), .A1(n135), .B0(n375), .Y(n298) );
  AOI22X1M U316 ( .A0(\mem[2][0] ), .A1(n393), .B0(\mem[3][0] ), .B1(n392), 
        .Y(n138) );
  AOI22X1M U317 ( .A0(\mem[0][0] ), .A1(n396), .B0(\mem[1][0] ), .B1(n394), 
        .Y(n137) );
  CLKNAND2X2M U318 ( .A(n389), .B(n388), .Y(n378) );
  AOI21X1M U319 ( .A0(n138), .A1(n137), .B0(n378), .Y(n297) );
  AOI22X1M U320 ( .A0(\mem[6][0] ), .A1(n393), .B0(\mem[7][0] ), .B1(n392), 
        .Y(n295) );
  AOI22X1M U321 ( .A0(\mem[4][0] ), .A1(n396), .B0(\mem[5][0] ), .B1(n394), 
        .Y(n294) );
  CLKNAND2X2M U322 ( .A(N12), .B(n388), .Y(n381) );
  AOI21X1M U323 ( .A0(n295), .A1(n294), .B0(n381), .Y(n296) );
  OR4X1M U324 ( .A(n299), .B(n298), .C(n297), .D(n296), .Y(rdata[0]) );
  AOI22X1M U325 ( .A0(\mem[10][1] ), .A1(n393), .B0(\mem[11][1] ), .B1(n392), 
        .Y(n301) );
  AOI22X1M U326 ( .A0(\mem[8][1] ), .A1(n396), .B0(\mem[9][1] ), .B1(n394), 
        .Y(n300) );
  AOI21X1M U327 ( .A0(n301), .A1(n300), .B0(n372), .Y(n311) );
  AOI22X1M U328 ( .A0(\mem[14][1] ), .A1(n393), .B0(\mem[15][1] ), .B1(n392), 
        .Y(n303) );
  AOI22X1M U329 ( .A0(\mem[12][1] ), .A1(n396), .B0(\mem[13][1] ), .B1(n394), 
        .Y(n302) );
  AOI21X1M U330 ( .A0(n303), .A1(n302), .B0(n375), .Y(n310) );
  AOI22X1M U331 ( .A0(\mem[2][1] ), .A1(n393), .B0(\mem[3][1] ), .B1(n392), 
        .Y(n305) );
  AOI22X1M U332 ( .A0(\mem[0][1] ), .A1(n396), .B0(\mem[1][1] ), .B1(n394), 
        .Y(n304) );
  AOI21X1M U333 ( .A0(n305), .A1(n304), .B0(n378), .Y(n309) );
  AOI22X1M U334 ( .A0(\mem[6][1] ), .A1(n393), .B0(\mem[7][1] ), .B1(n392), 
        .Y(n307) );
  AOI22X1M U335 ( .A0(\mem[4][1] ), .A1(n396), .B0(\mem[5][1] ), .B1(n394), 
        .Y(n306) );
  AOI21X1M U336 ( .A0(n307), .A1(n306), .B0(n381), .Y(n308) );
  OR4X1M U337 ( .A(n311), .B(n310), .C(n309), .D(n308), .Y(rdata[1]) );
  AOI22X1M U338 ( .A0(\mem[10][2] ), .A1(n393), .B0(\mem[11][2] ), .B1(n392), 
        .Y(n313) );
  AOI22X1M U339 ( .A0(\mem[8][2] ), .A1(n396), .B0(\mem[9][2] ), .B1(n394), 
        .Y(n312) );
  AOI21X1M U340 ( .A0(n313), .A1(n312), .B0(n372), .Y(n323) );
  AOI22X1M U341 ( .A0(\mem[14][2] ), .A1(n393), .B0(\mem[15][2] ), .B1(n392), 
        .Y(n315) );
  AOI22X1M U342 ( .A0(\mem[12][2] ), .A1(n396), .B0(\mem[13][2] ), .B1(n394), 
        .Y(n314) );
  AOI21X1M U343 ( .A0(n315), .A1(n314), .B0(n375), .Y(n322) );
  AOI22X1M U344 ( .A0(\mem[2][2] ), .A1(n393), .B0(\mem[3][2] ), .B1(n392), 
        .Y(n317) );
  AOI22X1M U345 ( .A0(\mem[0][2] ), .A1(n396), .B0(\mem[1][2] ), .B1(n394), 
        .Y(n316) );
  AOI21X1M U346 ( .A0(n317), .A1(n316), .B0(n378), .Y(n321) );
  AOI22X1M U347 ( .A0(\mem[6][2] ), .A1(n393), .B0(\mem[7][2] ), .B1(n392), 
        .Y(n319) );
  AOI22X1M U348 ( .A0(\mem[4][2] ), .A1(n396), .B0(\mem[5][2] ), .B1(n394), 
        .Y(n318) );
  AOI21X1M U349 ( .A0(n319), .A1(n318), .B0(n381), .Y(n320) );
  OR4X1M U350 ( .A(n323), .B(n322), .C(n321), .D(n320), .Y(rdata[2]) );
  AOI22X1M U351 ( .A0(\mem[10][3] ), .A1(n393), .B0(\mem[11][3] ), .B1(n392), 
        .Y(n325) );
  AOI22X1M U352 ( .A0(\mem[8][3] ), .A1(n396), .B0(\mem[9][3] ), .B1(n394), 
        .Y(n324) );
  AOI21X1M U353 ( .A0(n325), .A1(n324), .B0(n372), .Y(n335) );
  AOI22X1M U354 ( .A0(\mem[14][3] ), .A1(n393), .B0(\mem[15][3] ), .B1(n392), 
        .Y(n327) );
  AOI22X1M U355 ( .A0(\mem[12][3] ), .A1(n396), .B0(\mem[13][3] ), .B1(n394), 
        .Y(n326) );
  AOI21X1M U356 ( .A0(n327), .A1(n326), .B0(n375), .Y(n334) );
  AOI22X1M U357 ( .A0(\mem[2][3] ), .A1(n393), .B0(\mem[3][3] ), .B1(n392), 
        .Y(n329) );
  AOI22X1M U358 ( .A0(\mem[0][3] ), .A1(n396), .B0(\mem[1][3] ), .B1(n394), 
        .Y(n328) );
  AOI21X1M U359 ( .A0(n329), .A1(n328), .B0(n378), .Y(n333) );
  AOI22X1M U360 ( .A0(\mem[6][3] ), .A1(n393), .B0(\mem[7][3] ), .B1(n392), 
        .Y(n331) );
  AOI22X1M U361 ( .A0(\mem[4][3] ), .A1(n396), .B0(\mem[5][3] ), .B1(n394), 
        .Y(n330) );
  AOI21X1M U362 ( .A0(n331), .A1(n330), .B0(n381), .Y(n332) );
  OR4X1M U363 ( .A(n335), .B(n334), .C(n333), .D(n332), .Y(rdata[3]) );
  AOI22X1M U364 ( .A0(\mem[10][4] ), .A1(n393), .B0(\mem[11][4] ), .B1(n392), 
        .Y(n337) );
  AOI22X1M U365 ( .A0(\mem[8][4] ), .A1(n396), .B0(\mem[9][4] ), .B1(n394), 
        .Y(n336) );
  AOI21X1M U366 ( .A0(n337), .A1(n336), .B0(n372), .Y(n347) );
  AOI22X1M U367 ( .A0(\mem[14][4] ), .A1(n393), .B0(\mem[15][4] ), .B1(n392), 
        .Y(n339) );
  AOI22X1M U368 ( .A0(\mem[12][4] ), .A1(n396), .B0(\mem[13][4] ), .B1(n394), 
        .Y(n338) );
  AOI21X1M U369 ( .A0(n339), .A1(n338), .B0(n375), .Y(n346) );
  AOI22X1M U370 ( .A0(\mem[2][4] ), .A1(n393), .B0(\mem[3][4] ), .B1(n392), 
        .Y(n341) );
  AOI22X1M U371 ( .A0(\mem[0][4] ), .A1(n396), .B0(\mem[1][4] ), .B1(n394), 
        .Y(n340) );
  AOI21X1M U372 ( .A0(n341), .A1(n340), .B0(n378), .Y(n345) );
  AOI22X1M U373 ( .A0(\mem[6][4] ), .A1(n393), .B0(\mem[7][4] ), .B1(n392), 
        .Y(n343) );
  AOI22X1M U374 ( .A0(\mem[4][4] ), .A1(n396), .B0(\mem[5][4] ), .B1(n394), 
        .Y(n342) );
  AOI21X1M U375 ( .A0(n343), .A1(n342), .B0(n381), .Y(n344) );
  OR4X1M U376 ( .A(n347), .B(n346), .C(n345), .D(n344), .Y(rdata[4]) );
  AOI22X1M U377 ( .A0(\mem[10][5] ), .A1(n393), .B0(\mem[11][5] ), .B1(n392), 
        .Y(n349) );
  AOI22X1M U378 ( .A0(\mem[8][5] ), .A1(n396), .B0(\mem[9][5] ), .B1(n394), 
        .Y(n348) );
  AOI21X1M U379 ( .A0(n349), .A1(n348), .B0(n372), .Y(n359) );
  AOI22X1M U380 ( .A0(\mem[14][5] ), .A1(n393), .B0(\mem[15][5] ), .B1(n392), 
        .Y(n351) );
  AOI22X1M U381 ( .A0(\mem[12][5] ), .A1(n396), .B0(\mem[13][5] ), .B1(n394), 
        .Y(n350) );
  AOI21X1M U382 ( .A0(n351), .A1(n350), .B0(n375), .Y(n358) );
  AOI22X1M U383 ( .A0(\mem[2][5] ), .A1(n393), .B0(\mem[3][5] ), .B1(n392), 
        .Y(n353) );
  AOI22X1M U384 ( .A0(\mem[0][5] ), .A1(n396), .B0(\mem[1][5] ), .B1(n394), 
        .Y(n352) );
  AOI21X1M U385 ( .A0(n353), .A1(n352), .B0(n378), .Y(n357) );
  AOI22X1M U386 ( .A0(\mem[6][5] ), .A1(n393), .B0(\mem[7][5] ), .B1(n392), 
        .Y(n355) );
  AOI22X1M U387 ( .A0(\mem[4][5] ), .A1(n396), .B0(\mem[5][5] ), .B1(n394), 
        .Y(n354) );
  AOI21X1M U388 ( .A0(n355), .A1(n354), .B0(n381), .Y(n356) );
  OR4X1M U389 ( .A(n359), .B(n358), .C(n357), .D(n356), .Y(rdata[5]) );
  AOI22X1M U390 ( .A0(\mem[10][6] ), .A1(n393), .B0(\mem[11][6] ), .B1(n392), 
        .Y(n361) );
  AOI22X1M U391 ( .A0(\mem[8][6] ), .A1(n396), .B0(\mem[9][6] ), .B1(n394), 
        .Y(n360) );
  AOI21X1M U392 ( .A0(n361), .A1(n360), .B0(n372), .Y(n371) );
  AOI22X1M U393 ( .A0(\mem[14][6] ), .A1(n393), .B0(\mem[15][6] ), .B1(n392), 
        .Y(n363) );
  AOI22X1M U394 ( .A0(\mem[12][6] ), .A1(n396), .B0(\mem[13][6] ), .B1(n394), 
        .Y(n362) );
  AOI21X1M U395 ( .A0(n363), .A1(n362), .B0(n375), .Y(n370) );
  AOI22X1M U396 ( .A0(\mem[2][6] ), .A1(n393), .B0(\mem[3][6] ), .B1(n392), 
        .Y(n365) );
  AOI22X1M U397 ( .A0(\mem[0][6] ), .A1(n396), .B0(\mem[1][6] ), .B1(n394), 
        .Y(n364) );
  AOI21X1M U398 ( .A0(n365), .A1(n364), .B0(n378), .Y(n369) );
  AOI22X1M U399 ( .A0(\mem[6][6] ), .A1(n393), .B0(\mem[7][6] ), .B1(n392), 
        .Y(n367) );
  AOI22X1M U400 ( .A0(\mem[4][6] ), .A1(n396), .B0(\mem[5][6] ), .B1(n394), 
        .Y(n366) );
  AOI21X1M U401 ( .A0(n367), .A1(n366), .B0(n381), .Y(n368) );
  OR4X1M U402 ( .A(n371), .B(n370), .C(n369), .D(n368), .Y(rdata[6]) );
  AOI22X1M U403 ( .A0(\mem[10][7] ), .A1(n393), .B0(\mem[11][7] ), .B1(n392), 
        .Y(n374) );
  AOI22X1M U404 ( .A0(\mem[8][7] ), .A1(n396), .B0(\mem[9][7] ), .B1(n394), 
        .Y(n373) );
  AOI21X1M U405 ( .A0(n374), .A1(n373), .B0(n372), .Y(n387) );
  AOI22X1M U406 ( .A0(\mem[14][7] ), .A1(n393), .B0(\mem[15][7] ), .B1(n392), 
        .Y(n377) );
  AOI22X1M U407 ( .A0(\mem[12][7] ), .A1(n396), .B0(\mem[13][7] ), .B1(n394), 
        .Y(n376) );
  AOI21X1M U408 ( .A0(n377), .A1(n376), .B0(n375), .Y(n386) );
  AOI22X1M U409 ( .A0(\mem[2][7] ), .A1(n393), .B0(\mem[3][7] ), .B1(n392), 
        .Y(n380) );
  AOI22X1M U410 ( .A0(\mem[0][7] ), .A1(n396), .B0(\mem[1][7] ), .B1(n394), 
        .Y(n379) );
  AOI21X1M U411 ( .A0(n380), .A1(n379), .B0(n378), .Y(n385) );
  AOI22X1M U412 ( .A0(\mem[6][7] ), .A1(n393), .B0(\mem[7][7] ), .B1(n392), 
        .Y(n383) );
  AOI22X1M U413 ( .A0(\mem[4][7] ), .A1(n396), .B0(\mem[5][7] ), .B1(n394), 
        .Y(n382) );
  AOI21X1M U414 ( .A0(n383), .A1(n382), .B0(n381), .Y(n384) );
  OR4X1M U415 ( .A(n387), .B(n386), .C(n385), .D(n384), .Y(rdata[7]) );
  DLY1X1M U416 ( .A(test_se), .Y(n410) );
  DLY1X1M U417 ( .A(test_se), .Y(n411) );
  DLY1X1M U418 ( .A(test_se), .Y(n412) );
  DLY1X1M U419 ( .A(test_se), .Y(n413) );
  DLY1X1M U420 ( .A(test_se), .Y(n414) );
endmodule


module ASYNC_FIFO_TOP_test_1 ( wclk, wrst_n, winc, wdata, wfull, rclk, rrst_n, 
        rinc, rdata, rempty, test_si2, test_si1, test_so2, test_so1, test_se
 );
  input [7:0] wdata;
  output [7:0] rdata;
  input wclk, wrst_n, winc, rclk, rrst_n, rinc, test_si2, test_si1, test_se;
  output wfull, rempty, test_so2, test_so1;
  wire   n1, n2, n3, n4, n6;
  wire   [4:0] wq2_rptr;
  wire   [3:0] waddr;
  wire   [4:0] wptr;
  wire   [4:0] rq2_wptr;
  wire   [3:0] raddr;
  wire   [4:0] rptr;
  assign test_so2 = rq2_wptr[4];

  INVX2M U1 ( .A(n4), .Y(n3) );
  INVX2M U2 ( .A(wrst_n), .Y(n4) );
  INVX2M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(rrst_n), .Y(n2) );
  FIFO_WR_test_1 u_fifo_wr ( .wclk(wclk), .wrst_n(n3), .winc(winc), .wq2_rptr(
        wq2_rptr), .wfull(wfull), .waddr(waddr), .wptr(wptr), .test_si(rptr[4]), .test_se(test_se) );
  FIFO_RD_test_1 u_fifo_rd ( .rclk(rclk), .rrst_n(n1), .rinc(rinc), .rq2_wptr(
        rq2_wptr), .rempty(rempty), .raddr(raddr), .rptr(rptr), .test_si(
        test_si1), .test_se(test_se) );
  DF_SYNC_test_0 u_sync_r2w ( .ptr_in(rptr), .clk(wclk), .rst_n(n3), .ptr_out(
        wq2_rptr), .test_si(n6), .test_se(test_se) );
  DF_SYNC_test_1 u_sync_w2r ( .ptr_in(wptr), .clk(rclk), .rst_n(n1), .ptr_out(
        rq2_wptr), .test_si(wq2_rptr[4]), .test_se(test_se) );
  FIFO_MEM_CNTRL_test_1 u_mem ( .wdata(wdata), .winc(winc), .wfull(wfull), 
        .waddr(waddr), .raddr(raddr), .wclk(wclk), .rdata(rdata), .test_si2(
        test_si2), .test_si1(wptr[4]), .test_so2(n6), .test_so1(test_so1), 
        .test_se(test_se) );
endmodule


module Serializer_test_1 ( P_Data, ser_en, data_valid, busy, clk, RST, 
        ser_data, ser_done, test_si, test_so, test_se );
  input [7:0] P_Data;
  input ser_en, data_valid, busy, clk, RST, test_si, test_se;
  output ser_data, ser_done, test_so;
  wire   done_next, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n13, n14, n15, n16, n38;
  wire   [7:1] shift_reg;
  wire   [2:0] bit_count;
  wire   [2:0] count_next;
  assign test_so = shift_reg[7];

  SDFFRQX2M \shift_reg_reg[6]  ( .D(n32), .SI(shift_reg[5]), .SE(test_se), 
        .CK(clk), .RN(RST), .Q(shift_reg[6]) );
  SDFFRQX2M \shift_reg_reg[5]  ( .D(n33), .SI(shift_reg[4]), .SE(test_se), 
        .CK(clk), .RN(RST), .Q(shift_reg[5]) );
  SDFFRQX2M \shift_reg_reg[4]  ( .D(n34), .SI(shift_reg[3]), .SE(test_se), 
        .CK(clk), .RN(RST), .Q(shift_reg[4]) );
  SDFFRQX2M \shift_reg_reg[3]  ( .D(n35), .SI(shift_reg[2]), .SE(test_se), 
        .CK(clk), .RN(RST), .Q(shift_reg[3]) );
  SDFFRQX2M \shift_reg_reg[2]  ( .D(n36), .SI(shift_reg[1]), .SE(test_se), 
        .CK(clk), .RN(RST), .Q(shift_reg[2]) );
  SDFFRQX2M \shift_reg_reg[1]  ( .D(n37), .SI(ser_data), .SE(test_se), .CK(clk), .RN(RST), .Q(shift_reg[1]) );
  SDFFRQX2M \shift_reg_reg[7]  ( .D(n31), .SI(shift_reg[6]), .SE(test_se), 
        .CK(clk), .RN(RST), .Q(shift_reg[7]) );
  SDFFRQX2M \shift_reg_reg[0]  ( .D(n30), .SI(ser_done), .SE(test_se), .CK(clk), .RN(RST), .Q(ser_data) );
  SDFFRQX2M ser_done_reg ( .D(done_next), .SI(bit_count[2]), .SE(test_se), 
        .CK(clk), .RN(RST), .Q(ser_done) );
  SDFFRQX2M \bit_count_reg[1]  ( .D(count_next[1]), .SI(bit_count[0]), .SE(
        test_se), .CK(clk), .RN(RST), .Q(bit_count[1]) );
  SDFFRQX2M \bit_count_reg[2]  ( .D(count_next[2]), .SI(bit_count[1]), .SE(
        test_se), .CK(clk), .RN(RST), .Q(bit_count[2]) );
  SDFFRQX2M \bit_count_reg[0]  ( .D(count_next[0]), .SI(test_si), .SE(test_se), 
        .CK(clk), .RN(RST), .Q(bit_count[0]) );
  NOR2X2M U15 ( .A(n17), .B(n13), .Y(n19) );
  NOR2X2M U16 ( .A(ser_en), .B(n13), .Y(n17) );
  OAI211X2M U17 ( .A0(n16), .A1(n38), .B0(n14), .C0(ser_en), .Y(n28) );
  INVX2M U18 ( .A(n13), .Y(n14) );
  BUFX2M U19 ( .A(n20), .Y(n13) );
  NOR2BX2M U20 ( .AN(data_valid), .B(busy), .Y(n20) );
  OAI32X1M U21 ( .A0(n15), .A1(n16), .A2(n28), .B0(n38), .B1(n28), .Y(
        count_next[2]) );
  INVX2M U22 ( .A(bit_count[0]), .Y(n15) );
  OAI2BB1X2M U23 ( .A0N(n17), .A1N(shift_reg[6]), .B0(n21), .Y(n32) );
  AOI22X1M U24 ( .A0(shift_reg[7]), .A1(n19), .B0(P_Data[6]), .B1(n13), .Y(n21) );
  OAI2BB1X2M U25 ( .A0N(n17), .A1N(shift_reg[2]), .B0(n25), .Y(n36) );
  AOI22X1M U26 ( .A0(shift_reg[3]), .A1(n19), .B0(P_Data[2]), .B1(n13), .Y(n25) );
  OAI2BB1X2M U27 ( .A0N(n17), .A1N(shift_reg[3]), .B0(n24), .Y(n35) );
  AOI22X1M U28 ( .A0(shift_reg[4]), .A1(n19), .B0(P_Data[3]), .B1(n13), .Y(n24) );
  OAI2BB1X2M U29 ( .A0N(ser_data), .A1N(n17), .B0(n18), .Y(n30) );
  AOI22X1M U30 ( .A0(shift_reg[1]), .A1(n19), .B0(P_Data[0]), .B1(n13), .Y(n18) );
  OAI2BB1X2M U31 ( .A0N(n17), .A1N(shift_reg[4]), .B0(n23), .Y(n34) );
  AOI22X1M U32 ( .A0(shift_reg[5]), .A1(n19), .B0(P_Data[4]), .B1(n13), .Y(n23) );
  OAI2BB1X2M U33 ( .A0N(shift_reg[1]), .A1N(n17), .B0(n26), .Y(n37) );
  AOI22X1M U34 ( .A0(shift_reg[2]), .A1(n19), .B0(P_Data[1]), .B1(n13), .Y(n26) );
  OAI2BB1X2M U35 ( .A0N(n17), .A1N(shift_reg[5]), .B0(n22), .Y(n33) );
  AOI22X1M U36 ( .A0(shift_reg[6]), .A1(n19), .B0(P_Data[5]), .B1(n13), .Y(n22) );
  AO22X1M U37 ( .A0(n17), .A1(shift_reg[7]), .B0(P_Data[7]), .B1(n13), .Y(n31)
         );
  NOR4X1M U38 ( .A(n27), .B(n16), .C(bit_count[0]), .D(n13), .Y(done_next) );
  NAND2X2M U39 ( .A(ser_en), .B(bit_count[2]), .Y(n27) );
  NOR2X2M U40 ( .A(n29), .B(n28), .Y(count_next[1]) );
  XNOR2X2M U41 ( .A(bit_count[0]), .B(bit_count[1]), .Y(n29) );
  NOR2X2M U42 ( .A(bit_count[0]), .B(n28), .Y(count_next[0]) );
  INVX2M U43 ( .A(bit_count[1]), .Y(n16) );
  INVX2M U44 ( .A(bit_count[2]), .Y(n38) );
endmodule


module Fsm_tx_test_1 ( data_valid, par_en, ser_done, clk, rst, busy, ser_en, 
        mux_sel, test_si, test_so, test_se );
  output [1:0] mux_sel;
  input data_valid, par_en, ser_done, clk, rst, test_si, test_se;
  output busy, ser_en, test_so;
  wire   n10, n11, n12, n13, n14, n15, n16, n5, n6, n7, n8, n9;
  wire   [2:0] current_State;
  wire   [2:0] next_state;
  assign test_so = current_State[2];

  SDFFRQX2M \current_State_reg[2]  ( .D(next_state[2]), .SI(current_State[1]), 
        .SE(test_se), .CK(clk), .RN(rst), .Q(current_State[2]) );
  SDFFRQX2M \current_State_reg[0]  ( .D(next_state[0]), .SI(test_si), .SE(
        test_se), .CK(clk), .RN(rst), .Q(current_State[0]) );
  SDFFRQX2M \current_State_reg[1]  ( .D(next_state[1]), .SI(current_State[0]), 
        .SE(test_se), .CK(clk), .RN(rst), .Q(current_State[1]) );
  INVX2M U6 ( .A(mux_sel[1]), .Y(n5) );
  AND2X2M U7 ( .A(n11), .B(n7), .Y(n14) );
  INVX2M U8 ( .A(n12), .Y(ser_en) );
  NOR2X2M U9 ( .A(n6), .B(current_State[2]), .Y(mux_sel[1]) );
  NAND3X2M U10 ( .A(n11), .B(n5), .C(n16), .Y(busy) );
  NAND3BX2M U11 ( .AN(current_State[0]), .B(n6), .C(current_State[2]), .Y(n16)
         );
  INVX2M U12 ( .A(current_State[1]), .Y(n6) );
  OAI32X1M U13 ( .A0(n5), .A1(current_State[0]), .A2(n10), .B0(
        current_State[1]), .B1(n11), .Y(next_state[1]) );
  OAI31X1M U14 ( .A0(n9), .A1(n8), .A2(n12), .B0(n13), .Y(next_state[0]) );
  INVX2M U15 ( .A(par_en), .Y(n9) );
  NAND3X2M U16 ( .A(n14), .B(n6), .C(data_valid), .Y(n13) );
  NOR2X2M U17 ( .A(n8), .B(par_en), .Y(n10) );
  NAND2X2M U18 ( .A(current_State[0]), .B(n7), .Y(n11) );
  NAND2X2M U19 ( .A(n14), .B(current_State[1]), .Y(n12) );
  INVX2M U20 ( .A(current_State[2]), .Y(n7) );
  AOI2BB1X2M U21 ( .A0N(current_State[0]), .A1N(n10), .B0(n5), .Y(
        next_state[2]) );
  INVX2M U22 ( .A(ser_done), .Y(n8) );
  NAND2X2M U23 ( .A(n15), .B(n7), .Y(mux_sel[0]) );
  XNOR2X2M U24 ( .A(n6), .B(current_State[0]), .Y(n15) );
endmodule


module parity_cal_test_1 ( clk, RST, P_Data, busy, Data_Valid, par_typ, 
        par_bit, test_si, test_se );
  input [7:0] P_Data;
  input clk, RST, busy, Data_Valid, par_typ, test_si, test_se;
  output par_bit;
  wire   n1, n2, n3, n4, n5, n6, n8;

  SDFFRQX2M par_bit_reg ( .D(n8), .SI(test_si), .SE(test_se), .CK(clk), .RN(
        RST), .Q(par_bit) );
  XNOR2X2M U2 ( .A(P_Data[3]), .B(P_Data[2]), .Y(n5) );
  XOR3XLM U3 ( .A(P_Data[5]), .B(P_Data[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U4 ( .A(P_Data[7]), .B(P_Data[6]), .Y(n6) );
  OAI2BB2X1M U5 ( .B0(n1), .B1(n2), .A0N(par_bit), .A1N(n2), .Y(n8) );
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
  NAND3X2M U4 ( .A(mux_sel[1]), .B(n1), .C(ser_data), .Y(n3) );
  NOR2BX2M U5 ( .AN(mux_sel[1]), .B(par_bit), .Y(n2) );
  INVX2M U6 ( .A(mux_sel[0]), .Y(n1) );
endmodule


module UART_TX_Top_test_1 ( p_data_top, data_valid_top, par_en_top, 
        par_typ_top, clk_top, RST_top, TX_out_top, busy_top, test_si, test_so, 
        test_se );
  input [7:0] p_data_top;
  input data_valid_top, par_en_top, par_typ_top, clk_top, RST_top, test_si,
         test_se;
  output TX_out_top, busy_top, test_so;
  wire   ser_data_top, ser_done_top, ser_en_top, par_bit_top, n2, n3;
  wire   [1:0] mux_sel_top;
  assign test_so = par_bit_top;

  Serializer_test_1 dut0 ( .P_Data(p_data_top), .ser_en(ser_en_top), 
        .data_valid(data_valid_top), .busy(busy_top), .clk(clk_top), .RST(
        RST_top), .ser_data(ser_data_top), .ser_done(ser_done_top), .test_si(
        test_si), .test_so(n3), .test_se(test_se) );
  Fsm_tx_test_1 dut1 ( .data_valid(data_valid_top), .par_en(par_en_top), 
        .ser_done(ser_done_top), .clk(clk_top), .rst(RST_top), .busy(busy_top), 
        .ser_en(ser_en_top), .mux_sel(mux_sel_top), .test_si(n3), .test_so(n2), 
        .test_se(test_se) );
  parity_cal_test_1 dut2 ( .clk(clk_top), .RST(RST_top), .P_Data(p_data_top), 
        .busy(busy_top), .Data_Valid(data_valid_top), .par_typ(par_typ_top), 
        .par_bit(par_bit_top), .test_si(n2), .test_se(test_se) );
  Mux_4x1 dut3 ( .mux_sel(mux_sel_top), .ser_data(ser_data_top), .par_bit(
        par_bit_top), .tx_out_mux(TX_out_top) );
endmodule


module PULSE_GEN_test_1 ( CLK, RST, LVL_SIG, PULSE_SIG, test_si, test_se );
  input CLK, RST, LVL_SIG, test_si, test_se;
  output PULSE_SIG;
  wire   lvl_d, N1;

  SDFFRQX2M lvl_d_reg ( .D(LVL_SIG), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(lvl_d) );
  SDFFRQX2M pulse_r_reg ( .D(N1), .SI(lvl_d), .SE(test_se), .CK(CLK), .RN(RST), 
        .Q(PULSE_SIG) );
  NOR2BX2M U5 ( .AN(LVL_SIG), .B(lvl_d), .Y(N1) );
endmodule


module SYS_TOP ( scan_clk, scan_rst, test_mode, SE, SI, SO, RST_N, UART_CLK, 
        REF_CLK, UART_RX_IN, UART_TX_O, parity_error, framing_error );
  input [3:0] SI;
  output [3:0] SO;
  input scan_clk, scan_rst, test_mode, SE, RST_N, UART_CLK, REF_CLK,
         UART_RX_IN;
  output UART_TX_O, parity_error, framing_error;
  wire   REF_CLK_M, UART_CLK_M, UART_TX_CLK, UART_TX_CLK_M, ALU_CLK, ALU_CLK_M,
         RST_N_M, RST_SYNC_1_M, RST_SYNC_1, RST_SYNC_2_M, RST_SYNC_2, WrEn,
         RdEn, RdData_Valid, ALU_OUT_VALID, RX_SYNC_VLD, FIFO_FULL, ALU_EN,
         CLK_EN, TX_D_VLD, FIFO_RD_INC, FIFO_EMPTY, TX_BUSY, n3, n4, n5, n7,
         n8, n9, n10, n14, n15, n18, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32;
  wire   [4:0] Address;
  wire   [7:0] WrData;
  wire   [7:0] RdData;
  wire   [7:0] REG0;
  wire   [7:0] REG1;
  wire   [7:0] REG2;
  wire   [7:0] REG3;
  wire   [15:0] ALU_OUT;
  wire   [7:0] RX_SYNC_DATA;
  wire   [3:0] ALU_FUN;
  wire   [7:0] TX_P_DATA;
  wire   [7:0] RX_P_DATA;
  wire   [7:0] FIFO_RD_DATA;
  assign SO[1] = REG0[3];

  CLKMX2X4M u_mux_ref_clk ( .A(REF_CLK), .B(scan_clk), .S0(test_mode), .Y(
        REF_CLK_M) );
  CLKMX2X4M u_mux_uart_clk ( .A(UART_CLK), .B(scan_clk), .S0(test_mode), .Y(
        UART_CLK_M) );
  CLKMX2X4M u_mux_uart_tx_clk ( .A(UART_TX_CLK), .B(scan_clk), .S0(test_mode), 
        .Y(UART_TX_CLK_M) );
  CLKMX2X4M u_mux_alu_clk ( .A(ALU_CLK), .B(scan_clk), .S0(test_mode), .Y(
        ALU_CLK_M) );
  TLATNCAX4M u_clk_gate ( .E(CLK_EN), .CK(REF_CLK_M), .ECK(ALU_CLK) );
  INVX2M U5 ( .A(n4), .Y(n3) );
  INVX2M U6 ( .A(FIFO_EMPTY), .Y(n5) );
  MX2X2M U7 ( .A(RST_N), .B(scan_rst), .S0(test_mode), .Y(RST_N_M) );
  MX2X2M U8 ( .A(RST_SYNC_1), .B(scan_rst), .S0(test_mode), .Y(RST_SYNC_1_M)
         );
  INVX2M U9 ( .A(RST_SYNC_2_M), .Y(n4) );
  MX2X2M U10 ( .A(RST_SYNC_2), .B(scan_rst), .S0(test_mode), .Y(RST_SYNC_2_M)
         );
  DLY1X1M U14 ( .A(n32), .Y(n21) );
  DLY1X1M U15 ( .A(n24), .Y(n22) );
  INVXLM U16 ( .A(n31), .Y(n23) );
  INVXLM U17 ( .A(n23), .Y(n24) );
  INVXLM U18 ( .A(n23), .Y(n25) );
  DLY1X1M U19 ( .A(n32), .Y(n26) );
  DLY1X1M U20 ( .A(n29), .Y(n27) );
  INVXLM U21 ( .A(n32), .Y(n28) );
  INVXLM U22 ( .A(n28), .Y(n29) );
  INVXLM U23 ( .A(SE), .Y(n30) );
  INVXLM U24 ( .A(n30), .Y(n31) );
  INVXLM U25 ( .A(n30), .Y(n32) );
  rst_sych_test_0 u_rst_sync_1 ( .clk(REF_CLK_M), .rst(RST_N_M), .sych_rst(
        RST_SYNC_1), .test_si(n10), .test_se(n27) );
  rst_sych_test_1 u_rst_sync_2 ( .clk(UART_CLK_M), .rst(RST_N_M), .sych_rst(
        RST_SYNC_2), .test_si(RST_SYNC_1), .test_se(n32) );
  regfile_test_1 u_regfile ( .CLK(REF_CLK_M), .RST(RST_SYNC_1_M), .Address(
        Address), .WrEn(WrEn), .RdEn(RdEn), .WrData(WrData), .RdData(RdData), 
        .RdData_Valid(RdData_Valid), .REG0(REG0), .REG1(REG1), .REG2(REG2), 
        .REG3(REG3), .test_si3(SI[3]), .test_si2(SI[2]), .test_si1(FIFO_RD_INC), .test_so2(n10), .test_so1(SO[2]), .test_se(SE) );
  SYS_CTRL_test_1 u_sys_ctrl ( .CLK(REF_CLK_M), .RST(RST_SYNC_1_M), .ALU_OUT(
        ALU_OUT), .OUT_Valid(ALU_OUT_VALID), .RdData_Valid(RdData_Valid), 
        .RdData(RdData), .RX_P_DATA(RX_SYNC_DATA), .RX_D_VLD(RX_SYNC_VLD), 
        .FIFO_FULL(FIFO_FULL), .ALU_FUN(ALU_FUN), .EN(ALU_EN), .CLK_EN(CLK_EN), 
        .Address(Address), .WrEn(WrEn), .RdEn(RdEn), .WrData(WrData), 
        .TX_P_DATA(TX_P_DATA), .TX_D_VLD(TX_D_VLD), .test_si(RST_SYNC_2), 
        .test_so(n9), .test_se(n21) );
  ALU_TOP_test_1 u_alu ( .A(REG0), .B(REG1), .ALU_FUNC(ALU_FUN), .enable(
        ALU_EN), .CLK(ALU_CLK_M), .RST(RST_SYNC_1_M), .ALU_OUT(ALU_OUT), 
        .out_valid(ALU_OUT_VALID), .test_si(SI[0]), .test_so(n18), .test_se(
        n26) );
  clk_divider_test_1 u_clk_divider ( .i_ref_clk(UART_CLK_M), .i_rst_n(n3), 
        .i_clk_en(1'b1), .i_div_ratio(REG3), .o_div_clk(UART_TX_CLK), 
        .test_si(n15), .test_so(n14), .test_se(n32) );
  Top_test_1 u_uart_rx ( .clk(UART_CLK_M), .rst(n3), .RX_IN(UART_RX_IN), 
        .Prescale(REG2[7:2]), .parity_en(REG2[0]), .parity_typ(REG2[1]), 
        .p_data(RX_P_DATA), .stop_error(framing_error), .parity_error(
        parity_error), .test_si2(n7), .test_si1(n9), .test_so1(n8), .test_se(
        n22) );
  data_sync_n8_test_1 u_data_sync ( .Unsync_bus(RX_P_DATA), .bus_en(1'b0), 
        .clk(REF_CLK_M), .rst(RST_SYNC_1_M), .enable_pulse(RX_SYNC_VLD), 
        .sync_bus(RX_SYNC_DATA), .test_si(n14), .test_se(n31) );
  ASYNC_FIFO_TOP_test_1 u_async_fifo ( .wclk(REF_CLK_M), .wrst_n(RST_SYNC_1_M), 
        .winc(TX_D_VLD), .wdata(TX_P_DATA), .wfull(FIFO_FULL), .rclk(
        UART_TX_CLK_M), .rrst_n(n3), .rinc(FIFO_RD_INC), .rdata(FIFO_RD_DATA), 
        .rempty(FIFO_EMPTY), .test_si2(SI[1]), .test_si1(n18), .test_so2(n15), 
        .test_so1(SO[0]), .test_se(SE) );
  UART_TX_Top_test_1 u_uart_tx ( .p_data_top(FIFO_RD_DATA), .data_valid_top(n5), .par_en_top(REG2[0]), .par_typ_top(REG2[1]), .clk_top(UART_TX_CLK_M), 
        .RST_top(n3), .TX_out_top(UART_TX_O), .busy_top(TX_BUSY), .test_si(n8), 
        .test_so(n7), .test_se(n25) );
  PULSE_GEN_test_1 u_pulse_gen ( .CLK(UART_TX_CLK_M), .RST(n3), .LVL_SIG(
        TX_BUSY), .PULSE_SIG(FIFO_RD_INC), .test_si(RX_SYNC_DATA[7]), 
        .test_se(n32) );
  BUFX2M U13 ( .A(parity_error), .Y(SO[3]) );
endmodule

