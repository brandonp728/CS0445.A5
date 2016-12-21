# Contributed by Colton Blake.
# This tests the bgtz, bltz, bneqz, beqz instructions
# If it works, it'll output 1, 2, 3, 4 in order

  li r0, 1
  bltz r0, lesser   # Should do nothing
  beqz r0, zero     # Should also do nothing
  bgtz r0, greater
nonzero:
  li r1, 3
  put r1
  li r0, 0
  bnez r0, nonzero # Should do nothing
  beqz r0, zero
lesser:
  li r1, 2
  put r1
  bgtz r0, greater  # Should do nothing
  bnez r0, nonzero
greater:
  li r1, 1
  put r1
  li r0, -1
  bltz r0, lesser
zero:
  li r1, 4
  put r1
  halt
