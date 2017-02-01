`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:21:08 01/31/2017
// Design Name:   PWM
// Module Name:   /home/aaron/Git Repos/CSE311/lab2/PWM_tb.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PWM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PWM_tb;

	// Inputs
	reg clk;
	reg [3:0] duty_cycle;

	// Outputs
	wire pwm;

	// Instantiate the Unit Under Test (UUT)
	PWM uut (
		.clk(clk), 
		.duty_cycle(duty_cycle), 
		.pwm(pwm)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		duty_cycle = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		// Start clock
		forever begin
			#10 clk=~clk;
		end		
	end
	
	initial begin
		#100;
		// 25% Duty-cycle
		duty_cycle = 4'b0011;

		#100;
		duty_cycle = 4'b0111;
	end
      
endmodule

