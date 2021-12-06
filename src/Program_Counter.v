/*
* Description
*	Flip Flop 
* Author:
*	Ing. Luis Eduardo Almonte De Luna
* Date:
*	21/11/2021
*/
module Program_Counter
#(

		parameter WORD_LENGTH = 32

)

(
	input clk,
	input reset,
	input enable,
	input [WORD_LENGTH-1 : 0] data_in,
	
	output [WORD_LENGTH-1 : 0] data_out
	
);

	reg [WORD_LENGTH-1 : 0] Q;

   always @(posedge clk or negedge reset) begin
      if (!reset)
         Q <= 32'h400000;
      else 
		if (enable)
         Q <= data_in;
   end
		assign data_out = Q;

endmodule
	