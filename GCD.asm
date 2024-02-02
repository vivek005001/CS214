
.data
n1: .word 20
n2: .word 20

.text
.globl main
main:
    lw $a0,n1  
    lw $a1,n2  
    jal GCD 

    move $a0,$v0 
    li $v0,1
    syscall 
    li $v0, 10 
    syscall

GCD:
    #GCD(n1, n2)
    # n1 = $a0
    # n2 = $a1

    addi $sp, $sp, -12
    sw $ra, 0($sp) 
    sw $s0, 4($sp) 
    sw $s1, 8($sp) 

    move $s0, $a0 
    move $s1, $a1 

    li $t1, 0 
    beq $s1, $t1, returnn1

    move $a0, $s1 
    div $s0, $s1 
    mfhi $a1 

    jal GCD

exitGCD:
    lw $ra, 0 ($sp)  
    lw $s0, 4 ($sp)
    lw $s1, 8 ($sp)
    addi $sp, $sp, 12 
    jr $ra

returnn1:
    move $v0, $s0 
    j exitGCD