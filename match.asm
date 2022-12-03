# This code is a constituent part of work 1 of the Computer Organization Discipline [ELC1011]
# https://github.com/Jvbrates/TIC_TAC_TOE-MarsMips/
# This program is free software under GNU GPL V3 or later version
# see http://www.gnu.org/licences

# Autor: João Vitor Belmonte Rates(Jvbrates) - UFSM - CT
# e-mail: jvrates%inf.ufsm.br
#
# 1/14
# Prologue:
# Este arquivo contem a função que administra uma partoda até que termine
# e então retorna o resultado
# Prologue:
# This file-code will initialize and management the match

# IsCaller? Yes
# IsCallee? Yes
# ChangeRegisters? Yes
# ManipulateStack? Yes
# ManipulateDataSegment? Yes


#*******************************************************************************
#        1         2         3         4         5         6         7         8
#2345678901234567890123456789012345678901234567890123456789012345678901234567890

.text

.globl match
match:

#stack allocate
add $sp, $sp, -16


sw $a0, ($sp) #store $a0 in the stack
sw $a1, 4($sp) #store $a0 in the stack
sw $ra, 12($sp)#store $ra in the stack

#Set matrix erase (with back space only)
#for this, is need send matrix addres in $a0. So will store curretly $a0  value in $s0 
add $s0, $zero, $a0
la $a0, 8($sp) 


# $a0 -- matrix address
# $s0 -- round, player or machine

jal eraseMatrix # Limpa matriz
jal print # Escrever a matriz na saída

loop:
 
beqz $s0, player_move

machine_move:

jal minimax #Movimento Máquina

j ver_end

player_move:

jal input_move_pl




ver_end:
# the next function need the paramns:
# $a0 -- matrix address
# already setted
# $a1 -- round
add $a1, $zero, $s0
# $a2 -- input address
add $a2, $zero, $v0
# case in the future I need use $a1 or $a2 before this function I will need push they in the stack before call this function

jal update_matrix #Atualiza a matriz
jal print         #Mostra ela 
jal end_match     #Verifica o fim
seq $s0, $s0, 0 # Troca de quem é a vez


beqz $v0, loop

exit:

#recovery from stack
lw $a0, ($sp)
lw $a1, 4($sp)
lw $ra, 12($sp)
add $sp, $sp, 16 # erase stack <<<<<---
jr $ra #return to caller
