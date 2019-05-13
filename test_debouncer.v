`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:14:01 05/13/2019
// Design Name:   DebouncerTOP
// Module Name:   D:/FPGA/Debouncer/test_debouncer.v
// Project Name:  Debouncer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DebouncerTOP
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_debouncer;

	// Inputs
	reg in;
	reg clock;
	reg [7:0] delay;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	DebouncerTOP uut (
		.in(in), 
		.clock(clock), 
		.delay(delay), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		clock = 0;
		delay = 5;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		in=1;
		#40;
		in=0;
		#40;
		in=1;
		#320;
		in=0;
	end
    
initial forever begin #20; clock=~clock; end
	 
endmodule

