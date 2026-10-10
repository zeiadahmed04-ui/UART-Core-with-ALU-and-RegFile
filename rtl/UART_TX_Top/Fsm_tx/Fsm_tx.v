module Fsm_tx(
    input data_valid, par_en, ser_done,
    input clk, rst,
    output reg busy, ser_en,
    output reg [1:0] mux_sel
);

    localparam IDLE       = 3'b000,
               start_bit  = 3'b001,
               ser_data   = 3'b010,
               parity_bit = 3'b011,
               stop_bit   = 3'b100;

    reg [2:0] current_State, next_state;

    always @(posedge clk or negedge rst) begin
        if (!rst) current_State <= IDLE;
        else      current_State <= next_state;
    end

    // Combinational output logic
    always @(*) begin
        busy    = 0;
        mux_sel = 2'b01;   
        ser_en  = 0;
        case (current_State)
            start_bit:  begin busy = 1; mux_sel = 2'b00; ser_en = 0; end   
            ser_data:   begin busy = 1; mux_sel = 2'b10; ser_en = 1; end
            parity_bit: begin busy = 1; mux_sel = 2'b11; ser_en = 0; end
            stop_bit:   begin busy = 1; mux_sel = 2'b01; ser_en = 0; end
            default: ;
        endcase
    end

    // Next state logic
    always @(*) begin
        next_state = current_State;
        case (current_State)
            IDLE:       next_state = data_valid ? start_bit : IDLE;
            start_bit:  next_state = ser_data;
            ser_data:   next_state = ser_done ? (par_en ? parity_bit : stop_bit) : ser_data;
            parity_bit: next_state = stop_bit;
            stop_bit:   next_state = IDLE;
            default:    next_state = IDLE;
        endcase
    end

endmodule