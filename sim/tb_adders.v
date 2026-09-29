`timescale 1ns/1ps

module tb_adder_8bit;
    reg  [7:0] A, B;
    reg        Cin;
    wire [7:0] Sum;
    wire       Cout;

    adder_8bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        $dumpfile("out/wave_adder.vcd");
        $dumpvars(0, tb_adder_8bit);

        $display("Time |   A   |   B   | Cin |  Sum  | Cout");
        $monitor("%4t | %b | %b |  %b  | %b |  %b",
                  $time, A, B, Cin, Sum, Cout);

        // 複数通り検証 切り替え
        A = 8'd0;   B = 8'd0;   Cin = 1'b0; #10;
        A = 8'd50;  B = 8'd60;  Cin = 1'b0; #10;
        A = 8'd255; B = 8'd1;   Cin = 1'b0; #10;
        A = 8'd255; B = 8'd255; Cin = 1'b0; #10;
        A = 8'd85;  B = 8'd170; Cin = 1'b0; #10;
        A = 8'd0;   B = 8'd0;   Cin = 1'b1; #10;

        $finish;
    end
endmodule
