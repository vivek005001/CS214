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

    jal factorial

    move $a0,$v0
    li $v0,1
    syscall
    
    li $v0,4
    la $a0,endl
    syscall


    li $v0,4
    la $a0,n1
    syscall

    li $v0,5
    syscall
    move $t0,$v0

    li $v0,4
    la $a0,n2
    syscall

    li $v0,5
    syscall
    move $t1,$v0


    jal swap_using_bitwise_operators
    jal swap_by_addition
    jal swap_by_multiplication


    li $v0,10
    
    syscall

factorial:
    beq $a0,1,return_f
    sub $a0,$a0,1
    mul $t0,$t0,$a0

    j factorial
return_f:
    move $v0,$t0
    jr $ra


swap_by_multiplication:
    move $t2,$t0 
    move $t3,$t1
    
    mul $t2,$t2,$t3
    div $t3,$t2,$t3
    div $t2,$t2,$t3
    
    li $v0,1
    move $a0,$t2
    syscall
    
    li $v0,1
    move $a0,$t3
    syscall

    li $v0,4
    la $a0,endl
    syscall

    jr $ra


swap_using_bitwise_operators:

    move $t2,$t0 
    move $t3,$t1

    not $t4,$t2  
    not $t5,$t3

    and $s0,$t2,$t5
    and $s1,$t3,$t4

    or $t2,$s0,$s1

    not $t4,$t2
    not $t5,$t3

    and $s0,$t2,$t5
    and $s1,$t3,$t4

    or $t3,$s0,$s1

    not $t4,$t2
    not $t5,$t3

    and $s0,$t2,$t5
    and $s1,$t3,$t4

    or $t2,$s0,$s1

    li $v0,1
    move $a0,$t2
    syscall
    
    
    li $v0,1
    move $a0,$t3
    syscall

    li $v0,4
    la $a0,endl
    syscall

    jr $ra

swap_by_addition:
    move $t2,$t0 
    move $t3,$t1
    

    add $t2,$t2,$t3 


    sub $t3,$t2,$t3
    sub $t2,$t2,$t3

    li $v0,1
    move $a0,$t2
    syscall
    
    
    li $v0,1
    move $a0,$t3
    syscall

    li $v0,4
    la $a0,endl
    syscall

    jr $ra


.data
    n1: .asciiz"Enter a:"
    n2: .asciiz"Enter b:"
    endl:.asciiz"\n"

