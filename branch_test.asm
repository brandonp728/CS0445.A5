#written by Steve Hardy
#program tests all branch instructions with positives, negatives and zeroes
#requires load-immediate, put, and jump instructions to be working

.text
test_bgtz:
	li	r0, -3
	bgtz	r0, test_bgtz
	put	r0 					#expect FFFD
	li	r0, 0
	bgtz	r0, test_bgtz
	put	r0 					#expect 0000
	li	r0, 5
	bgtz	r0, test_bltz
	j	test_bgtz

test_bltz:
	put	r0 					#expect 0005
	li	r1, 8
	bltz	r1, test_bltz
	put	r1					#expect 0008
	li	r1, 0
	bltz	r1, test_bltz
	put	r1 					#expect 0000
	li	r1, -1
	bltz	r1, test_bnez
	j	test_bltz

test_bnez:
	put	r1					#expect FFFF
	li	r2, 0
	bnez	r2, test_bnez
	put	r2					#expect 0000
	li	r2, 1
	bnez	r2, test_bnez_pt2
	j	test_bnez
test_bnez_pt2:
	put	r2					#expect 0001
	li	r3, -1
	bnez	r3, test_beqz
	j	test_bnez_pt2

test_beqz:
	put	r3					#expect FFFF
	li	r4, 1
	beqz	r4, test_beqz
	put	r4					#expect 0001
	li	r4, -2
	beqz	r4, test_beqz
	put	r4					#expect FFFE
	li	r4, 0
	beqz	r4, end
	j	test_beqz

end:
	put	r4					#expect 0000
	halt