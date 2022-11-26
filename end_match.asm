#This code is a constituent part of work 1 of the Computer Organization Discipline [ELC1011]
#
# https://github.com/Jvbrates/TIC_TAC_TOE-MarsMips/
# This program is free software under GNU GPL V3 or later version
# see http://www.gnu.org/licences
# Autor: João Vitor Belmonte Rates(Jvbrates) - UFSM - CT
# e-mail: jvrates%inf.ufsm.br
#
# 6/10
# Prologue:
# this file-code get the player input and verfify if is aceptable

#IsCaller? No
#IsCallee? Yes
#ChangeRegisters? Yes
#ManipulateStack? No
#ManipulateHeap? No
#ManipulateDataSegment? No


# Prologue:
#this code verify the end of match
#case true return 1 in $v0 and the code of end in $v1 

# Map Parameters:
# $a0 -- Matrix address
# $a1 -- round
# 0 - Player
# 1 - Máquina
#
#Map return $v1
# 0 <= Player Ganhou
# 1 <= Maquina Ganhou
# 2 <= Empate Ganhou


#234567891234567890123456789012345678901234567890123456789012345678901234567890
.text
.globl end_match
end_match:

li $v0, 0
#Carregando matrix de Jogador 
lw $t0, ($a0)
andi $t0, $t0, 0x1FF

#Carregando matrix de maquina 
lw $t1, ($a0)
srl $t1, $t1, 8
andi $t1, $t1, 0x1FF

#Merge duas matrizes
or  $t2, $t1, $t0
andi $t2, $t2, 0x1FF

#Tie:
li $v1, 2
beq $t2, 0x1FF, end

#Player
li $v1, 0
move $t3, $t0


verif:
beq $t3, 0x7, end   # Linha 0
beq $t3, 0x38, end  # Linha 1
beq $t3, 0x1C0, end # Linha 2

beq $t3, 0x49, end  # Coluna 0
beq $t3, 0x92, end  # Coluna 1
beq $t3, 0x124, end # Coluna 2

beq $t3, 0x111, end # Diagonal Principal 
beq $t3, 0x54, end # Diagonal Secundária

#Nenhum Fim
beq $v1, 1, exit
#Machine
move $t3, $t1
li $v1, 1
j verif

end:
li $v0, 1
exit:
jr $ra





