# === While Loops in MIPS ===
# ===========================

.data
sum: .word 0
i: .word 1
n: .word 5

.text 
main: 
	lw $s0, sum
	lw $s1, i
	lw $s2, n

loop_start:
	bgt $s1, $s2, loop_end # if i > n -> end loop
	add $s0, $s0, $s1      # sum += i
	add $s1, $s1, 1        # i++
	j loop_start           # jump back to the start of the loop

loop_end:
	sw $t3, sum # store updated sum
	li $v0, 10  # Exit syscall
	syscall