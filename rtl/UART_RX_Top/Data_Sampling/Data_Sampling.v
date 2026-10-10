module Data_Sampling (
    input clk, rst,
    input RX_IN,
    input [5:0] Prescale,
    input data_sample_en,
    input [5:0] edge_cnt,
    output reg Sampled_bit
);

always@(posedge clk or negedge rst) begin
    if(!rst)
        Sampled_bit <= 0;

    else begin
        if(data_sample_en) begin
            if(edge_cnt == Prescale / 2)
                Sampled_bit <= RX_IN;
        end
    end
end




endmodule
