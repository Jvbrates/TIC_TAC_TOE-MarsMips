# This code is a constituent part of work 1 of the Computer Organization Discipline [ELC1011]
#
# https://github.com/Jvbrates/TIC_TAC_TOE-MarsMips/
# This program is free software under GNU GPL V3 or later version
# see http://www.gnu.org/licences
# Autor: João Vitor Belmonte Rates(Jvbrates) - UFSM - CT
# e-mail: jvrates%inf.ufsm.br
#
# 11/11
# Prologue:
# This file-code contain functions to store and restore the registers values on stack
# no store de $ra

# IsCaller? No
# IsCallee? Yes
# ChangeRegisters? Yes
# ManipulateStack? Yes
# ManipulateHeap? No
# ManipulateDataSegment? No

.text
.globl stack_push
stack_push:
addi $sp, $sp, -48
sw $s7, 44($sp)
sw $s6, 40($sp)
sw $s5, 36($sp)
sw $s4, 32($sp)
sw $s3, 28($sp)
sw $s2, 24($sp)
sw $s1, 20($sp)
sw $s0, 16($sp)

sw $a3, 12($sp)
sw $a2, 8($sp)
sw $a1, 4($sp)
sw $a0, ($sp)

jr $ra


#restaura os registradores da stack
.globl stack_pop
stack_pop:
lw $s7, 44($sp)
lw $s6, 40($sp)
lw $s5, 36($sp)
lw $s4, 32($sp)
lw $s3, 28($sp)
lw $s2, 24($sp)
lw $s1, 20($sp)
lw $s0, 16($sp)

lw $a3, 12($sp)
lw $a2, 8($sp)
lw $a1, 4($sp)
lw $a0, ($sp)

addi $sp, $sp, 48
jr $ra