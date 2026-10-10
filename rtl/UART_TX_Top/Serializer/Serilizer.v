module Serializer(
    input        [7:0] P_Data,
    input              ser_en,
    input              data_valid,
    input              busy,
    input              clk, RST,
    output             ser_data,
    output reg         ser_done
);

    reg [7:0] shift_reg;
    reg [2:0] bit_count;

    // next-state signals
    reg [7:0] shift_next;
    reg [2:0] count_next;
    reg       done_next;

    assign ser_data = shift_reg[0];

    // ---------------- Combinational: next-state logic ----------------
    always @(*) begin
        // defaults: hold shift_reg, clear the rest
        shift_next = shift_reg;
        count_next = 3'b0;
        done_next  = 1'b0;

        if (data_valid && !busy) begin
            shift_next = P_Data;
            count_next = 3'b0;
            done_next  = 1'b0;
        end
        else if (ser_en) begin
            shift_next = shift_reg >> 1;
            if (bit_count == 3'd6) begin
                count_next = 3'b0;
                done_next  = 1'b1;
            end else begin
                count_next = bit_count + 1'b1;
                done_next  = 1'b0;
            end
        end
        // else: defaults apply (count = 0, done = 0, shift_reg held)
    end

    // ---------------- Sequential: registers only ----------------
    always @(posedge clk or negedge RST) begin
        if (!RST) begin
            shift_reg <= 8'b0;
            bit_count <= 3'b0;
            ser_done  <= 1'b0;
        end
        else begin
            shift_reg <= shift_next;
            bit_count <= count_next;
            ser_done  <= done_next;
        end
    end

endmodule
