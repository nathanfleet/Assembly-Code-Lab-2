# Nathan Fleet - 10/16/22

.data
	winput: .asciiz "Enter a value for w: "
	xinput: .asciiz "Enter a value for x: "
	yinput: .asciiz "Enter a value for y: "
	zinput: .asciiz "Enter a value for z: "
	
	xmessage: .asciiz "The value of x is: "
	
.text
	# Get values from user and store in temporary registers
	
	# Display w prompt
	li $v0, 4 # 4 = code for text printing
	la $a0, winput
	syscall
	# Get the value for w
	li $v0, 5 # 5 = code to tell the computer it is recieving and integer
	syscall
	# Store w value
	move $t0, $v0
	
	# Display x prompt
	li $v0, 4
	la $a0, xinput
	syscall
	# Get the value for x
	li $v0, 5
	syscall
	# Store x value
	move $t1, $v0
	
	# Display y prompt
	li $v0, 4
	la $a0, yinput
	syscall
	# Get the value for y
	li $v0, 5
	syscall
	# Store y value
	move $t2, $v0
	
	# Display z prompt
	li $v0, 4
	la $a0, zinput
	syscall
	# Get the value for z
	li $v0, 5
	syscall
	# Store z value
	move $t3, $v0
	
	sub $t4, $t1, $t2
	bge $t4, $t0, if # if x-y >= w go to if
	j else
if:
	move $t1, $t2
	j endif
else:
	move $t1, $t3
	j endif
endif:
	# Display message prompt
	li $v0, 4 # 4 = code for text printing
	la $a0, xmessage
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	
