`timescale 1ns / 1ps

module dmem #(
    parameter MEM_SIZE = 128  // Parameterize memory size
)(
    input clk,
    input [31:0] daddr,       // Address input
    input [31:0] dwdata,      // Write data input
    input [3:0] we,           // Write enable signals
    output [31:0] drdata      // Read data output
);
    // Memory array (byte-addressable)
    reg [7:0] m[0:MEM_SIZE-1];
	initial $readmemh("mem.hex",m);
	
    // Byte addresses derived from daddr
    wire [31:0] add0 = (daddr & 32'hFFFFFFFC) + 32'h00000000;
    wire [31:0] add1 = (daddr & 32'hFFFFFFFC) + 32'h00000001;
    wire [31:0] add2 = (daddr & 32'hFFFFFFFC) + 32'h00000002;
    wire [31:0] add3 = (daddr & 32'hFFFFFFFC) + 32'h00000003;
    
    

    // Read data assembly
    assign drdata = {m[add3], m[add2], m[add1], m[add0]};

    // Write logic on positive clock edge
    always @(posedge clk) begin
        if (we[0]) m[add0] <= dwdata[7:0];
        if (we[1]) m[add1] <= dwdata[15:8];
        if (we[2]) m[add2] <= dwdata[23:16];
        if (we[3]) m[add3] <= dwdata[31:24];
    end
endmodule

