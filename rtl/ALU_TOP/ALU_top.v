module ALU_TOP #(parameter WIDTH = 8, out_width = WIDTH * 2) (
    input  signed [WIDTH-1:0] A,
    input  signed [WIDTH-1:0] B,
    input  [3:0] ALU_FUNC,
    input  enable,
    input  CLK, RST,
    output [out_width-1:0] ALU_OUT,
    output out_valid
);



wire Arith_Enable, Logic_Enable, CMP_Enable, Shift_Enable;
wire signed [out_width-1:0] Arith_OUT;
wire [out_width-1:0] Logic_OUT;
wire signed [out_width-1:0] CMP_OUT;
wire [out_width-1:0] SHIFT_OUT;
wire Arith_Flag, Logic_Flag, CMP_Flag, SHIFT_Flag;


DECODER u_decoder (
    .enable(enable),
    .ALU_FUNC     (ALU_FUNC),
    .Arith_Enable (Arith_Enable),
    .Logic_Enable (Logic_Enable),
    .CMP_Enable   (CMP_Enable),
    .Shift_Enable (Shift_Enable)
);


ARITHMETIC_UNIT #(.WIDTH(WIDTH), .arth_width(WIDTH*2)) u_arith (
    .A            (A),
    .B            (B),
    .ALU_FUN      (ALU_FUNC[1:0]),
    .Arith_Enable (Arith_Enable),
    .CLK          (CLK),
    .RST          (RST),
    .Arith_OUT    (Arith_OUT),
    .Arith_Flag   (Arith_Flag)
);


LOGIC_UNIT #(.WIDTH(WIDTH), .out_width(out_width)) u_logic (
    .A            (A),
    .B            (B),
    .ALU_FUN      (ALU_FUNC[2:0]),
    .Logic_Enable (Logic_Enable),
    .CLK          (CLK),
    .RST          (RST),
    .Logic_OUT    (Logic_OUT),
    .Logic_Flag   (Logic_Flag)
);


CMP_UNIT #(.WIDTH(WIDTH)) u_cmp (
    .A          (A),
    .B          (B),
    .ALU_FUN    (ALU_FUNC),
    .CMP_Enable (CMP_Enable),
    .CLK        (CLK),
    .RST        (RST),
    .CMP_OUT    (CMP_OUT),
    .CMP_Flag   (CMP_Flag)
);


SHIFT_UNIT #(.WIDTH(WIDTH), .out_width(out_width)) u_shift (
    .A            (A),
    .ALU_FUN      (ALU_FUNC),
    .Shift_Enable (Shift_Enable),
    .CLK          (CLK),
    .RST          (RST),
    .SHIFT_OUT    (SHIFT_OUT),
    .SHIFT_Flag   (SHIFT_Flag)
);


mux4x1 #(.WIDTH(WIDTH), .out_width(2*WIDTH)) u_mux4x1(
    .ALU_FUN    (ALU_FUNC),
    .Arith_OUT  (Arith_OUT),
    .Logic_OUT  (Logic_OUT),
    .CMP_OUT    (CMP_OUT),
    .SHIFT_OUT  (SHIFT_OUT),
    .CMP_Flag   (CMP_Flag),
    .Logic_Flag (Logic_Flag),
    .Arith_Flag (Arith_Flag),
    .SHIFT_Flag (SHIFT_Flag),
    .alu_out    (ALU_OUT),
    .out_valid  (out_valid)
);


endmodule
