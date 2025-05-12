# RISC-V

This repository contains the Verilog implementation of a RISC-V RV32I core.

## Structure of the repository

The repository is organized in two main directories:
- software: it contains a simple RISC-V assembly application testing multiple
  instruction in the RV32I set.
	- src/ contains the code and the memory map (linker.ld) for the linker. The
	compiler expects the instructions starting at the address 0x0; the data
	starts at the address 0x1000.
	- The compilation process creates the directories obj/ and bin/ containing
	the object and binary files.
- verilog: it contains the Verilog implementation in the src/ subdirectory. The
  compilation process creates the bin/ directory containing the software binaries
  (previously compiled) and the compiled Verilog model.

## Requirements

The IP core requires the following software:
- standard RISC-V toolchain for 32 bit RISC-V ISA;
- Makefile;
- Icarus Verilog;
- GTKWave (optional, to analyze the generated waveforms)

## Compilation and Simulation
The compilation is based on Makefile. The following are the main targets:
- all: compile the software, the verilog model and execute the simulation;
- software: compile the software;
- simulation: execute the simulation. If the software is not compiled, it
  compiles the software;
- clean: clean all the temporary files.