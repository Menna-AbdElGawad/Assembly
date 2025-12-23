.data

arr:  .word 10, 20, 30, 40, 50, 60   # Array of integers
size: .word 6                       # Number of elements in the array

.text

li $t0, 20          # Offset of last element = (size-1) * 4 = 5 * 4 = 20 bytes
la $t1, arr         # $t1 points to the first element of the array

add $t0, $t0, $t1   # $t0 = base address + offset → points to last element

loop:
bge $t1, $t0, end  # If start pointer >= end pointer, stop looping

lw $t2, 0($t0)     # Load value at end pointer
lw $t3, 0($t1)     # Load value at start pointer

sw $t3, 0($t0)     # Store start value at end position
sw $t2, 0($t1)     # Store end value at start position (swap)

addi $t1, $t1, 4   # Move start pointer to next element
addi $t0, $t0, -4  # Move end pointer to previous element

j loop              # Repeat the loop

end:
li $v0, 10          # Exit program
syscall
