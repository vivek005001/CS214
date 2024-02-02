    .text
    .globl main
main:
    li $v0,12
    syscall
    move $t0,$v0

    li $v0,12
    syscall
    move $t1,$v0

    li $v0,12
    syscall
    move $t2,$v0

    li $v0,11
    move $a0,$t1
    syscall
    
    li $v0,10
    syscall

    .data

val: .space 4

