module LOGIC_UNIT #(parameter WIDTH = 8, out_width = WIDTH * 2) (
    input  wire [WIDTH-1:0]     A,
    input  wire [WIDTH-1:0]     B,
    input  wire [2:0]           ALU_FUN,
    input  wire                 Logic_Enable,
    input  wire                 CLK,
    input  wire                 RST,
    output reg  [out_width-1:0] Logic_OUT,
    output reg                  Logic_Flag
);


always @(posedge CLK or negedge RST) begin
    if (!RST) begin
        Logic_OUT  <= {out_width{1'b0}};
        Logic_Flag <= 1'b0;
    end
    else if (Logic_Enable) begin
        Logic_Flag <= 1'b1;
        case (ALU_FUN)
            3'b100: Logic_OUT <= {{(out_width-WIDTH){1'b0}},   A & B };   // AND
            3'b101: Logic_OUT <= {{(out_width-WIDTH){1'b0}},   A | B };   // OR
            3'b110: Logic_OUT <= {{(out_width-WIDTH){1'b0}}, ~(A & B)};   // NAND
            3'b111: Logic_OUT <= {{(out_width-WIDTH){1'b0}}, ~(A | B)};   // NOR
            3'b000: Logic_OUT <= {{(out_width-WIDTH){1'b0}},   A ^ B };   // XOR
            3'b001: Logic_OUT <= {{(out_width-WIDTH){1'b0}}, ~(A ^ B)};   // XNOR
            default: Logic_OUT <= {out_width{1'b0}};
        endcase
    end
    else begin
        Logic_OUT  <= {out_width{1'b0}};
        Logic_Flag <= 1'b0;
    end
end

endmodule