`timescale 1ns/1ps

module tb_mux8;

    reg  [7:0] A;
    reg  [7:0] B;
    reg        sel;
    wire [7:0] Y;

    mux8 uut (
        .A(A),
        .B(B),
        .sel(sel),
        .Y(Y)
    );

    initial begin
        $dumpfile("mux8.vcd");
        $dumpvars(0, tb_mux8);

        // 最初に一度だけ設定
        $monitor("time=%0t sel=%b A=%b B=%b Y=%b",
                 $time, sel, A, B, Y);

        // TEST1
        A   = 8'b10110010;
        B   = 8'b01001101;
        sel = 1'b0;

        #10;

        // TEST2
        sel = 1'b1;

        #10;

        // TEST3
        A   = 8'b11111111;
        B   = 8'b00000000;
        sel = 1'b0;

        #10;

        // TEST4
        sel = 1'b1;

        #10;

        $finish;
    end

endmodule
