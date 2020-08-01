`timescale 1ns/1ns
module HiLo( clk, DivAns, Signal, HiOut, LoOut, reset );
	input			clk ;
	input			reset ;
	input[63:0]		DivAns ;
	input[5:0]		Signal ;
	output[31:0]	HiOut ;
	output[31:0]	LoOut ;

	reg[31:0]	HiOut ;
	reg[31:0]	LoOut ;
	reg[63:0]	HiLo ;
	
	
	// parameter MFHI= 6'b010000;
	// parameter MFLO= 6'b010010;
	
	always@( posedge clk or reset ) 
	begin
		if ( reset )
			HiLo <= 64'b0 ;
		else begin
			HiLo = DivAns ;
			// if ( Signal == 6'b010000 )
			HiOut = HiLo[63:32] ;
			// if ( Signal == 6'b010010 )
			LoOut = HiLo[31:0] ;
		end
	end
endmodule
