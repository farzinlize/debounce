`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:59:20 05/13/2019
// Design Name:   trigger
// Module Name:   D:/FPGA/Debouncer/test_trigger.v
// Project Name:  Debouncer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: trigger
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_trigger;

	// Inputs
	reg in;
	reg clock;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	trigger uut (
		.in(in), 
		.clock(clock), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		// Add stimulus here
		in=1;
		#120;
		in=0;
		#120;
		in=1;
		#40;
		in=0;
		#40;
		in=1;
		#80;
		in=0;
		#40;
	end
 
initial forever begin #20; clock=~clock; end
 
endmodule

