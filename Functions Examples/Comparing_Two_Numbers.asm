.text

.global main

main:
li $a0, 1
li $a1, 2

jal compare_num

move $a0, $v0

li $v0, 1
syscall

j end

compare_num:
slt $v0, $a0, $a1

jr $ra

end:
li $v0, 10
syscall