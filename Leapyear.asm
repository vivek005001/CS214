.text
.globl main
main:
    li $v0,5
    syscall
    move $t0,$v0

    li $v0,4
    la $a0,msg
    syscall

    li $t4,400
    divu $t0,$t4
    mfhi $t1

    li $t5,100
    divu $t0,$t5
    mfhi $t2

    li $t8,4
    divu $t0,$t8
    mfhi $t3

    beq $t1,0 leap
    beq $t2,0 notleap
    beq $t3,0 leap
    bne $t3,0 notleap


    li $v0,10
    syscall
leap:
    li $v0,1
    move $a0,$t0
    syscall

    li $v0,4
    la $a0,leapmsg
    syscall


    li $v0,10
    syscall
notleap:
    li $v0,1
    move $a0,$t0
    syscall

    li $v0,4
    la $a0,notleapmsg
    syscall


    li $v0,10
    syscall

    .data
msg: .asciiz"\n"
leapmsg: .asciiz" is a leap year"
notleapmsg: .asciiz" is not a leap year"
