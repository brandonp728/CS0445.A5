# Contributed by Colton Blake.
# Tests if your program can handle a series of for loops
# Should run indefinitely

main:
# Prints 5, 4, 3, 2, 1 then progresses

  li r0, 5

gtloop:
  put r0
  addi r0, -1
  bgtz r0, gtloop

# Prints FFFB, FFFC, FFFD, FFFE, FFFF then progresses

  li r0, -5

ltloop:
  put r0
  addi r0, 1
  bltz r0, ltloop

# Prints 5, 4, 3, 2, 1 then progresses

  li r0, 5

nezloop:
  put r0
  addi r0, -1
  bnez r0, nezloop

# Because r0 should be 0 from the previous loop, we start over
beqz r0, main

# We should never actually reach this instruction
halt
