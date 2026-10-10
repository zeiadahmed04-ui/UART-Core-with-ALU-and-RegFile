
module ARITHMETIC_UNIT #(parameter WIDTH = 8 , arth_width = WIDTH * 2) (
    input  wire signed [WIDTH-1:0] A,
    input  wire signed [WIDTH-1:0] B,
    input  wire [1:0] ALU_FUN,
    input  wire  Arith_Enable,
    input  CLK,
    input  RST,
    output reg  signed [arth_width-1:0] Arith_OUT,
    output reg  Arith_Flag
);

always @(posedge CLK or negedge RST) begin
    if (!RST) begin
        Arith_OUT  <= 0;
        Arith_Flag <= 0;
    end
    else if (Arith_Enable) begin
        Arith_Flag <= 1'b1;
        case (ALU_FUN)
            2'b00: Arith_OUT <= A + B;
            2'b01: Arith_OUT <= A - B;
            2'b10: Arith_OUT <= A * B;
            2'b11: Arith_OUT <= (B != 0) ? A / B : 0;
            default: Arith_OUT <= 0;
        endcase
    end
    else begin
        Arith_OUT  <= 0;
        Arith_Flag <= 0;
    end
end

endmodule
