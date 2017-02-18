`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:17:38 02/01/2017 
// Design Name: 
// Module Name:    mux4_1 
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
module mux4_1(
	input wire [3:0] input1,
	input wire [3:0] input2,
	input wire [3:0] input3,
	input wire [3:0] input4,
	input wire [1:0] select,
	output reg [3:0] selected_out
);

always@* 
	case(select)
		2'b00 : selected_out = input1;
		2'b01 : selected_out = input2;
		2'b10 : selected_out = input3;
		2'b11 : selected_out = input4;
	endcase


endmodule
