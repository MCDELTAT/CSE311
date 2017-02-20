`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:44:38 02/19/2017 
// Design Name: 
// Module Name:    top 
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
module top(
	input wire clk, reset,
	input wire sensorA,
	input wire sensorB,
	output wire [3:0] enable,  // enable 1-out-of-4 asserted low
   output wire [7:0] sseg, // led segments
	output wire [3:0] leds
);

wire [3:0] counter;

//instantiation of car_detector
car_detector count1(
	.clk (clk),
	.res (reset),
	.sensorA (sensorA),
	.sensorB (sensorB),
	.car_count (counter)
);

//instantiation of sevenSegValue controller
sevenSegValue  brd1(
	.clk (clk),
	.reset (reset),
	.d_in (counter),
	.an (enable),
	.sseg (sseg),
	.leds (leds)
);

endmodule
