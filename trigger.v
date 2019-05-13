`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:57:11 05/13/2019 
// Design Name: 
// Module Name:    trigger 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module trigger(
    input in,
	 input clock,
    output reg out
    );

reg Q;

initial begin Q=0; out=0; end

always@(posedge clock)begin
	Q<=in;
	out<=~(Q==in);
end

endmodule
