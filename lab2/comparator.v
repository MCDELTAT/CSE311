`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:00:35 01/31/2017 
// Design Name: 
// Module Name:    comparator 
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
module comparator(
	input wire [3:0] a_const,
	input wire [3:0] b_var,
	output wire d_out
);

assign d_out = (b_var < a_const) ? 1:((a_const==4'b1111) ? 1:0);

endmodule
