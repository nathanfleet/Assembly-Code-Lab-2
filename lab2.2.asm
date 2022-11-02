# Nathan Fleet - 10/16/22

.data
	register1Input: .asciiz "Enter a value for the first register: "
	register2Input: .asciiz "Enter a value for the second register: "
	message1: .asciiz "Value in first register after swap: "
	message2: .asciiz "Value in second register after swap: "
	newline: .asciiz "\n"
	
.text
	# Store user input into registers
	
	# Display register 1 prompt
	li $v0, 4
	la $a0, register1Input
	syscall
	# Get the value for register 1
	li $v0, 5
	syscall
	# Store register 1 value
	move $t0, $v0
	
	# Display register 2 prompt
	li $v0, 4
	la $a0, register2Input
	syscall
	# Get the value for register 2
	li $v0, 5
	syscall
	# Store register 2 value
	move $t1, $v0
	
	# Swap the values in the registers without using a third register
	# This is because the third register could be destroyed
	add $t0, $t0, $t1
	sub $t1, $t0, $t1
	sub $t0, $t0, $t1
	
	li $v0, 4
	la $a0, message1
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	# print a new line
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 4
	la $a0, message2
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	