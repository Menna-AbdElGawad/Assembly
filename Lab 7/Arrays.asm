# === Arrays in MIPS ===
# ======================

# Array Declaration:
# ------------------

# Arrays are declared in the .data section

# using directives like 
	# .word, 
	# .byte, or 
	# .float.

# Integer Array Example: 

.data
arr: .word 10, 20, 30, 40, 50    # Declare an array of integers
size: .word 5                    # Size of the array              

# Floating-Point Array Example:
.data
f_arr: .float 1.1, 2.2, 3.3, 4.4  # Declare an array of floats

# ========================================================================

# Accessing Array Elements
# -------------------------
# To access elements of an array:
# 1. Load the base address of the array into a register using the la (load address) instruction.
# 2. Use an offset to access individual elements
# 3. The offset depends on the size of the data type:
# Integers (.word): 4 bytes per element
# Bytes (.byte): 1 byte per element            
# Floats (.float): 4 bytes per element          

# Example: Access the 3rd element (index 2)
main:
	la $t0, arr         # Load base address of 'arr' into $t0
	li $t1, 2           # Index = 2
	sll $t1, $t1, 2     # Multiply index by 4 (size of .word)
	add $t2, $t0, $t1   # $t2 = address of arr[2]
	lw $t3, 0($t2)      # load arr[2] into $t3
	