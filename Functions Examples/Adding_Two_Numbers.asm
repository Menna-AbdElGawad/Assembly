.text

.global main # we say to it the program will start from "main"

main:

li $a0, 5 # put first input in $a0 
li $a1, 3 # put second input in $a0 

# jal -> Jump to add_function Function and save the return address in $ra
jal add_function # call the function

# after calling

move $a0, $v0 # result will be stored in $v0, we will move it to $a0

# print the result

li $v0, 1 # syscall code for printing integer
syscall 

j end # jump to end

add_function:
# add 2 numbers and save the result in $v0
add $v0, $a0, $a1 # any function must return value in $v0 register

jr $ra # return to caller 

end:
li $v0, 10 # syscall code to exit
syscall