module Memory_System_Wrapper
#(
		parameter MEMORY_DEPTH = 64,
		parameter DATA_WIDTH = 32
)

(

		input Write_Enable_i, clk,
		input [DATA_WIDTH-1:0] Write_Data,
		input [DATA_WIDTH-1:0] Address_i,
		
		output [DATA_WIDTH-1:0] Instruction_o
	
		
);

	Memory_System wrp (.Write_Data(Write_Data), .Address_i(Address_i), .Instruction_o(Instruction_o), .Write_Enable_i(Write_Enable_i), .clk(clk));
	
endmodule 