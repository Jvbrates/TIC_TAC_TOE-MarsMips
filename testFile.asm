
#.text
#li $v0, 13

#la $a0, file
#li $a1, 0
#li $a2, 0

#syscall


#move $a0, $v0
#li $v0, 14
#la $a1, bufferf
#li $a2, 0x7000

#syscall


#.data
#file: .asciiz "/home/jvbrates/scripts/asm/t1_OC/pixil-frame-0.bmp"
#bufferf: .space 0x10000
#
#
