
module RAM_32
#(	
	parameter MEMORY_DEPTH = 64,
   parameter DATA_WIDTH = 32
)
( 
	input 	[DATA_WIDTH-1:0]   Write_Data,
	input 	[DATA_WIDTH-1:0]   Address_i,
	input 					   Write_en, clk,
	
	output	[DATA_WIDTH-1:0]   Read_Data
);
	

	reg [DATA_WIDTH-1:0] RAM [MEMORY_DEPTH-1:0];
	reg  [DATA_WIDTH-1:0] value = 32'h10010000;

	always @ (posedge clk)
	begin

		if (Write_en)
			RAM[(Address_i-value)>>2] = Write_Data;
	end
	
  	assign Read_Data = RAM[(Address_i-value)>>2];

endmodule
