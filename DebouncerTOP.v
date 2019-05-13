`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:07:37 05/13/2019 
// Design Name: 
// Module Name:    DebouncerTOP 
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
module DebouncerTOP(
	input in,
	input clock,
	input [7:0] delay,
	output reg out
    );

reg [31:0] timer;
reg D;

wire reset;
wire enable_out;

assign enable_out = (delay==timer);

initial begin timer=0; D=0; out=0; end

trigger triiger_instant (
    .in(in), 
    .clock(clock), 
    .out(reset)
    );

always@(posedge clock or posedge reset)begin
	if(reset)
		timer <= 0;
	else if(!enable_out)
		timer <= timer + 1;
end

always@(posedge clock)begin
	if(enable_out)
		out <= D;
end

always@(posedge clock)begin
	D<=in;
end

endmodule
