`include "constants.vams"
`include "disciplines.vams"

// ========================================
// カスタムPMOS/NMOSを使ったNANDゲート (Verilog-A)
// ========================================
module my_nand_va (a, b, y);

    // 入力・出力定義 (電気信号)
    input a, b;
    output y;
    electrical a, b, y;

    // 電源・接地 (内部的に定義)
    electrical VDD, GND;
    parameter real vdd_val = 1.8 from (0:inf); // 電源電圧

    // --- MOSFETのパラメータ定義 ---
    // 閾値電圧 (Threshold Voltage)
    parameter real vth_p = -0.4; // PMOSの閾値 (負の値が一般的)
    parameter real vth_n = 0.4;  // NMOSの閾値 (正の値が一般的)
    
    // オン抵抗 / オフ抵抗 (スイッチの近似)
    parameter real r_on  = 100;   // オン時の抵抗 [Ω]
    parameter real r_off = 1e8;   // オフ時の抵抗 [Ω] (非常に高い抵抗)

    // 内部ノード
    electrical net1;

    // アナログ動作ブロック
    analog begin

        // 1. 電源と接地の定義
        V(VDD) <+ vdd_val;
        V(GND) <+ 0.0;

        // ========================================
        // カスタムPMOS定義 (Pull-Up Network)
        // 条件: Vgs < Vth (または Vg < Vs + Vth)
        // ========================================
        
        // PMOS1 (ゲート=a, ソース=VDD)
        // Vgs = V(a) - V(VDD)
        if (V(a) - V(VDD) < vth_p) begin
            // ON: Vgs < Vth (Low電圧入力でON)
            R(p1_out, VDD) <+ r_on;
        end else begin
            // OFF
            R(p1_out, VDD) <+ r_off;
        end

        // PMOS2 (ゲート=b, ソース=VDD)
        if (V(b) - V(VDD) < vth_p) begin
            // ON
            R(p2_out, VDD) <+ r_on;
        end else begin
            // OFF
            R(p2_out, VDD) <+ r_off;
        end

        // PMOSの出力結合 (並列接続)
        V(y) <+ V(p1_out);
        V(y) <+ V(p2_out);


        // ========================================
        // カスタムNMOS定義 (Pull-Down Network)
        // 条件: Vgs > Vth
        // ========================================
        
        // NMOS1 (ゲート=a, ドレイン=y, ソース=net1)
        if (V(a) - V(net1) > vth_n) begin
            // ON
            R(y, net1) <+ r_on;
        end else begin
            // OFF
            R(y, net1) <+ r_off;
        end

        // NMOS2 (ゲート=b, ドレイン=net1, ソース=GND)
        if (V(b) - V(GND) > vth_n) begin
            // ON
            R(net1, GND) <+ r_on;
        end else begin
            // OFF
            R(net1, GND) <+ r_off;
        end

    end

endmodule
