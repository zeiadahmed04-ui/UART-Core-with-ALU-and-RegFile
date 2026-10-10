module SYS_CTRL (
    input            CLK,
    input            RST,          // active low
    input  [15:0]    ALU_OUT,
    input            OUT_Valid,
    input            RdData_Valid,
    input  [7:0]     RdData,
    input  [7:0]     RX_P_DATA,
    input            RX_D_VLD,
    input            FIFO_FULL,

    output reg [3:0] ALU_FUN,
    output reg       EN,
    output reg       CLK_EN,       // Gate_EN
    output reg [4:0] Address,
    output reg       WrEn,
    output reg       RdEn,
    output reg [7:0] WrData,
    output reg [7:0] TX_P_DATA,
    output reg       TX_D_VLD,
    output           clk_div_en
);

assign clk_div_en = 1'b1;

localparam [3:0] IDLE     = 4'd0,
                 WADD     = 4'd1,
                 WDATA    = 4'd2,
                 RADD     = 4'd3,
                 RD_WAIT  = 4'd4,
                 RD_TX    = 4'd5,
                 ALU_A    = 4'd6,
                 ALU_B    = 4'd7,
                 S_ALU_FUN = 4'd8,
                 ALU_WAIT = 4'd9,
                 ALU_TX1  = 4'd10,
                 ALU_TX2  = 4'd11;

reg [3:0]  current_state, next_state;
reg [4:0]  addr_reg;
reg [7:0]  rd_reg;
reg [15:0] alu_res;
reg [3:0]  alu_fun_reg;

// state + data capture registers
always @(posedge CLK or negedge RST) begin
    if (!RST) begin
        current_state <= IDLE;
        addr_reg      <= 5'd0;
        rd_reg        <= 8'd0;
        alu_res       <= 16'd0;
        alu_fun_reg   <= 4'd0;
    end else begin
        current_state <= next_state;
        if (current_state == WADD     && RX_D_VLD)     addr_reg <= RX_P_DATA[4:0];
        if (current_state == RD_WAIT  && RdData_Valid) rd_reg   <= RdData;
        if (current_state == ALU_WAIT && OUT_Valid)    alu_res     <= ALU_OUT;
        if (current_state == S_ALU_FUN && RX_D_VLD)      alu_fun_reg <= RX_P_DATA[3:0];
    end
end

// next state + outputs
always @(*) begin
    next_state = current_state;
    ALU_FUN    = alu_fun_reg;
    EN         = 1'b0;
    CLK_EN     = 1'b0;
    Address    = 5'd0;
    WrEn       = 1'b0;
    RdEn       = 1'b0;
    WrData     = 8'd0;
    TX_P_DATA  = 8'd0;
    TX_D_VLD   = 1'b0;

    case (current_state)
        IDLE: begin
            if (RX_D_VLD) begin
                case (RX_P_DATA)
                    8'hAA:   next_state = WADD;
                    8'hBB:   next_state = RADD;
                    8'hCC:   next_state = ALU_A;
                    8'hDD:   next_state = S_ALU_FUN;
                    default: next_state = IDLE;
                endcase
            end
        end

        // ---------- Register write ----------
        WADD: begin
            if (RX_D_VLD) next_state = WDATA;
        end

        WDATA: begin
            if (RX_D_VLD) begin
                Address    = addr_reg;
                WrData     = RX_P_DATA;
                WrEn       = 1'b1;
                next_state = IDLE;
            end
        end

        // ---------- Register read ----------
        RADD: begin
            if (RX_D_VLD) begin
                Address    = RX_P_DATA[4:0];
                RdEn       = 1'b1;
                next_state = RD_WAIT;
            end
        end

        RD_WAIT: begin
            if (RdData_Valid) next_state = RD_TX;
        end

        RD_TX: begin
            if (!FIFO_FULL) begin
                TX_P_DATA  = rd_reg;
                TX_D_VLD   = 1'b1;
                next_state = IDLE;
            end
        end

        // ---------- ALU with operands (0xCC) ----------
        ALU_A: begin
            if (RX_D_VLD) begin
                Address    = 5'd0;          // Operand A -> reg 0
                WrData     = RX_P_DATA;
                WrEn       = 1'b1;
                next_state = ALU_B;
            end
        end

        ALU_B: begin
            CLK_EN = 1'b1;
            if (RX_D_VLD) begin
                Address    = 5'd1;          // Operand B -> reg 1
                WrData     = RX_P_DATA;
                WrEn       = 1'b1;
                next_state = S_ALU_FUN;
            end
        end

        // ---------- ALU function (shared by 0xCC and 0xDD) ----------
        S_ALU_FUN: begin
            CLK_EN = 1'b1;
            if (RX_D_VLD) begin
                next_state = ALU_WAIT;
            end
        end

        ALU_WAIT: begin
            CLK_EN = 1'b1;
            EN     = !OUT_Valid;
            if (OUT_Valid) next_state = ALU_TX1;
        end

        ALU_TX1: begin
            if (!FIFO_FULL) begin
                TX_P_DATA  = alu_res[7:0];
                TX_D_VLD   = 1'b1;
                next_state = ALU_TX2;
            end
        end

        ALU_TX2: begin
            if (!FIFO_FULL) begin
                TX_P_DATA  = alu_res[15:8];
                TX_D_VLD   = 1'b1;
                next_state = IDLE;
            end
        end

        default: next_state = IDLE;
    endcase
end

endmodule