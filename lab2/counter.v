`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:11:18 01/31/2017 
// Design Name: 
// Module Name:    counter 
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
module counter(
	input wire clk,
	output reg [3:0] count
);

// Initialize counter to ensure it has a valid value
initial begin
	count = 4'b0000;
end

// Increment counter until it reaches full saturation, then reset to zero
always @(posedge clk)
	begin
		count = (count==4'b1111) ? 0:(count+1);
	end

endmodule
