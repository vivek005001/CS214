.text
.globl main
main:
    li $v0,6
    syscall
    mov.s $f1,$f0

    li $v0,6
    syscall
    mov.s $f2,$f0

    li $v0,6
    syscall
    mov.s $f3,$f0

    c.lt.s $f1, $f2
    bc1t cond1
    bc1f cond2

    li $v0,10
    syscall


cond1:
    c.lt.s $f1,$f3

    bc1t cond3
    bc1f cond4

    li $v0,10
    syscall

cond4:

    li $v0, 2
    mov.s $f12,$f3
    syscall

    li $v0, 2
    mov.s $f12,$f1
    syscall

    li $v0, 2
    mov.s $f12,$f2
    syscall

    li $v0,10
    syscall

cond3:
    c.lt.s $f2,$f3

    bc1t cond5
    bc1f cond6

    li $v0,10
    syscall

cond5:

    li $v0, 2
    mov.s $f12,$f1
    syscall

    li $v0, 2
    mov.s $f12,$f2
    syscall

    li $v0, 2
    mov.s $f12,$f3
    syscall

    li $v0,10
    syscall

cond6:

    li $v0, 2
    mov.s $f12,$f1
    syscall

    li $v0, 2
    mov.s $f12,$f3
    syscall

    li $v0, 2
    mov.s $f12,$f2
    syscall

    li $v0,10
    syscall

cond2:
    c.lt.s $f2,$f3
    bc1t cond7
    bc1f cond8


    li $v0,10
    syscall

cond8:
    li $v0, 2
    mov.s $f12,$f3
    syscall

    li $v0, 2
    mov.s $f12,$f2
    syscall

    li $v0, 2
    mov.s $f12,$f1
    syscall

    li $v0,10
    syscall


cond7:
    c.lt.s $f1,$f3
    bc1t cond9
    bc1f cond10

     li $v0,10
    syscall


cond9:
    li $v0, 2
    mov.s $f12,$f2
    syscall

    li $v0, 2
    mov.s $f12,$f1
    syscall

    li $v0, 2
    mov.s $f12,$f3
    syscall

    li $v0,10
    syscall

cond10:
    li $v0, 2
    mov.s $f12,$f2
    syscall

    li $v0, 2
    mov.s $f12,$f3
    syscall

    li $v0, 2
    mov.s $f12,$f1
    syscall

    li $v0,10
    syscall
