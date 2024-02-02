.data
prompt: .asciiz "Enter the expression: "
correct: .asciiz "Expression is correct"
incorrect: .asciiz "Expression is incorrect: "
opening: .asciiz "\nNo. of opening parantheses: "
closing: .asciiz "\nNo. of closing parantheses: "
newline: .asciiz "\n"   

buffer : .space 20

.text

main:

la $a0, prompt
li $v0, 4
syscall

li $v0, 8
la $a0, buffer
syscall

move $a1, $sp 

li $s1, 0 
li $s2, 0 


loop:
    lb $t2, 0($a0) 

    beq $t2, 0, final 

    addi $a0, $a0, 1
    beq $t2, 40, push 
    beq $t2, 41, pop 

    
    j loop


final:
    beq $sp, $a1, balanced 
    j unbalanced 

push:
    addi $s1, $s1, 1
    addi $sp, $sp, -4 
    
    sw $t2, 0($sp)
    j loop


pop:
    addi $s2, $s2, 1
    
    beq $sp, $a1, unbalanced2 
    addi $sp, $sp, 4 
    
    lw $t2, 0($sp)
    j loop


push2:
    addi $s1, $s1, 1
    
    j loop2


pop2:
    addi $s2, $s2, 1

    j loop2


unbalanced2:

loop2:
    lb $t2, 0($a0) 

    beq $t2, 0, unbalanced 

    addi $a0, $a0, 1
    beq $t2, 40, push2
    beq $t2, 41, pop2 

    
    j loop


    li $v0,10
    syscall




balanced:
    li $v0, 4
    la $a0, correct
    syscall

    li $v0, 4
    la $a0, opening
    syscall

    li $v0, 1
    move $a0, $s1
    syscall


    li $v0, 4
    la $a0, closing
    syscall

    li $v0, 1
    move $a0, $s2
    syscall

    li $v0, 10
    syscall

unbalanced:
    li $v0, 4
    la $a0, incorrect
    syscall

    li $v0, 4
    la $a0, opening
    syscall

    li $v0, 1
    move $a0, $s1
    syscall


    li $v0, 4
    la $a0, closing
    syscall

    li $v0, 1
    move $a0, $s2
    syscall

    li $v0, 10
    syscall