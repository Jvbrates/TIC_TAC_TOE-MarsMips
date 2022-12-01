# This code is a constituent part of work 1 of the Computer Organization Discipline [ELC1011]
#
# https://github.com/Jvbrates/TIC_TAC_TOE-MarsMips/
# This program is free software under GNU GPL V3 or later version
# see http://www.gnu.org/licences
# Autor: João Vitor Belmonte Rates(Jvbrates) - UFSM - CT
# e-mail: jvrates%inf.ufsm.br
#
# 4/10
# Prologue:
# this file-code get the player input and verfify if is aceptable

#IsCaller? No
#IsCallee? Yes
#ChangeRegisters? Yes
#ManipulateStack? No
#ManipulateHeap? No
#ManipulateDataSegment? No


# Prologue:
# This code get the player input and return the address (in matrix) to put int the matrix
# 
# This code get the matrix address and the option to input and verify if it's is used
# from the caller (keep save on return):
# $a0 -- matrix address
# $s0 -- round, player or machine
# $a1 -- option inputed
# return 0 case used and 1 case no ($v0)



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
