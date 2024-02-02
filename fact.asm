.text
.globl main

main:
    li $v0,4
    la $a0,n1
    syscall

    li $v0,5
    syscall
    move $t0,$v0

    move $a0,$t0

    jal fac

    move $a0,$v0
    li $v0,1
    syscall
    
    li $v0,4
    la $a0,endl
    syscall

    li $v0,10
    syscall

fac:
    beq $a0,1,return_f
    sub $a0,$a0,1
    mul $t0,$t0,$a0

    j fac

return_f:
    move $v0,$t0
    jr $ra



.data
n1: .asciiz"Enter a:"
n2: .asciiz"Enter b:"
endl: .asciiz"\n"
