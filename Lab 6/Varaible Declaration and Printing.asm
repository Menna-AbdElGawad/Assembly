# Declaring Variables
# ====================

# Vairable_name: .datatype value

# 1. Integer Declaration
.data 
num1 : .word 10 # A 4-byte integer initialized to 10
num2 : .word 20 # A 4-byte integer initialized to 20

# 2. String Declaration
greeting: .asciiz "Hello, MIPS!" # Null-terminated string

# 3. Single Character
char: .byte 'M' ## A single byte initialized to ASCII value of 'M'


# ===================================

# To Print we use (syscalls)
# ==========================
# We use $v0 to load immediatly in it Syscalls Code of Operation we want to print
# as ($v0, $v1) are function return values.

# & we use $a0 to load value we want to print it in it as
# ($a0 -> $a3) are Function arguments.

.text  
li $v0, 4 # Syscalls Code to pring string
la $a0, greeting # Load address of the string into $a0
syscall 

li $v1, 1 # Syscalls Code to pring integer
lw $a1, num1 # lw: Load word from "num1" into register $a1
syscall 