.data
input: .word 0

.text

.global main

main:
li $v0, 5
syscall

sw $v0, input
lw $a0, input

jal mult_two

move $a0, $v0

li $v0, 1
syscall

j end

mult_two:
sll $v0, $a0, 1

jr $ra

end:
li $v0, 10
syscall