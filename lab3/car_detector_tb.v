`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:35:42 02/15/2017
// Design Name:   car_detector
// Module Name:   /home/aaron/Git Repos/CSE311/lab3/car_detector_tb.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: car_detector
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module car_detector_tb;

	// Inputs
	reg clk;
	reg res;
	reg sensorA;
	reg sensorB;

	// Outputs
	wire [3:0] car_count;

	// Instantiate the Unit Under Test (UUT)
	car_detector uut (
		.clk(clk), 
		.res(res), 
		.sensorA(sensorA), 
		.sensorB(sensorB), 
		.car_count(car_count)
	);

	initial begin
		//start a clock
		forever begin 
			#5 clk = ~clk;
		end 
	end

	initial begin
		// Initialize Inputs
		clk = 0;
		res = 0;
		sensorA = 0;
		sensorB = 0;

		// Wait 100 ns for global reset to finish
		#102;
		res = 1'b1;
		#5;
		res = 1'b0;
		
		// Cycle through sensor inputs that should result in car add
		#50;
		sensorA = 1'b1;
		#50;
		sensorB = 1'b1;
		#50;
		sensorA = 1'b0;
		#50;
		sensorB = 1'b0; //should result in increase = 1 
		
		// Cycle through sensor inputs that should result in car subtract
		#100;
		sensorB = 1'b1;
		#50;
		sensorA = 1'b1;
		#50;
		sensorB = 1'b0;
		#50;
		sensorA = 1'b0;
	end
      
endmodule

