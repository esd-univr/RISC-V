`timescale 1ns / 1ps

module imem(
    input [31:0] iaddr,       // Instruction address input
    output [31:0] idata       // Instruction data output
);
    reg [7:0] memory [0:1000000]; // Byte-addressable memory

    // Initialize memory from file
    initial begin
        $readmemh("program.hex", memory);  // Read byte-split hex file
    end

    // Assemble instruction from bytes
    assign idata = {memory[iaddr+3], memory[iaddr+2], memory[iaddr+1], memory[iaddr]};
endmodule

