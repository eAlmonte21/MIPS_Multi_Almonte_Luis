/*
* Description
*	Instantiation of FlipFlop
* Author:
*	Ing. Luis Eduardo Almonte De Luna
* Date:
*	21/11/2021
*/
module ff_inst
#(
	parameter WORD_LENGTH = 32
	
)
	
(
	input clk,
	input reset,
	input Reg_Write_i,
	input [WORD_LENGTH-1 : 0] data_in,
	input [WORD_LENGTH-1:0] CP_o,
	
	output [WORD_LENGTH-1:0] Q, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15,
	output [WORD_LENGTH-1:0] Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31
	
);

//wire [WORD_LENGTH-1 : 0] Q [WORD_LENGTH-1 : 0];
wire [WORD_LENGTH-1 : 0] en;
generate 
	genvar i;
	for(i = 0; i < 32; i = i+1) begin: instanciacion_ff
		and sel (en[i], Reg_Write_i, CP_o[i]);
		//Flip_Flop register (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[i]), .data_out(data_out[i]));
	end
	
endgenerate


Flip_Flop Reg1  (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[0]), .data_out(Q));
Flip_Flop Reg2  (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[1]), .data_out(Q1));	
Flip_Flop Reg3  (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[2]), .data_out(Q2));	
Flip_Flop Reg4  (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[3]), .data_out(Q3));	
Flip_Flop Reg5  (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[4]), .data_out(Q4));	
Flip_Flop Reg6  (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[5]), .data_out(Q5));	
Flip_Flop Reg7  (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[6]), .data_out(Q6));	
Flip_Flop Reg8  (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[7]), .data_out(Q7));

Flip_Flop Reg9  (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[8]), .data_out(Q8));
Flip_Flop Reg10 (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[9]), .data_out(Q9));
Flip_Flop Reg11 (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[10]), .data_out(Q10));
Flip_Flop Reg12 (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[11]), .data_out(Q11));
Flip_Flop Reg13 (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[12]), .data_out(Q12));
Flip_Flop Reg14 (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[13]), .data_out(Q13));
Flip_Flop Reg15 (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[14]), .data_out(Q14));
Flip_Flop Reg16 (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[15]), .data_out(Q15));

Flip_Flop Reg17 (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[16]), .data_out(Q16));
Flip_Flop Reg18 (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[17]), .data_out(Q17));
Flip_Flop Reg19 (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[18]), .data_out(Q18));
Flip_Flop Reg20 (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[19]), .data_out(Q19));
Flip_Flop Reg21 (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[20]), .data_out(Q20));
Flip_Flop Reg22 (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[21]), .data_out(Q21));
Flip_Flop Reg23 (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[22]), .data_out(Q22));
Flip_Flop Reg24 (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[23]), .data_out(Q23));

Flip_Flop Reg25 (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[24]), .data_out(Q24));
Flip_Flop Reg26 (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[25]), .data_out(Q25));
Flip_Flop Reg27 (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[26]), .data_out(Q26));
Flip_Flop Reg28 (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[27]), .data_out(Q27));
Flip_Flop Reg29 (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[28]), .data_out(Q28));
Flip_Flop Reg30 (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[29]), .data_out(Q29));
Flip_Flop Reg31 (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[30]), .data_out(Q30));	
Flip_Flop Reg32 (.data_in(data_in), .clk(clk), .reset(reset), .enable(en[31]), .data_out(Q31));		
	

endmodule
