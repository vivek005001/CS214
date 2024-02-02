.data
.text
main:
li $v0, 5
syscall
move $s0, $v0

li $v0, 5
syscall
move $s1, $v0

li $t6,1
comb:
    beq $s1, $zero, exit
    beq $s1, $s0, exit

    addi $s0, $s0, -1
    addi $s1, $s1, -1

    jal comb
    addi $s0, $s0, 1
    addi $s1, $s1, 1

    add $t3, $t3, $s0
    jr $ra

    li $v0, 1   
    
    move $a0, $t3
    syscall



exit:
    li $v0, 1
    move $a0, $t6
    syscall

    li $v0, 10
    syscall
