.text
.globl main
main:
    li $v0,5
    syscall
    move $t0,$v0

    li $t1,0
    blt $t1,$t0,bga

    li $v0,10
    syscall
bga:
    li $v0,1
    move $a0,$t0
    syscall

    li $v0,4
    la $a0,msg
    syscall

    addi $t0,$t0,-1

    blt $t1,$t0,bga

    li $v0,10
    syscall

.data
msg: .asciiz"\n"

