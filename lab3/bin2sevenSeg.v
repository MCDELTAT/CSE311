`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:20:48 02/18/2017 
// Design Name: 
// Module Name:    bin2sevenSeg 
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
module bin2sevenSeg (
	input wire clk,
	input wire [13:0] d_in, //14 bits is sufficient to store 9,999
	output reg [15:0] fullOutput, //all four segments together
	output reg [3:0] segA, 
	output reg [3:0] segB, 
	output reg [3:0] segC, 
	output reg [3:0] segD,
	output reg [13:0] d_out
);

reg [13:0] d_inCopy;
reg [15:0] fullOutputCopy;
reg copyDone;

//clear the output
initial begin
	fullOutput = 0;
	segA = 0;
	segB = 0;
	segC = 0;
	segD = 0;
	d_inCopy = 0;
end

integer i;
//shift 14 times, at any point, check to see if portions are greater than 4, if so, add3
// we only want to perform this operation when d_in changes
always @(d_in)
	begin
		// copy d_in to a reg for manipulation
		for(i=0;i<14;i=i+1)
			begin
				d_inCopy[i] = d_in[i];
			end
		d_out = d_inCopy;
		copyDone = 1'b1;
	end

always @(posedge copyDone)
	begin
		for(i=0;i<14;i=i+1)
			begin
				//Check to see if any of the digits are greater than 4, if so increment by 3
				//This fixes the fact that 5 shifted left would cause errors in carrying (5<<1 =10).
				case (fullOutputCopy[3:0])
					4'b0000: fullOutputCopy[3:0] <= 4'b0000;  // 0 -> 0
					4'b0001: fullOutputCopy[3:0] <= 4'b0001;
					4'b0010: fullOutputCopy[3:0] <= 4'b0010;
					4'b0011: fullOutputCopy[3:0] <= 4'b0011; 
					4'b0100: fullOutputCopy[3:0] <= 4'b0100;  // 4 -> 4
					4'b0101: fullOutputCopy[3:0] <= 4'b1000;  // 5 -> 8
					4'b0110: fullOutputCopy[3:0] <= 4'b1001;  
					4'b0111: fullOutputCopy[3:0] <= 4'b1010;
					4'b1000: fullOutputCopy[3:0] <= 4'b1011;
					4'b1001: fullOutputCopy[3:0] <= 4'b1100;  // 9 -> 12
					default: fullOutputCopy[3:0] <= 4'b0000;
				endcase
				case (fullOutputCopy[7:4])
					4'b0000: fullOutputCopy[7:4] <= 4'b0000;  // 0 -> 0
					4'b0001: fullOutputCopy[7:4] <= 4'b0001;
					4'b0010: fullOutputCopy[7:4] <= 4'b0010;
					4'b0011: fullOutputCopy[7:4] <= 4'b0011; 
					4'b0100: fullOutputCopy[7:4] <= 4'b0100;  // 4 -> 4
					4'b0101: fullOutputCopy[7:4] <= 4'b1000;  // 5 -> 8
					4'b0110: fullOutputCopy[7:4] <= 4'b1001;  
					4'b0111: fullOutputCopy[7:4] <= 4'b1010;
					4'b1000: fullOutputCopy[7:4] <= 4'b1011;
					4'b1001: fullOutputCopy[7:4] <= 4'b1100;  // 9 -> 12
					default: fullOutputCopy[7:4] <= 4'b0000;
				endcase
				if (fullOutputCopy[11:8] >= 4'd5) //hundreds
					begin
						fullOutputCopy[11:8] = fullOutputCopy[11:8] + 2'b11;
					end
				else if (fullOutputCopy[13:9] >= 4'd5) //thousands
					begin
						fullOutputCopy[13:9] = fullOutputCopy[13:9] + 2'b11;
					end
				fullOutputCopy[0] = d_out[13];
				d_out = d_out << 1;
				fullOutputCopy = fullOutputCopy << 1;
			end
		fullOutput = fullOutputCopy;
		copyDone = 1'b0;
	end
 
endmodule