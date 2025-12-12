# 1. Add -> add dest, first reg, second reg
# =========================================

.data
num1: .word 1
num2: .word 2

.text 
# Load values into registers
lw $s1, num1 # $s1: 1
lw $s2, num2 # $s2: 2

add $s3, $s1, $s2 # $s3 = $s1 + $s2 = 1 + 2 = 3

# =============================================================================

# 2. Subtract -> sub dest, first reg, second reg
# ================================================

sub $s4, $s2, $s1 # $s4 = $s2 - $s1 = 2 - 1 = 1

# =============================================================================

# 3. Multiplying
# ==============

# 3.1 mul: Performs a multiplication and stores the result in a single destination register.
# ------------------------------------------------------------------------------------------

mul $s5, $s1, $s2 # $s5 =  $s1 * $s2 = 1 * 2 = 2

# 3.2 mult: Performs a multiplication but stores the result in two special registers: HI (most significant 32 bits) 
# and LO (least significant 32 bits).
# -----------------------------------------------------------------------------------------------------------------

mult $s1, $s2
# Retrieve the 32-bit results
mflo $t0 # Lower 32 bits (LO) -> 2
mfhi $t1 # Upper 32 bits (HI) -> 0

# =============================================================================

# 4. sll (Shift Left Logical) -> is often used for multiplication by powers of 2.
# ==============================================================================

# Syntax:  sll $rd, $rt, x
# $rd -> destination
# $rt -> Source Register
# x -> number of positions to shift (multiplying by 2^x ).

sll $t2, $s2, 2

# =============================================================================
# 5. Dividing Integers
# ====================

# 5.1 div (Signed division)
# -------------------------

# divides two integers and produces a 64-bit 
# result. 

# The quotient is stored in the LO register, and
# the remainder is stored in the HI register
# Syntax: div $rs, $rt

div $s2, $s1
mflo $t0
mfhi $t1

# 5.2 divu (Unsigned division)
# -----------------------------

#  This is the unsigned division variant. The result is still stored in the LO register for the quotient and the 
# HI register for the remainder.
divu $s2, $s1
mflo $t2
mfhi $t3
