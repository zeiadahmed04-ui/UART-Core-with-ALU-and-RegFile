module CMP_UNIT #(parameter WIDTH = 8) (
    input  wire signed [WIDTH-1:0] A,
    input  wire signed [WIDTH-1:0] B,
    input  wire [3:0]              ALU_FUN,
    input  wire                    CMP_Enable,
    input                          CLK,
    input                          RST,
    output reg  signed [WIDTH*2-1:0] CMP_OUT,
    output reg CMP_Flag
);

always @(posedge CLK or negedge RST) begin
    if (!RST) begin
        CMP_OUT  <= 0;
        CMP_Flag <= 0;
    end
    else if (CMP_Enable) begin
        
        CMP_Flag <= 1'b1;
        case (ALU_FUN)
            4'b1010: CMP_OUT <= (A == B) ? {{(WIDTH*2-1){1'b0}}, 1'b1} : 0;
            4'b1011: CMP_OUT <= (A > B)  ? {{(WIDTH*2-2){1'b0}}, 2'b10} : 0;
            4'b1100: CMP_OUT <= (A < B)  ? {{(WIDTH*2-2){1'b0}}, 2'b11} : 0;
            default: CMP_OUT <= 0;
        endcase
    end
    else begin
        CMP_OUT  <= 0;
        CMP_Flag <= 0;
    end
end

endmodule
