# gates.v

## NAND

<img width="266" height="381" alt="nand_cmos drawio" src="https://github.com/user-attachments/assets/39694fb0-6c00-4c8e-a340-3c0a5f36378a" />

| **a** | **b** | **PMOS1** | **PMOS2** | **NMOS1** | **NMOS2** | **y** |
| :---- | :---- | :-------- | :-------- | :-------- | :-------- | :---- |
| 0     | 0     | ON        | ON        | OFF       | OFF       | 1     |
| 0     | 1     | ON        | OFF       | OFF       | ON        | 1     |
| 1     | 0     | OFF       | ON        | ON        | OFF       | 1     |
| 1     | 1     | OFF       | OFF       | ON        | ON        | 0     |

※a=1,b=0の場合、NMOS2がOFFとなる為、NMOS側の接地への経路は成立しない。

## NOT

<img width="180" height="57" alt="not drawio (3)" src="https://github.com/user-attachments/assets/dc86bb39-0424-4e60-b111-948316351e73" />

## AND

<img width="264" height="77" alt="and drawio (1)" src="https://github.com/user-attachments/assets/934c1999-1d6c-4ac7-bf9b-b95225124146" />

## OR

<img width="303" height="138" alt="or drawio (2)" src="https://github.com/user-attachments/assets/39f4faee-cf8d-444b-b2c5-0fb4e16c6645" />


## XOR

<img width="366" height="136" alt="xor drawio" src="https://github.com/user-attachments/assets/0ded8422-ec84-49c7-b111-08019dc6d335" />

# adders.v

## 半加算器

<img width="271" height="181" alt="hadder drawio" src="https://github.com/user-attachments/assets/a897f724-676a-4d40-9bb7-534caea93f6b" />

## 全加算器

<img width="655" height="270" alt="faddr" src="https://github.com/user-attachments/assets/757ef6d1-f5ac-4b61-94b6-491cac8c0e1a" />

## 8bit加算器

# muxs.v

## mux2

<img width="274" height="158" alt="未命名绘图 drawio" src="https://github.com/user-attachments/assets/55f42494-9535-41af-b43a-696607b4e8f6" />

| sel |  出力 y |
| --- | ------ | 
| 0   |  a    |
| 1   | b   |


## mux8

<img width="273" height="247" alt="mux8 drawio" src="https://github.com/user-attachments/assets/44b05d4a-5f01-4d18-8af9-bb48e33248e2" />

例
```
A   = 8'b10101010
B   = 8'b11001100
```

| sel | 選択 | Y[7] … Y[0] | 2進数        |
| --- | -- | ----------- | ---------- |
| 0   | A  | A[7] … A[0] | `10101010` |
| 1   | B  | B[7] … B[0] | `11001100` |


# dff.v

## Dラッチ

<img width="369" height="151" alt="dlach drawio" src="https://github.com/user-attachments/assets/3cbbbcc2-68ab-4a18-993e-ebf60245a827" />

## Dフリップフロップ

<img width="427" height="185" alt="dff drawio (1)" src="https://github.com/user-attachments/assets/0e6f2124-a1a2-498e-ba40-815b645ef21b" />

| clk     | d   | q          |
| ------- | --- | ---------- |
| 0       | 0/1 | 保持         |
| **0→1** | 0/1   | **dに書き換え** |
| 1       | 0/1 | **保持**     |


## 8bitレジスタ

<img width="273" height="247" alt="regester8 drawio" src="https://github.com/user-attachments/assets/3430cf4c-8c8a-4821-94c4-855a426ec545" />

```
d[7:0] = 11001100
          ↓ 立ち上がり
q[7:0] = 11001100
```
