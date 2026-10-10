module clk_divider (
    input  wire       i_ref_clk,
    input  wire       i_rst_n,
    input  wire       i_clk_en,
    input  wire [7:0] i_div_ratio,
    output reg       o_div_clk
);

reg  [7:0] counter;
reg        out_clk;
reg        reference;
wire       is_odd   = i_div_ratio[0];
wire [7:0] half     = {1'b0, i_div_ratio[7:1]};
wire       bypass   = (i_div_ratio == 8'd0) || (i_div_ratio == 8'd1) || !i_clk_en;

wire ref_clk = i_ref_clk;

wire [7:0] terminal = (is_odd && !out_clk) ? half : (half - 8'd1);

always @(posedge i_ref_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        counter <= 8'd0;
        reference<= 1'b0;
	o_div_clk<= 1'b0;
        out_clk <= 1'b0;
    end
    else if (bypass) begin
        counter <= 8'd0;
        reference<= 1'b0;
        out_clk <= 1'b0;
    end
    else if (counter >= terminal) begin
        counter <= 8'd0;
        reference<= ~reference;
        out_clk <= ~reference;
        o_div_clk <= bypass ? ref_clk : out_clk;
    end
    else begin
        counter <= counter + 8'd1;
    end
end


endmodule
