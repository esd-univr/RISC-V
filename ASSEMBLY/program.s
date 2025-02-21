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
    la a3, test_memory
    sw t2, 0(a3)      # Store t2 (30) at memory location
    lw a4, 0(a3)      # Load from memory back into a4 (should be 30)

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
