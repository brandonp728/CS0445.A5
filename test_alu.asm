# This tests halt, put, li, liu, as well as add, sub, and, and nor.

	li	r0, 3
	li	r1, 5
	add	r0, r1
	put	r0		# EXPECT 0008
	add	r0, r1
	put	r0		# EXPECT 000d
	sub	r0, r1
	put	r0		# EXPECT 0008
	liu	r3, 0x3C
	liu	r4, 0x0F
	and	r3, r4
	put	r3		# EXPECT 000C
	liu	r4, 0xF0
	nor	r3, r4
	put	r3		# EXPECT FF03
	halt