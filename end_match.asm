#E# This code is a constituent part of work 1 of the Computer Organization Discipline [ELC1011]
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
#ManipulateStack? Yes
#ManipulateHeap? No
#ManipulateDataSegment? No


# Prologue:
#this code verify the end of match
#case true return 1 in $v0 and the code of end in $v1 

# Map Parameters:
# $a0 -- Matrix address
# $a1 -- round
# none return


#234567891234567890123456789012345678901234567890123456789012345678901234567890
.text
.globl update_matrix
update_matrix:

#Verify Tie
li 

# Verify PlayerWin




