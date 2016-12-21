# Contributed by Alexis Aquiatan.
# Tests all instructions except jumps/branches.

.text
	li	r0, 1
	li	r1, -2
	liu	r2, 3
	liu	r3, 4
	put	r0       # EXPECT 0001
	put	r1       # EXPECT FFFE
	put	r2       # EXPECT 0003
	put	r3       # EXPECT 0004
	add	r0, r1
	put	r0       # EXPECT FFFF
	sub	r3, r2
	put	r3       # EXPECT 0001

	li	r0, 1
	and	r0, r5
	put	r0       # EXPECT 0000
	nor	r0, r2
	put	r0       # EXPECT FFFC
	li	r0, 0
	put	r0       # EXPECT 0000
	addiu	r0, 5
	addi	r0, -1
	li	r0, 5
	li	r2, 2
	sw	r0, r2   # Should see 0005 at data memory address 2
	put	r0       # EXPECT 0005
	addi	r0, 5
	put	r0       # EXPECT 000A
	lw	r0, r2
	put	r0       # EXPECT 0005
	li	r0, 1
	li	r1, 3
	put	r0       # EXPECT 0001
	sllv	r0, r3
	put	r0       # EXPECT 0002
	srlv	r0, r3
	put	r0       # EXPECT 0001
	sll	r0, 2
	put	r0       # EXPECT 0004
	srl	r0, 2
	put	r0       # EXPECT 0001
	halt