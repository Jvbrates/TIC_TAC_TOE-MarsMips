# This code is a constituent part of work 1 of the Computer Organization Discipline [ELC1011]
# https://github.com/Jvbrates/TIC_TAC_TOE-MarsMips/
# This program is free software under GNU GPL V3 or later version
# see http://www.gnu.org/licences
#
# Autor: João Vitor Belmonte Rates(Jvbrates) - UFSM - CT
# e-mail: jvrates%inf.ufsm.br

# 11/14
# Prólogo:
# Este arquivo recebe em $a0 o estado em que terminou a partida e atualiza o placar

#IsCaller? No
#IsCallee? Yes
#ChangeRegisters? Yes
#ManipulateStack? No

#*******************************************************************************
#        1         2         3         4         5         6         7         8
#2345678901234567890123456789012345678901234567890123456789012345678901234567890

.globl update_score

update_score:

la $t0, placar

beq $a0, 0, player
beq $a0, 1, machine
beq $a0, 2, tie

jr $ra


player:
lw  $t1, ($t0)     ## Carregando o placar atual do player
addi $t1, $t1, 1 ## Somando:  placar+1
sw $t1, ($t0)      ## Salvando o novo valor no placar
jr $ra		 ## Saindo


machine:
lw  $t1, 4($t0)
addi $t1, $t1, 1
sw $t1, 4($t0)
jr $ra


tie:
lw  $t1, 8($t0)
addi $t1, $t1, 1
sw $t1, 8($t0)
jr $ra
