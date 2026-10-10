module mux4x1#(parameter WIDTH = 8 , out_width = WIDTH * 2)(
    input  [3:0]           ALU_FUN,
    input  [out_width-1:0] Arith_OUT,
    input  [out_width-1:0] Logic_OUT,
    input  [out_width-1:0] CMP_OUT,
    input  [out_width-1:0] SHIFT_OUT,
    input  SHIFT_Flag, CMP_Flag, Logic_Flag, Arith_Flag,
    output reg [out_width-1:0] alu_out,
    output out_valid
);


always@(*) begin

    case(ALU_FUN)
    4'b0000, 4'b0001, 4'b0010, 4'b0011: alu_out = Arith_OUT;
    4'b0100, 4'b0101, 4'b0110, 4'b0111, 4'b1000, 4'b1001: alu_out = Logic_OUT;
    4'b1010, 4'b1011, 4'b1100: alu_out = CMP_OUT;
    4'b1101, 4'b1110: alu_out = SHIFT_OUT;
    default: alu_out = 0;
    endcase
end

assign out_valid = SHIFT_Flag | CMP_Flag | Arith_Flag | Logic_Flag;

endmodule
