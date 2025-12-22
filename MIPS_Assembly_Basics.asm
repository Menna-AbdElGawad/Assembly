.data

greeting: .asciiz "Hello\n"
newline: .asciiz "\n"
num: .word 10
x: .word 4
y: .word 2

.text

# Print Greeting
li $v0, 4
la $a0, greeting
syscall

# --------------------------------

# Print Number
li $v0, 1
lw $a0, num
syscall

# --------------------------------

# New line
li $v0, 4
la $a0, newline
syscall

# --------------------------------

# Load x & y
lw $t1, x
lw $t2, y

# --------------------------------

# Addition
add $t3, $t1, $t2
li $v0, 1
move $a0, $t3
syscall

# --------------------------------

# New Line
li $v0, 4
la $a0, newline
syscall

# --------------------------------

# Subtraction
sub $t4, $t1, $t2
li $v0, 1
move $a0, $t4
syscall

# --------------------------------

# New Line
li $v0, 4
la $a0, newline
syscall

# --------------------------------

# Multiplication (mul)
mul $t5, $t1, $t2
li $v0, 1
move $a0, $t5
syscall

# --------------------------------

# New Line
li $v0, 4
la $a0, newline
syscall

# --------------------------------

# Multiplication (mult)
mult $t1, $t2
mflo $t0
li $v0, 1
move $a0, $t0
syscall

# --------------------------------

# New Line
li $v0, 4
la $a0, newline
syscall

# --------------------------------

# Division
div $t1, $t2
mflo $t0   # quotient
li $v0, 1
move $a0, $t0
syscall