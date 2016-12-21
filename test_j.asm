# This tests the j instruction by putting the CPU into an infinite loop.
# This program will never halt, you just have to stop the simulation.

	li	r2, 5
loop:
	put	r2		# EXPECT 5, 6, 7, 8, ...
	addiu	r2, 1
	j	loop