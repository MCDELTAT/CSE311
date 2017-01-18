`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:50:33 01/10/2017
// Design Name:   barrel_shifter
// Module Name:   /home/aaron/Git Repos/CSE311/lab1/barrel_shifter_tb.v
// Project Name:  lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: barrel_shifter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module barrel_shifter_tb;

	// Inputs
	reg [7:0] d_in;
	reg [2:0] shift_amount;

	// Outputs
	wire [7:0] d_out;

	// Instantiate the Unit Under Test (UUT)
	barrel_shifter uut (
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
        
		// Test to shift left by 1
		d_in = 8'b01000000;
		shift_amount = 1'd1;
		
		#100;
		// New Test for shift left by 2
		d_in = 8'b00010000;
		shift_amount = 3'b010;
		
		#100;
		// Final Test to shift left by 4
		d_in = 8'b00100000;
		shift_amount = 3'b100;
		
	end
      
endmodule

