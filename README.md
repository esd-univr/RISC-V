# RISC-V
This repository contains a RISC-V RV32I core implemented in verilog, that loads and simulates RISC-V assembly code.

In `Single_Cycle_CPU` you find the core implementation, while in ASSEMBLY you can implement your RISC-V code in `program.s`.

## Compilation and Simulation
This project needs `riscv32` compiler and Icarus Verilog simulator:
```bash
git clone https://github.com/riscv-collab/riscv-gnu-toolchain
sudo apt-get install \
    	autoconf automake autotools-dev curl python3 python3-pip libmpc-dev libmpfr-dev \
	libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc \
	zlib1g-dev libexpat-dev ninja-build git cmake libglib2.0-dev libslirp-dev 
sudo mkdir /opt/riscv32i
sudo chown $USER /opt/riscv32i
cd riscv-gnu-toolchain && ./configure --with-arch=rv32i --with-abi=ilp32 --prefix=/opt/riscv32i
make -j $(nproc)
export PATH="/opt/riscv32i/bin:{$PATH}"
sudo apt-get install iverilog
sudo apt-get install gtkwave
git clone https://github.com/pt199vr/RISC-V 
cd RISC-V && sh script.sh
```
Once you installed it, you can directly compile and simulate your RISC-V code by executing the script file `script.sh`.
