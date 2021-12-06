module ROM_32 
#(
		parameter MEMORY_DEPTH = 64,
		parameter DATA_WIDTH = 32

)
(
	input [DATA_WIDTH-1:0] Address_i,
	output reg [DATA_WIDTH-1:0] Instruction_o
);


	reg [DATA_WIDTH-1:0] ROM [MEMORY_DEPTH-1:0];
	reg signed [DATA_WIDTH-1:0] value = 32'h400000;

	initial
	begin
		$readmemh("Test_Program_Hex.dat", ROM);
	end

	always @ (Address_i)
	begin
		Instruction_o = ROM[(Address_i-value)>>2];
	end

endmodule 
