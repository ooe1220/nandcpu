`timescale 1ns/1ps

module tb_reg8;
    reg  [7:0] d;
    reg        clk;
    wire [7:0] q;

    reg8 uut (.d(d), .clk(clk), .q(q));

    always #10 clk = ~clk;

    initial begin
        $dumpfile("out/regester_wave.vcd");
        $dumpvars(0, tb_reg8);

        $monitor("t=%0t | clk=%b d=%b | q=%b", $time, clk, d, q);

        clk = 0;
        d = 8'b00000000;
        #5;

        d = 8'b01010101;
        #10;  // clk立ち上がり → q=0101
        #10;  // clk=0 → まだホールド
        #10;  // clk=1 → q=1111
        d = 8'b10101010;
        #10;  // clk=0
        #10;  // clk=1 → q=1010
        d = 8'b0000;
        #20;  // q は 1010 のまま

        $finish;
    end
endmodule
