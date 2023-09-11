.data
msg_rev:� .space�� 21
string:   .space   21
Message1: .asciiz "Input string: "
Message2: .asciiz "\nReverse string: "

�

.text
main:
get_string:��
��������� li $v0, 4
��������� la $a0, Message1
��������� syscall

��������� li $v0, 8
��������� la $a0, string
��������� li $a1, 21
��������� syscall�

get_length:� # T�nh chi?u d�i c?a chu?i
��������� la�� $a0, string��������� # a0 = Address(string[0])
��������� xor� $v0, $zero, $zero��� # v0 = length = 0
��������� xor� $t0, $zero, $zero��� # t0 = i = 0
check_char:��
��������� add� $t1, $a0, $t0������� # t1 = a0 + t0�
������������������������������������ #��� = Address(string[0]+i)�
��������� lb�� $t2, 0($t1)��������� # t2 = string[i]
��������� beq� $t2, $zero, end_of_str # Is null char?
��������� addi $v0, $v0, 1��������� # v0=v0+1->length=length+1
��������� addi $t0, $t0, 1��������� # t0=t0+1->i = i + 1�
��������� j��� check_char
end_of_str:����������������
end_of_get_length:

�

check_new_line:�
��������� addi $t4, $v0, -1������ # l?y v? tr� vi th?� i = length - 1 ?? ki?m tra xem ?� c� ph?i l� k� t? xu�n
��������� add� $s0, $a0, $t4����� # ??a ch? c?a string[0] + i
��������� lb�� $t5, 0($s0)������� # l?y gi� tr? t? ??a ch? (string[0] + i)
��������� li�� $t8, '\n'��������� # g�n gi� tr? thanh ghi $t8 = '\n'
��������� bne� $t5, $t8, reverse_string�� # ki?m tra xem gi� tr? string[0] + i c� ph?i l� '\n' kh�ng
��������� add� $v0, $v0, -1������ # n?u l� '\0' ta t�nh length = length tr? 1 b? qua '\n' ?? ?i ??o chu?i

�

reverse_string:�
��������� la��� $a1, msg_rev������ # l?y ??a ch? c?a msg_rev
��������� addi� $v0, $v0, -1������ # length of string
��������� li��� $v1, 0������������ # v1 = i = -1
rev:�
��������� addi� $t3, $v0, 1�����
��������� beq�� $t3, $zero, end_of_rev� # ki?m tra xem�
��������� add�� $t1, $a0, $v0����� #� l?y ??a ch? c?a string[0]
��������� lb��� $t2,� 0($t1)������ #� l?y gi� tr? t? ??a ch? string[0]������
��������� add�� $t3, $a1, $v1����� #� l?y ??a ch? msg_rev[0] + i
��������� sb��� $t2, 0($t3)������� #� g�n gi� tr? msg_rev[i]
��������� addi� $v1, $v1,1�������� #� i=i+1
��������� addi� $v0, $v0, -1������ #� length = length - 1
��������� j���� rev��������������� #� next character
end_of_rev:��

output:�� li $v0, 4���������� # in ra� "\nReverse string: "
��������� la $a0, Message2
��������� syscall

��������� li $v0, 4���������� # in ra gia tri cua msg_rev (sau khi reverse t? string)
��������� la $a0, msg_rev���
��������� syscall