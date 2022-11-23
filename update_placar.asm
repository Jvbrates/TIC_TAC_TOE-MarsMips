#Este código é parte constituinte do trabalho 1 da Disciplina Organização de 
# Computadores [ELC1011]
#
# This program is free software under GNU GPL V3 or later version
# see http://www.gnu.org/licences
#
# Autor: João Vitor Belmonte Rates(Jvbrates) - UFSM - CT
# e-mail: jvrates%inf.ufsm.br
# This file-code get a value $a0 corresponding to a placar update and update de
#value in placar(score) memory space
# 0 <= Player Ganhou
# 1 <= Maquina Ganhou
# 2 <= Empate Ganhou
# placar addressing
#placar 0 is user
#placar 4 is machine
#placar 8 is tied
#234567891234567890123456789012345678901234567890123456789012345678901234567890

.globl update_score

update_score:

la $t0, placar

beq $a0, 0, player
beq $a0, 1, machine
beq $a0, 2, tie

jr $ra


player:
lw  $t1, ($t0)     ## Carregando o placar atual do player
addi $t0, $t0, 1 ## Somando:  placar+1
sw $t1, ($t0)      ## Salvando o novo valor no placar
jr $ra		 ## Saindo


machine:
lw  $t1, 4($t0)
addi $t0, $t0, 1
sw $t1, 4($t0)
jr $ra


tie:
lw  $t1, 8($t0)
addi $t0, $t0, 1
sw $t1, 8($t0)
jr $ra