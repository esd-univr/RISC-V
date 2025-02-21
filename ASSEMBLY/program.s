# .text
# 
# main:   add     t0, x0, x0
# 
#              addi    t1, x0, 1
# 
#              la      t3, n
# 
#              lw      t3, 0(t3)
# 
# fib:       beq     t0, x0, finish
# 
#              add     t2, t1, t3
# 
#              mv      t3, t1
# 
#              mv      t1, t2
# 
#              addi    t0, t0, -1
# 
#              j       fib
# 
.section .text
.global _start

_start:
    # Load values into registers
    li t0, 10         # t0 = 10
    li t1, 20         # t1 = 20
    add t2, t0, t1    # t2 = t0 + t1 (10 + 20 = 30)

    sub t3, t2, t0    # t3 = t2 - t0 (30 - 10 = 20)
    xor t4, t3, t1    # t4 = t3 XOR t1 (20 ^ 20 = 0)
    or  t5, t3, t1    # t5 = t3 OR t1 (20 | 20 = 20)
    and t6, t3, t1    # t6 = t3 AND t1 (20 & 20 = 20)

    # Immediate operations
    addi a0, t0, 5    # a0 = t0 + 5 (10 + 5 = 15)
    andi a1, t1, 15   # a1 = t1 & 15 (20 & 15 = 4)
    ori  a2, t2, 8    # a2 = t2 | 8 (30 | 8 = 30)

    # Memory operations
    lui t0, 0x0          # Load upper immediate for address 0x0000 into t0
    sw t1, 0(t0)         # Store t1 at memory location 0x0000
    lui t0, 0x0          # Load upper immediate for address 0x002C into t0
    addi t0, t0, 0x2C    # Add the lower part of the address (0x002C)
    sw t2, 0(t0)         # Store t2 at memory location 0x002C
    lw a4, 0(t0)         # Load the value from memory location 0x002C into a4

    # Branching
    beq t2, t3, fail  # Should NOT branch (30 != 20)
    bne t2, t3, pass  # Should branch (30 != 20)

fail:
    li a5, 0          # If we reach here, test failed
    j end

pass:
    li a5, 1          # If we reach here, test passed

end:
    j end             # Infinite loop
