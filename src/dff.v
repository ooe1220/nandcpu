`timescale 1ns/1ps

module d_latch (
    input  d,
    input  clk,
    output q,
    output q_n
);
    wire d_n;
    wire nand1_out;
    wire nand2_out;

    not_gate inv (.a(d), .y(d_n));
    nand_gate nand1 (.a(d),   .b(clk), .y(nand1_out));
    nand_gate nand2 (.a(d_n), .b(clk), .y(nand2_out));
    nand_gate nand3 (.a(nand1_out), .b(q_n), .y(q));
    nand_gate nand4 (.a(nand2_out), .b(q),   .y(q_n));

endmodule


module d_flipflop (
    input  d,
    input  clk,
    output q,
    output q_n
);
    wire clk_n, master_q, master_q_n;

    not_gate inv_clk (.a(clk), .y(clk_n));
    d_latch master (.d(d), .clk(clk), .q(master_q), .q_n(master_q_n));
    d_latch slave  (.d(master_q), .clk(clk_n), .q(q), .q_n(q_n));
endmodule
