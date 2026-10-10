module DF_SYNC #(parameter WIDTH = 5)(
    input  [WIDTH-1:0] ptr_in,
    input               clk,
    input               rst_n,
    output [WIDTH-1:0] ptr_out
);

reg [WIDTH-1:0] FF [0:1];

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        FF[0] <= 0;
        FF[1] <= 0;
    end 
    else begin
        FF[0] <= ptr_in;
        FF[1] <= FF[0];
    end
end

assign ptr_out = FF[1];

endmodule