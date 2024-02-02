.data 
buffer: .space 256
prompt_inp: .asciiz "Enter the name: "
notfound_msg: .asciiz "Name Not Found\n"
found_msg: .asciiz "Found\n"
foundat_msg: .asciiz "Found at index: "
name1: .asciiz "vivek"
name2: .asciiz "rahul"
name3: .asciiz "nishchay"
name4: .asciiz "dhruv"
name5: .asciiz "luv"
name6: .asciiz "aryan"
name_arr: .word name1, name2, name3, name4, name5, name6

phy_marks_prompt: .asciiz "phy_marks: "
chem_marks_prompt: .asciiz "chem_marks: "
bio_marks_prompt: .asciiz "bio_marks: "
maths_marks_prompt: .asciiz "maths_marks: "
newline: .asciiz "\n"
marks_outof100_arr: .word 100, 80, 60, 23, 10, 80, 60, 23, 100, 80, 60, 23, 100, 80, 60, 23, 100, 80, 60, 23
marks_size: .word 20
iterator: .word 0
size: .word 6

.text
main:
    li $v0, 4
    la $a0, prompt_inp
    syscall

    li $v0, 8
    la $a0, buffer
    li $a1, 256
    syscall

    la $t0, name_arr
    lw $t1, iterator
    lw $t2, size

loop:
    bge $t1, $t2, not_found

    sll $t3, $t1, 2
    addu $t3, $t3, $t0
    lw $a1, 0($t3)

    jal string_compare
    beqz $v0, found
    addi $t1, $t1, 1
    j loop

found:
    jal namefoundfunction
    li $v0, 4
    la $a0, found_msg
    syscall

    li $v0, 4
    la $a0, foundat_msg
    syscall

    move $a0, $t1
    li $v0, 1
    syscall

    j exit

not_found:
    li $v0, 4
    la $a0, notfound_msg
    syscall

exit:
    li $v0, 10
    syscall

string_compare:
    compare_loop:
        lb $t4, 0($a0)
        lb $t5, 0($a1)
        
        beqz $t4, end_compare
        beqz $t5, end_compare

        beq $t4, $t5, next_compare
        j strings_not_equal

    next_compare:
        addi $a0, $a0, 1
        addi $a1, $a1, 1
        j compare_loop

    strings_not_equal:
        li $v0, 1
        jr $ra

    end_compare:
        li $v0, 0
        jr $ra


namefoundfunction:
    la $t0, marks_outof100_arr
    sll $t5, $t1, 2
    addu $t5, $t5, $t0
    lw $t6, 0($t5)

    li $v0, 4
    la $a0, phy_marks_prompt
    syscall

    move $a0, $t6
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    addu $t5, $t5, 4
    lw $t6,0($t5)

    li $v0, 4
    la $a0, chem_marks_prompt
    syscall

    move $a0, $t6
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    addu $t5, $t5, 4
    lw $t6,0($t5)

    li $v0, 4
    la $a0, bio_marks_prompt
    syscall

    move $a0, $t6
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    addu $t5, $t5, 4
    lw $t6,0($t5)

    li $v0, 4
    la $a0, maths_marks_prompt
    syscall

    move $a0, $t6
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    jr $ra
