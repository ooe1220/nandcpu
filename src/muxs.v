module mux2_1 (
    input a,
    input b,
    input sel,
    output y
);

    wire nsel;
    wire w1;
    wire w2;

    not_gate u_not (
        .a(sel),
        .y(nsel)
    );

    and_gate u_and1 (
        .a(a),
        .b(nsel),
        .y(w1)
    );

    and_gate u_and2 (
        .a(b),
        .b(sel),
        .y(w2)
    );

    or_gate u_or (
        .a(w1),
        .b(w2),
        .y(y)
    );

endmodule
