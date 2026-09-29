`timescale 1ns/1ps

// ========================================
// SRラッチ
// ========================================
module sr_latch(
    input set,    // 1でセット
    input reset,  // 1でリセット
    output q,
    output q_not
);
    wire set_inv, reset_inv;
    
    not_gate inv1(set, set_inv);
    not_gate inv2(reset, reset_inv);
    
    nand_gate g1(set_inv, q_not, q);
    nand_gate g2(reset_inv, q, q_not);
endmodule
