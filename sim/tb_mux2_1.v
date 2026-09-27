`timescale 1ns/1ps

module tb_mux2_1;
    reg  a, b;
    reg  sel;
    wire y;

    mux2_1 uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        $dumpfile("wave_mux2_1.vcd");
        $dumpvars(0, tb_mux2_1);

        $display("Time | a | b | sel | y");
        $monitor("%4t | %b | %b |  %b  | %b",
                  $time, a, b, sel, y);

        // sel=0 → a が出力されるはず
        a = 1'b0; b = 1'b0; sel = 1'b0; #10;
        a = 1'b1; b = 1'b0; sel = 1'b0; #10;
        a = 1'b0; b = 1'b1; sel = 1'b0; #10;
        a = 1'b1; b = 1'b1; sel = 1'b0; #10;

        // sel=1 → b が出力されるはず
        a = 1'b0; b = 1'b0; sel = 1'b1; #10;
        a = 1'b1; b = 1'b0; sel = 1'b1; #10;
        a = 1'b0; b = 1'b1; sel = 1'b1; #10;
        a = 1'b1; b = 1'b1; sel = 1'b1; #10;

        $finish;
    end
endmodule
