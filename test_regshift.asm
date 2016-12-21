# This only tests the sllv/srlv instructions.
# Being R-type, they should be easy to implement by now.

	liu	r0, 0xCE
	put	r0		# EXPECT 00CE
	li	r1, 4
	sllv	r0, r1
	put	r0		# EXPECT 0CE0
	sllv	r0, r1
	put	r0		# EXPECT CE00
	srlv	r0, r1
	put	r0		# EXPECT 0CE0
	srlv	r0, r1
	put	r0		# EXPECT 00CE
	srlv	r0, r1
	put	r0		# EXPECT 000C

	halt