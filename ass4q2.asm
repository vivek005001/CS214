.text
    .globl main
    
main:
    li $v0,4
    la $a0,inp
    syscall

    li $v0,5
    syscall
    move $t0,$v0

    li $t1,1
    add $t0,1

    j loop_here

    li $v0,10
    syscall

loop_here:

    beq $t1,$t0,end
    li $t2,0
    j print_star

    li $v0,4
    la $a0,msg
    syscall



    j loop_here

print_star:

    li $v0,4
    la $a0,star
    syscall
    
    add $t2,1
    beq $t2,$t1,next_line

    j print_star

next_line:
    li $v0,4
    la $a0,msg
    syscall

    add $t1,1
    j loop_here

end:
    li $v0,10
    syscall

.data
star: .asciiz"*"
msg: .asciiz"\n"
name: .space 81
inp: .asciiz" Enter n : "