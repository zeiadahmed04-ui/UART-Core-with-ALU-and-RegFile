module FIFO_MEM_CNTRL #(parameter DATA_WIDTH = 8, parameter ADDR_WIDTH = 4)(
    input  [DATA_WIDTH-1 : 0] wdata,
    input  winc, wfull,
    input  [ADDR_WIDTH-1:0]   waddr, raddr,
    input  wclk,
    output [DATA_WIDTH-1 : 0] rdata
);

localparam depth = 1 << ADDR_WIDTH;

wire wclken;
reg [DATA_WIDTH-1 : 0] mem[0 : depth-1];

assign wclken = (winc & ~wfull);
assign rdata  = mem[raddr];

always @(posedge wclk) begin
    if (wclken) begin
        mem[waddr] <= wdata;
    end
end

endmodule