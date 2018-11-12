.data
triangle_string:	.asciiz	"\n1.Number-Triangle mode\n"
	.align 2
number_check_string:	.asciiz	"2.Nuber-Check\n"
	.align 2
array_multiply_string:	.asciiz	"3.Array Multiplier.\n"
	.align 2
exit_string:	.asciiz	"4.Exit the program.\n"
	.align 2
enter_choice_string:	.asciiz "Please enter your choice (1-4):\n "
	.align 2
end_choice_string: .asciiz "\nYour selected to exit the programe.See you later!:)\n"
	.align 2
triangle_choice_string: .asciiz "\nYour selection is to print a Triangle!\n"
analyze_choice_string: .asciiz "\nYour selection is to analyze a Number!\n"
multiplication_choice_string: .asciiz "\nYour selection is to enter 5 numbers and take back them myltiplade by 5\n"
error_string: .asciiz "\nPleaze enter a number from 1-4\n"
	


.text
##################################################################
main:	
loop:
	li $v0,4		
	la $a0,triangle_string		
	syscall			
	
	la $a0,number_check_string		
	syscall			
	
	la $a0,array_multiply_string		
	syscall
	
	la $a0,exit_string		
	syscall

	la $a0,enter_choice_string		
	syscall
	
	li $v0,5		
	syscall			
	move $s0,$v0

	
	
	beq $s0,1,choice_loop1

	beq $s0,2,choice_loop2

	beq $s0,3,choice_loop3

	beq $s0,4,end
	j error_choice_loop
################################################################
choice_loop1:	
	li $v0,4		
	la $a0,triangle_choice_string		
	syscall	
	j loop
choice_loop2:	
	li $v0,4		
	la $a0,analyze_choice_string		
	syscall	
	j loop
choice_loop3:	
	li $v0,4		
	la $a0,multiplication_choice_string		
	syscall	
	j loop	

error_choice_loop:
		
	li $v0,4		
	la $a0,error_string		
	syscall	
	j loop	

end:	li $v0,4
	la $a0,end_choice_string
	syscall
	li $v0, 10		
	syscall#syscall mode 10, exit the program
