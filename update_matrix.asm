# This code is a constituent part of work 1 of the Computer Organization Discipline [ELC1011]
#
# https://github.com/Jvbrates/TIC_TAC_TOE-MarsMips/
# This program is free software under GNU GPL V3 or later version
# see http://www.gnu.org/licences
# Autor: João Vitor Belmonte Rates(Jvbrates) - UFSM - CT
# e-mail: jvrates%inf.ufsm.br
#
# 9/14
# Prólogo:
# Está função insere a opção do usuário|máquina na matriz
# Prologue:
# This function insert the option from machine|player in the matrix

#IsCaller? No
#IsCallee? Yes
#ChangeRegisters? No
#ManipulateStack? Yes
#ManipulateDataSegment? No

# Map Parameters:
# $a0 -- Matrix address
# $a1 -- round
# $a2 -- input address matrix
# none return

#*******************************************************************************
#        1         2         3         4         5         6         7         8
#2345678901234567890123456789012345678901234567890123456789012345678901234567890

.text
.globl update_matrix
update_matrix:

lw $t0, ($a0)
           #         |Machine |Player
           #          876543210876543210
li $t1,  1 #0000000000000000000000000001

bnez $a1, machine_insert

player_insert:
j insert


machine_insert:
          #         |Machine |Player
          #          876543210876543210
          #0000000000000000001000000000
sll $t1, $t1, 9

insert:
sllv $t1, $t1, $a2

          #0000000000000000001000000000
          #xxxxxxxxxxxxxxxxxxxxxxxxxxxx
          #xxxxxxxxxxxxxxxxxx1xxxxxxxxx
or $t0, $t0, $t1

sw $t0, ($a0)

jr $ra #<< possivel erro
