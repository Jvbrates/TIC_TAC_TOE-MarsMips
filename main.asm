# This code is a constituent part of work 1 of the Computer Organization Discipline [ELC1011]
# https://github.com/Jvbrates/TIC_TAC_TOE-MarsMips/
# This program is free software under GNU GPL V3 or later version
# see http://www.gnu.org/licences
#
# Autor: João Vitor Belmonte Rates(Jvbrates) - UFSM - CT
# e-mail: jvrates%inf.ufsm.br

# 0/14
# Prólogo:
# Este arquivo contèm a main(função raiz) do projeto
# Prologue:
# This code is the main of project

#IsCaller? Yes
#IsCallee? No
#ChangeRegisters? Yes
#ManipulateStack? No
#ManipulateHeap? No
#ManipulateDataSegment? Yes | Allocate 3 bytes for SCORE

#*******************************************************************************
#        1         2         3         4         5         6         7         8
#2345678901234567890123456789012345678901234567890123456789012345678901234567890


.text

.globl main
main:


#Selecionando os aleatoriamente o primeiro jogador
li $v0, 42
li $a1, 2
syscall
# li $a0, 1 #for tests

move $s0, $a0
# 0 - Player
# 1 - Máquina

loop_match:

#Inverte a seleção do primeiro jogador
seq $a0, $a0, 0 #if $a0 == 0 : $a0 := 1


# Execução da partida
# Recebe em $a0 a matriz usada
jal match
# Retornará em $v1 o resultado da partida:
# 0 <= Player Ganhou
# 1 <= Maquina Ganhou
# 2 <= Empate Ganhou


move $a0, $v1
jal update_score # Atualiza o placar, recebe o código de quem ganhou em $a0
jal print_score  # Escreve na saída a pontiação


jal menu_exit # Menu [(n)ew Match | (e)xit]
bnez $v0, loop_match #Caso a escolha seja 0 o programa encerrará,
# caso não, nova partida

#Finalizando | Ending
li $t0, 1
li $v0, 17
li $a0, 0

syscall

.data
.globl placar
.align 0
placar: .space 12
#placar 0 is user
#placar 4 is machine
#placar 8 is tied
