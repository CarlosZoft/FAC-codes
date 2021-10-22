	.data
string:	.space 20
endl:	.asciiz "\n"
inicio: .asciiz "CRC16-BUYPASS: 0x"
	.text
main:

  lerString:
	  li $v0, 8 
	  la $a0, string 
	  li $a1, 16
	  syscall
 
    li $s6, 8
    li $t2, 0x8005 # poly
    li $t4, 0x0000 # value
    li $s1, 0 # ref in
    li $s2, 0 # ref out 
    li $t6, 0x0000 # xor out

for_externo: 
  lbu $t3, string($t1) # Pega o char atual da string
  beq $t3, 10, digest	# se for == '\0' para

  beq $s1, $zero, sll8Bits # se ref in for == 0 , joga 8 bits para esquerda 

  for_inside:
    bne $t7, 8, final_for_externo # retorna para o for externo
    and $s5, $t4, 0x8000 # bitwise and value com 0x8000

    bne $s5, $zero, if 
    beq $s5, $zero, else

    addi $t7, $t7, 1 # j++

  final_for_externo:
    move $t7, $zero # j = 0
    addi $t1, $t1, 1 # i ++
    j for_externo

# if(self->refin == 0)
sll8Bits:
  sll $s5, $t3, 8
  or $t4, $t4, $s5
  j for_inside

# if(self->value & 0x8000)
if:
  sll $s3, $t4, 1
  xor $t4, $s3, $t2
  j for_inside
# else 
else:
  sll $t4, $t4, 1


digest:
  move $s3, $t4
  or $s3, 0x0000
  
  li $v0, 4
  la $a0, inicio
  syscall

  move $a0, $s3
  li $v0, 34
  syscall

  j exit
exit:  
	li $v0, 10
	syscall

