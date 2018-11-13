#ASSEMBLY CODE FOR LAB 4 IN DIGITAL COMPUTERS, TUC,3RD SEMESTER,2018
#RAFAEL ELLINITAKIS
#a program that offers a simple numerical choice user menu, offering 4 functions.
.data #allocation of space and labels for the strings that need to be printed throughout the program
triangle_string:	.asciiz	"\n1.Number-Triangle mode\n"
	 .align 2
number_check_string:	.asciiz	"2.Nuber-Check\n"
	.align 2
array_multiply_string:	.asciiz	"3.Array Multiplier.\n"
	.align 2
exchange_chars:		.asciiz	"4.Uppercase/Loewrcase exchanger.\n"
	.align 2
exit_string:	.asciiz	"5.Exit the program.\n"
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
enter_a_number: .asciiz "\nPlease enter a number: \n " 
	.align 2
input_array: .space 20
	.align 2
output_array: .space 20
	.align 2
input_string: .space 100
	.align 2
output_string: .space 100
	.align 2
enter_string: .asciiz "Please enter a string of less-than-100 characters: "
	.align  2
	
.text
##################################################################
			#MAIN
##################################################################			
main:	
	loop:	#the MENU is printed below
		li $v0,4		
		la $a0,triangle_string		
		syscall		
		la $a0,number_check_string		
		syscall			
		la $a0,array_multiply_string		
		syscall
		la $a0,exchange_chars		
		syscall
		la $a0,exit_string		
		syscall
		la $a0,enter_choice_string		
		syscall		#menu stopped printing
		li $v0,5		
		syscall		#read a number from keyboard input	
		move $s0,$v0
		#beq's represent the switch in C
		beq $s0,1,choice_loop1
		beq $s0,2,choice_loop2
		beq $s0,3,choice_loop3
		beq $s0,4,choice_loop4
		beq $s0,5,end
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
		syscall	#prints indicative message 
		li $t5,0 #counter for the loop
		la $t6,input_array #register to store the current array "pointer" (or better,position)
		before_while_multiplier_input:
		beq $t5,5,after_while_multiplier_input
			li $v0,4 #PRINT STRING mode
			la $a0,enter_a_number
			syscall #prompts the user to enter a number
			li $v0,5 # READ INTEGER  mode
			syscall #reads an integer(and stores it in $v0)
			move $t7,$v0 #moves the integer in the $t7
			sw $t7,0($t6) #MOST LIKEL PROBLEMATIC! like: input_array[$t6] = $t7 [HHHHHOPEFULLY, WORKS FINE :3]
			addi $t6,$t6,4 #increment the $t6 "pointer" to the position of the next array element
			addi $t5,$t5,1 #increments $t5, the counter of the loop
			j before_while_multiplier_input #go and check if the condition is true to continue
		after_while_multiplier_input:#the end of the while loop for input
		#now we have to call multiplier()
		#pass the two arrays positions through $a0 and $a1
		la $a0,input_array
		la $a1,output_array
		jal multiplier # CALLS THE FOOKIN FUNCTION! (^.^)
		#by now, the multiplier() should have filled the output array with our multiplied-by-4 results	
		li $t5,0 # re-initializes the counter to ZERO
		la $t6,output_array # sets $t6 to the position ("pointer") of output_array
		before_while_multiplier_output: #this while loop prints the resulting output_array
		beq $t5,5,after_while_multiplier_output
			lw $t7,0($t6) #loads the contents of memory in adress $t6 (some position in the array) to $t7
			move $a0,$t7 #moves data from $t7 to $a0 to be passed as an argument in the int-printing syscall
			li $v0,1 # SYSCALL MODE print integer
			syscall #prints the contents of the array in courrent position
			li $v0,4 #PRINT STRING mode
			la $a0,tab
			syscall #prints 4 spac	es between the printed numbers
			addi $t5,$t5,1 #increments counter for the loop
			addi $t6,$t6,4 #increments our position in the array by four( which is sizeof(int) in the 32-bit-only mips systems)
			j before_while_multiplier_output
		after_while_multiplier_output:
		
		j loop	#end of the function
		
	choice_loop4: #here lies the heroic uppercase/lowercase exchange function summoner
		li $t2,0 #the counter for the loops 
		li $v0, 4
		la $a0,enter_string
		syscall #prompt the user to enter a string
		li $v0,8 #STRING READ mode
		la $a0,input_string #specifies the location at which the string is gonna be stored
		li $a1,100 #specifies the maximum length of the string
		syscall #actually reads the string from the keyboard, and stores it in input_string
		la $a0,input_string #setting values to the arguments of low_to_upper_case()
		la $a1,output_string #same as above
		jal low_to_upper_case
		la $a0,output_string
		li $v0,4
		syscall #print the altered string
		j loop
	
		
