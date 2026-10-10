module Mux_4x1 (
    input  [1:0] mux_sel,
    input        ser_data, par_bit, 
    output reg   tx_out_mux
);

wire start_bit, stop_bit;
assign start_bit = 0;
assign stop_bit = 1;

always @(*) begin
    case (mux_sel)
        2'b00:   tx_out_mux = start_bit;
        2'b01:   tx_out_mux = stop_bit;
        2'b10:   tx_out_mux = ser_data;
        2'b11:   tx_out_mux = par_bit;
        default: tx_out_mux = stop_bit;
    endcase
end

endmodule
