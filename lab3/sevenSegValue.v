// Listing 4.15
module sevenSegValue (
	input wire clk, reset,
	input wire [3:0] d_in,
	output reg [3:0] an,  // enable 1-out-of-4 asserted low
   output reg [7:0] sseg, // led segments
	output reg [3:0] leds
);

initial begin
	leds = 0;
end
	
   // hex to seven-segment led display
   always @*
   begin
		leds = d_in;
      case(d_in)
         4'b0000: sseg[7:0] = 8'b00000011;
         4'b0001: sseg[7:0] = 8'b10011111;
         4'b0010: sseg[7:0] = 8'b00100101;
         4'b0011: sseg[7:0] = 8'b00001101;
         4'b0100: sseg[7:0] = 8'b10011001;
         4'b0101: sseg[7:0] = 8'b01001001;
         4'b0110: sseg[7:0] = 8'b01000001;
         4'b0111: sseg[7:0] = 8'b00011111;
         4'b1000: sseg[7:0] = 8'b00000001;
         4'b1001: sseg[7:0] = 8'b00001001;
         default: sseg[7:0] = 8'b01110001;  //4'hf
     endcase
	  an = 4'b1110; //only use single digit counts
   end

endmodule