/*
* Description:
*	Wrapper Register File
* Author:
*	Ing. Luis Eduardo Almonte De Luna
* Date:
*	23/11/2021
*/
module Wrapper_Register_File
#(
	parameter WIDTH = 32

)

(
	input clock,
	input reset,
	input Reg_Write_i,
	input [4:0] rs, //rs
	input [4:0] rt, //rt
	input [4:0] rd, //rd
	input [WIDTH-1:0] R_rd, //R[rd]
	
	output [WIDTH-1:0] R_rs, //R[rs]
	output [WIDTH-1:0] R_rt //R[rt]
);

Register_File RF (.Write_Register_i(rs), .Read_Register_1_i(rt), .Read_Register_2_i(rd),
						.Write_Data_i(R_rd), .clock(clock), .reset(reset), .Reg_Write_i(Reg_Write_i), 
						.Read_Data_1_o(R_rs), .Read_Data_2_o(R_rt));
						
endmodule
