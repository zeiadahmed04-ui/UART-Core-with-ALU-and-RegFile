module UART_TX_Top(
    input [7:0] p_data_top,
    input data_valid_top, par_en_top, par_typ_top,
    input clk_top, RST_top,
    output TX_out_top, busy_top 
);

wire ser_data_top, ser_done_top, ser_en_top, par_bit_top;
wire [1:0] mux_sel_top;

Serializer dut0(
    .clk(clk_top),
    .P_Data(p_data_top),
    .ser_data(ser_data_top),
    .ser_done(ser_done_top),
    .ser_en(ser_en_top),
    .busy(busy_top),
    .RST(RST_top),
    .data_valid(data_valid_top)   // <-- FIXED
);

Fsm_tx dut1(
    .rst(RST_top),
    .busy(busy_top),
    .clk(clk_top),
    .data_valid(data_valid_top),
    .mux_sel(mux_sel_top),
    .ser_en(ser_en_top),
    .ser_done(ser_done_top),
    .par_en(par_en_top)
);

parity_cal dut2(
    .clk(clk_top),
    .Data_Valid(data_valid_top),
    .P_Data(p_data_top),
    .par_bit(par_bit_top),
    .busy(busy_top),
    .RST(RST_top),
    .par_typ(par_typ_top)
);

Mux_4x1 dut3(
    .mux_sel(mux_sel_top),
    .ser_data(ser_data_top),
    .tx_out_mux(TX_out_top),
    .par_bit(par_bit_top)
);

endmodule