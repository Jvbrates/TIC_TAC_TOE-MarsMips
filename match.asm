# This code is a constituent part of work 1 of the Computer Organization Discipline [ELC1011]
#
# https://github.com/Jvbrates/TIC_TAC_TOE-MarsMips/
# This program is free software under GNU GPL V3 or later version
# see http://www.gnu.org/licences
# Autor: João Vitor Belmonte Rates(Jvbrates) - UFSM - CT
# e-mail: jvrates%inf.ufsm.br
#
# 1/10
# Prologue:
# This file-code will initialize and management the match

# IsCaller? Yes
# IsCallee? Yes
# ChangeRegisters? Yes
# ManipulateStack? Yes
# ManipulateHeap? No
# ManipulateDataSegment? Yes

# stack map:
# $sp+12: $ra
# $sp+8: matrix
# $sp+4: $a1
# $sp: $a0


# registers map:
# $a0: matrix address
# $ra: 


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
jal eraseMatrix


# From here, use $s0 as user option
# $a0 -- matrix address
# $s0 -- round, player or machine

loop:
beqz $s0, player_move

machine_move:

jal minimax

j ver_end

player_move:

jal input_move_pl

# the next function need the paramns:
# $a0 -- matrix address
# already setted
# $a1 -- round
add $a1, $zero, $s0
# $a2 -- input address
add $a2, $zero, $v0
# case in the future I need use $a1 or $a2 before this function I will need push they in the stack before call this function
jal update_matrix


ver_end:
jal end_match
seq $s0, $s0, 0

jal print

bnez $v0, loop

exit:

#recovery from stack
lw $a0, ($sp)
lw $a1, 4($sp)
lw $ra, 12($sp)
add $sp, $sp, 16 # erase stack
jr $ra #return to caller
