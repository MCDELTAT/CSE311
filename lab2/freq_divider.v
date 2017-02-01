`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:03:35 01/31/2017 
// Design Name: 
// Module Name:    freq_divider 
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
module freq_divider(
    input wire clk,
	 output reg new_clk
);

reg [2:0] count;

initial begin
	count = 0;
end

always@(posedge clk)
	begin
		count <= count+1;
	end

always@*
	begin
		new_clk = (count==0) ? 1:0;
	end	

endmodule
