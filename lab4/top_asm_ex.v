`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:43:48 02/27/2017 
// Design Name: 
// Module Name:    top_asm_ex 
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
module top_asm_ex(
	input reset, clk,
	input [4:0] sw,
	output [3:0] an,
	output [7:0] sseg,
	output [0:0] led
);

wire [6:0] dout;

asm_ex uut(
    .clk (clk),
	 .start (sw[4]),
	 .reset (reset),
	 .din (sw[3:0]),
	 .dout(dout),
	 .done_tick (led)
);

sevenSegValue uut1(
	.d_in(dout),
	.an(an),
	.sseg(sseg)
);
	
endmodule
