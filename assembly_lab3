.data
str1:	.asciiz	"\n1.Print a triangle.\n"
	.align 2
str2:	.asciiz	"2.Number analyzation.\n"
	.align 2
str3:	.asciiz	"3.Array of numbers.\n"
	.align 2
str4:	.asciiz	"4.Exit the program.\n"
	.align 2
str5:	.asciiz "Please enter your choice (1-4):\n "
	.align 2
strend: .asciiz "\nYour selected to exit the programe.See you later!:)\n"
	.align 2
strc1: .asciiz "\nYour selection is to print a Triangle!\n"
strc2: .asciiz "\nYour selection is to analyze a Number!\n"
strc3: .asciiz "\nYour selection is to enter 5 numbers and take back them myltiplade by 5\n"
strnot: .asciiz "\nPleaze enter a number from 1-4\n"
	


.text
main:	
loop:
	li $v0,4		
	la $a0,str1		
	syscall			
	
	la $a0,str2		
	syscall			
	
	la $a0,str3		
	syscall
	
	la $a0,str4		
	syscall

	la $a0,str5		
	syscall
	
	li $v0,5		
	syscall			
	move $s0,$v0

	
	
	beq $s0,1,loop1

	beq $s0,2,loop2

	beq $s0,3,loop3

	beq $s0,4,end
	j loopnotdefined
	
loop1:	
	li $v0,4		
	la $a0,strc1		
	syscall	
	j loop
loop2:	
	li $v0,4		
	la $a0,strc2		
	syscall	
	j loop
loop3:	
	li $v0,4		
	la $a0,strc3		
	syscall	
	j loop	

loopnotdefined:
		
	li $v0,4		
	la $a0,strnot		
	syscall	
	j loop	

end:	li $v0,4
	la $a0,strend
	syscall
	li $v0, 10		
	syscall
