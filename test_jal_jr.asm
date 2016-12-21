# This tests the jal and jr instructions.

.data
	counter: 1
.text

main:
	jal r7, showCounter	# EXPECT 1
	jal r7, incCounter
	jal r7, showCounter	# EXPECT 2
	jal r7, incCounter
	jal r7, showCounter	# EXPECT 3
	halt

incCounter:
	la	r0, counter
	lw	r1, r0
	addi	r1, 1
	sw	r1, r0
	jr	r7

showCounter:
	la	r0, counter
	lw	r1, r0
	put	r1
	jr	r7