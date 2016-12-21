# This tests only the lw instruction.
# Remember, you have to use jmasm test_lw.asm -d and output that to
# a separate file to be loaded into the RAM in your CPU.

.data
	x: 0x54
	y: 0x2A

.text
	la	r0, x
	lw	r1, r0
	put	r1		# EXPECT 0054
	la	r2, y
	lw	r3, r2
	put	r3		# EXPECT 002A

	halt