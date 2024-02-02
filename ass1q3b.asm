# Start .text segment (program code)
    .text
    .globl main

main:
    li $t0, 1
    mul $s0,$t0,2

    li $t1, 11
    
    sub $t3,$t1,$t0

    li $t4,6

    sub $t5,$t4,1

    div $t9,$t4,2

    mul $t8,$t5,$t3

    add $s1,$s0,$t8

    mul $s3,$s1,$t9
     
    li $v0,10
    syscall