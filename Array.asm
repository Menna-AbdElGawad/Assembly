.data
arr: .word 10, 20, 30, 40, 50
size: .word 5
newline: .asciiz "\n"

.text 
main:
	
	# Step 1: Load the base address of the array and the size
	la $t0, arr   # load base address of array into $t0
	lw $t1, size  # load size into $t1
	li $t2, 0     # loop counter i = 0
	
	loop_start:
		# Step 2: Check if index i >= size  
		bge $t2, $t1, loop_end # if i >= size , end loop
		
		# Step 3: Access arr[i]    
		sll $t3, $t2, 2 # offset = i * 4 (word -> 4 byte)
		add $t4, $t0, $t3 # address = base + offset
		lw $a0, 0($t4) # load arr[i] into $a0 to print
		
		# Step 4: Print the current array element    
		li $v0, 1
		syscall
		
		# Print a newline for formatting    
		la $a0, newline
		li $v0, 4
		syscall
		
		# Step 5: Increment index i and repeat   
		addi $t2, $t2, 1		
		j loop_start
		
	loop_end:
		# Step 6: Exit the program   
		li $v0, 10
		syscall