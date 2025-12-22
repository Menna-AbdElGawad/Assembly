.data 
x: .word 3
y: .word 5
c: .word 0

.text
lw $t0, x
lw $t1, y

slt $t2, $t0, $t1
beq $t2, 1, less

li $t3, 0
sw $t3, c
j End

less:
	li $t3, 1
	sw $t3, c
	
End:
	li $v0, 10
	syscall