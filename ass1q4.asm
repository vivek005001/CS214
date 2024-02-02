# Start .text segment (program code)
    .text
    .globl main

main:
    li $t4,10
    li $t5,20
    li $t8,30
    li $t9,40

    srl $t0,$t4,3
    srl $t1,$t5,2
    srl $t2,$t8,1
    srl $t3,$t9,1

    add $s0,$t0,$t1
    add $s1,$t2,$t3
    add $s2,$s0,$s1

    li $v0,10
    syscall