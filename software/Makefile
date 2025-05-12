AS = riscv32-unknown-elf-as
LD = riscv32-unknown-elf-ld
OBJCOPY = riscv32-unknown-elf-objcopy
ARCH = rv32i

ASFLAGS = -march=$(ARCH)
LDFLAGS = -T src/linker.ld
OBJCOPY_IMEM_FLAGS = -O verilog -j .text
OBJCOPY_DMEM_FLAGS = -O verilog -j .data

SRC = src/program.s
OBJ = obj/program.o
ELF = bin/program.elf
IMEM_HEX = bin/imem.hex
DMEM_HEX = bin/dmem.hex

all: $(IMEM_HEX) $(DMEM_HEX) $(ELF)
	@mkdir -p obj bin 

$(OBJ): $(SRC)
	$(AS) $(ASFLAGS) $< -o $@

$(ELF): $(OBJ)
	$(LD) $(LDFLAGS) $< -o $@

$(IMEM_HEX): $(ELF)
	$(OBJCOPY) $(OBJCOPY_IMEM_FLAGS) $< $@

$(DMEM_HEX): $(ELF)
	$(OBJCOPY) $(OBJCOPY_DMEM_FLAGS) $< $@

clean:
	rm -f $(OBJ) $(ELF) $(IMEM_HEX) $(DMEM_HEX)
