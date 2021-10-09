.data 
	Invalida: .asciiz "Entrada invalida.\n"
   endl: .asciiz "\n"
.text



main:	
 	addi $t2, $zero, 2

	li $v0,5
	syscall 
	move $s1, $v0 
	
	ble $s1, $zero, EntradaInvalida
	bgt $s1, 32767, EntradaInvalida

FORNUMBERS:
	beq $s1, 1, finaliza
	
	move $s4, $t2
  	div $s3, $s1, $s4
	mfhi $t3
	
	beq $t3, 0, PRINTPRIMO
	bne $t3, 0, SOMA1	
  	
  	j FORNUMBERS

SOMA1:
  	add $t2, $t2, 1
  	j FORNUMBERS
  	
PRINTPRIMO:
  	li $v0, 1
	move $a0, $t2
  	syscall
  	
  	li $v0, 4
	la, $a0, endl
	syscall
	
	div $s1, $s1, $s4
	
	j FORNUMBERS
  	
EntradaInvalida:
	li $v0, 4
	la, $a0, Invalida
	syscall
	
	j finaliza

finaliza:
	li $v0, 10
	syscall
