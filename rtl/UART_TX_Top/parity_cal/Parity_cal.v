module parity_cal(
    input clk, RST,
    input [7:0] P_Data,
    input busy,
    input Data_Valid, par_typ,
    output reg par_bit
);


wire even_parity = ^P_Data;
wire odd_parity = ~(^P_Data);

always@(posedge clk or negedge RST) begin
        if(!RST) begin
            par_bit <= 0;
        end
        else if(Data_Valid && !busy) begin
            if(par_typ) begin
                par_bit <= odd_parity;
                end
            else begin
                par_bit <= even_parity;
            end
        end
end

endmodule