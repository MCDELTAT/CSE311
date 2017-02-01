`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:15:46 01/31/2017
// Design Name:   counter
// Module Name:   /home/aaron/Git Repos/CSE311/lab2/counter_tb.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module counter_tb;

	// Inputs
	reg clk;

	// Outputs
	wire [3:0] counter;

	// Instantiate the Unit Under Test (UUT)
	counter uut (
		.clk(clk), 
		.counter(counter)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		forever begin
			#5 clk=~clk;
		end

			
	end
      
endmodule

