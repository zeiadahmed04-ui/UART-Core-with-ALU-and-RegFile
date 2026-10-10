module ASYNC_FIFO_TOP #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4,
    parameter PTR_WIDTH  = ADDR_WIDTH + 1
) (
    input                        wclk,
    input                        wrst_n,
    input                        winc,
    input      [DATA_WIDTH-1:0]  wdata,
    output                       wfull,

    input                        rclk,
    input                        rrst_n,
    input                        rinc,
    output     [DATA_WIDTH-1:0]  rdata,
    output                       rempty
);

wire [PTR_WIDTH-1:0]  wptr, rptr;
wire [PTR_WIDTH-1:0]  wq2_rptr, rq2_wptr;
wire [ADDR_WIDTH-1:0] waddr, raddr;

// Write pointer generation / full-flag logic
FIFO_WR #(
    .PTR_WIDTH  (PTR_WIDTH),
    .ADDR_WIDTH (ADDR_WIDTH)
) u_fifo_wr (
    .wclk     (wclk),
    .wrst_n   (wrst_n),
    .winc     (winc),
    .wq2_rptr (wq2_rptr),
    .wfull    (wfull),
    .waddr    (waddr),
    .wptr     (wptr)
);

// Read pointer generation / empty-flag logic
FIFO_RD #(
    .PTR_WIDTH  (PTR_WIDTH),
    .ADDR_WIDTH (ADDR_WIDTH)
) u_fifo_rd (
    .rclk     (rclk),
    .rrst_n   (rrst_n),
    .rinc     (rinc),
    .rq2_wptr (rq2_wptr),
    .rempty   (rempty),
    .raddr    (raddr),
    .rptr     (rptr)
);

// Synchronize read pointer into the write clock domain
DF_SYNC #(
    .WIDTH (PTR_WIDTH)
) u_sync_r2w (
    .ptr_in  (rptr),
    .clk     (wclk),
    .rst_n   (wrst_n),
    .ptr_out (wq2_rptr)
);

// Synchronize write pointer into the read clock domain
DF_SYNC #(
    .WIDTH (PTR_WIDTH)
) u_sync_w2r (
    .ptr_in  (wptr),
    .clk     (rclk),
    .rst_n   (rrst_n),
    .ptr_out (rq2_wptr)
);

// Dual-port FIFO memory array
FIFO_MEM_CNTRL #(
    .DATA_WIDTH (DATA_WIDTH),
    .ADDR_WIDTH (ADDR_WIDTH)
) u_mem (
    .wdata (wdata),
    .winc  (winc),
    .wfull (wfull),
    .waddr (waddr),
    .raddr (raddr),
    .wclk  (wclk),
    .rdata (rdata)
);

endmodule