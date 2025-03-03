.data
test_memory:
	.word 22
another_test:
	.word 3, 35, 12
.text
.globl _start
_start:
    la   a3, another_test
    la 	 a2, test_memory
    lw   t2, 0(a3)               
    addi t2, t2, 1               
    sw   t2, 0(a2)
    lw   t0, 0(a2)
    addi t0, t0, 10
    sw t0, 8(a3)
    nop             
