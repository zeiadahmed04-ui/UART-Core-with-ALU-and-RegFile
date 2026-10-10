// ============================================================================
// PULSE_GEN : one-cycle pulse on the rising edge of LVL_SIG
// (used to pop the FIFO once per UART_TX frame, from the Busy signal)
// ============================================================================
module PULSE_GEN (
    input  CLK,
    input  RST,          // active low async
    input  LVL_SIG,
    output PULSE_SIG
);

reg lvl_d, pulse_r;

always @(posedge CLK or negedge RST) begin
    if (!RST) begin
        lvl_d   <= 1'b0;
        pulse_r <= 1'b0;
    end else begin
        lvl_d   <= LVL_SIG;
        pulse_r <= LVL_SIG & ~lvl_d;
    end
end

assign PULSE_SIG = pulse_r;

endmodule
