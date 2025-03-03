cd ASSEMBLY/
riscv32-unknown-elf-as -march=rv32i program.s -o program.o
riscv32-unknown-elf-ld -o program.elf program.o
riscv32-unknown-elf-objcopy -O verilog program.elf program.hex
riscv32-unknown-elf-objcopy -O verilog -j .text program.elf program.hex
riscv32-unknown-elf-objcopy -O verilog -j .data program.elf mem.hex

cd ..
cp ASSEMBLY/program.hex Single_Cycle_CPU/
cp ASSEMBLY/mem.hex Single_Cycle_CPU/
cd Single_Cycle_CPU/
iverilog -o stimulus.vvp cpu_tb.v Single_cycle_implementation/*.v
vvp stimulus.vvp
gtkwave pipeline_cpu_tb.vcd
