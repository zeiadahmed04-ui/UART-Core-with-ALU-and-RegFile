module Stop_check(
    input stop_check_en,
    input Sampled_bit,
    output reg stop_err
);

always@(*) begin

    if(stop_check_en) begin
        stop_err = (Sampled_bit == 1)? 0:1;
    end
    else
        stop_err = 0;

end



endmodule
