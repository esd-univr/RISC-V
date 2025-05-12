`timescale 1ns / 1ns

module cpu_tb();
    reg clk, reset;
    wire [31:0] iaddr;
    wire [31:0] x31, pc;

    // Create a reg array to hold instructions
    reg [31:0] instruction_mem [0:15]; // assuming we have 16 instructions for testing

    // Wire to connect the instruction memory to the CPU
    wire [31:0] idata;

    // Instantiate the CPU module
    CPU dut (
        .clk(clk),
        .reset(reset),
        .iaddr(iaddr),
        .pc(pc),
        .x31(x31)
    );


    // Clock generation (toggle every 5 ns)
    always #5 clk = ~clk;

    // Initialize instruction memory with test instructions
    initial begin
        
        // Open a VCD file for waveform dump
        $dumpfile("verilog/output/simulazione.vcd"); // Name of the VCD file
        $dumpvars(0, cpu_tb);  // Dump all signals in the cpu_tb module
        // Initialize signals
        clk = 0;
        reset = 1;

        // Apply reset to the CPU for some time
        #30;
        reset = 0;

        // Simulate the execution of instructions
        #10;  // Time for instruction 1 (NOP)
        #10;  // Time for instruction 2 (ADD)
        #10;  // Time for instruction 3 (LUI)
        #10;  // Time for instruction 4 (JAL)
        #10;  // Time for instruction 5 (JALR)

        // Wait for some cycles to observe results
        #100;

        // Check the outputs
        $display("iaddr = %h, pc = %h, x31 = %h", iaddr, pc, x31);

        // End simulation after a while
        $finish;
    end

endmodule

