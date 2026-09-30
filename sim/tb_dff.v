`timescale 1ns/1ps

module tb_reg8;
    reg  [7:0] d;
    reg        clk;
    wire [7:0] q;

    reg8 uut (.d(d), .clk(clk), .q(q));

    always #10 clk = ~clk;

    initial begin
        $dumpfile("out/wave_tb_reg8.vcd");
        $dumpvars(0, tb_reg8);

        $monitor("t=%0t | clk=%b d=%b | q=%b", $time, clk, d, q);

        clk = 0;
        d = 8'b00000000;
        #5;

        // パターン1: clk=0 の間に d をセットして、立ち上がりで捕捉
        d = 8'b01010101;
        #10;  // clk=0 のまま
        #10;  // clk=1 立ち上がり → この瞬間の d=01010101 が捕捉される

        // パターン2: clk=1 の間に d を変える → q は変わらないはず
        #5;   // clk=1 のまま
        d = 8'b10101010;
        #10;  // clk=1 のまま → q は 01010101 のまま
        #5;
        d = 8'b11110000;
        #10;  // clk=1 のまま → q はまだ 01010101

        // パターン3: clk=0 に下がる
        #10;  // clk=0
        d = 8'b00001111;
        #10;  // clk=1 立ち上がり → この瞬間の d=00001111 が捕捉

        // パターン4: ホールド確認
        d = 8'b11111111;
        #20;  // q は 00001111 のまま

        $display("=== Test Done ===");
        $finish;
    end
endmodule
