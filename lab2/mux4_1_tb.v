`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:24:35 02/01/2017
// Design Name:   mux4_1
// Module Name:   /home/aaron/Git Repos/CSE311/lab2/mux4_1_tb.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux4_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux4_1_tb;

	// Inputs
	reg [3:0] input1;
	reg [3:0] input2;
	reg [3:0] input3;
	reg [3:0] input4;
	reg [1:0] select;

	// Outputs
	wire [3:0] selected_out;

	// Instantiate the Unit Under Test (UUT)
	mux4_1 uut (
		.input1(input1), 
		.input2(input2), 
		.input3(input3), 
		.input4(input4), 
		.select(select), 
		.selected_out(selected_out)
	);

	initial begin
		// Initialize Inputs
		input1 = 0;
		input2 = 0;
		input3 = 0;
		input4 = 0;
		select = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Set inputs to unique values, select input1
		input1 = 4'b1000;
		input2 = 4'b0100;
		input3 = 4'b0010;
		input4 = 4'b0001;
		select = 2'b00;
		
		// Select input2
		#100;
		select = 2'b01;
		
		// Select input3
		#100;
		select = 2'b10;
		
		// Select input4
		#100;
		select = 2'b11;
		
	end
      
endmodule

