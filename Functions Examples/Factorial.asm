# Factorial Program - Clean Version
# =================================

.data
prompt: .asciiz "Enter a number: "
result_msg: .asciiz "Factorial: "

.text
.global main

main:
    # ----------------------------
    # Print prompt
    # ----------------------------
    li $v0, 4          # syscall: print string
    la $a0, prompt
    syscall

    # ----------------------------
    # Read integer n
    # ----------------------------
    li $v0, 5          # syscall: read integer
    syscall
    move $a0, $v0      # n → $a0

    # ----------------------------
    # Call factorial function
    # ----------------------------
    jal factorial
    move $t0, $v0      # store result in $t0 to protect from syscalls

    # ----------------------------
    # Print "Factorial: "
    # ----------------------------
    li $v0, 4
    la $a0, result_msg
    syscall

    # ----------------------------
    # Print factorial number
    # ----------------------------
    move $a0, $t0
    li $v0, 1
    syscall

    # ----------------------------
    # Exit program
    # ----------------------------
    li $v0, 10
    syscall

# ----------------------------
# Function: factorial
# Input : $a0 = n
# Output: $v0 = n!
# ----------------------------
factorial:
    li $v0, 1       # result = 1
    li $t1, 1       # counter i = 1

fact_loop:
    bgt $t1, $a0, fact_end  # if i > n, exit loop
    mul $v0, $v0, $t1       # result *= i
    addi $t1, $t1, 1        # i++
    j fact_loop

fact_end:
    jr $ra                  # return result in $v0
