`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:07:34 02/15/2017 
// Design Name: 
// Module Name:    car_detector 
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
module car_detector(
	input wire clk, res,
	input wire sensorA,
	input wire sensorB,
	output reg [3:0] car_count
);

localparam abUnblocked=2'b00, aBlocked=2'b01, abBlocked=2'b10, bBlocked=2'b11;
reg [1:0] next_state, current_state;
reg increase, decrease;

//initialize all necessary values
initial begin
	increase = 0;
	decrease = 0;
	car_count = 0;
	next_state = 0;
	current_state = 0;
end

// State register logic
always@(posedge clk, posedge res) begin
	if (res) 
		current_state <= abUnblocked;
	else
		current_state <= next_state;
end

always@* begin
	increase = 0;
	decrease = 0;
	case(current_state)
		abUnblocked: if ({sensorA,sensorB} == 2'b10) begin
							  next_state = aBlocked;
						 end	 
						 else if ({sensorA,sensorB} == 2'b01) begin
							  next_state = bBlocked;
						 end
						 else if ({sensorA,sensorB} == 2'b00) begin
							  next_state = abUnblocked; //stay
						 end
		aBlocked: 	 if ({sensorA,sensorB} == 2'b10) begin
							  next_state = aBlocked; //stay
						 end	 
						 else if ({sensorA,sensorB} == 2'b11) begin
							  next_state = abBlocked;
						 end
						 else if ({sensorA,sensorB} == 2'b00) begin
							  next_state = abUnblocked; 
							  decrease = 1; //finished exiting
						 end
		abBlocked: 	 if ({sensorA,sensorB} == 2'b10) begin
							  next_state = aBlocked;
						 end	 
						 else if ({sensorA,sensorB} == 2'b11) begin
							  next_state = abBlocked; //stay
						 end
						 else if ({sensorA,sensorB} == 2'b01) begin
							  next_state = bBlocked; 
						 end
		bBlocked: 	 if ({sensorA,sensorB} == 2'b00) begin
							  next_state = abUnblocked;
							  increase = 1;
						 end	 
						 else if ({sensorA,sensorB} == 2'b11) begin
							  next_state = abBlocked;
						 end
						 else if ({sensorA,sensorB} == 2'b01) begin
							  next_state = bBlocked; //stay
						 end				 
	endcase
end		
	
always@(posedge increase, posedge decrease) begin
	if(increase)
		car_count = car_count+1; //increment the total counter
	else if(decrease)
		car_count = car_count-1; //decrement the total counter
end

endmodule
