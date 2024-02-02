.data
input_prompt:   .asciiz "Enter a lowercase string (10 characters): "
output_prompt:  .asciiz "Uppercase string: "
lowercase_str:  .space 11 
uppercase_str:  .space 11  

.text
.globl main

main:
    li $v0, 4
    la $a0, input_prompt
    syscall

    li $v0, 8
    la $a0, lowercase_str
    li $a1, 11
    syscall

    la $a0, lowercase_str
    la $a1, uppercase_str
    jal convert_to_uppercase

    li $v0, 4
    la $a0, output_prompt
    syscall

    li $v0, 4
    la $a0, uppercase_str
    syscall

    li $v0, 10
    syscall

convert_to_uppercase:

    loop:
        lb $t0, ($a0)       
        beqz $t0, done       
        addi $a0, $a0, 1    

       
        li $t1, 'a'           
        li $t2, 'z'           
        blt $t0, $t1, not_lowercase
        bgt $t0, $t2, not_lowercase

        
        li $t3, 32
        sub $t0, $t0, $t3

        
       

        not_lowercase:
        sb $t0, ($a1)

        
        addi $a1, $a1, 1
        j loop

    done:
        
        li $t0, 0
        sb $t0, ($a1)

        jr $ra
    