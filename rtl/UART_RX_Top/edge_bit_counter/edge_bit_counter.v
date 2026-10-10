module edge_bit_counter (
    input clk, rst,
    input enable,
    input [5:0] prescale,
    input par_en,
    output reg [5:0] bit_cnt,
    output reg [5:0] edge_cnt
);

wire [5:0] wrap_target;

assign wrap_target = par_en ? 10 : 9;

always@(posedge clk or negedge rst) begin

    if(!rst) begin
        edge_cnt <= 0;
        bit_cnt <= 0;
    end
    else if(enable)  begin
        if(edge_cnt == prescale - 1) begin
            edge_cnt <= 0;
            if(bit_cnt == wrap_target)
                bit_cnt  <= 0;
            else
                bit_cnt <= bit_cnt + 1;
        end

        else
            edge_cnt <= edge_cnt + 1;
    end
    else begin
        edge_cnt <= 0;
        bit_cnt  <= 0;
    end
end

endmodule
