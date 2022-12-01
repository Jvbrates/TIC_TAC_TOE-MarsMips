#This code is a constituent part of work 1 of the Computer Organization Discipline [ELC1011]
# Revised?Yes, tested isolated
# https://github.com/Jvbrates/TIC_TAC_TOE-MarsMips/
# This program is free software under GNU GPL V3 or later version
# see http://www.gnu.org/licences
# Autor: João Vitor Belmonte Rates(Jvbrates) - UFSM - CT
# e-mail: jvrates%inf.ufsm.br
#
# 8/10
# Prologue:
# This function just print the matrix

#IsCaller? No
#IsCallee? Yes
#ChangeRegisters? Yes
#ManipulateStack? Yes
#ManipulateHeap? No
#ManipulateDataSegment? Yes

# Map Parameters:
# $a0 -- Matrix address

#Map Registers
# $t0 -- player Matrix
# $t1 -- machine Matrix
# $t3 -- comparative
# $t7 -- contador
.text 
.globl print
print:
#set syscall print
li $v0, 4
#lw $a0, ($sp)
#save $a

addi $sp, $sp, -4
sw $a0, ($sp) # tests 

#Carregando matrix de Jogador 
lw $t0, ($a0)
andi $t0, $t0, 0x1FF

#Carregando matrix de maquina 
lw $t1, ($a0)
srl $t1, $t1, 9
andi $t1, $t1, 0x1FF

li $t7, 0 #Contador

print_:

beq $t7, 9, end #Fim for loop
beq $t7, 3, newLine_
beq $t7, 6, newLine_

j no_newLine
#New line
newLine_:
la $a0, newline
syscall

no_newLine:
andi $t3, $t0, 1
beqz $t3, machine_
# player print
la $a0, player
syscall
j sum_count

machine_:
andi $t3, $t1, 1
beqz $t3, space
# machine print
la $a0, machine
syscall
j sum_count

space:
la $a0, backspace
syscall

sum_count:
addi $t7, $t7, 1
srl $t0, $t0, 1
srl $t1, $t1, 1
j print_

end:

#new line
la $a0, newline
syscall

#restore $a
lw $a0, ($sp)
addi $sp, $sp, 4

jr $ra

.globl player, machine, backspace, newline, colon
.data
player: .asciiz "|X|"
machine: .asciiz "|O|"
backspace: .asciiz "| |"
newline: .asciiz "\n"
colon: .asciiz ":"
