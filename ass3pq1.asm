.text
.globl main
main:
    li $v0,6
    syscall
    mov.s $f1,$f0

    li $v0,6
    syscall
    mov.s $f2,$f0

    li $v0,4
    la $a0,msg
    syscall


    c.eq.s $f2,$f1
    bc1t eq
    
    c.lt.s $f2, $f1
    bc1t greater
    bc1f greater2

    li $v0,10
    syscall

eq:

    li $v0, 2
    mov.s $f12,$f1
    syscall


    li $v0,4
    la $a0,eqmsg
    syscall

    li $v0, 2
    mov.s $f12,$f2
    syscall


    li $v0,10
    syscall

greater:
    li $v0, 2
    mov.s $f12,$f1
    syscall


    li $v0,4
    la $a0,grtmsg
    syscall

    li $v0, 2
    mov.s $f12,$f2
    syscall


    li $v0,10
    syscall

greater2:
    li $v0, 2
    mov.s $f12,$f2
    syscall


    li $v0,4
    la $a0,grtmsg
    syscall

    li $v0, 2
    mov.s $f12,$f1
    syscall


    li $v0,10
    syscall


    .data
msg: .asciiz"\n"
eqmsg: .asciiz" is equal to"
grtmsg: .asciiz" is greater than"
