# This code is a constituent part of work 1 of the Computer Organization Discipline [ELC1011]
#
# https://github.com/Jvbrates/TIC_TAC_TOE-MarsMips/
# This program is free software under GNU GPL V3 or later version
# see http://www.gnu.org/licences
# Autor: João Vitor Belmonte Rates(Jvbrates) - UFSM - CT
# e-mail: jvrates%inf.ufsm.br
#
# 10/14
# Prólogo:
# Está função verifica se a partida acabou, se sim retorna que ganhou ou empate
# Prologue:
# This return the state of match

#IsCaller? No
#IsCallee? Yes
#ChangeRegisters? No
#ManipulateStack? Yes
#ManipulateDataSegment? No

#Map return $v1
# 0 <= Player Ganhou
# 1 <= Maquina Ganhou
# 2 <= Empate Ganhou

#*******************************************************************************
#        1         2         3         4         5         6         7         8
#2345678901234567890123456789012345678901234567890123456789012345678901234567890


.text
.globl end_match
end_match:
#move $s0, $ra
#jal print
#move $ra, $s0
li $v0, 0
#Carregando matrix de Jogador 
lw $t0, ($a0)
andi $t0, $t0, 0x1FF

#Carregando matrix de maquina 
lw $t1, ($a0)
srl $t1, $t1, 9
andi $t1, $t1, 0x1FF

#Merge duas matrizes
or  $t2, $t1, $t0
andi $t2, $t2, 0x1FF

#Player
li $v1, 0
move $t3, $t0


verif:
andi $t4, $t3, 0x07 
beq $t4, 0x07, end   # Linha 0

andi $t4, $t3, 0x038 
beq $t4, 0x038, end  # Linha 1

andi $t4, $t3, 0x01C0 
beq $t4, 0x01C0, end # Linha 2

andi $t4, $t3, 0x049 
beq $t4, 0x049, end  # Coluna 0

andi $t4, $t3, 0x092 
beq $t4, 0x092, end  # Coluna 1

andi $t4, $t3, 0x0124 
beq $t4, 0x0124, end # Coluna 2

andi $t4, $t3, 0x0111 
beq $t4, 0x0111, end # Diagonal Principal 

andi $t4, $t3, 0x054 
beq $t4, 0x054, end # Diagonal Secundária

#Nenhum Fim --_ Ainda não Acabou
beq $v1, 1, tie

#Machine
move $t3, $t1
li $v1, 1
j verif

tie:
li $v1, 2
beq $t2, 0x1FF, end 
j exit

end:
li $v0, 1
exit:
jr $ra




