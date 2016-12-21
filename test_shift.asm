# This tests the sll/srl instructions.

	liu	r0, 0xCE
	put	r0		# EXPECT 00CE
	sll	r0, 4
	put	r0		# EXPECT 0CE0
	sll	r0, 4
	put	r0		# EXPECT CE00
	srl	r0, 4
	put	r0		# EXPECT 0CE0
	srl	r0, 4
	put	r0		# EXPECT 00CE
	srl	r0, 4
	put	r0		# EXPECT 000C

	halt