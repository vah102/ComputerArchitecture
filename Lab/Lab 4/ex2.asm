#Laboratory Exercise 4, Home Assignment 2
#PhamVanAnh_20214988
.text
	li	$s0, 0x12345678		# test value 
	andi  $t0, $s0, 0xff000000 	# extract MSB
	andi  $t1, $s0, 0xffffff00	# clear LSB
	ori   $t2, $s0, 0x000000ff    # OR with bit 7 = 1
	andi  $t3, $s0, 0x0 		# clear $s0 = 0
	

