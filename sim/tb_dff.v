`timescale 1ns/1ps

module tb_d_flipflop;
    reg d;
    reg clk;
    wire q;
    wire q_n;

    d_flipflop uut (
        .d(d),
        .clk(clk),
        .q(q),
        .q_n(q_n)
    );

    always #10 clk = ~clk;

    initial begin
        $dumpfile("out/wave_d_flipflop.vcd");
        $dumpvars(0, uut);

        $monitor("t=%0t | clk=%b d=%b | q=%b q_n=%b",
                 $time, clk, d, q, q_n);

        clk = 0;
        d = 0;

        // clk=0
        #5;
        d = 1;

        // t=10: clk ↑ → q=1
        #10;

        // clk=1の間にdを0へ
        // qは1のまま
        #5;
        d = 0;

        // t=20: clk ↓
        #10;

        // clk=0の間にd=0
        // 次のclk↑でq=0
        #5;

        // t=30: clk ↑ → q=0
        #10;

        // clk=1の間にd=1
        // qは0のまま
        #5;
        d = 1;

        // t=40: clk ↓
        #10;

        // t=50: clk ↑ → q=1
        #10;

        $display("=== Test Done ===");
        $finish;
    end

endmodule
