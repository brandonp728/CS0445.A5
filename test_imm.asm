# This tests the instructions halt, put, li, and liu.

	li	r0, 5
	put	r0		# EXPECT 0005
	liu	r2, 5
	put	r2		# EXPECT 0005
	li	r4, 0x80
	put	r4		# EXPECT FF80
	liu	r7, 0x80
	put	r7		# EXPECT 0080
	halt