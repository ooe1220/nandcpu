#!/bin/bash

# 論理素子
iverilog -o out/tb_gates.out src/gates.v sim/tb_gates.v
vvp out/tb_gates.out

# 加算器
iverilog -o out/tb_adders.out src/adders.v src/gates.v sim/tb_adders.v
vvp out/tb_adders.out

# 選択回路
iverilog -o out/tb_muxs.out src/muxs.v src/gates.v sim/tb_muxs.v
vvp out/tb_muxs.out 

