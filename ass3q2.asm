.text
    .globl main
    
main:

    li $v0,5
    syscall
    move $t0,$v0

    li $v0,5
    syscall
    move $t1,$v0

    li $v0,5
    syscall
    move $t2,$v0

    li $v0,5
    syscall
    move $t3,$v0

    li $v0,5
    syscall
    move $t4,$v0

    li $v0,5
    syscall
    move $t5,$v0

    li $v0,5
    syscall
    move $t6,$v0

    li $v0,5
    syscall
    move $t7,$v0

    blt $t0,$t4,bga
    blt $t4,$t0,agb
    
    blt $t1,$t5,bga
    blt $t5,$t1,agb


    blt $t2,$t6,bga
    blt $t6,$t2, agb

    blt $t3,$t7,bga
    blt $t7,$t3,agb

    li $v0,4
    la $a0,eq
    syscall

    li $v0,10
    syscall

agb:
    li $v0,4
    la $a0,agbp
    syscall

    li $v0,10
    syscall
bga:
    li $v0,4
    la $a0,bgap
    syscall

    li $v0,10
    syscall
eq:
    li $v0,4
    la $a0,eqp
    syscall

    li $v0,10
    syscall


.data
msg: .asciiz"\n"
name: .space 81
agbp: .asciiz" A is greater than B"
bgap: .asciiz" B is greater than A"
eqp: .asciiz" B equal A"