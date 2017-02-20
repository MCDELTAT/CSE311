`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:17:38 02/18/2017
// Design Name:   bin2sevenSeg
// Module Name:   /home/aaron/Git Repos/CSE311/lab3/bin2sevenSeg_tb.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bin2sevenSeg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bin2sevenSeg_tb;

	// Inputs
	reg clk;
	reg [13:0] d_in;

	// Outputs
	wire [15:0] fullOutput;
	wire [3:0] segA;
	wire [3:0] segB;
	wire [3:0] segC;
	wire [3:0] segD;
	wire [13:0] d_out;

	// Instantiate the Unit Under Test (UUT)
	bin2sevenSeg uut (
		.clk(clk), 
		.d_in(d_in), 
		.fullOutput(fullOutput), 
		.segA(segA),
		.segB(segB),
		.segC(segC),
		.segD(segD),
		.d_out(d_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		d_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		d_in = 4'd11;
	end
      
endmodule

