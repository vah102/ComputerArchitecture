.data
	InN: 		.asciiz "Input N: "
	InM: 		.asciiz "Input M: "
	Output:	.asciiz "Prime number in [N,M]: "
	No_number:	.asciiz "No number"
	Space:	.asciiz "  "
	Endline: 	.asciiz "\n"
.text
main: 
input_n:
	li	$v0, 4
	la	$a0, InN
	syscall
	
	li	$v0, 5
	syscall
	add	$t0, $v0, $zero

input_m:
	li	$v0, 4
	la	$a0, InM
	syscall
	
	li	$v0, 5
	syscall
	add	$t1, $v0, $zero
	
	li	$v0, 4
	la	$a0, Output
	syscall
	
	slt	$s6, $t1, $t0    # $s6 = $s1 < 0 ? 1 : 0
	bne	$s6, $zero, exit
	
	
loop: #For i in range[n,m]
	jal	is_prime
	addi	$t0, $t0, 1
	slt	$t8, $t1, $t0	 # $t8 = $t1 < $t0 ? 1 : 0
	beq	$t8, $zero, loop
	
exit:
	bne	$t3, $zero, halt	
	li	$v0, 4
	la	$a0, No_number
	syscall
	
halt: 	
	li	$v0, 10
	syscall
	
is_prime:
	li	$t2, 2
	slt	$t7, $t0, $t2
	bne	$t7, $zero, return
	
prime_test:
	beq	$t0, $t2, print		#if ($t2 >= n) -> print
	div	$t0, $t2
	mfhi	$s0				#s0 = $t0 % $t2
	beq	$s0, $zero, return
	addi	$t2, $t2, 1		#$t2+=1
	j	prime_test
	
print:
	addi	$t3, $zero, 1
	li	$v0, 1
	add	$a0, $t0, $zero
	syscall
	
	li	$v0, 4
	la	$a0, Space
	syscall

return:
	jr	$ra
