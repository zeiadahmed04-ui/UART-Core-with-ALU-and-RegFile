module FIFO_RD #(parameter PTR_WIDTH = 5, parameter ADDR_WIDTH = 4) (
    input                        rclk,
    input                        rrst_n,
    input                        rinc,
    input      [PTR_WIDTH-1:0]   rq2_wptr,
    output reg                   rempty,
    output reg [ADDR_WIDTH-1:0]  raddr,
    output reg [PTR_WIDTH-1:0]   rptr
);

reg  [PTR_WIDTH-1:0] rbin;
wire [PTR_WIDTH-1:0] rbin_next;
wire [PTR_WIDTH-1:0] ptr_cal;
wire                 empty_ck;

assign rbin_next = rbin + (rinc & ~rempty);

assign ptr_cal = (rbin_next >> 1) ^ rbin_next;

assign empty_ck = (ptr_cal == rq2_wptr);

always @(posedge rclk or negedge rrst_n) begin
    if (!rrst_n) begin
        rbin   <= 0;
        raddr  <= 0;
        rptr   <= 0;
        rempty <= 1'b1;
    end
    else begin
        rbin   <= rbin_next;
        raddr  <= rbin_next[ADDR_WIDTH-1:0];
        rptr   <= ptr_cal;
        rempty <= empty_ck;
    end
end

endmodule