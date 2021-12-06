/*
* Description:
*	PRIORITY ENCODER
* Author:
*	Ing. Luis Eduardo Almonte De Luna
* Date:
*	22/11/2021
*/
module priority_encoder
#(

	parameter WORD_LENGTH = 32,
	parameter BITS = 5
	
)
(
	input [BITS-1:0] Write_Register_i,
	output [WORD_LENGTH-1:0] CP_o
);


wire A, B, C, D, E;

assign A = Write_Register_i[4];
assign B = Write_Register_i[3];
assign C = Write_Register_i[2];
assign D = Write_Register_i[1];
assign E = Write_Register_i[0];

assign CP_o[0]  = 5'b00000;
assign CP_o[1]  = ~A & ~B & ~C & ~D & E;
assign CP_o[2]  = ~A & ~B & ~C & D & ~E;
assign CP_o[3]  = ~A & ~B & ~C & D & E;
assign CP_o[4]  = ~A & ~B & C & ~D & ~E;
assign CP_o[5]  = ~A & ~B & C & ~D & E;
assign CP_o[6]  = ~A & ~B & C & D & ~E;
assign CP_o[7]  = ~A & ~B & C & D & E;
assign CP_o[8]  = ~A & B & ~C & ~D & ~E;
assign CP_o[9]  = ~A & B & ~C & ~D & E;
assign CP_o[10] = ~A & B & ~C & D & ~E;
assign CP_o[11] = ~A & B & ~C & D & E;
assign CP_o[12] = ~A & B & C & ~D & ~E;
assign CP_o[13] = ~A & B & C & ~D & E;
assign CP_o[14] = ~A & B & C & D & ~E;
assign CP_o[15] = ~A & B & C & D & E;
assign CP_o[16] = A & ~B & ~C & ~D & ~E;
assign CP_o[17] = A & ~B & ~C & ~D & E;
assign CP_o[18] = A & ~B & ~C & D & ~E;
assign CP_o[19] = A & ~B & ~C & D & E;
assign CP_o[20] = A & ~B & C & ~D & ~E;
assign CP_o[21] = A & ~B & C & ~D & E;
assign CP_o[22] = A & ~B & C & D & ~E;
assign CP_o[23] = A & ~B & C & D & E;
assign CP_o[24] = A & B & ~C & ~D & ~E;
assign CP_o[25] = A & B & ~C & ~D & E;
assign CP_o[26] = A & B & ~C & D & ~E;
assign CP_o[27] = A & B & ~C & D & E;
assign CP_o[28] = A & B & C & ~D & ~E;
assign CP_o[29] = A & B & C & ~D & E;
assign CP_o[30] = A & B & C & D & ~E;
assign CP_o[31] = A & B & C & D & E;

endmodule
