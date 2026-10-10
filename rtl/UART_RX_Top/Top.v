module Top #(parameter width_len = 8) (
    input clk, rst,
    input RX_IN,
    input [5:0] Prescale,
    input parity_en,
    input parity_typ,

    output [width_len-1:0] p_data,
    output data_valid_top,
    output stop_error,
    output parity_error
);

    // FSM control signals
    wire enable, data_sam_en, strt_ck_en, stop_ck_en, desr_en, par_ck_en;

    // counter outputs
    wire [5:0] bit_cnt, edge_cnt;

    // sampled bit
    wire Sampled_bit;

    // error/status flags from checkers
    wire par_err, start_glitch, stop_err;

    fsm u_fsm (
        .clk          (clk),
        .rst          (rst),
        .RX_IN        (RX_IN),
        .parity_en    (parity_en),
        .par_err      (par_err),
        .start_glitch (start_glitch),
        .stop_err     (stop_err),
        .bit_cnt      (bit_cnt),
        .prescale     (Prescale),
        .enable       (enable),
        .data_sam_en  (data_sam_en),
        .strt_ck_en   (strt_ck_en),
        .stop_ck_en   (stop_ck_en),
        .desr_en      (desr_en),
        .par_ck_en    (par_ck_en),
        .data_valid_reg (data_valid_top),
        .stop_error   (stop_error),
        .parity_error (parity_error),
        .edge_cnt(edge_cnt)
    );

    edge_bit_counter u_edge_bit_counter (
        .clk      (clk),
        .rst      (rst),
        .enable   (enable),
        .prescale (Prescale),
        .par_en   (parity_en),
        .bit_cnt  (bit_cnt),
        .edge_cnt (edge_cnt)
    );

    Data_Sampling u_data_sampling (
        .clk            (clk),
        .rst            (rst),
        .RX_IN          (RX_IN),
        .Prescale       (Prescale),
        .data_sample_en (data_sam_en),
        .edge_cnt       (edge_cnt),
        .Sampled_bit    (Sampled_bit)
    );

    deserializer #(.width_len(width_len)) u_deserializer (
        .clk         (clk),
        .rst         (rst),
        .sampled_bit (Sampled_bit),
        .deser_en    (desr_en),
        .p_data      (p_data)
    );

    start_check u_start_check (
        .strt_check_en (strt_ck_en),
        .Sampled_bit   (Sampled_bit),
        .strt_glitch   (start_glitch)
    );

    parity_check u_par (
        .clk(clk), .rst(rst),
        .Sampled_bit(Sampled_bit),
        .data_en(desr_en),
        .clr(strt_ck_en),
        .parity_check_en(par_ck_en),
        .parity_typ(parity_typ),
        .par_err(par_err)
    );

    Stop_check u_stop_check (
        .stop_check_en (stop_ck_en),
        .Sampled_bit   (Sampled_bit),
        .stop_err      (stop_err)
    );

endmodule
