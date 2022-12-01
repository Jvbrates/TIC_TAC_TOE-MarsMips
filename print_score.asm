.text
.globl print_score
print_score:
#---------------------
addi $sp, $sp, -4
sw $ra, ($sp)
jal stack_push
#---------------------

la $t0, placar

#X
li $v0, 4
la $a0, player
syscall # |X|
la $a0, colon
syscall # :
li $v0, 1
lw $a0, ($t0)
syscall # n
li $v0, 4
la $a0, newline
syscall # \n

#O
li $v0, 4
la $a0, machine
syscall # |O|
la $a0, colon
syscall # :
li $v0, 1
lw $a0, 4($t0)
syscall # n
li $v0, 4
la $a0, newline
syscall # \n


#Tie
li $v0, 4
la $a0, backspace
syscall # | |
la $a0, colon
syscall # :
li $v0, 1
lw $a0, 8($t0)
syscall # n
li $v0, 4
la $a0, newline
syscall # \n




#---------------------
jal stack_pop
lw $ra, ($sp)
addi $sp, $sp, 4
#---------------------

jr $ra  # << ERRO