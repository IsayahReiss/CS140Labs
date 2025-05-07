.data
    A: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    sum: .word 0

.text
.globl main

main:
    la $t0, A         # base address of A
    ori $t1, $zero, 0 # i = 0
    ori $t2, $zero, 10 # N = 10
    ori $t3, $zero, 0 # sum = 0

loop:
    # Calculate address of A[i]
    sll $t4, $t1, 2      # i * 4 (word offset)
    add $t5, $t0, $t4    # A[i] address

    # Load A[i] and add to sum
    lw $t6, 0($t5)
    add $t3, $t3, $t6

    # Increment i
    addi $t1, $t1, 1

    # Check if i < 10
    slt $t7, $t1, $t2
    bne $t7, $zero, loop

exit:
    sw $t3, sum          # store final sum
    li $v0, 1
    move $a0, $t3        # print sum
    syscall

    li $v0, 10           # exit program
    syscall
