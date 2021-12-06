module MUX_4to1
#(
	parameter WIDTH = 32
	
)
(
	/*input [WIDTH-1:0] w, x, y, z,
   input [1:0] Sel,
   output [WIDTH-1:0] Data_out*/
	
	input [WIDTH-1:0] w, x, y, z,
   input [1:0] Sel,
	
   output reg [WIDTH-1:0] Data_out
);

reg [WIDTH-1:0] value = 32'b0000_0000_0000_0000_0000_0000_0000_0100;

	localparam S0 = 2'b00;
   localparam S1 = 2'b01;
   localparam S2 = 2'b10;
   localparam S3 = 2'b11;

   always @ (*)
   begin
      case(Sel)
			default:
				Data_out = w;
         S1: begin
            Data_out = x;
         end
         S2: begin
            Data_out = value;
         end
         S3: begin
            Data_out = z;
         end
			endcase
   end
endmodule






/*reg [WIDTH-1:0] d_out;
always @(*)
begin
	case (Sel)
	0: begin
	   d_out = w;
	end
	
	1: begin
	   d_out = x;
	end
	2: begin
	   d_out = y;
	end
	3: begin
	   d_out = z;
	end	
endcase
end
	assign Data_out = d_out;*/