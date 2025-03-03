cd ASSEMBLY/
riscv32-unknown-elf-as -march=rv32i program.s -o program.o
riscv32-unknown-elf-ld -T linker.ld program.o -o program.elf
riscv32-unknown-elf-objcopy -O verilog -j .text program.elf imem.hex  # For instructions
riscv32-unknown-elf-objcopy -O verilog -j .data program.elf dmem.hex  # For data
cd ..
cp ASSEMBLY/imem.hex Single_Cycle_CPU/
cp ASSEMBLY/dmem.hex Single_Cycle_CPU/
cd Single_Cycle_CPU/
iverilog -o stimulus.vvp cpu_tb.v Single_cycle_implementation/*.v
vvp stimulus.vvp
gtkwave pipeline_cpu_tb.vcd
