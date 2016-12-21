# This tests the jr instruction. It should display the numbers 1, 2, 3, and 4 in order.

# NOTE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# The offsets used here are hardcoded, so don't change this program or it'll break.

	li r0, 1
	put r0
	li r7, 8 # address of label2
	jr r7
label1:
	li r0, 3
	put r0
	li r7, 12 # address of label3
	jr r7
label2:
	li r0, 2
	put r0
	li r7, 4 # address of label1
	jr r7
label3:
	li r0, 4
	put r0
	halt