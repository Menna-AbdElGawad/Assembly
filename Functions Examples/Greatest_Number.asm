.text

.global main

main:

li $a0, 5
li $a1, 9

jal greatest_value

move $a0, $v0

li $v0, 1
syscall

j end

greatest_value:
bgt $a0, $a1, first

move $v0, $a1
jr $ra

first:
move $v0, $a0
jr $ra

end:
li $v0, 10
syscall