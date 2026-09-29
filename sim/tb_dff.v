`timescale 1ns/1ps

module tb_dff;
    reg set, reset;
    wire q, q_not;

    sr_latch uut(.set(set), .reset(reset), .q(q), .q_not(q_not));

    initial begin
        $dumpfile("out/wave_sr_latch.vcd");
        $dumpvars(0, tb_dff);

        $display("Time | set | reset | q | q_not");
        $monitor("%4t |  %b  |   %b   | %b |   %b", $time, set, reset, q, q_not);

        set = 0; reset = 0; #10;
        set = 1; reset = 0; #10; ; set
        set = 0; reset = 0; #10; ; 保持
        set = 0; reset = 1; #10; ; reset
        set = 0; reset = 0; #10; ; 保持
        set = 1; reset = 1; #10; ; 禁止

        $finish;
    end
endmodule
