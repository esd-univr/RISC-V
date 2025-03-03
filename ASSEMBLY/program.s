.data
test_memory:
	.word 22
another_test:
	.word 3, 35, 12
.text
.globl _start
_start:
    la   a3, another_test        # a3 = address of 'another_test'
    lw   t2, 4(a3)               
    addi t2, t2, 1               
    sw   t2, 0(a3)               
    nop             
