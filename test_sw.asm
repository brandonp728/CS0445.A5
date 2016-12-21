.data
	x: 0
	y: 0
	z: 0

.text
	li	r0, 5
	la	r1, x
	sw	r0, r1
	li	r0, 0x10
	la	r1, y
	sw	r0, r1
	li	r0, 0x15
	la	r1, z
	sw	r0, r1

	# At this point, your RAM component should look like:
	# 00: | 0005 0010 |
	# 02: | 0015 0000 |

	la	r0, x
	lw 	r1, r0
	put	r1		# EXPECT 0005
	addiu	r0, 1
	lw	r1, r0
	put	r1		# EXPECT 0010
	addiu	r0, 1
	lw	r1, r0
	put	r1		# EXPECT 0015

	halt