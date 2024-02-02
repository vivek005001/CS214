.data
    prompt1:     .asciiz "Enter string1 of upto 8 char: "
    prompt2:     .asciiz "Enter string2 of upto 8 char: "
    prompt3:     .asciiz "Enter char : "
    s1:     .asciiz "\nstring1: \n"
    s2:     .asciiz "\nstring2: \n"
    len1:       .asciiz "\nLen of string 1: "
    len2:     .asciiz "\nLen of string 2: "
    found:     .asciiz "\nfound given char in string"
    not_found:     .asciiz "\nNot found given char in string"

    endl:     .asciiz "\n"
    inp1: .space 81
    inp2: .space 81
    concat_s: .space 81

.text
    .globl main

main:
    li $v0,4
    la $a0,prompt1
    syscall

    li $v0,8
    la $a0,inp1
    li $a1, 10
    syscall

    li $v0,4
    la $a0,endl
    syscall

    li $v0,4
    la $a0,prompt2
    syscall

    li $v0,8
    la $a0,inp2
    li $a1, 10
    syscall

    li $v0,4
    la $a0,endl
    syscall

    li $v0,4
    la $a0,prompt3
    syscall

    li $v0,12
    syscall
    move $t0,$v0 # t0 has char

    li $v0,4
    la $a0,endl
    syscall
    
    

    # string1
    li $v0,4
    la $a0,s1
    syscall

    la $a0,inp1
    li $t9,-1 
    jal len
    move $t8,$v0

    li $v0,4
    la $a0,len1
    syscall
    li $v0,1
    move $a0,$t8
    syscall

    # search
    la $a0,inp1
    jal search

    # endline
    li $v0,4
    la $a0,endl
    syscall

    # string2
    li $v0,4
    la $a0,s2
    syscall

    la $a0,inp2
    li $t9,-1 # count len
    # len
    jal len
    move $t8,$v0

    li $v0,4
    la $a0,len2
    syscall

    move $a0,$t8
    li $v0,1
    syscall

    # search
    la $a0,inp2
    jal search


    # concat
    li $t8,0
    li $t9,0
    li $t7,10

    la $a0,inp1
    la $a1,inp2
    la $a2,concat_s
    jal concat

    la $a1,inp1
    la $a0,inp2
    la $a2,concat_s
    jal concat


    li $v0,10
    syscall

len:
    lb $t8,0($a0)
    beqz $t8, return_f
    addi $t9,$t9,1
    addi $a0,$a0,1
    j len
return_f:
    move $v0,$t9
    jr $ra

search:
    lb $t8,0($a0)
    beqz $t8,not_found_f
    beq $t8,$t0, found_f
    addi $a0,$a0,1
    j search

found_f:
    li $v0,4
    la $a0,found
    syscall

    jr $ra
not_found_f:
    li $v0,4
    la $a0,not_found
    syscall

    jr $ra

concat:
    lb $t8,0($a0)
    beq $t8,$t7,concat_a1
    beqz $t8,concat_a1

    sb $t8,0($a2)
    addi $a0,$a0,1
    addi $a2,$a2,1
    j concat

concat_a1:
    lb $t8,0($a1)
    
    beq $t8,$t7,print_concat
    beqz $t8,print_concat
    sb $t8,0($a2)
    addi $a1,$a1,1
    addi $a2,$a2,1

    j concat_a1

print_concat:
    sb $0,0($a2)

    li $v0,4
    la $a0,endl
    syscall

    li $v0,4
    la $a0,concat_s
    syscall

    jr $ra