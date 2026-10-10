module DECODER (
    input [3:0] ALU_FUNC,
    input enable,
    output reg         Arith_Enable,
    output reg         Logic_Enable,
    output reg         CMP_Enable,
    output reg         Shift_Enable
);

always @(*) begin
    Arith_Enable = 1'b0;
    Logic_Enable = 1'b0;
    CMP_Enable   = 1'b0;
    Shift_Enable = 1'b0;

    if(enable)  begin
    case (ALU_FUNC)
        4'b0000, 4'b0001, 4'b0010, 4'b0011: Arith_Enable = 1'b1;
        4'b0100, 4'b0101, 4'b0110, 4'b0111, 4'b1000, 4'b1001: Logic_Enable = 1'b1;
        4'b1010, 4'b1011, 4'b1100: CMP_Enable = 1'b1;
        4'b1101, 4'b1110: Shift_Enable = 1'b1;
        default: begin
            Arith_Enable = 1'b0;
            Logic_Enable = 1'b0;
            CMP_Enable   = 1'b0;
            Shift_Enable = 1'b0;
        end
    endcase
    end
    else begin
        Arith_Enable = 1'b0;
        Logic_Enable = 1'b0;
        CMP_Enable   = 1'b0;
        Shift_Enable = 1'b0;
    end

end

endmodule
