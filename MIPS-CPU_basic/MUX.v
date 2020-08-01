`timescale 1ns/1ns
module MUX( ALUOut, HiOut, LoOut, Shifter, Signal, dataOut );

	input [31:0] ALUOut ;
	input [31:0] HiOut ;
	input [31:0] LoOut ;
	input [31:0] Shifter ;
	input [5:0] Signal ;
	output [31:0] dataOut ;
	
	wire [1:0] Sel ;
	
	assign Sel = ( Signal == 6'b100100 ) ? 2'b00 :
				 ( Signal == 6'b100101 ) ? 2'b00 :
				 ( Signal == 6'b100000 ) ? 2'b00 :
				 ( Signal == 6'b100010 ) ? 2'b00 :
				 ( Signal == 6'b101010 ) ? 2'b00 :
				 ( Signal == 6'b010000 ) ? 2'b01 :
				 ( Signal == 6'b010010 ) ? 2'b10 :
										   2'b11 ;
										   
	assign dataOut = ( Signal == 6'b011011 ) ? 0 : ( Sel[1] ) ? ( Sel[0] ? Shifter : LoOut ) : ( Sel[0] ? HiOut : ALUOut ) ;
	
endmodule