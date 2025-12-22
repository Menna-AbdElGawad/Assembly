# Fibonacci Program - Iterative (F(0)=0, F(1)=1)
# ==============================================

.data
prompt: .asciiz "Enter a number: "
result_msg: .asciiz "Fibonacci is: "

.text
.global main

main:
    # ----------------------------
    # Print prompt
    # ----------------------------
    li $v0, 4
    la $a0, prompt
    syscall

    # ----------------------------
    # Read integer n
    # ----------------------------
    li $v0, 5
    syscall
    move $a0, $v0    # n → $a0

    # ----------------------------
    # Call fibonacci function
    # ----------------------------
    jal fibonacci
    move $t0, $v0    # حفظ الناتج قبل أي syscall

    # ----------------------------
    # Print "Fibonacci is: "
    # ----------------------------
    li $v0, 4
    la $a0, result_msg
    syscall

    # ----------------------------
    # Print fibonacci number
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
# Function: fibonacci
# Input : $a0 = n
# Output: $v0 = F(n)
# ----------------------------
fibonacci:
    blez $a0, fib_zero     # if n <= 0, return 0
    li $v0, 1
    li $t1, 0              # prev = F(0)
    li $t2, 1              # counter i = 1

fib_loop:
    beq $t2, $a0, fib_done  # if i == n, done
    add $t3, $v0, $t1       # next = prev + curr
    move $t1, $v0           # prev = curr
    move $v0, $t3           # curr = next
    addi $t2, $t2, 1        # i++
    j fib_loop

fib_done:
    jr $ra

fib_zero:
    li $v0, 0
    jr $ra
