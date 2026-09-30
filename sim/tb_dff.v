`timescale 1ns/1ps

module tb_dff;
    reg d;
    reg clk;
    wire q;
    wire q_n;

    d_ff uut (
        .d(d),
        .clk(clk),
        .q(q),
        .q_n(q_n)
    );

    // クロック生成（周期20ns）
    always #10 clk = ~clk;

    // 波形ダンプ（GTKWaveしたいとき用）
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_dff);
    end

    initial begin
        $monitor("t=%0t | clk=%b d=%b | q=%b q_n=%b", $time, clk, d, q, q_n);

        // 初期化
        clk = 0;
        d = 0;
        #5;

        // clk=0 の間に d を変えてもホールド
        d = 1;  #5;   // clk=0
        #10;         // clk=1 に → d=1 を透過 → q=1

        // clk=1 の間に d を変える → そのまま追随（ラッチだから）
        d = 0;  #5;   // q=0 になる
        d = 1;  #5;   // q=1 になる

        // clk=0 に戻す → ホールド
        #10;         // clk=0
        d = 0;  #10; // 変えても q は変わらない
        d = 1;  #10;

        // もう一回 clk=1
        #10;         // clk=1 → d=1 を捕捉
        d = 0;  #10; // clk=1 のまま → q=0 に追随

        $finish;
    end
endmodule
