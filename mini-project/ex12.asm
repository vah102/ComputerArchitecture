.data
	Input: 	.space 16
	Message: 	.asciiz "Please input a string number: "
	Exit_code:	.asciiz "Input problem"
	Output:	.asciiz "32-bit integer: "
	Min_number:	.word 48	#0
	Max_number:	.word 57	#9
	Enter:	.word 10	
.text
main: 	

	li	$s0, 0	#number
	la	$t7, Enter
	lw	$t7, 0($t7)
	la	$t8, Min_number
	lw	$t8, 0($t8)
	la	$t9, Max_number
	lw	$t9, 0($t9)
	
input_string:
	li	$v0, 54
	la	$a0, Message
	la	$a1, Input
	la	$a2, 10
	syscall
	
	la	$t0, Input

read_char:
	lbu	$t1, 0($t0)		#l?y t?ng byte t?i ??a ch? $t0 gán vào $t1
	sle	$s3, $t8, $t1	#t8 <= t1 --> s3 = 1
	beq	$s3, $zero, exit	#ki?m tra kí t? ??u vào >= 0 
	sge	$s3, $t9, $t1	#t9 >= t1 --> s3 =1 
	beq	$s3, $zero, exit	#ki?m tra kí t? ??u vào <= 9
	mul	$s0, $s0, 10	#s0*=10
	sub	$t1, $t1, $t8	#ord($t1)
	add	$s0, $s0, $t1	#s0+ = t1
	addi	$t0, $t0, 1		#t0 = $t0 + 1
	j	read_char

exit:
	beq	$t1, $zero, print	#
	bne	$t1, $t7, error	#

print:
	li	$v0, 4
	la	$a0, Output
	syscall
	
	li	$v0, 1
	add	$a0, $s0, $zero
	syscall
	j	done
	
error:
	li	$v0, 4
	la	$a0, Exit_code
	syscall
	
done:	
	li	$v0, 10
	syscall
	
