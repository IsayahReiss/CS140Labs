.data
    ival: .word 100
    jval: .word 200
    fval: .word 0
    gval: .word 10
    hval: .word 5

.text
.globl main

main:
    lw $t0, gval
    lw $t1, gval
    lw $t2, hval

    lw $t3, ival
    lw $t4, jval

    slt $t5, $t3, $t4     # t5 = 1 if ival < jval

    bne $t5, $zero, true  # if t5 != 0, go to true
    j false

true:
    add $t0, $t1, $t2
    j exit

false: 
    lui $t5, 0xFFFF
    ori $t5, $t5, 0xFFFF
    xor $t2, $t2, $t5
    addi $t2, $t2, 1
    add $t0, $t1, $t2

exit:
    sw $t0, fval

    li $v0, 1          # print integer
    move $a0, $t0
    syscall

    li $v0, 10         # exit program
    syscall
################################################
 