`timescale 1ns/1ns
module Divider( clk, reset, dataA, dataB, Signal, dataOut );

	input clk ;
	input reset ;
	input[31:0]		dataA ;
	input[31:0]		dataB ;
	input[5:0]		Signal ;
	output[63:0]	dataOut ;
	reg[63:0]		dataOut ;
	
	reg[31:0]		resultSub ;
	reg				LSB ;
	reg[31:0]		divisor ;		// 除數 "B"
	reg[63:0]		temp ;			// dividend被除數 "A" 放在右半邊 LHREM 
	//  Signal ( 6-bits)?
	//  DIVU  : 27   / 011011
	//	OUT	  : 127  / 111111

	always@( Signal )
	begin
		if ( Signal == 6'b011011 ) begin
			divisor <= dataB ;
			temp[32:1] <= dataA ;     // 直接先SL 1bit
		end
		if ( Signal == 6'b111111 ) begin
			dataOut <= { 1'b0, temp[63:33], temp[31:0] } ;
			temp <= 64'b0 ;
		end
		
	end

	always@( posedge clk or reset )
	begin
		if ( reset == 1'b1 )
			temp <= 64'b0 ;
		else begin
			resultSub = temp[63:32]-divisor ;
			LSB = ~resultSub[31] ;
			if ( LSB == 1'b1 ) begin
				temp[63:32] = resultSub ;
				temp = { temp[62:0], 1'b1 } ;
			end
			if ( LSB == 1'b0 )
				temp = { temp[62:0], 1'b0 } ;
		end
	end
endmodule
