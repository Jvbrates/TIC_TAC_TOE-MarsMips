# Este código é parte constituinte do trabalho 1 da Disciplina Organização de   |
#Computadores [ELC1011]							       |
# This program is free software under GNU GPL V3 or later version              |
# see http://www.gnu.org/licences                                              |
#
# Autor: João Vitor Belmonte Rates(Jvbrates) - UFSM - CT
# e-mail: jvrates%inf.ufsm.br
# This code keep the user keypress [e]xit or [n]ew match
# case [e] set $v0 := 0
# case [n] set $v0 := 1
# other case, keep again the keypress

#this use the syscall 12 - read character

#234567891234567890123456789012345678901234567890123456789012345678901234567890

.globl menu_exit

menu_exit:
li $v0 12

loop:
syscall

beq $v0, 101, exit_op
beq $v0, 101, new_match_op

j loop


#Opção de Saída
exit_op:
li $v0, 0
jr $ra

#Opção nova partida
new_match_op:
li $v0, 1
jr $ra
