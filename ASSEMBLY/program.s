.data
test_memory:
	.word 22
	
another_test:
	.word 3, 35, 12


.text
.globl _start
_start:
    # Load values into registers
    addi t0, 10        
    addi t1, 8         
    add t2, t0, t1    

    # Memory operations
    auipc a3, %pcrel_hi(_another_test)   
	addi  a3, a3, %pcrel_lo(_another_test) 
    lw t2, 0(a3)       
