riscv64-unknown-elf-as -march=rv32i program.s -o program.o
riscv64-unknown-elf-objcopy -O verilog program.o program.hex
riscv64-unknown-elf-as -march=rv32i mem.s -o mem.o
riscv64-unknown-elf-objcopy -O verilog mem.o mem.hex
cp -rf program.hex ../Single_cycle_CPU
cp -rf mem.hex ../Single_cycle_CPU
