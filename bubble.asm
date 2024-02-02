.data
array: .space 40
prompt: .asciiz"Enter the elements in the array: \n"
prompt2: .asciiz"Your Given array is: "
prompt3: .asciiz"Your Array after Bubble Sort is: "
newline: .asciiz"\n"

.text
.globl main
main:
	li $v0,4
	la $a0,prompt
	syscall

	li $t0,0
	li $t2,0
	li $s0,40

	j take_input
take_input:
	beq $t0,$s0,print_prompt

	li $v0,5
	syscall
	move $t1,$v0
	
	sw $t1,array($t0)
	addi $t0,$t0,4
	j take_input

print_prompt:
	li $v0,4
	la $a0,prompt2
	syscall

	j print_array

print_array:
	beq $t2,$s0,bubble_sort

	lw $t1,array($t2)

	addi $t2,$t2,4

	li $v0,1
	move $a0,$t1
	syscall

    # print space
	li $v0,11
	li $a0,32
	syscall

	j print_array

bubble_sort:
	li $v0,4
	la $a0,newline
	syscall

	li $t0,0
	li $t3,9
	j outer_loop

outer_loop:
	beq $t0,$t3,print
	li $t1,0	# j for iteration
	li $t2,0  # lw ke liye

    sub $s1,$t3,$t0 # n - i
	j inner_loop

# 9 8 7 6 5 4 3 2 1 0
inner_loop:
	beq $t1,$s1,outer

	lw $t4,array($t2)
	addi $t5,$t2,4
	lw $t6, array($t5)

	blt $t6,$t4,swap

	addi $t2,$t2,4
	addi $t1,$t1,1
	j inner_loop
    
outer:
	addi $t0,$t0,1
	j outer_loop
swap:

    sw $t4,array($t5)
	sw $t6,array($t2)

	addi $t2,$t2,4
    addi $t1,$t1,1

	j inner_loop
print:
	li $v0,4
	la $a0,prompt3
	syscall

	li $t2,0
	li $s0,40

	j print_array2

print_array2:
	beq $t2,$s0,exit

	lw $t1,array($t2)
	addi $t2,$t2,4

	li $v0,1
	move $a0,$t1
	syscall

	li $v0,11
	li $a0,32
	syscall
    
	j print_array2

exit:
	li $v0,10
	syscall