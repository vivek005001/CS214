.text
.globl main
main:
    li $v0,8
    la $a0,val
    li $a1,5
    syscall

    li $v0,4
    la $a0,msg
    syscall

    li $v0,6
    syscall
    mov.s $f1,$f0


    li $v0,6
    syscall
    mov.s $f2,$f0

    div.s $f3,$f1,$f2
    li.s $f7,100.0
    mul.s $f6,$f7,$f3

    li.s $f5,75.0

    c.le.s $f5,$f6
    bc1t yes
    bc1f no

    li $v0,10
    syscall
yes:
    li $v0,4
    la $a0,val
    syscall

    li $v0,4
    la $a0,appear
    syscall

    li $v0,10
    syscall

no:
    li $v0,4
    la $a0,val
    syscall

    li $v0,4
    la $a0,notappear
    syscall

    li $v0,10
    syscall


    

    .data
val: .space 81
msg: .asciiz"\n"
appear: .asciiz" is allowed to sit in the exam."
notappear: .asciiz" is not allowed to sit in the exam."