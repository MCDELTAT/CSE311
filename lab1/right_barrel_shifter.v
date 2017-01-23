`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:47:33 01/18/2017 
// Design Name: 
// Module Name:    right_barrel_shifter 
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
module right_barrel_shifter(
	input [7:0] d_in,
	input [2:0] shift_amount,
	output reg [7:0] d_out
);

//Examples:
// 0 no change
// 1 : in: 10000000 out: 01000000
// 2 : in: 10000000 out: 00100000
// 3 : in: 10000000 out: 00010000

always @* begin
	case (shift_amount)
		0 : d_out = d_in;
		1 : d_out = {d_in[0], d_in[7:1]}; //done
		2 : d_out = {d_in[1:0], d_in[7:2]};
		3 : d_out = {d_in[2:0], d_in[7:3]};
		4 : d_out = {d_in[3:0], d_in[7:4]};
		5 : d_out = {d_in[4:0], d_in[7:5]};
		6 : d_out = {d_in[5:0], d_in[7:6]};
		7 : d_out = 0;
	endcase
end 

endmodule
