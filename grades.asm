.text
    .globl main
    
main:

    li $v0,8
    la $a0,name
    la $a1,10
    syscall

    li $v0,5
    syscall
    move $t0,$v0

    li $v0,5
    syscall
    move $t1,$v0

    mul $t2,$t0,100
    div $t3,$t2,$t1

    bge $t3,75,allowed
    blt $t3,75,notallowed

    li $v0,10
    syscall

allowed: 
    li $v0,4
    la $a0,name
    syscall

    li $v0,4
    la $a0,almsg
    syscall


    li $v0,10
    syscall

notallowed: 
    li $v0,4
    la $a0,name
    syscall

    li $v0,4
    la $a0,nalmsg
    syscall

    li $v0,10
    syscall

.data
msg: .asciiz"\n"
name: .space 81
almsg: .asciiz" is allowed to sit in exam"
nalmsg: .asciiz" is not allowed to sit in exam"