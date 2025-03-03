.data
test_memory:
	.word 22
another_test:
	.word 3, 35, 12
.text
.globl _start
_start:
    la   a3, another_test        # a3 = address of 'another_test'
    lw   t2, 0(a3)               # t2 = value at address in a3 (which is 42)
    addi t2, t2, 1               # t2 = t2 + 1 (t2 = 43)
    sw   t2, 0(a3)               # Store 43 back to the address in a3 (i.e., 'another_test')
    nop             
