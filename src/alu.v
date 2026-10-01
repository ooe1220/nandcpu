`timescale 1ns/1ps

// ========================================
// 8種類から1つを選択する回路
//
// sel0 = ADD
// sel1 = SUB
// sel2 = AND
// sel3 = OR
// sel4 = XOR
// sel5 = INC
// sel6 = DEC
// sel7 = 未使用
//
// 選択された結果だけがYに出る
// ========================================
module alu_result_select (
    input [7:0] R0,
    input [7:0] R1,
    input [7:0] R2,
    input [7:0] R3,
    input [7:0] R4,
    input [7:0] R5,
    input [7:0] R6,
    input [7:0] R7,

    input sel0,
    input sel1,
    input sel2,
    input sel3,
    input sel4,
    input sel5,
    input sel6,
    input sel7,

    output [7:0] Y
);

    wire [7:0] w0;
    wire [7:0] w1;
    wire [7:0] w2;
    wire [7:0] w3;
    wire [7:0] w4;
    wire [7:0] w5;
    wire [7:0] w6;
    wire [7:0] w7;

    // ========================================
    // 各演算結果を選択信号でマスクする
    // ========================================

    and_gate g00 (R0[0], sel0, w0[0]);
    and_gate g01 (R0[1], sel0, w0[1]);
    and_gate g02 (R0[2], sel0, w0[2]);
    and_gate g03 (R0[3], sel0, w0[3]);
    and_gate g04 (R0[4], sel0, w0[4]);
    and_gate g05 (R0[5], sel0, w0[5]);
    and_gate g06 (R0[6], sel0, w0[6]);
    and_gate g07 (R0[7], sel0, w0[7]);

    and_gate g10 (R1[0], sel1, w1[0]);
    and_gate g11 (R1[1], sel1, w1[1]);
    and_gate g12 (R1[2], sel1, w1[2]);
    and_gate g13 (R1[3], sel1, w1[3]);
    and_gate g14 (R1[4], sel1, w1[4]);
    and_gate g15 (R1[5], sel1, w1[5]);
    and_gate g16 (R1[6], sel1, w1[6]);
    and_gate g17 (R1[7], sel1, w1[7]);

    and_gate g20 (R2[0], sel2, w2[0]);
    and_gate g21 (R2[1], sel2, w2[1]);
    and_gate g22 (R2[2], sel2, w2[2]);
    and_gate g23 (R2[3], sel2, w2[3]);
    and_gate g24 (R2[4], sel2, w2[4]);
    and_gate g25 (R2[5], sel2, w2[5]);
    and_gate g26 (R2[6], sel2, w2[6]);
    and_gate g27 (R2[7], sel2, w2[7]);

    and_gate g30 (R3[0], sel3, w3[0]);
    and_gate g31 (R3[1], sel3, w3[1]);
    and_gate g32 (R3[2], sel3, w3[2]);
    and_gate g33 (R3[3], sel3, w3[3]);
    and_gate g34 (R3[4], sel3, w3[4]);
    and_gate g35 (R3[5], sel3, w3[5]);
    and_gate g36 (R3[6], sel3, w3[6]);
    and_gate g37 (R3[7], sel3, w3[7]);

    and_gate g40 (R4[0], sel4, w4[0]);
    and_gate g41 (R4[1], sel4, w4[1]);
    and_gate g42 (R4[2], sel4, w4[2]);
    and_gate g43 (R4[3], sel4, w4[3]);
    and_gate g44 (R4[4], sel4, w4[4]);
    and_gate g45 (R4[5], sel4, w4[5]);
    and_gate g46 (R4[6], sel4, w4[6]);
    and_gate g47 (R4[7], sel4, w4[7]);

    and_gate g50 (R5[0], sel5, w5[0]);
    and_gate g51 (R5[1], sel5, w5[1]);
    and_gate g52 (R5[2], sel5, w5[2]);
    and_gate g53 (R5[3], sel5, w5[3]);
    and_gate g54 (R5[4], sel5, w5[4]);
    and_gate g55 (R5[5], sel5, w5[5]);
    and_gate g56 (R5[6], sel5, w5[6]);
    and_gate g57 (R5[7], sel5, w5[7]);

    and_gate g60 (R6[0], sel6, w6[0]);
    and_gate g61 (R6[1], sel6, w6[1]);
    and_gate g62 (R6[2], sel6, w6[2]);
    and_gate g63 (R6[3], sel6, w6[3]);
    and_gate g64 (R6[4], sel6, w6[4]);
    and_gate g65 (R6[5], sel6, w6[5]);
    and_gate g66 (R6[6], sel6, w6[6]);
    and_gate g67 (R6[7], sel6, w6[7]);

    and_gate g70 (R7[0], sel7, w7[0]);
    and_gate g71 (R7[1], sel7, w7[1]);
    and_gate g72 (R7[2], sel7, w7[2]);
    and_gate g73 (R7[3], sel7, w7[3]);
    and_gate g74 (R7[4], sel7, w7[4]);
    and_gate g75 (R7[5], sel7, w7[5]);
    and_gate g76 (R7[6], sel7, w7[6]);
    and_gate g77 (R7[7], sel7, w7[7]);


    // ========================================
    // 全結果をORでまとめる
    // ========================================

    wire [7:0] o01;
    wire [7:0] o23;
    wire [7:0] o45;
    wire [7:0] o67;

    wire [7:0] o0123;
    wire [7:0] o4567;


    // 0 + 1
    or_gate o010 (w0[0], w1[0], o01[0]);
    or_gate o011 (w0[1], w1[1], o01[1]);
    or_gate o012 (w0[2], w1[2], o01[2]);
    or_gate o013 (w0[3], w1[3], o01[3]);
    or_gate o014 (w0[4], w1[4], o01[4]);
    or_gate o015 (w0[5], w1[5], o01[5]);
    or_gate o016 (w0[6], w1[6], o01[6]);
    or_gate o017 (w0[7], w1[7], o01[7]);

    // 2 + 3
    or_gate o230 (w2[0], w3[0], o23[0]);
    or_gate o231 (w2[1], w3[1], o23[1]);
    or_gate o232 (w2[2], w3[2], o23[2]);
    or_gate o233 (w2[3], w3[3], o23[3]);
    or_gate o234 (w2[4], w3[4], o23[4]);
    or_gate o235 (w2[5], w3[5], o23[5]);
    or_gate o236 (w2[6], w3[6], o23[6]);
    or_gate o237 (w2[7], w3[7], o23[7]);

    // 4 + 5
    or_gate o450 (w4[0], w5[0], o45[0]);
    or_gate o451 (w4[1], w5[1], o45[1]);
    or_gate o452 (w4[2], w5[2], o45[2]);
    or_gate o453 (w4[3], w5[3], o45[3]);
    or_gate o454 (w4[4], w5[4], o45[4]);
    or_gate o455 (w4[5], w5[5], o45[5]);
    or_gate o456 (w4[6], w5[6], o45[6]);
    or_gate o457 (w4[7], w5[7], o45[7]);

    // 6 + 7
    or_gate o670 (w6[0], w7[0], o67[0]);
    or_gate o671 (w6[1], w7[1], o67[1]);
    or_gate o672 (w6[2], w7[2], o67[2]);
    or_gate o673 (w6[3], w7[3], o67[3]);
    or_gate o674 (w6[4], w7[4], o67[4]);
    or_gate o675 (w6[5], w7[5], o67[5]);
    or_gate o676 (w6[6], w7[6], o67[6]);
    or_gate o677 (w6[7], w7[7], o67[7]);

    // 0,1,2,3
    or_gate o01230 (o01[0], o23[0], o0123[0]);
    or_gate o01231 (o01[1], o23[1], o0123[1]);
    or_gate o01232 (o01[2], o23[2], o0123[2]);
    or_gate o01233 (o01[3], o23[3], o0123[3]);
    or_gate o01234 (o01[4], o23[4], o0123[4]);
    or_gate o01235 (o01[5], o23[5], o0123[5]);
    or_gate o01236 (o01[6], o23[6], o0123[6]);
    or_gate o01237 (o01[7], o23[7], o0123[7]);

    // 4,5,6,7
    or_gate o45670 (o45[0], o67[0], o4567[0]);
    or_gate o45671 (o45[1], o67[1], o4567[1]);
    or_gate o45672 (o45[2], o67[2], o4567[2]);
    or_gate o45673 (o45[3], o67[3], o4567[3]);
    or_gate o45674 (o45[4], o67[4], o4567[4]);
    or_gate o45675 (o45[5], o67[5], o4567[5]);
    or_gate o45676 (o45[6], o67[6], o4567[6]);
    or_gate o45677 (o45[7], o67[7], o4567[7]);

    // 最終結果
    or_gate final0 (o0123[0], o4567[0], Y[0]);
    or_gate final1 (o0123[1], o4567[1], Y[1]);
    or_gate final2 (o0123[2], o4567[2], Y[2]);
    or_gate final3 (o0123[3], o4567[3], Y[3]);
    or_gate final4 (o0123[4], o4567[4], Y[4]);
    or_gate final5 (o0123[5], o4567[5], Y[5]);
    or_gate final6 (o0123[6], o4567[6], Y[6]);
    or_gate final7 (o0123[7], o4567[7], Y[7]);

endmodule


// ========================================
// 8bit ALU
//
// ALU_OP
//
// 000 = ADD
// 001 = SUB
// 010 = AND
// 011 = OR
// 100 = XOR
// 101 = INC
// 110 = DEC
// 111 = 未使用
// ========================================
module alu_8bit (
    input  [7:0] A,
    input  [7:0] B,
    input  [2:0] ALU_OP,
    output [7:0] Y,
    output Cout
);

    // ========================================
    // ADD
    // ========================================

    wire [7:0] add_result;
    wire add_cout;

    adder_8bit add (
        .A(A),
        .B(B),
        .Cin(1'b0),
        .Sum(add_result),
        .Cout(add_cout)
    );


    // ========================================
    // SUB
    //
    // A - B = A + (~B) + 1
    // ========================================

    wire [7:0] B_n;

    not_gate sub_n0 (B[0], B_n[0]);
    not_gate sub_n1 (B[1], B_n[1]);
    not_gate sub_n2 (B[2], B_n[2]);
    not_gate sub_n3 (B[3], B_n[3]);
    not_gate sub_n4 (B[4], B_n[4]);
    not_gate sub_n5 (B[5], B_n[5]);
    not_gate sub_n6 (B[6], B_n[6]);
    not_gate sub_n7 (B[7], B_n[7]);

    wire [7:0] sub_result;
    wire sub_cout;

    adder_8bit sub (
        .A(A),
        .B(B_n),
        .Cin(1'b1),
        .Sum(sub_result),
        .Cout(sub_cout)
    );


    // ========================================
    // AND
    // ========================================

    wire [7:0] and_result;

    and_gate and0 (A[0], B[0], and_result[0]);
    and_gate and1 (A[1], B[1], and_result[1]);
    and_gate and2 (A[2], B[2], and_result[2]);
    and_gate and3 (A[3], B[3], and_result[3]);
    and_gate and4 (A[4], B[4], and_result[4]);
    and_gate and5 (A[5], B[5], and_result[5]);
    and_gate and6 (A[6], B[6], and_result[6]);
    and_gate and7 (A[7], B[7], and_result[7]);


    // ========================================
    // OR
    // ========================================

    wire [7:0] or_result;

    or_gate or0 (A[0], B[0], or_result[0]);
    or_gate or1 (A[1], B[1], or_result[1]);
    or_gate or2 (A[2], B[2], or_result[2]);
    or_gate or3 (A[3], B[3], or_result[3]);
    or_gate or4 (A[4], B[4], or_result[4]);
    or_gate or5 (A[5], B[5], or_result[5]);
    or_gate or6 (A[6], B[6], or_result[6]);
    or_gate or7 (A[7], B[7], or_result[7]);


    // ========================================
    // XOR
    // ========================================

    wire [7:0] xor_result;

    xor_gate xor0 (A[0], B[0], xor_result[0]);
    xor_gate xor1 (A[1], B[1], xor_result[1]);
    xor_gate xor2 (A[2], B[2], xor_result[2]);
    xor_gate xor3 (A[3], B[3], xor_result[3]);
    xor_gate xor4 (A[4], B[4], xor_result[4]);
    xor_gate xor5 (A[5], B[5], xor_result[5]);
    xor_gate xor6 (A[6], B[6], xor_result[6]);
    xor_gate xor7 (A[7], B[7], xor_result[7]);


    // ========================================
    // INC
    //
    // A + 1
    // ========================================

    wire [7:0] inc_result;
    wire inc_cout;

    adder_8bit inc (
        .A(A),
        .B(8'b00000001),
        .Cin(1'b0),
        .Sum(inc_result),
        .Cout(inc_cout)
    );


    // ========================================
    // DEC
    //
    // A - 1
    //
    // A + 11111111
    // ========================================

    wire [7:0] dec_result;
    wire dec_cout;

    adder_8bit dec (
        .A(A),
        .B(8'b11111111),
        .Cin(1'b0),
        .Sum(dec_result),
        .Cout(dec_cout)
    );


    // ========================================
    // ALU_OPを7種類の選択信号に変換
    //
    // 000 → ADD
    // 001 → SUB
    // 010 → AND
    // 011 → OR
    // 100 → XOR
    // 101 → INC
    // 110 → DEC
    // 111 → 未使用
    // ========================================

    wire op2_n;
    wire op1_n;
    wire op0_n;

    not_gate op2_inv (
        .a(ALU_OP[2]),
        .y(op2_n)
    );

    not_gate op1_inv (
        .a(ALU_OP[1]),
        .y(op1_n)
    );

    not_gate op0_inv (
        .a(ALU_OP[0]),
        .y(op0_n)
    );


    wire sel_add;
    wire sel_sub;
    wire sel_and;
    wire sel_or;
    wire sel_xor;
    wire sel_inc;
    wire sel_dec;
    wire sel_unused;


    // 000 = ADD
    and3 select_add (
        .a(op2_n),
        .b(op1_n),
        .c(op0_n),
        .y(sel_add)
    );

    // 001 = SUB
    and3 select_sub (
        .a(op2_n),
        .b(op1_n),
        .c(ALU_OP[0]),
        .y(sel_sub)
    );

    // 010 = AND
    and3 select_and (
        .a(op2_n),
        .b(ALU_OP[1]),
        .c(op0_n),
        .y(sel_and)
    );

    // 011 = OR
    and3 select_or (
        .a(op2_n),
        .b(ALU_OP[1]),
        .c(ALU_OP[0]),
        .y(sel_or)
    );

    // 100 = XOR
    and3 select_xor (
        .a(ALU_OP[2]),
        .b(op1_n),
        .c(op0_n),
        .y(sel_xor)
    );

    // 101 = INC
    and3 select_inc (
        .a(ALU_OP[2]),
        .b(op1_n),
        .c(ALU_OP[0]),
        .y(sel_inc)
    );

    // 110 = DEC
    and3 select_dec (
        .a(ALU_OP[2]),
        .b(ALU_OP[1]),
        .c(op0_n),
        .y(sel_dec)
    );

    // 111 = 未使用
    and3 select_unused (
        .a(ALU_OP[2]),
        .b(ALU_OP[1]),
        .c(ALU_OP[0]),
        .y(sel_unused)
    );


    // ========================================
    // 演算結果を1つ選ぶ
    // ========================================

    alu_result_select result_select (
        .R0(add_result),
        .R1(sub_result),
        .R2(and_result),
        .R3(or_result),
        .R4(xor_result),
        .R5(inc_result),
        .R6(dec_result),
        .R7(8'b00000000),

        .sel0(sel_add),
        .sel1(sel_sub),
        .sel2(sel_and),
        .sel3(sel_or),
        .sel4(sel_xor),
        .sel5(sel_inc),
        .sel6(sel_dec),
        .sel7(sel_unused),

        .Y(Y)
    );


    // ========================================
    // Cout
    //
    // 今回は算術演算のCoutだけ出す
    //
    // ADD → add_cout
    // SUB → sub_cout
    // INC → inc_cout
    // DEC → dec_cout
    // 論理演算 → 0
    // ========================================

    wire cout_add;
    wire cout_sub;
    wire cout_inc;
    wire cout_dec;

    and_gate cout_add_gate (
        .a(add_cout),
        .b(sel_add),
        .y(cout_add)
    );

    and_gate cout_sub_gate (
        .a(sub_cout),
        .b(sel_sub),
        .y(cout_sub)
    );

    and_gate cout_inc_gate (
        .a(inc_cout),
        .b(sel_inc),
        .y(cout_inc)
    );

    and_gate cout_dec_gate (
        .a(dec_cout),
        .b(sel_dec),
        .y(cout_dec)
    );


    wire cout_01;
    wire cout_23;

    or_gate cout_or1 (
        .a(cout_add),
        .b(cout_sub),
        .y(cout_01)
    );

    or_gate cout_or2 (
        .a(cout_inc),
        .b(cout_dec),
        .y(cout_23)
    );

    or_gate cout_final (
        .a(cout_01),
        .b(cout_23),
        .y(Cout)
    );

endmodule
