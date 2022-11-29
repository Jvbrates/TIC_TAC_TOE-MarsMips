.text
.globl minimax_max

minimax_max:

# --------------
jal stack_push
addi $sp, $sp, -4
sw $ra, ($sp)
# --------------

# Verifica se esta possibilidade é um fim de partida, caso não, testa as demais possibilidades que surgem desta
jal end_match
beqz $v0, fork 

# --------------
#Aqui caso sim, este trecho de código é resultado de um má planejamento. 
#Eu poderia ter escrito os códigos de fim de partida de fomra que fosse semelhante a pontuação da jogada para a máquina

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

#Testas as demais possibilidades, retornando a que dar o resultado com maior pontuação
fork:
sw $s0, ($sp)
 sw $s1, ($sp)
 
 srl $s1, $s1, 9
 or $s1, $s1, $s0
 
 li $s2, -3
 li $s3, 0
 
 loop:
 beq $s3, 9, exit 
 ori $t0, $s1, 0x01
 bnez $t0, continue

  
 li $t2, 0x01
 sllv $t2, $t2, $s3
 or $t2, $t2, $s0
 addi $sp, $sp, -4
 sw $t2, ($sp)
 jal minimax_min
 addi $sp, $sp, 4 
 
 blt $s2, $v0, continue
 move $v0, $s2

 
  continue:
  srl $s1, $s1, 1
  addi $s3, $s3, 1
  j loop
# -------------- 
exit:
lw $ra ($sp)
addi $sp, $sp, 4
jal stack_pop
# --------------

jr $ra
