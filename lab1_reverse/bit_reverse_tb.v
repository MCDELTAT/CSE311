`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:40:57 01/18/2017
// Design Name:   bit_reverse
// Module Name:   /home/aaron/Git Repos/CSE311/lab1_reverse/bit_reverse_tb.v
// Project Name:  lab1_reverse
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bit_reverse
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bit_reverse_tb;

	// Inputs
	reg [7:0] d_in;

	// Outputs
	wire [7:0] d_out;

	// Instantiate the Unit Under Test (UUT)
	bit_reverse uut (
		.d_in(d_in), 
		.d_out(d_out)
	);

	initial begin
		// Initialize Inputs
		d_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		d_in = 8'b10100001;
	end
      
endmodule

