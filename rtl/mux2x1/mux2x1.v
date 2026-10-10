module mux2x1(
    input mux0,
    input mux1,
    input sel,
    output out_mux
);


assign out_mux = sel? mux1: mux0;

endmodule