#this is activated to print an error message for wrong user input format	
error_choice_loop:
	li $v0,4		
	la $a0,error_string		
	syscall	
	j loop	

#this is activated to just terminate the execution of the program	
end:	
	li $v0,4
	la $a0,end_choice_string
	syscall
	li $v0, 10		
	syscall#syscall mode 10, exit the program
	
##################################################################
 			#FUNCTIONS
################################################################## 			

#this prints a triangle of numbers(1, 1 2, 1 2 3 etc)
print_triangle: # $a0 contains the number of lines requested
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

#this checks if a number is odd or even, with logical bitwise AND with 1 (we only care about the last bit of the number)
check_number: # $a0 contains the number which needs to be checked
	andi $v0,$a0,1#now $v0 holds the return value
	jr $ra

#this function accepts two array "locations", one for the input array, and one for the output array
#what it does,is that it multiplies each element of the input by four, and stores it in the output array
multiplier: # $a0 contains the input_array position, and $a1 contains the output array position
	la $t0,($a0) #now $t0 has the **input_array** position
	la $t1,($a1) #and $t1 has the **output_array** position
	li $t2,0 #counter for the loop
	before_while_multiplier:
		beq $t2,5,after_while_multiplier
		lw $t3,0($t0) #loads number from input array($t0)
		sll $t3,$t3,2 #multiplies the contents at $t3 by four, as requested
		sw $t3,0($t1) #stores multiplied number in output array($t1)
		addi $t0,$t0,4 #increments the $t0 (input_arrau) to point to the next array element
		addi $t1,$t1,4 #increments the $t1 (output_array) to point to the next element position
		addi $t2,$t2,1 #increments the COUNTER of the loop
		j before_while_multiplier
	after_while_multiplier:
	jr $ra
	
low_to_upper_case: # $a0 has the location of the input_string, and $a1 the location of the output_string
	la $t0,($a0) # INPUT string
	la $t1,($a1) #OUTPUT string
	li $t2,0 #counter for the loop
	before_while_case:
	beq $t2,99,after_while_case
		lb $t3,0($t0) # $t3 has the contents of the $t0'th element of the input_string
		# ASCII TABLE: from 65 to 90, upperacse, from 97 to 122, lowercase
		#blt $t3,65,after_else_case #if the ASCII code of the character is less than 65, it is not touched
#TODO: I need to add a way to avoid tweaking the values of characters other than letters,such as spaces etc.
		bgt $t3,90, after_if_case
			#this is executed if the current character is UPPERCASE!
			addi $t4,$t3,32 # makes contents of $t3 lowercase by subtracting 32, and stores them in $t4
			sb $t4,0($t1) #stores the altered character in the output array
			j after_else_case #if the above code is executed, we want to ignore the code inside "else"(after_if_case label)
		after_if_case:
			#this is executed if thecurrent character is LOWERCASE!
			addi $t4,$t3,-32 # makes contents of $t3 uppercase by adding 32, and stores them in $t4
			sb $t4,0($t1) #store uppercase letter in $t1 (output array)
		after_else_case:
		addi $t0,$t0,1 #increments $t0 (input string) to the next element
		addi $t1,$t1,1 #also increments $t1 (output string)
		addi $t2,$t2,1 #increments the while loop counter
		j before_while_case
	after_while_case:
	jr $ra
	

	
		


#######################################################################################################
#\.						NOTES						    ./#
#######################################################################################################
#we could use bne at the end of loops to make them smaller in length




