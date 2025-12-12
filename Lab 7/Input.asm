# Getting Input from user
# =======================

# 1. To read an integer from the user:
# ====================================
# 1) Load the syscall code 5 into $v0.
# 2) Use syscall.
# 3) The integer input will be stored in $v0

.data
input: .word 0
buffer: .space 50
prompt: .asciiz "Enter a string:"

.text 
li $v0, 5 # Syscall code for reading an integer    
syscall   # Perform the syscall 
sw $v0, input  # Store the input in memory  

# 2. To read an string from the user:
# ====================================
# 1) Load the syscall code 8 into $v0.
# 2) Use $a0 to provide the buffer address and $a1 for the maximum input length.
# 3) Use syscall
# 4) The string will be stored in the buffer

# Print the prompt   
li $v0, 4       # Syscall code for print_string               
la $a0, prompt  # Load the address of the prompt      
syscall         # Perform the syscall            
    
# Get the string input    
li $v0, 8       # Syscall code for reading a string   
la $a0, buffer  # Load the address of the first byte of the buffer

# Note: buffer will be stored in data section and we reserved 50 byte in the data section for the buffer
# so, the string entered from user will be stored in these 50 bytes
# and $a0 will store the address of the first byte this string stored in from the 50 bytes.
        
li $a1, 50      # Set the maximum length of the input  

# Note: $a1 we load to it the maximum length, but it will store the maximum length of the string entered by user

syscall         # Perform the syscall            