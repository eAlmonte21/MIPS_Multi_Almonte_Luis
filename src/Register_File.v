/*
* Description
*	Register file.
* Author:
*	Ing. Luis Eduardo Almonte De Luna
* Date:
*	21/11/2021
*/


module Register_File #(
	
	parameter WIDTH = 32
	
)
(

	input clock,
	input reset,
	input Reg_Write_i,
	input [4:0] Write_Register_i, //rs
	input [4:0] Read_Register_1_i, //rt
	input [4:0] Read_Register_2_i, //rd
	input [WIDTH-1:0] Write_Data_i, //R[rd]
	
	output [WIDTH-1:0] Read_Data_1_o, //R[rs]
	output [WIDTH-1:0] Read_Data_2_o //R[rt]
);
	
wire [WIDTH-1:0] Q [0:31];
wire [WIDTH-1:0] CP_o;

ff_inst registers (.data_in(Write_Data_i), .clk(clock), .reset(reset), .Reg_Write_i(Reg_Write_i), .CP_o(CP_o), .Q(Q[0]), .Q1(Q[1]), .Q2(Q[2]), .Q3(Q[3]), 
.Q4(Q[4]), .Q5(Q[5]), .Q6(Q[6]), .Q7(Q[7]), .Q8(Q[8]), .Q9(Q[9]), .Q10(Q[10]), .Q11(Q[11]), .Q12(Q[12]), .Q13(Q[13]),
.Q14(Q[14]), .Q15(Q[15]), .Q16(Q[16]), .Q17(Q[17]), .Q18(Q[18]), .Q19(Q[19]), .Q20(Q[20]), .Q21(Q[21]), .Q22(Q[22]), 
.Q23(Q[23]), .Q24(Q[24]), .Q25(Q[25]), .Q26(Q[26]), .Q27(Q[27]), .Q28(Q[28]), .Q29(Q[29]), .Q30(Q[30]), .Q31(Q[31])
);



MUX mux1 (.data_0(Q[0]), .data_1(Q[1]), .data_2(Q[2]), .data_3(Q[3]), .data_4(Q[4]), .data_5(Q[5]),
	.data_6(Q[6]), .data_7(Q[7]), .data_8(Q[8]), .data_9(Q[9]), .data_10(Q[10]), .data_11(Q[11]),
	.data_12(Q[12]), .data_13(Q[13]), .data_14(Q[14]), .data_15(Q[15]), .data_16(Q[16]), .data_17(Q[17]),
	.data_18(Q[18]), .data_19(Q[19]), .data_20(Q[20]), .data_21(Q[21]), .data_22(Q[22]), .data_23(Q[23]),
	.data_24(Q[24]), .data_25(Q[25]), .data_26(Q[26]), .data_27(Q[27]), .data_28(Q[28]), .data_29(Q[29]),
	.data_30(Q[30]), .data_31(Q[31]), .selec(Read_Register_1_i), .d_out(Read_Data_1_o));
	

MUX mux2 (.data_0(Q[0]), .data_1(Q[1]), .data_2(Q[2]), .data_3(Q[3]), .data_4(Q[4]), .data_5(Q[5]),
	.data_6(Q[6]), .data_7(Q[7]), .data_8(Q[8]), .data_9(Q[9]), .data_10(Q[10]), .data_11(Q[11]),
	.data_12(Q[12]), .data_13(Q[13]), .data_14(Q[14]), .data_15(Q[15]), .data_16(Q[16]), .data_17(Q[17]),
	.data_18(Q[18]), .data_19(Q[19]), .data_20(Q[20]), .data_21(Q[21]), .data_22(Q[22]), .data_23(Q[23]),
	.data_24(Q[24]), .data_25(Q[25]), .data_26(Q[26]), .data_27(Q[27]), .data_28(Q[28]), .data_29(Q[29]),
	.data_30(Q[30]), .data_31(Q[31]), .selec(Read_Register_2_i), .d_out(Read_Data_2_o));
	

priority_encoder CP (.Write_Register_i(Write_Register_i), .CP_o(CP_o));
endmodule	