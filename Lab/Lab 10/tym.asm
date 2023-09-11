.eqv MONITOR_SCREEN 0x10010000 #Dia chi bat dau cua bo nho man hinh
.eqv RED 0x00FF0000 #Cac gia tri mau thuong su dung
.eqv GREEN 0x0000FF00
.eqv BLUE 0x000000FF
.eqv WHITE 0x00FFFFFF
.eqv YELLOW 0x00FFFF00
.eqv BLACK 0x00000000
.text
	li $k0, MONITOR_SCREEN #Nap dia chi bat dau cua man hinh
	add 	$t1, $k0, 0
	li	$t2, 255
	loop_white:
		li $t0, WHITE
		sw $t0, 0($t1)
		add $t1, $t1, 4
		add $t2, $t2, -1
		bgez $t2, loop_white
	add	$t1, $k0, 136 
	li	$t2, 12
	black_line_1:
		li $t0, BLACK
		sw $t0, 0($t1)
		add $t1, $t1, 4
		add $t2, $t2, -1
		bgtz $t2, black_line_1
	white_line_1:
		li $t0, WHITE
		sw $t0, 156($k0)
		sw $t0, 160($k0)
	add	$t1, $k0, 196 
	li	$t2, 14
	black_line_2:
		li $t0, BLACK
		sw $t0, 0($t1)
		add $t1, $t1, 4
		add $t2, $t2, -1
		bgtz $t2, black_line_2
	red_line_2:
		li $t0, RED
		sw $t0, 204($k0)
		sw $t0, 208($k0)
		sw $t0, 212($k0)
		sw $t0, 232($k0)
		sw $t0, 236($k0)
		sw $t0, 240($k0)	
	white_line_2:
		li $t0, WHITE
		sw $t0, 220($k0)
		sw $t0, 224($k0)
	add	$t1, $k0, 264
	li	$t2, 12
	red_line_3:
		li $t0, RED
		sw $t0, 0($t1)
		add $t1, $t1, 4
		add $t2, $t2, -1
		bgtz $t2, red_line_3
	black_line_3:
		li $t0, BLACK
		sw $t0, 260 ($k0)
		sw $t0, 284 ($k0)
		sw $t0, 288 ($k0)
		sw $t0, 312 ($k0)
	 	
	white_line_3:
		li $t0, WHITE
		sw $t0, 268 ($k0)
		sw $t0, 272 ($k0)
		
	add	$t1, $k0, 328
	li	$t2, 12
	red_line_4:
		li $t0, RED
		sw $t0, 0($t1)
		add $t1, $t1, 4
		add $t2, $t2, -1
		bgtz $t2, red_line_4
	black_line_4:
		li $t0, BLACK
		sw $t0, 324 ($k0)
		sw $t0, 376 ($k0)
	 	
	white_line_4:
		li $t0, WHITE
		sw $t0, 332 ($k0)
	
	add	$t1, $k0, 392
	li	$t2, 12
	red_line_5:
		li $t0, RED
		sw $t0, 0($t1)
		add $t1, $t1, 4
		add $t2, $t2, -1
		bgtz $t2, red_line_5
	black_line_5:
		li $t0, BLACK
		sw $t0, 388 ($k0)
		sw $t0, 440 ($k0)
	
	add	$t1, $k0, 456
	li	$t2, 12
	red_line_6:
		li $t0, RED
		sw $t0, 0($t1)
		add $t1, $t1, 4
		add $t2, $t2, -1
		bgtz $t2, red_line_6
	black_line_6:
		li $t0, BLACK
		sw $t0, 452 ($k0)
		sw $t0, 504 ($k0)
	
	add	$t1, $k0, 516
	li	$t2, 14
	black_line_7:
		li $t0, BLACK
		sw $t0, 0($t1)
		add $t1, $t1, 4
		add $t2, $t2, -1
		bgtz $t2, black_line_7
	add	$t1, $k0, 524
	li	$t2, 10
	red_line_7:
		li $t0, RED
		sw $t0, 0($t1)
		add $t1, $t1, 4
		add $t2, $t2, -1
		bgtz $t2, red_line_7
	
	add	$t1, $k0, 584
	li	$t2, 12
	black_line_8:
		li $t0, BLACK
		sw $t0, 0($t1)
		add $t1, $t1, 4
		add $t2, $t2, -1
		bgtz $t2, black_line_8
	add	$t1, $k0, 592
	li	$t2, 8
	red_line_8:
		li $t0, RED
		sw $t0, 0($t1)
		add $t1, $t1, 4
		add $t2, $t2, -1
		bgtz $t2, red_line_8
	
	add	$t1, $k0, 652
	li	$t2, 10
	black_line_9:
		li $t0, BLACK
		sw $t0, 0($t1)
		add $t1, $t1, 4
		add $t2, $t2, -1
		bgtz $t2, black_line_9
	add	$t1, $k0, 660
	li	$t2, 6
	red_line_9:
		li $t0, RED
		sw $t0, 0($t1)
		add $t1, $t1, 4
		add $t2, $t2, -1
		bgtz $t2, red_line_9
		
	add	$t1, $k0, 720
	li	$t2, 8
	black_line_10:
		li $t0, BLACK
		sw $t0, 0($t1)
		add $t1, $t1, 4
		add $t2, $t2, -1
		bgtz $t2, black_line_10
	add	$t1, $k0, 728
	li	$t2, 4
	red_line_10:
		li $t0, RED
		sw $t0, 0($t1)
		add $t1, $t1, 4
		add $t2, $t2, -1
		bgtz $t2, red_line_10
	
	add	$t1, $k0, 788
	li	$t2, 6
	black_line_11:
		li $t0, BLACK
		sw $t0, 0($t1)
		add $t1, $t1, 4
		add $t2, $t2, -1
		bgtz $t2, black_line_11
	add	$t1, $k0, 796
	li	$t2, 2
	red_line_11:
		li $t0, RED
		sw $t0, 0($t1)
		add $t1, $t1, 4
		add $t2, $t2, -1
		bgtz $t2, red_line_11
	
	add	$t1, $k0, 856
	li	$t2, 4
	black_line_12:
		li $t0, BLACK
		sw $t0, 0($t1)
		add $t1, $t1, 4
		add $t2, $t2, -1
		bgtz $t2, black_line_12