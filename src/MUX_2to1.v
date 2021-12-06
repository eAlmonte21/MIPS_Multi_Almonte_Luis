module MUX_2to1
#(
	parameter DATA_WIDTH = 32
	
 )
	
(
	 input  [DATA_WIDTH-1:0] 	  x, y,
    input  								sel,
    output [DATA_WIDTH-1:0] Data_out
	 
);
	  
	 assign Data_out = sel ? x:y;
	 
endmodule
