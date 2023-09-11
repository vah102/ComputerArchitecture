#Laboratory Exercise 4, Home Assignment 3
#PhamVanAnh_20214988
.text
	li	$s1, -8			#s0=-8
	slt	$t0, $s1, $zero		#branch t0 and s0
	bne	$t0, $zero, so_am		#brand t0 and 0
	add 	$s0, $zero, $s1		#s1=s0+0
	j	endif
so_am:
	sub	$s0, $zero, $s1
endif:


	
	
	
	
	
		
