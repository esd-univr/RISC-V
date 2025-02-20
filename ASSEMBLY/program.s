.text

main:   add     t0, x0, x0

             addi    t1, x0, 1

             la      t3, n

             lw      t3, 0(t3)

fib:       beq     t0, x0, finish

             add     t2, t1, t3

             mv      t3, t1

             mv      t1, t2

             addi    t0, t0, -1

             j       fib
