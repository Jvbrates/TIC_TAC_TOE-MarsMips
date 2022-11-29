#Map Param:  |Não tenho certeza se funciona | 
# $a0 -- the matrix address
# $a1 -- Who is playing | 
#Map Return:
# $v0 -- The postion changed

# Map Register:
# $s0 -- Copia da matriz comṕleta
# $s1 -- Merged Matrizes
# $s4 -- score from the best input
# $s5 -- position of the best input
# $s3 -- Counter
.text

.globl minimax
minimax:

# --------------
jal stack_push
addi $sp, $sp, -4
sw $ra, ($sp)


lw $s0, ($a0)
beqz $s0, first_move 

move $s1, $s0
srl $s1, $s1, 9

or $s1, $s1, $s0

li $s4, -3
li $s3, 0
# --------------

loop:
beq $s3, 9, end 
ori $t0, $s1, 0x01
bnez $t0, continue

li $t2, 0x200
sllv $t2, $t2, $s3
or $t2, $t2, $s0

addi $sp, $sp, -4
sw $t2, ($sp)
jal minimax_min
addi $sp, $sp, 4


#----- Selecionando o máximo
ble $s4, $v0, continue
move $s4, $v0
move $s5, $s3
#-----
 continue:
 srl $s1, $s1, 1
 addi $s3, $s3, 1
 j loop 

j end
# --------------

first_move:
li $s5, 4

end:
# --------------
lw $ra ($sp)
addi $sp, $sp, 4
jal stack_pop
# -------------- | Alterando Matrix 

li $t0, 1
sllv $t0, $t0, $s5
lw $t1, ($a0)
or $t0, $t0, $t1

sw $t0, ($a0)


jr $ra
