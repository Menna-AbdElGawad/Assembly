.data
sum: .word 0
i: .word 1

.text
.global main

main:
li $a0, 4        # n = 4
lw $a1, sum      # sum = 0
lw $a2, i        # i = 1

jal sum_n

move $a0, $v0
li $v0, 1
syscall

j end

# -------------------------
# Function: sum_n
# -------------------------
sum_n:
loop_start:
bgt $a2, $a0, loop_end   # if i > n → exit loop

add $a1, $a1, $a2        # sum += i
addi $a2, $a2, 1         # i++

j loop_start         

loop_end:
move $v0, $a1             # return sum
jr $ra

end:
li $v0, 10
syscall
