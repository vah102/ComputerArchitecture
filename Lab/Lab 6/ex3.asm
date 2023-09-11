.data
	A: .word 5, 7, -3, 6, 3, -8, -4
	Aend: .word 
	Message: .asciiz  "Mang sau khi duoc sap xep: "
	tab: .asciiz " "
.text
main:   
	la $a0, A           # $a0 = Address(A[0])
      la $a1, Aend
      j sort              # sort
after_sort:  
	j print_out
end_main:
# BUBBLE SORT
sort:   
	beq $a0, $a1, done            # single element list is sorted
      j   travasal                  # call the travasal procedure           
done: 
	j     after_sort	
travasal:       
	addi $v0, $a0, 0         # init travasal pointer to first element
      addi $t0, $a0, 0         # init next pointer to first
      addi $a1, $a1, -4        # pointer to last element 
      beq $a0, $a1, done       # completely sort
loop:   
	beq  $v0, $a1, travasal          # if current=last, bubbleSort
      lw   $v1, 0($v0) 
      addi $t0, $v0, 4         # advance to next element
      lw   $t1, 0($t0)         # load next element into $t1
      slt  $t2, $t1, $v1       # (next)<(current) ?
      bne  $t2, $zero, swap    # if (next)>(current), swap
      addi $v0, $v0, 4         # current point to next
      j    loop             
      
swap:   
	add $t5, $v1, $zero     # store value has address ($v1) to $t5 (temp)
      sw  $t1, 0($v0)         # copy next value to current
      sw  $t5, 0($t0)         # copy temp value to next
      addi $v0, $v0, 4        # current point to next
      j   loop                # change completed; now repeat 
           
print_out:
        li $v0, 4
        la $a0, Message
        syscall
        la $a0, A
        la $a1, Aend
        add $t0, $a0, 0
print_el:                    # in ra tung phan tu trong mang
        lw     $t1, 0($t0)   # l?y giá tr? t? ??a ch? $t0  
        li     $v0, 1        # Th?c hi?n in giá tr? ra màn hình
        move   $a0, $t1
        syscall 
        
        li $v0, 4            # in d?u cách tab kho?ng cách gi?u các ph?n t?
        la $a0, tab
        syscall
        
        add  $t0, $t0, 4     # ti?p t?c tr? ??n ph?n t? ti?p theo c?a mnagr
        bne  $t0, $a1, print_el # ki?m tra xem có tr? ??n ph?n t? cu?i cùng c?a m?ng?
        
        li $v0, 10              # exit()
        syscall                 # 