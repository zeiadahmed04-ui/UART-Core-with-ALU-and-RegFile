module SYS_TOP (
    input  REF_CLK,
    input  UART_CLK,
    input  RST,
    input  RX_IN,
    output TX_OUT,
    output parity_error,
    output stop_error
);

wire RST_SYNC_1, RST_SYNC_2;

wire [7:0] REG0, REG1, REG2, REG3;
wire [4:0] Address;
wire       WrEn, RdEn;
wire [7:0] WrData, RdData;
wire       RdData_Valid;

//wire       EN_CLK;
//wire       INV_EN_CLK;

wire [3:0] ALU_FUN;
wire       ALU_EN;
wire       CLK_EN;
wire       ALU_CLK;
wire [15:0] ALU_OUT;
wire       ALU_OUT_VALID;

wire [7:0] RX_P_DATA;
wire       RX_D_VLD;
wire [7:0] RX_SYNC_DATA;
wire       RX_SYNC_VLD;

wire [7:0] TX_P_DATA;
wire       TX_D_VLD;
wire       CLK_DIV_EN;
//wire       clk_sel;

wire [7:0] FIFO_RD_DATA;
wire       FIFO_FULL;
wire       FIFO_EMPTY;
wire       FIFO_RD_INC;
wire       TX_BUSY;

rst_sych u_rst_sync_1 (
    .clk      (REF_CLK),
    .rst      (RST),
    .sych_rst (RST_SYNC_1)
);

rst_sych u_rst_sync_2 (
    .clk      (UART_CLK),
    .rst      (RST),
    .sych_rst (RST_SYNC_2)
);

regfile u_regfile (
    .CLK          (REF_CLK),
    .RST          (RST_SYNC_1),
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
    .CLK           (REF_CLK),
    .RST           (RST_SYNC_1),
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

//CLK_GATE u_clk_gate (
//    .CLK      (REF_CLK),
//    .CLK_EN   (CLK_EN),
//    .GATED_CLK(ALU_CLK)
//);

TLATNCAX4M u_clk_gate(
      .CK(REF_CLK),
      .E(CLK_EN),
      .ECK(ALU_CLK)
);


ALU_TOP #(.WIDTH(8), .out_width(16)) u_alu (
    .A       (REG0),
    .B       (REG1),
    .ALU_FUNC(ALU_FUN),
    .enable  (ALU_EN),
    .CLK     (ALU_CLK),
    .RST     (RST_SYNC_1),
    .ALU_OUT (ALU_OUT),
    .out_valid(ALU_OUT_VALID)
);


clk_divider u_clk_divider (
    .i_ref_clk  (UART_CLK),
    .i_rst_n    (RST_SYNC_2),
    .i_clk_en   (CLK_DIV_EN),
    .i_div_ratio(REG3),
    .o_div_clk  (UART_TX_CLK)
);

/*
clk_divider u_clk_divider (
    .i_ref_clk  (UART_CLK),
    .i_rst_n    (RST_SYNC_2),
    .i_clk_en   (CLK_DIV_EN),
    .i_div_ratio(REG3),
//  .o_div_clk  (UART_TX_CLK)
    .out_clk(DIV_CLK),
    .bypass(EN_CLK)
//  .pass(INV_EN_CLK)
);
*/
/*
CLKMX2X4M U_mux2x1_clk(
    .A(DIV_CLK),
    .B(UART_CLK),
    .S0(EN_CLK),
    .Y(clk_sel)
);

DFFNHX2M ff0(
   .D(clk_sel0),
   .Q(clk_sel1),
   .CKN()
);
*/


Top #(.width_len(8)) u_uart_rx (
    .clk            (UART_CLK),
    .rst            (RST_SYNC_2),
    .RX_IN          (RX_IN),
    .Prescale       (REG2[7:2]),
    .parity_en      (REG2[0]),
    .parity_typ     (REG2[1]),
    .p_data         (RX_P_DATA),
    .data_valid_top (RX_D_VLD),
    .stop_error     (stop_error),
    .parity_error   (parity_error)
);

data_sync #(.n(8)) u_data_sync (
    .Unsync_bus    (RX_P_DATA),
    .bus_en        (RX_D_VLD),
    .clk           (REF_CLK),
    .rst           (RST_SYNC_1),
    .enable_pulse  (RX_SYNC_VLD),
    .sync_bus      (RX_SYNC_DATA)
);

ASYNC_FIFO_TOP #(.DATA_WIDTH(8), .ADDR_WIDTH(4), .PTR_WIDTH(5)) u_async_fifo (
    .wclk    (REF_CLK),
    .wrst_n  (RST_SYNC_1),
    .winc    (TX_D_VLD),
    .wdata   (TX_P_DATA),
    .wfull   (FIFO_FULL),
    .rclk    (UART_TX_CLK),
    .rrst_n  (RST_SYNC_2),
    .rinc    (FIFO_RD_INC),
    .rdata   (FIFO_RD_DATA),
    .rempty  (FIFO_EMPTY)
);

UART_TX_Top u_uart_tx (
    .p_data_top   (FIFO_RD_DATA),
    .data_valid_top(~FIFO_EMPTY),
    .par_en_top   (REG2[0]),
    .par_typ_top  (REG2[1]),
    .clk_top      (UART_TX_CLK),
    .RST_top      (RST_SYNC_2),
    .TX_out_top   (TX_OUT),
    .busy_top     (TX_BUSY)
);

PULSE_GEN u_pulse_gen (
    .CLK      (UART_TX_CLK),
    .RST      (RST_SYNC_2),
    .LVL_SIG  (TX_BUSY),
    .PULSE_SIG(FIFO_RD_INC)
);

endmodule
