#Laboratory Exercise 5, Home Assignment 2
#PhamVanAnh_20214988
.data
	Message1: .asciiz "The sum of "
	Message2: .asciiz " and "
	Message3: .asciiz " is "
.text
	li 	$s0, 10
	li 	$s1, 12
	
#Print "The sum of"	
	li 	$v0, 4	
	la 	$a0, Message1
	syscall				
#Print s0
	li 	$v0, 1
	add	$a0, $zero, $s0
	syscall				
#Print "and"
	li	$v0, 4
	la	$a0 Message2
	syscall
#Print "s1"
	li 	$v0, 1
	add 	$a0, $zero,$s1
	syscall
#Print "is"
	li 	$v0, 4	
	la	$a0 Message3
	syscall
#Print result
	li 	$v0, 1
	add	$a0, $s0, $s1
	syscall

