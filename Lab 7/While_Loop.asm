.data
sum: .word 0
i: .word 1
n: .word 5

.text
main:
lw $t0, i
lw $t1, n
lw $t2, sum

loop_start:
	bgt $t0, $t1, loop_end
	add $t2, $t2, $t0
	addi $t0, $t0, 1
	j loop_start
loop_end:
	sw $t2, sum
	li $v0, 10
	syscall