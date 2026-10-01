`timescale 1ns/1ps

// ========================================
// NAND素子の定義(これを最小単位とする)
// ========================================
module nand_gate (
    input a,
    input b,
    output y
);

    //nand(y,a,b); // 本篇    <----- コメントアウト
    
    // MOSFET版 番外篇    <----- 追加
    supply1 VDD; // 電源
    supply0 GND; // 接地

    // PMOS: a または b が 低電圧 なら y を 高電圧 に引き上げ
    pmos p1 (y, VDD, a);
    pmos p2 (y, VDD, b);

    // NMOS: a と b が両方 高電圧 なら y を 低電圧 に引き下げ
    nmos n1 (y, net1, a);
    nmos n2 (net1, GND, b);
    
endmodule

// ========================================
// NOT素子
// ========================================
module not_gate (
    input a, // 入力
    output y // 出力
);

    nand_gate u_not (
        .a(a), // 入力aをNANDのAに繋ぐ
        .b(a), // 同じくNANDのBにも繋ぐ
        .y(y)
    );

endmodule

// ========================================
// AND素子
// ========================================
module and_gate (
    input a,
    input b,
    output y
);

    wire n;
    nand_gate g1(a, b, n); // 一つ目のNANDの出力を
    nand_gate g2(n, n, y); // NOTに繋ぐ(NANDの入力両方に繋ぐ)
endmodule

// ========================================
// OR素子
// ========================================
module or_gate (
    input a,
    input b,
    output y
);
    wire not_a;
    wire not_b;
    
    nand_gate u_not_a(a, a, not_a); // aを反転(NAND入力2本共a)
    nand_gate u_not_b(b, b, not_b); // bを反転(NAND入力2本共b)
    
    nand_gate nand_nota_notb(not_a, not_b, y); // NOT(a)とNOT(b)をNAND→OR
endmodule

// ========================================
// XOR素子
// ========================================
module xor_gate (
    input a,
    input b,
    output y
);

    wire n1; // A NAND B
    wire n2; // A NAND n1
    wire n3; // B NAND n1
    
    nand_gate g1(a, b, n1);
    nand_gate g2(a, n1, n2);
    nand_gate g3(n1, b, n3);
    nand_gate g4(n2, n3, y);

endmodule


// ========================================
// AND 3入力に対応
// ========================================
module and3 (
    input a,
    input b,
    input c,
    output y
);

    wire ab;

    and_gate g1 (
        .a(a),
        .b(b),
        .y(ab)
    );

    and_gate g2 (
        .a(ab),
        .b(c),
        .y(y)
    );

endmodule

