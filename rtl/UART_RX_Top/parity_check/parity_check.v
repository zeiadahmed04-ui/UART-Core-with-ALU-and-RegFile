module parity_check(
    input  clk, rst,
    input  Sampled_bit,
    input  data_en,
    input  clr,
    input  parity_check_en,
    input  parity_typ,
    output reg par_err
);

    reg data_parity;

    always @(posedge clk or negedge rst) begin
        if (!rst)
            data_parity <= 1'b0;
        else if (clr)
            data_parity <= 1'b0;
        else if (data_en)
            data_parity <= data_parity ^ Sampled_bit;
    end

    wire expected_par = parity_typ ? ~data_parity : data_parity;

    always @(*) begin
        if (parity_check_en)
            par_err = (Sampled_bit != expected_par);
        else
            par_err = 1'b0;
    end

endmodule
