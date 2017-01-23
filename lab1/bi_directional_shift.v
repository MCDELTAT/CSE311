`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:03:31 01/18/2017 
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
//
//////////////////////////////////////////////////////////////////////////////////
module bi_directional_shift(
	input [7:0] d_in,
	input [2:0] shift_amount,
	input shift_direction, // 0 = left, 1 = right
	output wire [7:0] shifter_out
);

wire [7:0] l_d_out;
wire [7:0] r_d_out;

barrel_shifter left_1(
	.d_in (d_in),
	.shift_amount (shift_amount),
	.d_out (l_d_out)
);

right_barrel_shifter right_1 (
	.d_in (d_in),
	.shift_amount (shift_amount),
	.d_out (r_d_out)
);

//assign shifter_out = l_d_out;
assign shifter_out = (shift_direction) ? r_d_out : l_d_out;

endmodule
