#Laboratory Exercise 5, Home Assignment 5
#PhamVanAnh_20214988


.data
	string:		.space 21
	reverse_string: 	.space 21
	Message1:		.asciiz "Input string:"
	Message2:	 	.asciiz "\nReverse string:"
.text
main:
get_string: 
	li	$v0, 4			# 54 -> show input dialog
	la	$a0, Message1
	syscall
	
	li	$v0, 8
	la	$a1, string
	li	$a2, 21	
	syscall				# TODO 
get_length: 
	la	$a0, string			# a0 = Address(string[0])
 	xor 	$v0, $zero, $zero 	# v0 = length = 0
 	xor 	$t0, $zero, $zero 	# t0 = i = 0
check_char: 
	add 	$t1, $a0, $t0 		# t1 = a0 + t0 
 						#= Address(string[0]+i) 
 	lb 	$t2, 0($t1) 		# t2 = string[i]
 	beq	$t2, $zero, end_of_str 	# Is null char? 
 	addi 	$v0, $v0, 1 		# v0=v0+1->length=length+1
 	addi 	$t0, $t0, 1 		# t0=t0+1->i = i + 1
 	j check_char
end_of_str: 
end_of_get_length:

check:
	addi	$t4, $v0, -1
	add	$s0, $v0, $t4
	lb	$t5, 0($s0)
	li	$t6, '\n'
	bne	$t5, $t6, reverse_string
	add	$v0, $v0, -1
	
reverse_string:
	la	$s1, reverse_string
	add	$v0, $v0, -1
	li	$v1, 0
rev: 
      addi  $t3, $v0, 1     
      beq   $t3, $zero, end_of_rev  
      add   $t1, $a0, $v0      #  l?y ??a ch? c?a string[0]
      lb    $t2,  0($t1)       #  l?y giá tr? t? ??a ch? string[0]      
      add   $t3, $a1, $v1      #  l?y ??a ch? msg_rev[0] + i
      sb    $t2, 0($t3)        #  gán giá tr? msg_rev[i]
      addi  $v1, $v1,1         #  i=i+1
      addi  $v0, $v0, -1       #  length = length - 1
      j     rev                #  next character
end_of_rev:  

output:   
	li $v0, 4           # in ra  "\nReverse string: "
      la $a0, Message2
      syscall

      li $v0, 4           # in ra gia tri cua msg_rev (sau khi reverse t? string)
      la $a0, msg_rev   
      syscall
	 	 




	
	
	

