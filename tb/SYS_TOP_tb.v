`timescale 1ns/1ps
module SYS_TOP_tb;

localparam real REF_PERIOD  = 20.0;
localparam real UART_PERIOD = 271.2674;
localparam real BIT_T       = 32.0 * UART_PERIOD;

reg  REF_CLK = 0, UART_CLK = 0, RST = 0, RX_IN = 1;
wire TX_OUT, parity_error, stop_error;

SYS_TOP dut(.REF_CLK(REF_CLK),
            .UART_CLK(UART_CLK),
            .RST(RST),
            .RX_IN(RX_IN),
            .TX_OUT(TX_OUT),
            .parity_error(parity_error),
            .stop_error(stop_error));

always #(REF_PERIOD/2)  REF_CLK  = ~REF_CLK;
always #(UART_PERIOD/2) UART_CLK = ~UART_CLK;

integer errors = 0, checks = 0;


task send_byte(input [7:0] d);
    integer i;
    begin
        RX_IN = 0;        #(BIT_T);
        for (i = 0; i < 8; i = i + 1) begin
            RX_IN = d[i]; #(BIT_T);
        end
        RX_IN = ^d;       #(BIT_T);
        RX_IN = 1;        #(BIT_T);
    end
endtask


task recv_byte(output [7:0] d);
    integer i, waited;
    begin
        d = 8'hxx; waited = 0;
        while (TX_OUT !== 1'b0 && waited < 3_000_000) begin #200; waited = waited + 200; end
        if (TX_OUT !== 1'b0) begin
            $display("ERROR: timeout waiting for TX frame"); errors = errors + 1;
        end else begin
            #(BIT_T*1.5);
            for (i = 0; i < 8; i = i + 1) begin d[i] = TX_OUT; #(BIT_T); end
            #(BIT_T);
        end
    end
endtask

task check(input [8*20-1:0] name, input [15:0] got, input [15:0] exp);
    begin
        checks = checks + 1;
        if (got === exp)
            $display("  PASS  %0s : %d", name, got);
        else begin
            $display("  FAIL  %0s : got %d, expected %d", name, got, exp);
            errors = errors + 1;
        end
    end
endtask

task rf_write(input [7:0] addr, input [7:0] data);
    begin
        send_byte(8'hAA);
        send_byte(addr);
        send_byte(data);
    end
endtask

task rf_read(input [7:0] addr, output [7:0] data);
    begin
        send_byte(8'hBB);
        send_byte(addr);
        recv_byte(data);
    end
endtask

task alu(input [7:0] a, input [7:0] b, input [3:0] fun, output [15:0] res);
    reg [7:0] lo, hi;
    begin
        send_byte(8'hCC);
        send_byte(a);
        send_byte(b);
        send_byte({4'h0, fun});
        recv_byte(lo);
        recv_byte(hi);
        res = {hi, lo};
    end
endtask

reg [7:0]  rd;
reg [15:0] r;

initial begin
    $dumpfile("sys_top_tb.vcd");
    $dumpvars(0, SYS_TOP_tb);

    RST = 0; #200; RST = 1; #2000;

    $display("\n-- Configuration --");
    rf_write(8'h02, {6'd32, 1'b0, 1'b1});
    rf_write(8'h03, 8'd32);
    rf_read (8'h02, rd);
    check("REG2 readback", rd, 8'h81);
    rf_read (8'h03, rd);
    check("REG3 readback", rd, 8'd32);

    $display("\n-- Register file --");
    rf_write(8'h05, 8'hA5);
    rf_read(8'h05, rd);
    check("RF[0x05]", rd, 8'hA5);
    rf_write(8'h15, 8'hC3);
    rf_read(8'h15, rd);
    check("RF[0x15]", rd, 8'hC3);

    $display("\n-- ALU (0xCC) --");
    alu(8'd10, 8'd5,  4'd0, r);  check("ADD 10+5",   r, 16'd15);
    alu(8'd10, 8'd5,  4'd1, r);  check("SUB 10-5",   r, 16'd5);
    alu(8'd12, 8'd10, 4'd2, r);  check("MUL 12*10",  r, 16'd120);
    alu(8'd20, 8'd5,  4'd3, r);  check("DIV 20/5",   r, 16'd4);
    alu(8'd12, 8'd10, 4'd4, r);  check("AND",        r, 16'h0008);
    alu(8'd12, 8'd10, 4'd5, r);  check("OR",         r, 16'h000E);
    alu(8'd12, 8'd10, 4'd6, r);  check("NAND",       r, 16'h00F7);
    alu(8'd12, 8'd10, 4'd7, r);  check("NOR",        r, 16'h00F1);
    alu(8'd12, 8'd10, 4'd8, r);  check("XOR",        r, 16'h0006);
    alu(8'd12, 8'd10, 4'd9, r);  check("XNOR",       r, 16'h00F9);
    alu(8'd7,  8'd7,  4'd10, r); check("CMP A==B",   r, 16'd1);
    alu(8'd9,  8'd3,  4'd11, r); check("CMP A>B",    r, 16'd2);
    alu(8'd3,  8'd9,  4'd12, r); check("CMP A<B",    r, 16'd3);
    alu(8'd20, 8'd3,  4'd13, r); check("SHIFT A>>1", r, 16'd10);
    alu(8'd20, 8'd3,  4'd14, r); check("SHIFT A<<1", r, 16'd40);

    $display("\n-- ALU (0xDD, reuses REG0/REG1) --");
    send_byte(8'hDD);
    send_byte(8'h01);
    begin : dd
        reg [7:0] lo, hi;
        recv_byte(lo);
        recv_byte(hi);
        check("DD SUB 20-3", {hi, lo}, 16'd17);
    end

    $display("\n-- Error flags --");
    checks = checks + 1;
    if (!parity_error && !stop_error)
    $display("  PASS  no parity/stop errors");
    else begin
        $display("  FAIL  parity_error=%b stop_error=%b", parity_error, stop_error);
        errors = errors + 1;
    end

    $display("\n----------------------------------------");
    if (errors == 0) $display(" ALL TESTS PASSED (%0d checks)", checks);
    else             $display(" TESTS FAILED: %0d errors / %0d checks", errors, checks);
    $display("----------------------------------------\n");
    $stop;
end

endmodule

