/*
* Description:
*	MIPS_Multi_Cycle
* Author:
*	Ing. Luis Eduardo Almonte De Luna
* Date:
*	05/12/2021
*/
module MIPS_Multi_Cycle
#(
	parameter DATA_WIDTH = 32
)

(

		input IorD, MemWrite, IRWrite, PCSrc, RegWrite, PCEn, RegDst, MemtoReg, ALUSrcA, 
		input  PCWrite, Branch,
		input [2:0] ALUControl,
		input [1:0] ALUSrcB,
		input clk,reset,
		output [5:0]Op, 
		output [5:0] Funct, 
		output zero,
		output [7:0] GPIO_O

);

wire [DATA_WIDTH-1:0] Q; //PC_Out
wire [DATA_WIDTH-1:0] Address_i; //mux1o
wire [DATA_WIDTH-1:0] Read_Data; //Mem_o
wire [DATA_WIDTH-1:0] Q2; //inst_reg_o
wire [DATA_WIDTH-1:0] Q3; //
wire [DATA_WIDTH-1:0] Q4;
wire [DATA_WIDTH-1:0] RD1;
wire [DATA_WIDTH-1:0] RD2;
wire [DATA_WIDTH-1:0] Q5;
wire [DATA_WIDTH-1:0] Q6;
wire [DATA_WIDTH-1:0] Write_R_i;
wire [DATA_WIDTH-1:0] A;
wire [DATA_WIDTH-1:0] B;
wire [DATA_WIDTH-1:0] Y; //ALU 
wire [DATA_WIDTH-1:0] SE;
wire [DATA_WIDTH-1:0] D_O;
wire [DATA_WIDTH-1:0] D_O_M;
wire [4:0] WD; 
wire z;

assign zero = z;
assign Op [5:0] = Q2 [31:26];
assign Funct [5:0] = Q2 [5:0];
assign GPIO_O [7:0] = Y[7:0];


//////MEMORY_SYSTEM/////
Memory_System_Wrapper Mem_S (.Write_Data(Q5), 
							  .Address_i(Address_i), 
						 .Instruction_o(Read_Data), 
						 .Write_Enable_i(MemWrite), 
											 .clk(clk));

////REGISTER FILE/////
Wrapper_Register_File Reg_F (.rs(Write_R_i), //WRITE REGISTER
									  .rt(Q2[25:21]), //READ REGISTER 1 //A1
									  .rd(Q2[20:16]), //READ REGISTER 2 //A2
											 .R_rd(WD), //WRITE DATA  		//WD3
										  .clock(clk), //CLOCK
									   .reset(reset), //RESET
							.Reg_Write_i(RegWrite), //WRITE ENABLE  	//WE3
											.R_rs(RD1),	
										  .R_rt(RD2));
						
/////PROGRAM COUNTER/////
Program_Counter PC  (.data_in(D_O_M), 
									.clk(clk), 
							  .reset(reset), 
							  .enable(PCEn), 
							  .data_out(Q)); 

/////MODULO MUX 2to1 to ADDRESS (MEM_SYS)/////
MUX_2to1 UUT (.sel(IorD), 
    .Data_out(Address_i), 
	              .x(D_O), 
					   .y(Q));
						
////mux to A3 (register file)////
MUX_2to1  #(.DATA_WIDTH(5)) mux2 (.sel(MemtoReg), 
											  .Data_out(WD), 
											  .x(Q3[20:16]),
											.y(D_O[15:11]));
											
////mux to ALU 
MUX_2to1 mux3 (.sel(ALUSrcA),
					 .Data_out(A),
							 .x(Q4),
							 .y(Q));

////mux to WD3 register file
MUX_2to1 mux4 (.sel(RegDst),
		 .Data_out(Write_R_i), 
							.x(Q2), 
						  .y(Q2));
////mux to data_in PC
MUX_2to1 mux5 (.sel(PCSrc),
			 .Data_out(D_O_M), 
							.x(Y),
						.y(D_O));

/////MODULO 4 TO 1/////
MUX_4to1 mux  (.Sel(ALUSrcB), 
					 .Data_out(B), 
						    .w(Q5), 
						 .x(32'h4), 
						    .y(SE), 
					 .z(SE << 2));

/////MODULO REGISTROS/////
///Register to Op & Funct...
Flip_Flop Reg2  (.data_in(Read_Data),
									.clk(clk), 
							  .reset(reset),
								  .enable(IRWrite), 
							 .data_out(Q2));
////Register to mux2
Flip_Flop Reg3  (.data_in(Read_Data),
									.clk(clk), 
							  .reset(reset), 
						  .enable(1), 
							 .data_out(Q3));
////Register to mux3
Flip_Flop Reg4  (.data_in(RD1),
							.clk(clk),
				     .reset(reset), 
					     .enable(1), 
					 .data_out(Q4));
////Register to WD(Mem_sys) & mux 4to1
Flip_Flop Reg5  (.data_in(RD2),
							.clk(clk), 
					  .reset(reset), 
					     .enable(1), 
					 .data_out(Q5));
////Register to mux5
Flip_Flop Reg6  (.data_in(Y), 
						 .clk(clk), 
					.reset(reset), 
					   .enable(1), 
				 .data_out(D_O));

/////MODULO ALU/////
ALU alu (.y(Y), 
			.a(A), 
			.b(B), 
			.select(ALUControl), 
			.zero(z));

////SIGN_EXTEND
SignExtend Sign (.Sign_Ex_i(Q2[15:0]), 
							 .Sign_Ex_o(SE));

endmodule
