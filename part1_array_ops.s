.data
array:
.word 12 10 8 6 4 2 0 -2 -4 -6 -8 -10

size:
.word 12

sumlabel:
.asciiz "Sum: "

minlabel:
.asciiz "Min: "

maxlabel:
.asciiz "Max: "

neglabel:
.asciiz "Number of negative integers: "

.text
.globl main

main:
    la a0, array #sum
    li a1, 12
    jal ra, sum
    mv t0, a0
    li a0, 4
    la a1, sumlabel
    ecall
    li a0, 1
    mv a1, t0
    ecall
    li a0, 11
    li a1, 10
    ecall
    
    la a0, array #min
    li a1, 12
    jal ra, min
    mv t0, a0
    li a0, 4
    la a1, minlabel
    ecall
    li a0, 1
    mv a1, t0
    ecall
    li a0, 11
    li a1, 10
    ecall
    
    la a0, array #max
    li a1, 12
    jal ra, max
    mv t0, a0
    li a0, 4
    la a1, maxlabel
    ecall
    li a0, 1
    mv a1, t0
    ecall
    li a0, 11
    li a1, 10
    ecall
    
    la a0, array #neg
    li a1, 12
    jal ra, negative
    mv t0, a0
    li a0, 4
    la a1, neglabel
    ecall
    li a0, 1
    mv a1, t0
    ecall
    li a0, 11
    li a1, 10
    ecall
    li a0, 10
    ecall
    
sum:
    addi sp, sp, -8
    sw ra, 4(sp)
    sw s0, 0(sp)
    mv s0, a0
    li t0, 0
    li t1, 0
sloop:
    bge t1, a1, sdone
    slli t2, t1, 2
    add t3, s0, t2
    lw t4, 0(t3)
    add t0, t0, t4
    addi t1, t1, 1
    j sloop
sdone:
    mv a0, t0
    lw s0, 0(sp)
    lw ra, 4(sp)
    addi sp, sp, 8
    ret
    
min:
    addi sp, sp, -8
    sw ra, 4(sp)
    sw s0, 0(sp)
    mv s0, a0
    lw t0, 0(s0)
    li t1, 1
minloop:
    bge t1, a1, mindone
    slli t2, t1, 2
    add t3, s0, t2
    lw t4, 0(t3)
    bge t4, t0, notsmall
    mv t0, t4
notsmall:
    addi t1, t1, 1
    j minloop
mindone:
    mv a0, t0
    lw s0, 0(sp)
    lw ra, 4(sp)
    addi sp, sp, 8
    ret

max:
    addi sp, sp, -8
    sw ra, 4(sp)
    sw s0, 0(sp)
    mv s0, a0
    lw t0, 0(s0)
    li t1, 1
maxloop:
    bge t1, a1, maxdone
    slli t2, t1, 2
    add t3, s0, t2
    lw t4, 0(t3)
    ble t4, t0, notbig
    mv t0, t4
notbig:
    addi t1, t1, 1
    j maxloop
maxdone:
    mv a0, t0
    lw s0, 0(sp)
    lw ra, 4(sp)
    addi sp, sp, 8
    ret

negative:
    addi sp, sp, -8
    sw ra, 4(sp)
    sw s0, 0(sp)
    mv s0, a0
    li t0, 0
    li t1, 0      
nloop:
    bge t1, a1, ndone
    slli t2, t1, 2
    add t3, s0, t2
    lw t4, 0(t3)
    bge t4, zero, notneg
    addi t0, t0, 1
notneg:
    addi t1, t1, 1
    j nloop
ndone:
    mv a0, t0
    lw s0, 0(sp)
    lw ra, 4(sp)
    addi sp, sp, 8
    ret