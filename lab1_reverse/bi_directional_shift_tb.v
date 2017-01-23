`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:07:26 01/23/2017
// Design Name:   bi_directional_shift
// Module Name:   /home/aaron/Git Repos/CSE311/lab1_reverse/bi_directional_shift_tb.v
// Project Name:  lab1_reverse
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bi_directional_shift
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bi_directional_shift_tb;

	// Inputs
	reg [7:0] d_in;
	reg [2:0] shift_amount;
	reg shift_direction;

	// Outputs
	wire [7:0] shifter_out;

	// Instantiate the Unit Under Test (UUT)
	bi_directional_shift uut (
		.d_in(d_in), 
		.shift_amount(shift_amount), 
		.shift_direction(shift_direction), 
		.shifter_out(shifter_out)
	);

	initial begin
		// Initialize Inputs
		d_in = 0;
		shift_amount = 0;
		shift_direction = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Test Case 1: Shift Right by 2
		d_in = 8'b00010000;
		shift_amount = 3'b010;
		shift_direction = 1'b1;
		
		#100;
		// Test Case 2: Shift Left by 2
		d_in = 8'b00010000;
		shift_amount = 3'b010;
		shift_direction = 1'b0;
	end
      
endmodule

