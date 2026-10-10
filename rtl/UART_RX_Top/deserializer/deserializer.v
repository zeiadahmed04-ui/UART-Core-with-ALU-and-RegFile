module deserializer #(parameter width_len = 8)(
    input clk, rst,
    input sampled_bit,
    input deser_en,
    output reg [width_len - 1 : 0] p_data

);


always@(posedge clk or negedge rst) begin

    if(!rst) begin
        p_data <= 0;
    end
    else begin
        if(deser_en) begin
            {p_data[width_len - 1:0]} <= {sampled_bit, {p_data[width_len-1:1]}};
        end
    end
end

endmodule