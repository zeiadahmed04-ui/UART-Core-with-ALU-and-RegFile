
module regfile #(
    parameter WIDTH = 8,
    parameter DEPTH = 22,
    parameter ADDR  = 5
)(
    input                  CLK,
    input                  RST,          // active low async
    input  [ADDR-1:0]      Address,
    input                  WrEn,
    input                  RdEn,
    input  [WIDTH-1:0]     WrData,
    output reg [WIDTH-1:0] RdData,
    output reg             RdData_Valid,
    output [WIDTH-1:0]     REG0,
    output [WIDTH-1:0]     REG1,
    output [WIDTH-1:0]     REG2,
    output [WIDTH-1:0]     REG3
);

reg [WIDTH-1:0] mem [0:DEPTH-1];
integer i;

always @(posedge CLK or negedge RST) begin
    if (!RST) begin
        RdData       <= 0;
        RdData_Valid <= 1'b0;
        for (i = 0; i < DEPTH; i = i + 1)
            mem[i] <= {WIDTH{1'b0}};
    end
    else begin
        RdData_Valid <= 1'b0;
        if (WrEn && !RdEn) begin
            if (Address < DEPTH)
                mem[Address] <= WrData;
        end
        else if (RdEn && !WrEn) begin
            if (Address < DEPTH) begin
                RdData       <= mem[Address];
                RdData_Valid <= 1'b1;
            end
        end
    end
end

assign REG0 = mem[0];
assign REG1 = mem[1];
assign REG2 = mem[2];
assign REG3 = mem[3];

endmodule
