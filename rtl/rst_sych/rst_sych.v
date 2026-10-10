module rst_sych #(parameter num_stages = 3)(
    input clk,
    input rst,
    output sych_rst
);

reg [num_stages-1:0] ff;

always @(posedge clk or negedge rst) begin
    if (!rst)
        ff <= 0;
    else
        ff <= {ff[num_stages-2:0], 1'b1};
end

assign sych_rst = ff[num_stages-1];

endmodule