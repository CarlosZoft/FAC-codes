	.data
    symbol: .asciiz "0x"
    endl: .asciiz "\n"
    add1: .asciiz "ADD: "
    sub1: .asciiz "SUB: "
    and1: .asciiz "AND: "
    or1: .asciiz "OR: "
    xor1: .asciiz "XOR: "
    mask1: .asciiz "MASK: "
    sll1: .asciiz "SLL("
    srl1: .asciiz "SRL("
    final: .asciiz "): "
    resultado:  .space  8
    zeroAsFloat: .float 0.0
	.text
main:	
	li $v0, 5 # ler um numero inteiro 
	syscall 
	move $s2, $v0
	
	li $v0, 5 # ler um numero inteiro
	syscall 
	move $s1, $v0
	
  li $v0, 5 # ler um numero inteiro
	syscall 
	move $s3, $v0

  # ------------- Printando ADD ----------------------

  add $s4, $s2, $s1 # somando A e B

  li $v0, 4 # printando string
  la $a0, add1 # printando nome ADD
  syscall

  li $v0, 1 # printando int
  move $a0, $s4 # Printando Soma de A + B 
  syscall

  li $v0, 4 # printando string
  la $a0, endl # Imprimindo '\n'
  syscall


  # ------------- Printando SUB ----------------------

  sub $s4, $s2, $s1 # subtraindo A de B

  li $v0, 4 # printando string
  la $a0, sub1 # printando nome SUB
  syscall

  li $v0, 1 # printando int
  move $a0, $s4 # Printando SUB de A + B 
  syscall

  li $v0, 4 # printando string
  la $a0, endl # Imprimindo '\n'
  syscall
  

  # ------------- Printando AND ----------------------

  and $s4, $s2, $s1 # And entre A e B

  li $v0, 4 # printando string
  la $a0, and1 # printando nome AND
  syscall

  li $v0, 1 # printando int
  move $a0, $s4 # Printando AND de A + B 
  syscall

  li $v0, 4 # printando string
  la $a0, endl # Imprimindo '\n'
  syscall
  

  # ------------- Printando OR ----------------------

  or $s4, $s2, $s1 # OR A B

  li $v0, 4 # printando string
  la $a0, or1 # printando nome OR
  syscall

  li $v0, 1 # printando int
  move $a0, $s4 # Printando OR de A + B 
  syscall

  li $v0, 4 # printando string
  la $a0, endl # Imprimindo '\n'
  syscall

  xor $s4, $s2, $s1 # XOR A B

  # ------------- Printando XOR ----------------------

  li $v0, 4 # printando string
  la $a0, xor1 # printando nome XOR
  syscall

  li $v0, 1 # printando int
  move $a0, $s4 # Printando XOR de A + B 
  syscall

  li $v0, 4 # printando string
  la $a0, endl # Imprimindo '\n'
  syscall

  # ------------- Printando MASK ----------------------

  and $s4, $s3, 31 # MASK entre c e 31

  li $v0, 4 # printando string
  la $a0, mask1 # printando nome MASK
  syscall

  li $v0, 1 # printando int
  move $a0, $s4 # Printando SUB de A + B 
  syscall

  li $v0, 4 # printando string
  la $a0, endl # Imprimindo '\n'
  syscall
  
  # ------------- Printando SLL ----------------------

  loopsll: 
    sll $s2, $s2, 1 # SLL 
    add $s7, $s7, 1 
    bne $s7 , $s4, loopsll

  li $v0, 4 # printando string
  la $a0, sll1 # printando nome SLL
  syscall

  li $v0, 1 # printando int
  move $a0, $s4 # Printando SRL
  syscall

  li $v0, 4 # printando string
  la $a0, final # printando nome SRL
  syscall

  li $v0, 1 # printando int
  move $a0, $s2 # Printando SLL
  syscall

  li $v0, 4 # printando string
  la $a0, endl # Imprimindo '\n'
  syscall

  # ------------- Printando SRL ----------------------
  loopsrl: 
    srl $s1, $s1, 1 # SRL
    add $s6, $s6, 1 
    bne $s6 , $s4, loopsrl

  li $v0, 4 # printando string
  la $a0, srl1 # printando nome SRL
  syscall

  li $v0, 1 # printando int
  move $a0, $s4 # Printando SRL
  syscall

  li $v0, 4 # printando string
  la $a0, final # printando nome SRL
  syscall

  li $v0, 1 # printando int
  move $a0, $s1 # Printando SRL
  syscall

  li $v0, 4 # printando string
  la $a0, endl # Imprimindo '\n'
  syscall
  
  li $v0, 10 # instrução para finalizar
  syscall # finaliza