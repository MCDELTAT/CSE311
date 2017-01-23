`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:49:45 01/23/2017
// Design Name:   mux2_1
// Module Name:   /home/aaron/Git Repos/CSE311/lab1_reverse/mux2_1_tb.v
// Project Name:  lab1_reverse
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux2_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux2_1_tb;

	// Inputs
	reg [7:0] input1;
	reg [7:0] input2;
	reg select;

	// Outputs
	wire [7:0] selected_out;

	// Instantiate the Unit Under Test (UUT)
	mux2_1 uut (
		.input1(input1), 
		.input2(input2), 
		.select(select), 
		.selected_out(selected_out)
	);

	initial begin
		// Initialize Inputs
		input1 = 0;
		input2 = 0;
		select = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// First case: select input2 from mux
		input1 = 8'b10000001;
		input2 = 8'b10101010;
		select = 1'b1;
		
		#100;
		// Second Case: select input1 from mux
		select = 1'b0;
	end
      
endmodule

