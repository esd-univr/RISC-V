AS = riscv32-unknown-elf-as
LD = riscv32-unknown-elf-ld
OBJCOPY = riscv32-unknown-elf-objcopy
ARCH = rv32i

SW=software

ASFLAGS = -march=$(ARCH)
LDFLAGS = -T $(SW)/src/linker.ld
OBJCOPY_IMEM_FLAGS = -O verilog -j .text
OBJCOPY_DMEM_FLAGS = -O verilog -j .data

SRC = $(SW)/src/program.s
OBJ = $(SW)/obj/program.o
ELF = $(SW)/bin/program.elf
IMEM_HEX = $(SW)/bin/imem.hex
DMEM_HEX = $(SW)/bin/dmem.hex

ICARUS=iverilog

all: software simulation

software: $(IMEM_HEX) $(DMEM_HEX) $(ELF)
	@echo "Software compiled."
	@mkdir -p $(SW)/obj $(SW)/bin 

$(OBJ): $(SRC)
	@mkdir -p $(SW)/obj $(SW)/bin 
	$(AS) $(ASFLAGS) $< -o $@

$(ELF): $(OBJ)
	@mkdir -p $(SW)/obj $(SW)/bin 
	$(LD) $(LDFLAGS) $< -o $@

$(IMEM_HEX): $(ELF)
	@mkdir -p $(SW)/obj $(SW)/bin 
	$(OBJCOPY) $(OBJCOPY_IMEM_FLAGS) $< $@

$(DMEM_HEX): $(ELF)
	@mkdir -p $(SW)/obj $(SW)/bin 
	$(OBJCOPY) $(OBJCOPY_DMEM_FLAGS) $< $@

clean:
	rm -f $(OBJ) $(ELF) $(IMEM_HEX) $(DMEM_HEX)
	rm -rf $(SW)/obj $(SW)/bin verilog/bin verilog/output

simulation: $(IMEM_HEX) $(DMEM_HEX) $(ELF)
	@echo "Copying software to verilog directory."
	mkdir -p verilog/bin
	mkdir -p verilog/output
	cp $(IMEM_HEX) verilog/bin/imem.hex
	cp $(DMEM_HEX) verilog/bin/dmem.hex
	@echo "Compiling testbench and verilog model."
	$(ICARUS) -o verilog/bin/simulazione.vvp verilog/src/*.v
	@echo "Running simulation."
	verilog/bin/simulazione.vvp
	@echo "Simulation finished. The simulation traces are in verilog/output/simulazione.vcd"
