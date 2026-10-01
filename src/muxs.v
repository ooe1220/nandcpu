// ========================================
// 2入力 1bit MUX
// sel = 0 → a
// sel = 1 → b
// ========================================
module mux2 (
    input a,
    input b,
    input sel,
    output y
);

    wire sel_n;
    wire w1;
    wire w2;

    not_gate n1 (
        .a(sel),
        .y(sel_n)
    );

    and_gate a1 (
        .a(a),
        .b(sel_n),
        .y(w1)
    );

    and_gate a2 (
        .a(b),
        .b(sel),
        .y(w2)
    );

    or_gate o1 (
        .a(w1),
        .b(w2),
        .y(y)
    );

endmodule

// ========================================
// 8bit MUX
// sel = 0 → A
// sel = 1 → B
// ========================================
module mux8 (
    input [7:0] A,
    input [7:0] B,
    input sel,
    output [7:0] Y
);

    mux2 m0 (A[0], B[0], sel, Y[0]);
    mux2 m1 (A[1], B[1], sel, Y[1]);
    mux2 m2 (A[2], B[2], sel, Y[2]);
    mux2 m3 (A[3], B[3], sel, Y[3]);
    mux2 m4 (A[4], B[4], sel, Y[4]);
    mux2 m5 (A[5], B[5], sel, Y[5]);
    mux2 m6 (A[6], B[6], sel, Y[6]);
    mux2 m7 (A[7], B[7], sel, Y[7]);

endmodule
