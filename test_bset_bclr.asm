# This tests the extra credit bset and bclr instructions.

.text
	li	r0, 0
	bset	r0, 0
	put	r0	# EXPECT 0001
	bset	r0, 1
	put	r0	# EXPECT 0003
	bset	r0, 2
	put	r0	# EXPECT 0007
	bset	r0, 3
	put	r0	# EXPECT 000F
	bset	r0, 4
	put	r0	# EXPECT 001F
	bset	r0, 5
	put	r0	# EXPECT 003F
	bset	r0, 6
	put	r0	# EXPECT 007F
	bset	r0, 7
	put	r0	# EXPECT 00FF
	bclr	r0, 0
	put	r0	# EXPECT 00FE
	bclr	r0, 1
	put	r0	# EXPECT 00FC
	bclr	r0, 2
	put	r0	# EXPECT 00F8
	bclr	r0, 3
	put	r0	# EXPECT 00F0
	bclr	r0, 4
	put	r0	# EXPECT 00E0
	bclr	r0, 5
	put	r0	# EXPECT 00C0
	bclr	r0, 6
	put	r0	# EXPECT 0080
	bclr	r0, 7
	put	r0	# EXPECT 0000

	halt