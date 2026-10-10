module data_sync #(parameter n = 8, num_of_stages = 5)(
    input [n-1:0] Unsync_bus,
    input bus_en,
    input clk, rst,
    output reg enable_pulse,
    output reg [n-1:0] sync_bus
);

reg [num_of_stages-1:0] multi_FF;
reg hold;
wire sel_wire;

assign sel_wire = (~ hold) & multi_FF[num_of_stages - 1];

integer i;

always@(posedge clk or negedge rst) begin
    if(!rst) begin
        enable_pulse <= 0;
        sync_bus <= 0;
        hold <= 0;
        for(i = 0; i < num_of_stages; i =  i+1)
            multi_FF[i] <= 0;
    end
    else begin
        {multi_FF [num_of_stages-1:0]} <= {multi_FF[num_of_stages-2:0], bus_en};
        hold <= multi_FF[num_of_stages -1 ];

        enable_pulse <= sel_wire;

        if(sel_wire == 1)
            sync_bus <= Unsync_bus;

    end


end
endmodule
