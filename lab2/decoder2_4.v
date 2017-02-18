`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:54:57 02/01/2017 
// Design Name: 
// Module Name:    decoder2_4 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module decoder2_4(
	input wire clk, reset,
	input wire pwm,
	output reg [3:0] an
);

localparam N = 18;
reg [N-1:0] q_reg;
wire [N-1:0] q_next;

// N-bit counter
// register
always @(posedge clk, posedge reset)
	if (reset)
		q_reg <= 0;
   else
      q_reg <= q_next;

// next-state logic
assign q_next = q_reg + 1;

always @*
	case (q_reg[N-1:N-2])
		2'b00: an = {3'b111, ~pwm};
		2'b01: an = {2'b11, ~pwm, 1'b1};
		2'b10: an = {1'b1, ~pwm, 2'b11};
		2'b11: an = {~pwm, 3'b111};
	endcase

endmodule
