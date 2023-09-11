#Laboratory 6, Home Assigment 2
#PhamVanAnh_20214988

.data
	A: .word 10, -5, -4, -3, 33, -7, 12, 16, 27, -9
	Aend: .word 
	tab: .asciiz " "
	message: .asciiz "Day sau khi duoc sap xep: "
.text
main: 
	la 	$a0, A 		#$a0 = Address(A[0])
 	la 	$a1, Aend
 	addi 	$a1, $a1, -4 	#$a1 = Address(A[n-1])
 	j 	sort 			#sort
after_sort: 
	la	$s0, A
	la	$s1, Aend
	addi	$s1, $s1, -4	
	li	$v0, 4
	la	$a0, message
	syscall	
print_loop:
        li $v0, 1
        add $t2, $s0, 0
        lw	$a0, 0($t2)
        syscall
        
        beq	$s0, $s1, out
        li	$v0, 4
        la	$a0, tab
        syscall        
        add	$s0, $s0, 4
        j print_loop
end_main:

#--------------------------------------------------------------
#procedure sort (ascending selection sort using pointer)
#register usage in sort program
#$a0 pointer to the first element in unsorted part
#$a1 pointer to the last element in unsorted part
#$t0 temporary place for value of last element
#$v0 pointer to max element in unsorted part
#$v1 value of max element in unsorted part
#--------------------------------------------------------------
sort: 
	beq $a0, $a1, done 	#single element list is sorted
 	j   max 			#call the max procedure
after_max: 
	lw $t0, 0($a1) 		#load last element into $t0
 	sw $t0, 0($v0) 		#copy last element to max location
 	sw $v1, 0($a1) 		#copy max value to last element
 	addi $a1, $a1, -4 	#decrement pointer to last element
 	j sort 			#repeat sort for smaller list
done: j after_sort
#---------------------------------------------------------------------

#Procedure max
#function: fax the value and address of max element in the list
#$a0 pointer to first element
#$a1 pointer to last element
#---------------------------------------------------------------------

max:
	addi 	$v0, $a0, 0 		#init max pointer to first element
	lw 	$v1, 0($v0) 		#init max value to first value
	addi  $t0, $a0, 0 		#init next pointer to first
loop:
	beq 	$t0, $a1, ret 		#if next=last, return
	addi 	$t0, $t0, 4 		#advance to next element
	lw 	$t1, 0($t0) 		#load next element into $t1
	slt 	$t2, $t1, $v1 		#(next)<(max) ?
	bne   $t2, $zero, loop 		#if (next)<(max), repeat
	addi 	$v0, $t0, 0 		#next element is new max element
	addi 	$v1, $t1, 0 		#next value is new max value
	j 	loop				#change completed; now repeat
ret:
j after_max
out:
