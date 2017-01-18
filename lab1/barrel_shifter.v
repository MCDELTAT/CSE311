`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:08:24 01/10/2017 
// Design Name: 
// Module Name:    barrel_shifter 
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
module barrel_shifter(
	input [7:0] d_in,
	input [2:0] shift_amount,
	output reg [7:0] d_out
);

always @* begin
	case (shift_amount)
		0 : d_out = d_in;
		1 : d_out = {d_in[6:0], d_in[7]};
		2 : d_out = {d_in[5:0], d_in[7:6]};
		3 : d_out = {d_in[4:0], d_in[7:5]};
		4 : d_out = {d_in[3:0], d_in[7:4]};
		5 : d_out = {d_in[2:0], d_in[7:3]};
		6 : d_out = {d_in[1:0], d_in[7:2]};
		7 : d_out = 0;
	endcase
end 

endmodule
