`timescale 1ns/1ps

module reg8 (
    input  [7:0] d,
    input        clk,
    output [7:0] q
);

    d_flipflop ff0 (.d(d[0]), .clk(clk), .q(q[0]), .q_n());
    d_flipflop ff1 (.d(d[1]), .clk(clk), .q(q[1]), .q_n());
    d_flipflop ff2 (.d(d[2]), .clk(clk), .q(q[2]), .q_n());
    d_flipflop ff3 (.d(d[3]), .clk(clk), .q(q[3]), .q_n());
    d_flipflop ff4 (.d(d[4]), .clk(clk), .q(q[4]), .q_n());
    d_flipflop ff5 (.d(d[5]), .clk(clk), .q(q[5]), .q_n());
    d_flipflop ff6 (.d(d[6]), .clk(clk), .q(q[6]), .q_n());
    d_flipflop ff7 (.d(d[7]), .clk(clk), .q(q[7]), .q_n());

endmodule
