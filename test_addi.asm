# This tests the addi and addiu instructions.

	li	r4, 3
	addi	r4, 1
	put	r4		# EXPECT 0004
	addi    r4, 0xFF
	put	r4		# EXPECT 0003
	addiu	r4, 1
	put	r4		# EXPECT 0004
	addiu	r4, 0xFF
	put	r4		# EXPECT 0103
	halt