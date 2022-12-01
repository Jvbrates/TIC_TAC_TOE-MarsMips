

#Make the header
# a0 -- address matrix complete

#Register Maps
# $s0 -- Matrix complete
# $s1 -- Matrix merged
# $s2 -- score
# $s3 -- contador


.text
.globl minimax_min
minimax_min:

# --------------
addi $sp, $sp, -4
sw $ra, ($sp)
jal stack_push
# --------------

jal end_match

beqz $v0, fork

beq $v1, 2, empate
beq $v1, 1, win

lose:
li $v0, -1
j exit

empate:
li $v0, 0
j exit

win:
li $v0, 1
j exit

# --------------
fork:
 lw $s0, ($a0)
 lw $s1, ($a0)
 
 srl $s1, $s1, 9
 or $s1, $s1, $s0
 
 li $s2, 3
 li $s3, 0
# --------------

loop:
beq $s3, 9, exit 
andi $t0, $s1, 0x01
bnez $t0, continue

li $t2, 0x01
sllv $t2, $t2, $s3
or $t2, $t2, $s0
addi $sp, $sp, -4
sw $t2, ($sp)
la $a0, ($sp)
jal minimax_max
addi $sp, $sp, 4

blt $s2, $v0, continue
move $s2, $v0 


continue:
srl $s1, $s1, 1
addi $s3, $s3, 1
j loop
# --------------
exit:
move $v0, $s2
# --------------
jal stack_pop
lw $ra ($sp)
addi $sp, $sp, 4
# --------------

jr $ra
