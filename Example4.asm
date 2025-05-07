.data
    sum: .word 0
    N: .word 6
    A: .word 1, 2, 3, 4, 5, 6

.text
.globl main

main:
    la $t0, A       # base address of A
    li $t1, 0       
    li $t2, 6       
    li $t3, 0      
    li $t4, 1       

loop:
    sll $t5, $t3, 2       
    add $t6, $t0, $t5     
    lw $t7, 0($t6)        
    add $t1, $t1, $t7     

    add $t3, $t3, $t4     
    bne $t3, $t2, loop   

    exit:
    li $v0, 1          # print integer
    move $a0, $t1      # move sum into $a0
    syscall

    li $v0, 10         # exit
    syscall
#############################################################
  