`timescale 1ns/1ps

// ========================================
// 半加算器 (Half Adder)
// 自分で作ったXORとANDを使用
// ========================================
module half_adder (
    input a,
    input b,
    output sum,
    output carry
);

    // 和 → XORで計算
    xor_gate u_xor (a, b, sum);
    
    // 桁上り → ANDで計算
    and_gate u_and (a, b, carry);

endmodule

// ========================================
// 全加算器 (Full Adder)
// half_adder を2つと or_gate で構成
// 入力: A, B, Cin
// 出力: Sum, Cout
// ========================================
module full_adder (
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);

    wire sum1;      // 1段目の half_adder の和
    wire carry1;    // 1段目の half_adder の桁上がり
    wire carry2;    // 2段目の half_adder の桁上がり

    // 1段目: A + B
    half_adder ha1 (
        .a(A),
        .b(B),
        .sum(sum1),
        .carry(carry1)
    );

    // 2段目: sum1 + Cin
    half_adder ha2 (
        .a(sum1),
        .b(Cin),
        .sum(Sum),
        .carry(carry2)
    );

    // ORの部分
    or_gate u_or (
        .a(carry1),
        .b(carry2),
        .y(Cout)
    );

endmodule

// ========================================
// 8ビット加算器 (Ripple Carry Adder)
// full_adder を8個連結
// 入力: A[7:0], B[7:0], Cin
// 出力: Sum[7:0], Cout
// ========================================
module adder_8bit (
    input  [7:0] A,   // 8bit値(A+BのA)
    input  [7:0] B,   // 8bit値(A+BのB)
    input        Cin, // 初期キャリー
    output [7:0] Sum, // 結果
    output       Cout // オーバーフロー(Cフラグ)
);

    wire c1, c2, c3, c4, c5, c6, c7;
    // 各全加算器を繋ぐ

    full_adder fa0 (A[0], B[0], Cin, Sum[0], c1);
    full_adder fa1 (A[1], B[1], c1,   Sum[1], c2);
    full_adder fa2 (A[2], B[2], c2,   Sum[2], c3);
    full_adder fa3 (A[3], B[3], c3,   Sum[3], c4);
    full_adder fa4 (A[4], B[4], c4,   Sum[4], c5);
    full_adder fa5 (A[5], B[5], c5,   Sum[5], c6);
    full_adder fa6 (A[6], B[6], c6,   Sum[6], c7);
    full_adder fa7 (A[7], B[7], c7,   Sum[7], Cout);

endmodule
