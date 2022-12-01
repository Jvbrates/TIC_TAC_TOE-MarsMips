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