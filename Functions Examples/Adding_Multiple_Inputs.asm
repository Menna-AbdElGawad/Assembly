.data
x: .word 5
y: .word 5
z: .word 5
w: .word 5

.text

.global main

main:
lw $a0, x
lw $a1, y
lw $a2, z
lw $a3, w

jal add_function

move $a0, $v0

li $v0, 1
syscall

j end

add_function:
add $v0, $a0, $a1

add $v0, $v0, $a2

add $v0, $v0, $a3

jr $ra

end:
li $v0, 10
syscal
