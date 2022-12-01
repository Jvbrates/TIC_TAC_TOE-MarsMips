# This code is a constituent part of work 1 of the Computer Organization Discipline [ELC1011]
#
# https://github.com/Jvbrates/TIC_TAC_TOE-MarsMips/
# This program is free software under GNU GPL V3 or later version
# see http://www.gnu.org/licences
# Autor: João Vitor Belmonte Rates(Jvbrates) - UFSM - CT
# e-mail: jvrates%inf.ufsm.br
#
# 3/10
# Prologue:
# this file-code set the initial matrix value

#IsCaller? Yes
#IsCallee? Yes
#ChangeRegisters? Yes
#ManipulateStack? No
#ManipulateHeap? No
#ManipulateDataSegment? No


# Prologue:
# This code get the player input and return the address (in matrix) to put int the matrix


.text

.globl input_move_pl
input_move_pl:

#store on stack
addi $sp, $sp, -12 # allocate space
sw $ra, 8($sp) # store $a0 in 8($sp)
sw $a0, 4($sp) # store $a0 in 4($sp)
sw $a1, ($sp) # store $a1 in ($sp)

loop:
li $v0, 12
syscall


# Verify the key press ascii code, 0x30 < [ 1, 2, 3, ,4 ,5, 6, 7, 8] < 0x39
bgt, $v0, 0x29, upper_1 ## Verifica se a entradar maior que 59
j loop

upper_1:
blt $v0, 0x39, ok 
j loop

ok:
addi $a1, $v0, -0x30 # 1|2|3|4|5|6|7|8 in $a1
#this function get the input address in the matrix and verify it, return 1 for acceptable value and 0 for not (used position)
jal ver_input

beqz $v0, loop

li $t7, 1
#sllv $t7, $t7, $a1
#lw $t6, ($a0)
#or $t6, $t6, $t7
#sw $t6, ($a0)

add $v0, $zero, $a1 #Retornará a posição escolhida a ser adicionada

#restore from stack
lw $ra, 8($sp)
lw $a0, 4($sp)
lw $a1, ($sp)
addi $sp, $sp, 12

jr $ra
