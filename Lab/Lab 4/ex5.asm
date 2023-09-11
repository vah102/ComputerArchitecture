#Laboratory Exercise 4, Home Assignment 5
#PhamVanAnh_20214988
.text
	li 	$s0, 1	
	li	$s1, 10	#Nhan 1 * 10
	li	$t1, 1	#initial mask = 000...001
	li	$t2, -1	#i
	li	$s5, 0	#sum
loop:
	add	$t0, $s1, $t1
	addi 	$t2, $t2, 1
	bne 	$t0, $zero, Nhan
Nhan: 
	sllv 	$s3, $s0, $t2 	#Dich sang phai $t1 1 bit
	add	$s5, $s5, $s3	#$s5 = $s5 + $s3
next:
	sll	$t1, $t1, 1
	bne	$t2, 31, loop
	

		
	
