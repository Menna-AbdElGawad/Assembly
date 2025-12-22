# Output = 0 --> Even
 # Output = 1 --> Odd

.text

.global main

main:
li $a0, 6

jal even_odd

move $a0, $v0

li $v0, 1
syscall

j end

even_odd:
div $v0, $a0, 2
mflo $t0
mfhi $t1

beq $t1, 1, equal

li $v0, 0
jr $ra

equal:
li $v0, 1
jr $ra

end:
li $v0, 10
syscall