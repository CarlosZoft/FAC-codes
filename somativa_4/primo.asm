.data 
	Invalida: .asciiz "Entrada invalida."
   nao: .asciiz "nao"
   sim: .asciiz "sim"
.text



main:	
  	
	li $v0,5
	syscall  # Leitura do inteiro a ser verificado
	move $s1, $v0 

	ble $s1, $zero, EntradaInvalida # Se for menor ou igual a 0 finaliza
  	beq $s1, 1, NAO # Se for igual a 1 , N�o � primo
  	beq $s1, 2, SIM # Se for igual a 2 , � primo
  	
  	li $t4, 2
  	div $t3, $s1, $t4  #Divididindo o valor por 2 e pegando o resto
    	mfhi $t1
    	
	beq $t1, 0, NAO # se o resto for igual a zero, n�o � primo
  	
  	mtc1 $s1, $f2
	cvt.s.w $f2, $f2	
	sqrt.s $f0,$f2
	
	cvt.w.s $f0,$f0
	mfc1 $a1,$f0 # Pega a raiz quadrada do numero
  
  li $t2, 3  # Inicia em 3, pois descarto numeros pares

FORNUMBERS:	
  bgt $t2, $a1, SIM # Se for maior que a raiz, � primo
  	div $s3, $s1, $t2
	mfhi $t1  # tira o resto do numero pelo it

  	beqz $t1, NAO # se tiver o resto 0, n�o � primo
  	 
	addi $t2, $t2, 2 # Adiciona 2, j� que s� verifa impares
	
  	jal FORNUMBERS

EntradaInvalida:
	li $v0, 4
	la, $a0, Invalida
	syscall
	
	j finaliza

SIM:
  	li $v0, 4
	la, $a0, sim # Imprimi SIM
	syscall
	
	j finaliza

NAO:
  	li $v0, 4
	la, $a0, nao # Imprimi NAO
	syscall
	
	j finaliza
	
finaliza:
	li $v0, 10 # Finaliza o programa
	syscall
