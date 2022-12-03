# This code is a constituent part of work 1 of the Computer Organization Discipline [ELC1011]
# https://github.com/Jvbrates/TIC_TAC_TOE-MarsMips/
# This program is free software under GNU GPL V3 or later version
# see http://www.gnu.org/licences
#
# Autor: João Vitor Belmonte Rates(Jvbrates) - UFSM - CT
# e-mail: jvrates%inf.ufsm.br

# 13/14
# Prólogo:
# Este arquivo recebe uma entrada do usuário indicando se quer jogar novamente
# ou finalizar o programa

#IsCaller? No
#IsCallee? Yes
#ChangeRegisters? Yes
#ManipulateStack? Yes
#ManipulateHeap? No

#*******************************************************************************
#        1         2         3         4         5         6         7         8
#2345678901234567890123456789012345678901234567890123456789012345678901234567890

.text
.globl menu_exit
menu_exit:
# 0 -- exit
# 1 -- again
#---------------------
addi $sp, $sp, -4
sw $ra, ($sp)
jal stack_push
#---------------------
li $v0, 4
la $a0, msg
syscall


loop:

li $v0, 12
syscall

ori $v0, $v0, 0x20

beq $v0, 0x65, exit
beq $v0, 0x6E, again

j loop

exit:
li $v0, 0 
j end,

again:
li $v0, 1
end:
#---------------------
jal stack_pop
lw $ra, ($sp)
addi $sp, $sp, 4
#---------------------

jr $ra
.data
msg: .asciiz "Menu [(n)ew Match | (e)xit]:\n"
