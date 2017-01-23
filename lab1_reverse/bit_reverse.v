`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    11:16:33 01/18/2017
// Design Name:
// Module Name:    bit_reverse
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
module bit_reverse(
	input wire [7:0] d_in,
	output reg [7:0] d_out
);

/*integer i;
reg  [9:0] reversed;
wire [9:0] result;

// mirror bits in wide 10-bit value
always @*
for(i=0;i<10;i=i+1)
    reversed[i] = data_reg[9-i];

// settle LSB on its place
assign result = reversed>>(10-Reverse_Count);*/

integer i;
reg [3:0] reverse_count = 4'b1000; //8
reg [7:0] reversed;

always @*
	begin
		for(i=0;i<8;i=i+1)
			begin
				reversed[i] = d_in[7-i];
			end
		d_out = reversed>>(8-reverse_count);
	end

endmodule