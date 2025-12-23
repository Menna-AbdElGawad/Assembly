.data

arr: .word 10, 20, 30, 40, 50, 60
size: .word 6

.text

li $t0, 20
la $t1, arr

add $t0, $t0, $t1

loop:
bge $t1, $t0, end

lw $t2, 0($t0)
lw $t3, 0($t1)

sw $t3, 0($t0)
sw $t2, 0($t1)

addi $t1, $t1, 4
addi $t0, $t0, -4

j loop

end:
li $v0, 10
syscall