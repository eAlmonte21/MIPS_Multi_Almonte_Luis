/*
* Description
*	Memory System.
* Author:
*	Ing. Luis Eduardo Almonte De Luna
* Date:
*	28/11/2021
*/

module Memory_System
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

		wire [DATA_WIDTH-1:0] ROM_out;
		wire [DATA_WIDTH-1:0] RAM_out;
		
		wire [DATA_WIDTH-1:0] out;
		reg [(DATA_WIDTH-1):0] value = 32'h1000_0000 ;

		
		assign out = (Address_i < value) ?  1 : 0;
		
		ROM_32 data_mem (.Address_i(Address_i), .Instruction_o(ROM_out));
		
		RAM_32 program_mem (.Write_en(Write_Enable_i), .Write_Data(Write_Data), .Address_i(Address_i), .Read_Data(RAM_out), .clk(clk));

		MUX_2to1 UUT (.sel(out), .Data_out(Instruction_o), .x(ROM_out), .y(RAM_out));
		
		
		
endmodule 