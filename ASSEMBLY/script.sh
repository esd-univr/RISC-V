riscv32-unknown-elf-as program.s -o program.o
riscv32-unknown-elf-objcopy -O verilog program.o program.hex
riscv32-unknown-elf-as mem.s -o mem.o
riscv32-unknown-elf-objcopy -O verilog mem.o mem.hex
cp -rf program.hex ../Single_cycle_CPU
cp -rf mem.hex ../Single_cycle_CPU
