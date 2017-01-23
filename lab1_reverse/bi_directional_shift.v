`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:44:25 01/22/2017 
// Design Name: 
// Module Name:    bi_directional_shift 
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
// An 8-Bit Barrel Shifter designed to work off of only a reverse filter and
// a left-barrel shift. The shift_direction is used to determine if the left_barrel_shifter
// is returned of if the right_shift is returned via a path of:
// bit_reverse,left_shift,bit_reverse
//////////////////////////////////////////////////////////////////////////////////
module bi_directional_shift(
	input wire [7:0] d_in,
	input wire [2:0] shift_amount,
	input wire shift_direction, // 0 = left, 1 = right
	output wire [7:0] shifter_out
);

wire [7:0] pre_reverse;
wire [7:0] l_d_out;
wire [7:0] post_reverse;

bit_reverse pre_reverse (
	.d_in (d_in),
	.d_out (pre_reverse)
);

left_barrel_shifter left_1 (
	.d_in (d_in),
	.shift_amount (shift_amount),
	.d_out (l_d_out)
);

endmodule
