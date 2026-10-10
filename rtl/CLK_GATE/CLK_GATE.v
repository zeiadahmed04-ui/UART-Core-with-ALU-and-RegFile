
module CLK_GATE (
    input  CLK,
    input  CLK_EN,
    output GATED_CLK
);

reg en_latch;

always @(CLK or CLK_EN)

if (!CLK) 
    en_latch = CLK_EN;

assign GATED_CLK = CLK & en_latch;

endmodule
