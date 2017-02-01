`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:06:07 01/31/2017 
// Design Name: 
// Module Name:    PWM 
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
module PWM(
	input wire clk,
	input wire [3:0] duty_cycle,
	output pwm
);

wire new_clock;
wire [3:0] count;

freq_divider freq1 (
	.clk (clk),
	.new_clk (new_clock)
);

counter counter1 (
	.clk (new_clock),
	.count (count)
);

comparator comp1 (
	.a_const (duty_cycle),
	.b_var (count),
	.d_out (pwm)
);


endmodule
