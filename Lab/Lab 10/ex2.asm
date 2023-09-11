#Laboratory Exercise 10 Home Assignment 2
#PhamVanAnh_20214988

.eqv MONITOR_SCREEN 0x10010000 #Dia chi bat dau cua bo nho man hinh
.eqv RED 0x00FF0000 #Cac gia tri mau thuong su dung
.eqv GREEN 0x0000FF00
.eqv BLUE 0x000000FF
.eqv WHITE 0x00FFFFFF
.eqv YELLOW 0x00FFFF00

.text
 	li 	$k0, MONITOR_SCREEN #Nap dia chi bat dau cua man hinh
 	li 	$t0, WHITE
 	sw 	$t0, 0($k0)
 	nop
 	
 	li 	$t0, WHITE
	sw 	$t0, 28($k0)
 	nop
 	
 	li 	$t0, WHITE
 	sw 	$t0, 36($k0) 
 	nop
 	
 	li 	$t0, WHITE
 	sw 	$t0, 56($k0) 
 	nop
 	
 	li 	$t0, WHITE
 	sw 	$t0, 68($k0)
 	nop
 
 	li 	$t0, WHITE
 	sw 	$t0, 88($k0)
 	nop
 
 	li 	$t0, WHITE
	sw 	$t0, 104($k0)
 	nop
 
  	li 	$t0, WHITE
	sw 	$t0, 116($k0)
 	nop
 	
 	li 	$t0, WHITE
	sw 	$t0, 136($k0)
 	nop
 	
 	li 	$t0, WHITE
	sw 	$t0, 148($k0)
 	nop
 	
 	li 	$t0, WHITE
	sw 	$t0, 172($k0)
 	nop
 	
 	li 	$t0, WHITE
	sw 	$t0, 176($k0)
 	nop
 	
 	