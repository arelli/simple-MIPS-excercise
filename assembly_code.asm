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
triangle_choice_string: .asciiz "\n Enter how many lines you want: \n"
	.align 2
analyze_choice_string: .asciiz "\nYour selection is to check a Number!\n"
	.align 2
multiplication_choice_string: .asciiz "\nYour selection is to enter 5 numbers and take back them multiply by 4\n"
	.align 2
error_string: .asciiz "\nPleaze enter a number from 1-4\n"
	.align 2
next_line: .asciiz "\n" 
	.align 2
tab: .asciiz "  " 
	.align 2
number_is_even: .asciiz "\nThe number is even \n "
	.align 2
number_is_odd: .asciiz "\nThe number is odd\n " 
	.align 2
	
.text
##################################################################
			#MAIN
##################################################################			
main:	
loop:
	li $v0,4		
	la $a0,triangle_string		
	syscall		#print the triangle_string in stdout
	la $a0,number_check_string		
	syscall			
	la $a0,array_multiply_string		
	syscall
	la $a0,exit_string		
	syscall
	la $a0,enter_choice_string		
	syscall
	li $v0,5		
	syscall		#read a number from keyboard input	
	move $s0,$v0
	#beq's represent the switch in c
	beq $s0,1,choice_loop1
	beq $s0,2,choice_loop2
	beq $s0,3,choice_loop3
	beq $s0,4,end
	j error_choice_loop

choice_loop1:	#print number triangle
	li $v0,4		
	la $a0,triangle_choice_string	
	syscall		#prints the triangle_choice_string message
	li $v0,5		
	syscall		#reads a number from keyboard
	move $a0,$v0	# $a0 will be the passed argument in the print_triangle function
	jal print_triangle
	j loop		#go back to main loop
choice_loop2:	#analyze a number
	li $v0,4		
	la $a0,analyze_choice_string		
	syscall	
	li $v0,5		
	syscall	
	move $a0,$v0 #$a0 is the argument passed in check_number function
	jal check_number
	beq $v0,$zero,is_even #its essentialy an if/else statement, despite double if in original c lang
		li $v0,4		
		la $a0,number_is_odd		
		syscall	
		b is_odd #if its odd, it prints it(above) and then exits
	is_even:
		li $v0,4		
		la $a0,number_is_even		
		syscall	
	is_odd: #exit of if/else statement
	j loop
choice_loop3:	#multiply an array of five, by 4
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
##################################################################
 			#FUNCTIONS
################################################################## 			
check_number:
andi $v0,$a0,1#now $v0 holds the return value
jr $ra

print_triangle:
li $t0,0 # counter of how many numbers were printed in total(requested return value)
li $t1,0 # line number(incremented in the outter loop)
li $t9,0 # the column number(incremented inside the nested loop)
move $t2,$a0  #copies the passed argument to a temporary,because $a0 will be later altered for syscalls
	before_while3:
	bge $t1,$t2,after_while3
		before_while4:
		bgt $t9,$t1,after_while4
		li $v0, 1   
		addi $a0,$t9,1   
		syscall   #printf("%d", t9+1)
		la $a0,tab
		li $v0,4
		syscall  #print a tab(4 spaces)
		addi $t9,$t9,1  #increments the for (termination) counter for the nested loop
		addi $t0,$t0,1  #this is the counter of total numbers printed
	j before_while4
	after_while4:
	la $a0,next_line
	li $v0,4
	syscall #printf("\n")
	addi $t1,$t1,1 #increments the termination counter for the outter loop
	li $t9,0
j before_while3
after_while3:
syscall #printf("\n")
move $v0,$t0 #it returns the $v0 by convention for subprogram return registers
jr $ra #jump back to where the function was called initially ($ra has the right value because of jal)



	
		














