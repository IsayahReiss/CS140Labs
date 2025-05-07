.data
     A: .word 5, 10, 25, 35, 45
    K: .word 30
    idx: .word 0

.text
.globl main

main:
     la $t0, A      # load base address of A
    lw $t3, K      # load K
    ori $t1, $zero, 0  # i = 0
    
loop:
    # Get A[i]
    sll $t2, $t1, 2   # t2 = i * 4 (word offset)
    add $t2, $t2, $t0 # t2 = address of A[i]
    lw $t4, 0($t2)    # load A[i]

    # Check if A[i] <= K
    slt $t5, $t3, $t4 # t5 = 1 if K < A[i]
    bne $t5, $zero, exit

    # Increment i
    addi $t1, $t1, 1
    j loop

exit:
    sw $t1, idx        # store i in idx
    li $v0, 1
    move $a0, $t1      # print i
    syscall

    li $v0, 10
    syscall
    #####################################################
    
    