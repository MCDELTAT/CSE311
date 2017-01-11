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
	input clk,
	input rst,
	input [7:0] d_in,
	input shift_dir, //shift_dir =0 --> right, =1 --> left
	input [2:0] shift_amount,
	output reg [7:0] d_out
);

always @(posedge clk) begin
	if (shift_dir == 1) begin 
		case (shift_amount)
			0 : d_out = d_in;
			1 : d_out = {d_in[6:0], d_in[7]};
		endcase
	end
end 

endmodule
