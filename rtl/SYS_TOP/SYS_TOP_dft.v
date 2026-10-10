
module SYS_TOP # ( parameter DATA_WIDTH = 8 , RF_ADDR = 4 , NUM_OF_CHAINS = 4)


(
 input   wire                              scan_clk ,
 input   wire                              scan_rst ,
 input   wire                              test_mode ,
 input   wire                              SE ,
 input   wire   [NUM_OF_CHAINS-1:0]        SI ,
 output  wire   [NUM_OF_CHAINS-1:0]        SO ,
 input   wire                              RST_N,
 input   wire                              UART_CLK,
 input   wire                              REF_CLK,
 input   wire                              UART_RX_IN,
 output  wire                              UART_TX_O,
 output  wire                              parity_error,
 output  wire                              framing_error
);


wire        REF_CLK_M, UART_CLK_M;      // muxed functional/scan clocks
wire        UART_TX_CLK, UART_TX_CLK_M; // divided clock before/after mux
wire        ALU_CLK, ALU_CLK_M;         // gated ALU clock before/after mux

wire        RST_N_M;                    // reset into the synchronizers
wire        RST_SYNC_1, RST_SYNC_2;     // synchronized resets (before mux)
wire        RST_SYNC_1_M, RST_SYNC_2_M; // synchronized resets (after mux)

wire [7:0]  REG0, REG1, REG2, REG3;
wire [4:0]  Address;
wire        WrEn, RdEn;
wire [7:0]  WrData, RdData;
wire        RdData_Valid;

wire [3:0]  ALU_FUN;
wire        ALU_EN;
wire        CLK_EN;
wire [15:0] ALU_OUT;
wire        ALU_OUT_VALID;

wire [7:0]  RX_P_DATA;
wire        RX_D_VLD;
wire [7:0]  RX_SYNC_DATA;
wire        RX_SYNC_VLD;

wire [7:0]  TX_P_DATA;
wire        TX_D_VLD;
wire        CLK_DIV_EN;

wire [7:0]  FIFO_RD_DATA;
wire        FIFO_FULL;
wire        FIFO_EMPTY;
wire        FIFO_RD_INC;
wire        TX_BUSY;

//////////////////////////// clock muxes ////////////////////////////
// CLKMX2X4M : Y = S0 ? B : A

CLKMX2X4M u_mux_ref_clk (
    .A  (REF_CLK),
    .B  (scan_clk),
    .S0 (test_mode),
    .Y  (REF_CLK_M)
);

CLKMX2X4M u_mux_uart_clk (
    .A  (UART_CLK),
    .B  (scan_clk),
    .S0 (test_mode),
    .Y  (UART_CLK_M)
);

CLKMX2X4M u_mux_uart_tx_clk (          // divided (generated) clock
    .A  (UART_TX_CLK),
    .B  (scan_clk),
    .S0 (test_mode),
    .Y  (UART_TX_CLK_M)
);

CLKMX2X4M u_mux_alu_clk (              // gated clock
    .A  (ALU_CLK),
    .B  (scan_clk),
    .S0 (test_mode),
    .Y  (ALU_CLK_M)
);

//////////////////////////// reset muxes ////////////////////////////

// reset of the synchronizer flops (so they are controllable in test)
assign RST_N_M = test_mode ? scan_rst : RST_N;

// outputs of the reset synchronizers (so downstream resets do not
// toggle while the synchronizer flops are shifting scan data)
assign RST_SYNC_1_M = test_mode ? scan_rst : RST_SYNC_1;
assign RST_SYNC_2_M = test_mode ? scan_rst : RST_SYNC_2;

//////////////////////////// design ////////////////////////////

rst_sych u_rst_sync_1 (
    .clk      (REF_CLK_M),
    .rst      (RST_N_M),
    .sych_rst (RST_SYNC_1)
);

rst_sych u_rst_sync_2 (
    .clk      (UART_CLK_M),
    .rst      (RST_N_M),
    .sych_rst (RST_SYNC_2)
);

regfile u_regfile (
    .CLK          (REF_CLK_M),
    .RST          (RST_SYNC_1_M),
    .Address      (Address),
    .WrEn         (WrEn),
    .RdEn         (RdEn),
    .WrData       (WrData),
    .RdData       (RdData),
    .RdData_Valid (RdData_Valid),
    .REG0         (REG0),
    .REG1         (REG1),
    .REG2         (REG2),
    .REG3         (REG3)
);

