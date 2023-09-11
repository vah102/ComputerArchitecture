#Laboratory Exercise 4, Home Assignment 3
#PhamVanAnh_20214988
.text
	li	$s1, 10		#s1=10
	li	$s2, 8		#s2=8
	
	slt	$t0, $s2, $s1	#so sanh s2 va s1
	beq	$t0, $zero, L	#so sanh t0 va 0
	
	li	$t1, 2
	j	endif
L:
	li	$t1, 1
endif:
	
	
	
	
		
