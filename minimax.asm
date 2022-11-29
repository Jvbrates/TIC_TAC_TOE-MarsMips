#Map Param:
# $a0 -- the matrix address
# $a1 -- Who is playing | 
#Map Return:
# $v0 -- The postion changed

.text

.globl minimax2
minimax2:

# --------------
jal stack_push
addi $sp, $sp, -4
sw $ra, ($sp)


# --------------
lw $t0, ($a0)
beqz $t0, first_move 

# --------------

# --------------

j end

first_move:
li $v0, 4

end:
# --------------
lw $ra ($sp)
addi $sp, $sp, 4
jal stack_pop
# --------------

jr $ra
