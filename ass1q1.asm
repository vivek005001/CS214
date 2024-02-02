# Start .text segment (program code)
    .text
    .globl main

main:
    li $t0, 1
    li $t1, 1

    nor $t3,$t0,$t0
    nor $t4,$t1,$t1

    and $t5,$t3,$t1
    and $t8,$t4,$t0

    or $s0,$t5,$t8

    and $s1,$t0,$t1

    li $v0,10
    syscall