cd ASSEMBLY/
riscv64-unknown-elf-as -march=rv32i program.s -o program.o
riscv64-unknown-elf-objcopy -O verilog program.o program.hex
riscv64-unknown-elf-as -march=rv32i mem.s -o mem.o
riscv64-unknown-elf-objcopy -O verilog mem.o mem.hex
cd ..
cp ASSEMBLY/program.hex Single_Cycle_CPU/
cp ASSEMBLY/mem.hex Single_Cycle_CPU/
cd Single_Cycle_CPU/
iverilog -o stimulus.vvp cpu_tb.v Single_cycle_implementation/*.v
vvp stimulus.vvp
gtkwave pipeline_cpu_tb.vcd
