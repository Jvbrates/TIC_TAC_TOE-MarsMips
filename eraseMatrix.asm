# This code is a constituent part of work 1 of the Computer Organization Discipline [ELC1011]
#
# https://github.com/Jvbrates/TIC_TAC_TOE-MarsMips/
# This program is free software under GNU GPL V3 or later version
# see http://www.gnu.org/licences
# Autor: João Vitor Belmonte Rates(Jvbrates) - UFSM - CT
# e-mail: jvrates%inf.ufsm.br
#
# 2/10
# Prologue:
# this file-code set the initial matrix value

#IsCaller? No
#IsCallee? Yes
#ChangeRegisters? No
#ManipulateStack? No
#ManipulateHeap? No
#ManipulateDataSegment? Yes

#stack map:
# $a0: matrixaddress

.globl eraseMatrix
eraseMatrix:

#la $a0, ($sp) #for tests

li $t0, 0x00000000 

sw $t0, ($a0)

#print Erase Matrix

jr  $ra


