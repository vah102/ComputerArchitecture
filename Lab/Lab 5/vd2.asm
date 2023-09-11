string: .space 50
Message1: .asciiz "Nhap xau:”
Message2: .asciiz "Do dai la "
.text
main:
get_string: # TODO des X H e l
$s0 = i
$a0 $t3 sb $t2, 0($t3)
 $t2 
 lb $t2, 0($t1)
src Y H e l l o \0
$s0 = i
$a1 $t1
Ha Noi University of Science and Technology
School of Information and Communication Technology
 
get_length: la $a0, string # a0 = Address(string[0])
 xor $v0, $zero, $zero # v0 = length = 0
 xor $t0, $zero, $zero # t0 = i = 0
check_char: add $t1, $a0, $t0 # t1 = a0 + t0 
 #= Address(string[0]+i) 
 lb $t2, 0($t1) # t2 = string[i]
 beq $t2,$zero,end_of_str # Is null char? 
 addi $v0, $v0, 1 # v0=v0+1->length=length+1
 addi $t0, $t0, 1 # t0=t0+1->i = i + 1
 j check_char
end_of_str: 
end_of_get_length:
print_length: # TODO
