.data

instructions:
.word 0x003100B3
.word 0x00A30293
.word 0x00742423
.word 0x00208863
.word 0x123452B7
.word 0x020000EF

.text
.globl main

main:
    la t0, instructions
    li t3, 6
    
loop:
    beqz t3, exit
    lw t1, 0(t0)
    
    andi t2, t1, 0x7F #Opcode
    li a0, 1
    mv a1, t2
    ecall
    li a0, 11
    li a1, 10
    ecall
    
    srli t2, t1, 7 #rd
    andi t2, t2, 0x1F
    li a0, 1
    mv a1, t2
    ecall
    li a0, 11
    li a1, 10
    ecall
    
    srli t2, t1, 12 #func3
    andi t2, t2, 0x07
    li a0, 1
    mv a1, t2
    ecall
    li a0, 11
    li a1, 10
    ecall
    
    srli t2, t1, 15 #rs1
    andi t2, t2, 0x1F
    li a0, 1
    mv a1, t2
    ecall
    li a0, 11
    li a1, 10
    ecall
    
    addi t0, t0, 4 #Next instruction
    addi t3, t3, -1
    j loop
    
exit:
    li a0, 10
    ecall #Some instructions dont have all fields, they are just printing whatever is extracted from those positions