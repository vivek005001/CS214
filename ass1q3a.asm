# Start .text segment (program code)
    .text
    .globl main

main:
    li $t0, 1
    li $t1, 11

    li $t4,8

    sub $t5,$t4,1
    sub $t3,$t1,$t0

    mul $t8,$t5,$t3
    add $t9,$t0,$t8

    li $v0,10
    syscall