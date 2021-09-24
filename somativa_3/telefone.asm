	.data
string:	.space 20
endl:	.asciiz "\n"
	.text
main:

   lerString:
	li $v0, 8 
	la $a0, string 
	li $a1, 20
	syscall
	
	lbu $t3, string($0)
	beq $t3, 10, lerString 
	 
charAchar:
	lbu $t3, string($t1)	
	beq $t3, 10 , exit 

	beq $t3, 'A', printa2
  	beq $t3, 'B', printa2
  	beq $t3, 'C', printa2
  	beq $t3, 'D', printa3
  	beq $t3, 'E', printa3
  	beq $t3, 'F', printa3
  	beq $t3, 'G', printa4
 	beq $t3, 'H', printa4
  	beq $t3, 'I', printa4
  	beq $t3, 'J', printa5
  	beq $t3, 'K', printa5
  	beq $t3, 'L', printa5
  	beq $t3, 'M', printa6
  	beq $t3, 'N', printa6
  	beq $t3, 'O', printa6
  	beq $t3, 'P', printa7
  	beq $t3, 'Q', printa7
  	beq $t3, 'R', printa7
  	beq $t3, 'S', printa7
  	beq $t3, 'T', printa8
  	beq $t3, 'U', printa8
  	beq $t3, 'V', printa8
  	beq $t3, 'W', printa9
  	beq $t3, 'X', printa9
  	beq $t3, 'Y', printa9
  	beq $t3, 'Z', printa9

	li $t4, 'A'
 	slt $t0, $t3, $t4
 
  	beq $t0, 1, printChar

	addi $t1, $t1, 1 
	j charAchar

printa2:
  li $v0, 1
  li $a0, 2
  syscall
  addi $t1, $t1, 1 
  j charAchar

printa3:
  li $v0, 1
  li $a0, 3
  syscall
  addi $t1, $t1, 1 
  j charAchar

printa4:
  li $v0, 1
  li $a0, 4
  syscall
  addi $t1, $t1, 1 
  j charAchar

printa5:
  li $v0, 1
  li $a0, 5
  syscall
  addi $t1, $t1, 1 
  j charAchar

printa6:
  li $v0, 1
  li $a0, 6
  syscall
  addi $t1, $t1, 1 
  j charAchar

printa7:
  li $v0, 1
  li $a0, 7
  syscall
  addi $t1, $t1, 1 
  j charAchar

printa8:
  li $v0, 1
  li $a0, 8
  syscall
  addi $t1, $t1, 1 
  j charAchar

printa9:
  li $v0, 1
  li $a0, 9
  syscall
  addi $t1, $t1, 1 
  j charAchar

printChar:
  li $v0, 11
  lbu $a0, string($t1)
  syscall
  addi $t1, $t1, 1  
  j charAchar

exit:  
	li $v0, 10
	syscall
