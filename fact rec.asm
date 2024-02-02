.data   
    num: .word 16
    ans: .word -1
    prompt: .asciiz "Enter the number:" 

.text
main:
   
    li $v0, 4
    la $a0, prompt
    syscall
    li $v0, 5
    syscall
    sw $v0, num

    lw $a0, num      
    jal fac          
    sw $s1, ans    

   
    li $v0, 1
    lw $a0, ans
    syscall
    li $v0, 10      #khatam bc
    syscall
fac:
    subu $sp, $sp,8 
    sw $ra, ($sp)    
    sw $s0, 4($sp)    
 
    li $s1, 1         
    beq $a0, $zero, done  

    move $s0, $a0    
    addi $a0, $a0, -1  
    jal fac         
    mul $s1, $s0, $s1  
done:   
    lw $ra, ($sp)    
    lw $s0, 4($sp)   
    addu $sp, $sp, 8  
    jr $ra          

exit:
    li $v0, 10       
    syscall
