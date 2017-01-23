`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:49:40 01/18/2017
// Design Name:   right_barrel_shifter
// Module Name:   /home/aaron/Git Repos/CSE311/lab1/right_barrel_shifter_tb.v
// Project Name:  lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: right_barrel_shifter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module right_barrel_shifter_tb;

	// Inputs
	reg [7:0] d_in;
	reg [2:0] shift_amount;

	// Outputs
	wire [7:0] d_out;

	// Instantiate the Unit Under Test (UUT)
	right_barrel_shifter uut (
		.d_in(d_in), 
		.shift_amount(shift_amount), 
		.d_out(d_out)
	);

	initial begin
		// Initialize Inputs
		d_in = 0;
		shift_amount = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Test to shift right by 1
		d_in = 8'b00000001;
		shift_amount = 1'd1;
		
		#100;
		// New Test for shift right by 2
		d_in = 8'b10000000;
		shift_amount = 3'b010;
		
		#100;
		// Final Test to shift right by 4
		d_in = 8'b00010000;
		shift_amount = 3'b100;
	end
      
endmodule

