module FIFO_WR #(parameter PTR_WIDTH = 5, parameter ADDR_WIDTH = 4) (
    input                        wclk,
    input                        wrst_n,
    input                        winc,
    input      [PTR_WIDTH-1:0]   wq2_rptr,
    output reg                   wfull,
    output reg [ADDR_WIDTH-1:0]  waddr,
    output reg [PTR_WIDTH-1:0]   wptr
);

reg  [PTR_WIDTH-1:0] wbin;
wire [PTR_WIDTH-1:0] wbin_next;
wire [PTR_WIDTH-1:0] ptr_cal;
wire                 full_ck;

assign wbin_next = wbin + (winc & ~wfull);

assign ptr_cal = (wbin_next >> 1) ^ wbin_next;

assign full_ck = (ptr_cal == {~wq2_rptr[PTR_WIDTH-1], ~wq2_rptr[PTR_WIDTH-2], wq2_rptr[PTR_WIDTH-3:0]});

always @(posedge wclk or negedge wrst_n) begin
    if (!wrst_n) begin
        wbin  <= 0;
        waddr <= 0;
        wptr  <= 0;
        wfull <= 0;
    end
    else begin
        wbin  <= wbin_next;
        waddr <= wbin_next[ADDR_WIDTH-1:0];
        wptr  <= ptr_cal;
        wfull <= full_ck;
    end
end

endmodule