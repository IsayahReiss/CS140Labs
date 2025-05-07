.data
    #g: .word 100
    #h: .word 200
    #ival: .word 10
    #jval: .word 20
    #fval: .word 0

    ival: .word 100
    jval: .word 200
    fval: .word 0
    gval: .word 10
    hval: .word 5



.text
.globl main

main:
    #lw $t0, g
    #lw $t2, h
    #lw $t3, ival
    #lw $t4, jval

    #bne $t3, $t4, false
    #add $t0, $t1, $t2
    #j endif

    lw $t0, gval
    lw $t1, gval
    lw $t2, hval

    lw $t3, ival
    lw $t4, jval

    bne $t3, $t4, false
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

    li $v0 , 1
    move $a0, $t0
    syscall

    li $v0, 10
    syscall
    # his output is 5
    #sub $t0, $t1, $t2

#endif:
    #sw $t0, fval

    #move $a0, $t0
   # li $v0, 1
   # syscall

    #li $v0, 10
   #syscall
