module SignExtend
(
	input [15:0] Sign_Ex_i,
	output wire [31:0] Sign_Ex_o

);

assign Sign_Ex_o = { {16{Sign_Ex_i[15]}}, Sign_Ex_i};
endmodule
