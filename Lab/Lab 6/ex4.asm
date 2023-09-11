#Laboratory 6, Home Assigment 4
#PhamVanAnh_20214988

.data
A: .word 10, 13, 6, 3, 7, 37,12
Aend: .word 
Message: .asciiz  "Mang sau khi duoc sap xep: "
tab: .asciiz " "

.text
main:   la $a0, A           # $a0 = Address(A[0])
        la $a1, Aend        # $a1 = Address(A[n-1]) + 4 //dieu kien dung vong lap
        j sort              # sort
after_sort:  j   print_out  # in ra man hinh mang sau khi s?p x?p
end_main:


# INSERTION SORT
sort:   beq $a0, $a1, done       # single element list is sorted
        j   travasal                  # call the travasal procedure
done:   j     after_sort

travasal:    addi $v0, $a0, 4    # init pointer to second element
             addi $t0, $v0, 0         # init previous pointer to $v0
loop:   beq  $v0, $a1, after_sort  # if next=last, return
        lw   $v1, 0($v0)         # init value to $v1
        addi $t0, $v0, -4        # advance to next element
        lw   $t1, 0($t0)         # load previous element into $t1
        sgt  $t2, $t1, $v1       # (pre)>(cur) ?
        bne  $t2, $zero, progress    # if (pre)<(cur), progress
        addi $v0, $v0, 4         # next element 
        addi $t0, $t0, 4         # 
        j    loop                # change completed; now repeat

progress:       addi  $t5, $v1, 0   # value of current ($v1)
                addi  $t3, $v0, 0   # phan tu tinh tien 
repeat:         sw   $t1, 0($t3)    # begin move back
                add  $t3, $t3, -4   # the next element move back
                beq  $t0, $a0, end    # check ($t0 == $a0) tr�nh tr??ng h?p duy?t qu� m?ng
                add  $t0, $t0, -4   
                lw   $t1, 0($t0)
                slt  $t2, $t1, $t5            # (pre)<(cur) ? 
                beq  $t2, $zero, repeat       # if (pre)<(cur), repeat
end:            sw   $t5, 0($t3)
                add  $v0, $v0, 4 
                j    loop
end_loop:

print_out:
        li $v0, 4
        la $a0, Message
        syscall
        la $a0, A
        la $a1, Aend
        add $t0, $a0, 0
print_el:                    # in ra tung phan tu trong mang
        lw     $t1, 0($t0)   # l?y gi� tr? t? ??a ch? $t0  
        li     $v0, 1        # Th?c hi?n in gi� tr? ra m�n h�nh
        move   $a0, $t1
        syscall 
        
        li $v0, 4            # in d?u c�ch tab kho?ng c�ch gi?u c�c ph?n t?
        la $a0, tab
        syscall
        
        add  $t0, $t0, 4     # ti?p t?c tr? ??n ph?n t? ti?p theo c?a mnagr
        bne  $t0, $a1, print_el # ki?m tra xem c� tr? ??n ph?n t? cu?i c�ng c?a m?ng?
        
        li $v0, 10              # exit()
        syscall                 # 



