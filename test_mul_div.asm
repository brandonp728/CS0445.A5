# This tests the extra credit mul and div instructions.

.text
	li	r0, 53
	li	r1, 78
	mul	r0, r1
	put	r0	# EXPECT 1026
	put	r1	# EXPECT 0000

	li	r7, -1
	li	r0, 3
	mul	r7, r0
	put	r7	# EXPECT FFFD
	put	r0	# EXPECT 0002

	li	r0, 17
	li	r1, 5
	div	r0, r1
	put	r0	# EXPECT 0003
	put	r1	# EXPECT 0002

	halt