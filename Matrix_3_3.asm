.data
arr1: .word 1, 2, 3
      .word 3, 4, 5
      .word 2, 3, 4
 
arr2: .word 1, 2, 3 
      .word 3, 4, 5
      .word 3, 4, 5

final: .word 0:3
       .word 0:3
       .word 0:3

msg1: .asciiz "Enter Matrix 1 Element: "
msg2: .asciiz "Enter Matrix 2 Element: "
endl: .asciiz "\n"

.text
.globl main

main:
    
    li $t0,0 # matix 1 index
    li $t1,0  # matrix 2 index
    li $t4,0 # final matrix index
    li $t5,0 # column pointer
    li $s3,3 # row pointer
    li $s4,0 # temp
    li $s1,0
    j mult_

mult_:
    li $t8,0
    li $t6,0
    move $t0,$s4
	j sum

sum:
    beq $t8,3,return # compare with no. of col in mat1
    lw $t9,arr1($t0)
    lw $t7,arr2($t1)

    mul $t9,$t9,$t7
    add $t6,$t6,$t9

    addi $t0,$t0,4
    addi $t1,$t1,12 # add in t1 to go to next col ==> t1 = no. of cols in mat2 * 4

    addi $t8,$t8,1

    j sum
return:
    sw $t6,final($t4)

    addi $t4,$t4,4

    addi $s1,$s1,4
    move $t1,$s1
    
    addi $t5,$t5,1
    beq $t5,3,new_row

    j mult_

new_row:
    addi $s3,$s3,-1
    beqz $s3,exit

    addi $s4,$s4,12
    li $s1,0
    li $t5,0

    li $t1,0
    j mult_

exit:	
    li $t0,0
    li $t1,36
    j print
	li $v0,10
	syscall

print:
    beq $t0,$t1,exit1
    lw $t2,final($t0)

    li $v0,1
    move $a0,$t2
    syscall

    li $v0,4
    la $a0,endl
    syscall

    addi $t0,$t0,4

    j print

exit1:	
	li $v0,10
	syscall



