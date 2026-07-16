.data
cache:
.word -1, -1, -1, -1, -1
.word -1, -1, -1, -1, -1
.word -1, -1, -1, -1, -1
.word -1, -1, -1, -1, -1, -1

label:
.asciiz "Fib(20) = "

.text
.globl main

main:
    la t0, cache
    li t1, 0 #cache[0] = 0
    sw t1, 0(t0)
    li t1, 1 #cache[1] = 1
    sw t1, 4(t0)
    li a0, 20 #fib(20)
    jal ra, fib
    mv t2, a0
    li a0, 4
    la a1, label 
    ecall
    li a0, 1 #print ans
    mv a1, t2
    ecall
    li a0, 11
    li a1, 10
    ecall
    li a0, 10 #exit
    ecall
    
fib:
    addi sp, sp, -12
    sw ra, 8(sp)
    sw s0, 4(sp)
    sw s1, 0(sp)
    mv s0, a0 #save n
    la t0, cache #compare with cache
    slli t1, s0, 2
    add t0, t0, t1
    lw t2, 0(t0) 
    li t3, -1
    bne t2, t3, cached
    addi a0, s0, -1 #compute fib(n-1)
    jal ra, fib
    mv s1, a0
    addi a0, s0, -2 #and fib(n-2)
    jal ra, fib
    add a0, a0, s1 #add ans
    la t0, cache #store in cache
    slli t1, s0, 2
    add t0, t0, t1
    sw a0, 0(t0)
    j finish #return fib(n)
    
cached:
    mv a0, t2

finish:
    lw s1, 0(sp)
    lw s0, 4(sp)
    lw ra, 8(sp)
    addi sp, sp, 12
    ret