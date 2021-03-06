	.data
string:	.space 20
endl:	.asciiz "\n"
inicio: .asciiz "CRC16-BUYPASS: 0x"
barraN: .asciiz "1BC0"
result: .space 20
	.text
main:

   lerString:
	li $v0, 8 
	la $a0, string 
	li $a1, 20
	syscall

    li $s6, 8
    li $t1, 0
    li $t2, 0x8005 # poly
    li $t4, 0x0000 # crc
    li $t5, 0x8000 # mask
    li $t8, 0xFFFF # most sig bit


percorreString: 
  lbu $t3, string($t1) # Pega o char atual da string
  beq $t3, 10, digest	# se for == '\0' para
	
  j desloca8bits # desloca 8 bits para a esquerda

  forTam8:
    beq $t7, 8, finalPercorreString # retorna para o for externo
    and $s5, $t4, $t5 # crc & mask	
    
    beq $s5, $t5, if # crc & mask == mask
    bne $s5, $t5, else # else
    j forTam8
    
  finalPercorreString:
    move $t7, $zero # j = 0
    addi $t1, $t1, 1 # i ++
    j percorreString

# if(self->refin == 0)
desloca8bits:
  sll $s5, $t3, 8
  and $s7, $s5, $t8
  xor $t4, $t4, $s7
  j forTam8

# ((crc & CRC_MASK) == CRC_MASK) 
if: 
  sll $t4, $t4, 1
  xor $t4, $t4, $t2
  and $t4, $t4, $t8
  addi $t7, $t7, 1 # j++
  j forTam8

# else 
else:
  sll $t4, $t4, 1
  and $t4, $t4, $t8
  addi $t7, $t7, 1 # j++
  j forTam8

digest:
  and $t4, $t4, $t8
  
  li $v0, 4
  la $a0, inicio
  syscall	
  beqz $t1, printBarraN

  move $a1, $t4 		
  la $a0, result 
  
  jal intToString
 
  li $t4, 0
	forTeste:
		beq $t4, 8, finalizaPrograma
		
		lbu $a0, result($t4)
		
		bne $a0, '0', printxD
		
		addi $t4, $t4, 1
		j forTeste

 j finalizaPrograma

printBarraN:
  li $v0, 4
  la $a0, barraN
  syscall	
  j finalizaPrograma
printxD:
	li $v0, 11
	syscall
	addi $t4, $t4, 1
	forFinal:
		beq $t4, 8, finalizaPrograma
		lbu $a0, result($t4)
		li $v0, 11
		syscall
		addi $t4, $t4, 1
		j forFinal
		
intToString:
	li $t0, 20	
	move $s1, $a0
LoopIntToString:
	beqz $t0, restaura		
	rol $a1, $a1, 4	
	and $s2, $a1, 0xf	
	ble $s2, 9, Soma48	 
	addi $s2, $s2, 55	
  j changeByte
Soma48: 
	addi $s2, $s2, 48	
changeByte: 
	sb $s2, 0($s1)
	addi $s1, $s1, 1
	addi $t0, $t0, -1	
	j LoopIntToString 
restaura:
	jr $ra 
finalizaPrograma:
	li $v0, 10
	syscall

