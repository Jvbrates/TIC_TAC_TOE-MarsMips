# This code is a constituent part of work 1 of the Computer Organization Discipline [ELC1011]
# https://github.com/Jvbrates/TIC_TAC_TOE-MarsMips/
# This program is free software under GNU GPL V3 or later version
# see http://www.gnu.org/licences

# Autor: João Vitor Belmonte Rates(Jvbrates) - UFSM - CT
# e-mail: jvrates%inf.ufsm.br
#
# 4/14
# Prologue:
# Este arquivo contem a parte inicial do algoritmo minimax para escolha da
# posição que a máquina deve jogar | Está implementações possuí algumas 
# diferenças em relação ao minimax original
# Prologue:
# This implement the minimax algorithm with some changes

# IsCaller? Yes
# IsCallee? Yes
# ChangeRegisters? Yes
# ManipulateStack? Yes
# ManipulateDataSegment? No

# Map Register:
# $s0 -- Copia da matriz comṕleta
# $s1 -- Merged Matrizes
# $s4 -- score from the best input
# $s5 -- position of the best input
# $s3 -- Counter


#*******************************************************************************
#        1         2         3         4         5         6         7         8
#2345678901234567890123456789012345678901234567890123456789012345678901234567890


.text

.globl minimax
minimax:

# --------------
addi $sp, $sp, -4
sw $ra, ($sp)
jal stack_push
# --------------


lw $s0, ($a0)
beqz $s0, first_move 

move $s1, $s0
srl $s1, $s1, 9

or $s1, $s1, $s0
andi $s1, $s1, 0x1FF

li $s4, -3
li $s3, 0
# --------------
#Quem sabe eu tenha provlema em usar registradores temporarios
loop:
beq $s3, 9, end 
andi $t0, $s1, 0x01
bnez $t0, continue

li $t2, 0x0200
sllv $t2, $t2, $s3
or $t2, $t2, $s0

addi $sp, $sp, -4
sw $t2, ($sp)
la $a0, ($sp)
jal minimax_min
lw $t2 ($sp)
addi $sp, $sp, 4


#----- Selecionando o máximo | Corrigir no m
bgt $s4, $v0, continue
#ble $v0, $s4 continue
move $s4, $v0
move $s5, $s3
#-----
 continue:
 srl $s1, $s1, 1
 addi $s3, $s3, 1
 j loop 

j end
# --------------

first_move:
li $s5, 4

end:
# --------------

#sw $t0, ($a0)
move $v0, $s5


# --------------
jal stack_pop
lw $ra ($sp) ## <<< ---- AQUI
addi $sp, $sp, 4 
# -------------- | Alterando Matrix 




jr $ra
