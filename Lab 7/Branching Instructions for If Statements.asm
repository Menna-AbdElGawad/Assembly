# Branching Instructions for If Statements
# ========================================

# 1. beq (Branch if Equal)
# ------------------------
# Branches to a label if two registers are equal.

# Syntax:
# beq$rs, $rt, label

# 2. bne (Branch if Not Equal)
# ----------------------------
# Branches to a label if two registers are not equal.

# Syntax:
# bne $rs, $rt, label3. 

# 3. slt (Set on Less Than)
# -------------------------
# Compares two registers and sets a destination register to 1 if the first is less than the second, otherwise sets it 
# to 0.Often combined with beq or bne for conditional branching.

# Syntax:
# slt $rd, $rs, $rt

# Example 1 : Simple If Statement
# If a == b -> return c = 1 
# else -> return c = 0

.data 
a: .word 2
b: .word 5
c: .word 0

.text 
# main:
	# lw $s0, a # load a into $s0
	# lw $s1, b # load b into $s1

	# beq $s0, $s1, equal # if a == b -> jump to "equal"

	# li $s2, 0 # if a != b -> load 0 into $s0
	# sw $s2, c 

	# j end # jump to end

	# equal :
		# li $s2, 1 # load 0 into $s2
		# sw $s2, c 

	# end:
		# li $v0, 10 
		# syscall 
# ------------------------------------------------

# Example 2 : If-Else 
# if a < b -> return c = 1
# else -> return c = 0

main:
	lw $s0, a # load a into $s0
	lw $s1, b # load b into $s1
	
	slt $s2, $s0, $s1 # if a = b -> $s2 = 1 , else $s2 = 0
	bne $s2, $zero, less # if $s2 != 0 --> (a < b) is true, then go to branch "less"
	
	li $s2, 0 # Else -> set c = 0
	sw $s2, c
	j end
	
	less :
		li $s3, 1 # set c = 1
		sw $s3, c
		
	end:
		# Exit Program
		li $v0, 10
		syscall 