# Swap the contents in testdata1 and testdata2.
.data
counter:  .byte   32                                               # "counter" of 1 byte to hold constant.
testdata1: .word   0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x08, 0x09  # "testdata" of 32 bytes to contain some values
testdata2: .word   0xAAAA, 0x5555, 0xCCCC, 0xDDDD, 0xFEFE, 0xEFEF, 0x9898, 0x8989  # "testdata" of 32 bytes to contain some values
.text
la   $t1, testdata1        # load starting address of testdata1
la   $t2, testdata2        # load starting address of testdata2 variable
la   $t3, counter          # load starting address of counter variable
add  $s0, $zero, $zero     # initialize $s0 = 0
lb   $a1, 0($t3)           # load counter into $a1
loop: bge  $s0, $a1, exit  # if $s0 >= $a1, exit the loop
lw   $t4, 0($t1)           # load a word from testdata1
lw   $t5, 0($t2)           # load a word from testdata2
sw   $t4, 0($t2)           # store $t4 into testdata2
sw   $t5, 0($t1)           # store $t5 into testdata1
addi $t1, $t1, 4           # update $t1 for next word
addi $t2, $t2, 4           # update $t2 for next word
addi $s0, $s0, 4           # update $s0 as counter
j    loop                  # loop back
exit:
syscall                    # end of program
# this is the end of the story.