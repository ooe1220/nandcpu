#!/bin/bash

# 論理素子
# iverilog -o out/tb_gates.out src/gates.v sim/tb_gates.v
# vvp out/tb_gates.out

# 加算器
# iverilog -o out/tb_adders.out src/adders.v src/gates.v sim/tb_adders.v
# vvp out/tb_adders.out

# 選択回路
# iverilog -o out/tb_muxs.out sim/tb_muxs.v src/muxs.v src/gates.v
# vvp out/tb_muxs.out 

# フリップフロップ
iverilog -o out/diff.out src/gates.v src/dff.v sim/tb_dff.v
vvp out/diff.out 

# 8bitレジスタ
# iverilog -o out/regester.out sim/tb_regester.v src/regester.v src/dff.v src/gates.v
# vvp out/regester.out 
