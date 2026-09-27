# シミュレータの設定（Icarus Verilog）
CC = iverilog
VVP = vvp

# ディレクトリ設定
SRC_DIR = src
SIM_DIR = sim

# ソースファイル（依存順：下位モジュールから並べる）
SRC = $(SRC_DIR)/gates.v $(SRC_DIR)/adders.v

# テストベンチファイル
TB_GATES = $(SIM_DIR)/tb_gates.v
TB_ADDER_8BIT = $(SIM_DIR)/tb_adder_8bit.v

# 波形ファイル（simディレクトリに出力）
WAVE_GATES = $(SIM_DIR)/wave_gates.vcd
WAVE_ADDER_8BIT = $(SIM_DIR)/wave_adder_8bit.vcd

# デフォルトターゲット（全部実行）
all: gates adder_8bit

# ---- 個別動作確認 ----
gates:
	$(CC) -o $(SIM_DIR)/tb_gates.out $(SRC) $(TB_GATES)
	$(VVP) $(SIM_DIR)/tb_gates.out
	@echo "波形: $(WAVE_GATES)"

adder_8bit:
	$(CC) -o $(SIM_DIR)/tb_adder_8bit.out $(SRC) $(TB_ADDER_8BIT)
	$(VVP) $(SIM_DIR)/tb_adder_8bit.out
	@echo "波形: $(WAVE_ADDER_8BIT)"

# 波形表示（GTKWave）
view_gates: gates
	gtkwave $(WAVE_GATES) &

view_adder_8bit: adder_8bit
	gtkwave $(WAVE_ADDER_8BIT) &

# 掃除
clean:
	rm -f $(SIM_DIR)/*.out $(SIM_DIR)/*.vcd

.PHONY: all gates adders adder_8bit view_gates view_adder_8bit clean
