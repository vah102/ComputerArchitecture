# Laboratory Exercise 3, Assignment 6
# PhamVanAnh_20214988
.data
A: .word -1, -2, -3, -11, 1, 2, 3, 4, 5, 6, 7, 8, 9

.text
      li $s1, -1          #i=-1
      la $s2, A           #s2 stores the address of array A
      li $s3, 13          #number of element of A
      li $s4, 1           #step
      li $s5, 0           #max
loop:
      add $s1, $s1, $s4   
      add $t1, $s1, $s1   #t1=2*s1
      add $t1, $t1, $t1   #t1=4*s1
      add $t1, $t1, $s2   #t1 store the address of A[i]
      lw  $t0, 0($t1)     #load value of A[i] in$t0
      beq $s1, $s3, end
      
      slt $t2, $zero, $t0 #so sanh A[i] v?i 0. Neu A[i]>0, t2 =1 => chay tiep 
      beq $t2, $zero, a   #so sánh t2 và 0. Neu t2=0 thì quay xuong ham a (truong hop A[i]<0)
      slt $s7, $s5, $t0   # 1: 0 ? s5 < A[i]
      beq $s7, $0, loop   #neu s7 = 0 thì quay lai loop
      add $s5, $0, $t0    #gán s5 thành A[i]
      j loop
a:
      sub $s6, $0, $t0   #Vi A[i]<0, dùng sub 0-A[i]
      slt $s7, $s5, $s6  # 1: 0 ? s5 < s6
      beq $s7, $0, loop
      add $s5, $0, $s6 
      j loop
 end:
 