module start_check(
    input strt_check_en,
    input Sampled_bit,
    output reg strt_glitch
);

always@(*) begin

    if(strt_check_en) begin
        strt_glitch = (Sampled_bit == 0)? 0:1;
    end
    else
        strt_glitch = 0;

end



endmodule
