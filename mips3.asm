.data 
x: .word 5
y: .word 5
z: .word 1

.text 
lw $t0, x          # Load x into $t0
lw $t1, y          # Load y into $t1
lw $t2, z          # Load z into $t2

beq $t0, $t1, EQUAL  # Branch to EQUAL if $t0 == $t1

li $t2, 0          # If not equal, set $t2 = 0
sw $t2, z          # Store $t2 back to z
j End              # Jump to End

EQUAL:
li $t2, 1          # If equal, set $t2 = 1
sw $t2, z          # Store $t2 back to z

End:
li $v0, 10         # Exit program
syscall

