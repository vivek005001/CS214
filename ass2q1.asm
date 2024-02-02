.text
.globl main
main:
    li $v0,8
    la $a0,val
    li $a1,5
    syscall


    li $v0,4
    la $a0,hi
    syscall
    

    li $v0,4
    la $a0,val
    syscall

    li $v0,4
    la $a0,newmsg
    syscall

    .data
hi: .asciiz"hi "
val: .space 81
newmsg: .asciiz",MIPS assembly programming is very exciting to learn"
