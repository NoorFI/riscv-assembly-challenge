# **RISCV ASSEMBLY CHALLENGE**
## *MEDS Training Programme*
### **Module 3 Grand Assignment**
### *Hand-encoded Instructions*


**Overview:**</br>
There are total 6 types of RISCV instructions, each with different formats.
- R :
    - funct7   rs2   rs1   funct3   rd   opcode
- I :
    - imm[11:0]   rs1   funct3   rd   opcode
- S :
    - imm[11:5]   rs2   rs1   funct3   imm[4:0]   opcode
- B :
    - imm[12]   imm[10:5]   rs2   rs1   funct3   imm[4:1]   imm[11]   opcode
- U :
    - imm[31:12]   rd   opcode
- J :
    - imm[20]   imm[10:1]   imm[11]   imm[19:12]   rd   opcode

### *R instruction*

**Instruction**: *add x1,x2,x3*

**Step 1:** *For each field, write it in binary<br>*
funct7 --> 0000000</br>
rs2 --> x3 = 00011</br>
rs1 --> x2 = 00010</br>
funct3 --> 000</br>
rd --> x1 = 00001</br>
opcode --> 0110011</br>

**Step 2:** *Arrange them in order and write complete binary (32-bit)</br>*
0000 0000 0011 0001 0000 0000 1011 0011

**Step 3:** *Convert to hexadecimal</br>*
0x003100B3 (By taking 4 bits from LSB side, and converting)

### *I instruction*

**Instruction:** *addi x5,x6,10*

**Step 1:** *For each field, write it in binary</br>*
imm[11:0] --> 000000001010</br>
rs1 --> x6 = 00110</br>
funct3 --> 000</br>
rd --> x5 = 00101</br>
opcode --> 0010011</br>

**Step 2:** *Arrange them in order and write complete binary (32-bit)</br>*
0000 0000 1010 0011 0000 0010 1001 0011

**Step 3:** *Convert to hexadecimal</br>*
0x00A30293

### *S instruction*

**Instruction:** *sw x7,8(x8)*

**Step 1:** *For each field, write it in binary</br>*
imm[11:5] --> 0000000</br>
rs2 --> x7 = 00111</br>
rs1 --> x8 = 01000</br>
funct3 --> 010</br>
imm[4:0] --> 01000</br>
opcode --> 0100011</br>
Immediate has 8, in 12 bits thats 000000001000, this is then divided in 2 parts.

**Step 2:** *Arrange them in order and write complete binary (32-bit)</br>*
0000 0000 0111 0100 0010 0100 0010 0011

**Step 3:** *Convert to hexadecimal</br>*
0x00742423

### *B instruction*

**Instruction:** *beq x1,x2,16*

**Step 1:** *For each field, write it in binary</br>*
imm[12] --> 0</br>
imm[10:5] --> 000000</br>
rs2 --> x2 = 00010</br>
rs1 --> x1 = 00001</br>
funct3 --> 000</br>
imm[4:1] --> 1000</br>
imm[11] --> 0</br>
opcode --> 1100011</br>
Immediate has 16, in 13 bits thats 0000000010000, this is then divided in 4 parts.

**Step 2:** *Arrange them in order and write complete binary (32-bit)</br>*
0000 0010 0010 0000 1000 1000 0110 0011

**Step 3:** *Convert to hexadecimal</br>*
0x00208863

### *U instruction**

**Instruction:** *lui x5,0x12345*

**Step 1:** *For each field, write it in binary</br>*
imm[31:12] --> 0x12345 = 0001 0010 0011 0100 0101</br>
rd --> x5 = 00101</br>
opcode --> 0110111</br>

**Step 2:** *Arrange them in order and write complete binary (32-bit)</br>*
0001 0010 0011 0100 0101 0010 1011 0111

**Step 3:** *Convert to hexadecimal</br>*
0x123452B7

### *J instruction*

**Instruction:** *jal x1,32*

**Step 1:** *For each field, write it in binary</br>*
imm[20] --> 0</br>
imm[10:1] --> 0000010000</br>
imm[11] --> 0</br>
imm[19:12] --> 00000000</br>
rd --> x1 = 00001</br>
opcode --> 1101111</br>
Immediate has 32, in 20 bits thats 000000000000000100000, this is then divided in 4 parts.

**Step 2:** *Arrange them in order and write complete binary (32-bit)</br>*
0000 0010 0000 0000 0000 0000 1110 1111

**Step 3:** *Convert to hexadecimal</br>*
0x020000EF

Author:</br>
***Noor Fatima***