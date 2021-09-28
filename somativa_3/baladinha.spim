.data
imp: .asciiz "THUMS THUMS THUMS\n"
pa: .asciiz "THUMS THUMS THUMS THUMS THUMS THUMS\n"

.text

main:
	li $v0, 5
	syscall # l? um numero e guarda em $v0
	move $s1,$v0 # guarda o numero 
	
loop:	
	beq $s2, $s1 , exit
	
	li $t3, 2 # divisor para a instru??o div
	move $t1, $s2 # copia o numero  para o registrador $t1
	div $t1, $t3 # divide o numero por 2 (quociente: LO, resto: HI)
	mfhi $t2 # copia o resto para o registrador $t2
	bne $t2, 0, printPar # se o resto ? 0, ent?o ? um numero impar
	
	beq $t2, 0, printImpar
	
printPar:
	li $v0, 4
	la $a0, pa
	syscall # imprime mensagem par
	add $s2,$s2,1
	j loop
printImpar:
	li $v0, 4
	la $a0, imp
	syscall # imprime mensagem impar
	add $s2,$s2,1
	j loop
	
exit: 
	li $v0, 10
	syscall #finaliza programa
	
	
		

		