SYS_CTRL u_sys_ctrl (
    .CLK           (REF_CLK_M),
    .RST           (RST_SYNC_1_M),
    .ALU_OUT       (ALU_OUT),
    .OUT_Valid     (ALU_OUT_VALID),
    .RdData_Valid  (RdData_Valid),
    .RdData        (RdData),
    .RX_P_DATA     (RX_SYNC_DATA),
    .RX_D_VLD      (RX_SYNC_VLD),
    .FIFO_FULL     (FIFO_FULL),
    .ALU_FUN       (ALU_FUN),
    .EN            (ALU_EN),
    .CLK_EN        (CLK_EN),
    .Address       (Address),
    .WrEn          (WrEn),
    .RdEn          (RdEn),
    .WrData        (WrData),
    .TX_P_DATA     (TX_P_DATA),
    .TX_D_VLD      (TX_D_VLD),
    .clk_div_en    (CLK_DIV_EN)
);

// clock gate: latch clocked by the (muxed) reference clock
TLATNCAX4M u_clk_gate (
    .CK  (REF_CLK_M),
    .E   (CLK_EN),
    .ECK (ALU_CLK)
);

ALU_TOP #(.WIDTH(DATA_WIDTH), .out_width(2*DATA_WIDTH)) u_alu (
    .A         (REG0),
    .B         (REG1),
    .ALU_FUNC  (ALU_FUN),
    .enable    (ALU_EN),
    .CLK       (ALU_CLK_M),
    .RST       (RST_SYNC_1_M),
    .ALU_OUT   (ALU_OUT),
    .out_valid (ALU_OUT_VALID)
);

clk_divider u_clk_divider (
    .i_ref_clk   (UART_CLK_M),
    .i_rst_n     (RST_SYNC_2_M),
    .i_clk_en    (CLK_DIV_EN),
    .i_div_ratio (REG3),
    .o_div_clk   (UART_TX_CLK)
);

Top #(.width_len(DATA_WIDTH)) u_uart_rx (
    .clk            (UART_CLK_M),
    .rst            (RST_SYNC_2_M),
    .RX_IN          (UART_RX_IN),
    .Prescale       (REG2[7:2]),
    .parity_en      (REG2[0]),
    .parity_typ     (REG2[1]),
    .p_data         (RX_P_DATA),
    .data_valid_top (RX_D_VLD),
    .stop_error     (framing_error),
    .parity_error   (parity_error)
);

data_sync #(.n(DATA_WIDTH)) u_data_sync (
    .Unsync_bus   (RX_P_DATA),
    .bus_en       (RX_D_VLD),
    .clk          (REF_CLK_M),
    .rst          (RST_SYNC_1_M),
    .enable_pulse (RX_SYNC_VLD),
    .sync_bus     (RX_SYNC_DATA)
);

ASYNC_FIFO_TOP #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(RF_ADDR), .PTR_WIDTH(RF_ADDR+1)) u_async_fifo (
    .wclk    (REF_CLK_M),
    .wrst_n  (RST_SYNC_1_M),
    .winc    (TX_D_VLD),
    .wdata   (TX_P_DATA),
    .wfull   (FIFO_FULL),
    .rclk    (UART_TX_CLK_M),
    .rrst_n  (RST_SYNC_2_M),
    .rinc    (FIFO_RD_INC),
    .rdata   (FIFO_RD_DATA),
    .rempty  (FIFO_EMPTY)
);

UART_TX_Top u_uart_tx (
    .p_data_top     (FIFO_RD_DATA),
    .data_valid_top (~FIFO_EMPTY),
    .par_en_top     (REG2[0]),
    .par_typ_top    (REG2[1]),
    .clk_top        (UART_TX_CLK_M),
    .RST_top        (RST_SYNC_2_M),
    .TX_out_top     (UART_TX_O),
    .busy_top       (TX_BUSY)
);

PULSE_GEN u_pulse_gen (
    .CLK       (UART_TX_CLK_M),
    .RST       (RST_SYNC_2_M),
    .LVL_SIG   (TX_BUSY),
    .PULSE_SIG (FIFO_RD_INC)
);

endmodule
