
.data
    prompt_input: .asciiz "Enter the range (N, M): "
    prompt_result: .asciiz "Prime numbers in the range: "
    prime_numbers: .space 100
    array_size: .word 0
    
.text
.globl main
main:
    # In thông báo yêu c?u nh?p kho?ng
    li $v0, 4
    la $a0, prompt_input
    syscall
    
    # Nh?p kho?ng t? bàn phím
    li $v0, 5
    syscall
    sw $v0, N
    
    li $v0, 5
    syscall
    sw $v0, M
    
    # Tìm s? nguyên t? trong kho?ng
    lw $a0, N
    lw $a1, M
    jal find_prime_numbers
    
    # In k?t qu?
    li $v0, 4
    la $a0, prompt_result
    syscall
    
    la $a0, prime_numbers
    la $a1, array_size
    jal print_array