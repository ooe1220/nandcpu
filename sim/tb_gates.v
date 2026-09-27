`timescale 1ns/1ps

module tb_gates;

    // 信号
    reg a, b;
    wire y_nand, y_not, y_and, y_or, y_xor;
    
    // 各素子を追加
    nand_gate u_gate (.a(a), .b(b), .y(y_nand));
    not_gate  u_not ( .a(a), .y(y_not));
    and_gate  u_and ( .a(a), .b(b), .y(y_and));
    or_gate   u_or ( .a(a), .b(b), .y(y_or));
    xor_gate  u_xor ( .a(a), .b(b), .y(y_xor));
    
    initial begin
        $dumpfile("wave.vcd"); // 出力する波形
        $dumpvars(0, tb_gates); // 全階層の波形を記録
        
        $display("A B | NAND NOT AND OR XOR");
        $monitor("%b %b |  %b    %b   %b  %b  %b",
                  a, b, y_nand, y_not, y_and, y_or, y_xor);
        
        a = 0; b = 0; #10; // 10ns 時間を進める
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        
        $finish;
    end
endmodule
