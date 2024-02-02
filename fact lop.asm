# code to factorial of a number using recursion

.data 
    prompt1: .asciiz "Enter the first number: "
    result: .asciiz "The factorial is: "
    newline: .asciiz "\n"
    space: .asciiz " "
.text
main:
# Prompt the user to enter the first number
li $v0, 4
la $a0, prompt1
syscall

; #enter first number

li $v0,5
syscall
move $t0, $v0
li $t3,1
jal factorial

# Print the result
li $v0, 4   

la $a0, result
syscall

li $v0, 1
move $a0, $t1
syscall
li $v0, 4
la $a0, newline
syscall
li $v0, 10
syscall

factorial:
beq $t0, 0, end

mul $t3, $t3, $t0
addi $t0, $t0, -1
j factorial
end:
move $t1, $t3
jr $ra






