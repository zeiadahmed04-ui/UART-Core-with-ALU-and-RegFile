module SHIFT_UNIT #(parameter WIDTH = 8, out_width = WIDTH * 2) (
    input  wire [WIDTH-1:0]     A,
    input  wire [3:0]           ALU_FUN,
    input  wire                 Shift_Enable,
    input  wire                 CLK,
    input  wire                 RST,
    output reg  [out_width-1:0] SHIFT_OUT,
    output reg                  SHIFT_Flag
);

always @(posedge CLK or negedge RST) begin
    if (!RST) begin
        SHIFT_OUT  <= {out_width{1'b0}};
        SHIFT_Flag <= 1'b0;
    end
    else if (Shift_Enable) begin
        SHIFT_Flag <= 1'b1;
        case (ALU_FUN)
            4'b1101: SHIFT_OUT <= {{(out_width-WIDTH+1){1'b0}}, A[WIDTH-1:1]};
            4'b1110: SHIFT_OUT <= {{(out_width-WIDTH-1){1'b0}}, A, 1'b0};
            default: SHIFT_OUT <= {out_width{1'b0}};
        endcase
    end
    else begin
        SHIFT_OUT  <= {out_width{1'b0}};
        SHIFT_Flag <= 1'b0;
    end
end

endmodule
