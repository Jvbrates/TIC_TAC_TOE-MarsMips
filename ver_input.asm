# This code is a constituent part of work 1 of the Computer Organization Discipline [ELC1011]
#
# https://github.com/Jvbrates/TIC_TAC_TOE-MarsMips/
# This program is free software under GNU GPL V3 or later version
# see http://www.gnu.org/licences
# Autor: João Vitor Belmonte Rates(Jvbrates) - UFSM - CT
# e-mail: jvrates%inf.ufsm.br
#
# 8/14
# Próologo:
# Esta função válida a entrada do usuário
# Prologue:
# This function validate the input from user

#IsCaller? No
#IsCallee? Yes
#ChangeRegisters? Yes
#ManipulateStack? No
#ManipulateDataSegment? No

#*******************************************************************************
#        1         2         3         4         5         6         7         8
#2345678901234567890123456789012345678901234567890123456789012345678901234567890


.text
.globl ver_input
ver_input:


move $t6, $a0

lw $a0, ($t6)

andi $t0, $a0, 0x03FFFF #Erase any memory trash or error possible

srlv $t0, $t0, $a1 

andi $t0, $t0, 0x0201

seq $v0, $t0, 0

move $a0, $t6
jr $ra
