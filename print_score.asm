# This code is a constituent part of work 1 of the Computer Organization Discipline [ELC1011]
# https://github.com/Jvbrates/TIC_TAC_TOE-MarsMips/
# This program is free software under GNU GPL V3 or later version
# see http://www.gnu.org/licences
#
# Autor: João Vitor Belmonte Rates(Jvbrates) - UFSM - CT
# e-mail: jvrates%inf.ufsm.br

# 12/14
# Prólogo:
# Este arquivo imprime a pontuação na saída


#IsCaller? Yes
#IsCallee? No
#ChangeRegisters? Yes
#ManipulateStack? No
#ManipulateHeap? No

#*******************************************************************************
#        1         2         3         4         5         6         7         8
#2345678901234567890123456789012345678901234567890123456789012345678901234567890

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
