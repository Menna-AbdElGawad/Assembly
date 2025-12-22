.data
# Integer input
input: .word 0

# Float input
input_float: .float 0.0

# String input
buffer: .space 50
prompt: .asciiz "Enter a string: "

.text
################################
# Read Integer
################################
li $v0, 5          # syscall 5: read integer
syscall            # value stored in $v0

sw $v0, input      # save integer in memory

# Print integer (from register)
move $a0, $v0
li $v0, 1          # syscall 1: print integer
syscall

################################
# Read Float
################################
li $v0, 6          # syscall 6: read float
syscall            # value stored in $f0

swc1 $f0, input_float  # save float in memory

################################
# Read String
################################
# Print prompt
li $v0, 4          # syscall 4: print string
la $a0, prompt
syscall

# Read string
li $v0, 8          # syscall 8: read string
la $a0, buffer     # buffer address
li $a1, 50         # max length
syscall
