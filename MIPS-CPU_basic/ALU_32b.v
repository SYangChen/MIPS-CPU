`timescale 1ns/1ns
module ALU_32b( inputA, inputB, Signal, S ) ;

	input[31:0]		inputA ;
	input[31:0]		inputB ;
	input[5:0]		Signal ;
	output[31:0]	S ;
	
	wire		less, binvert, set, trash ;
	wire[1:0]	sel ;
	wire[31:0]	temp, cout ;
	wire		BinvertCarry ;
	//   Signal ( 6-bits)?
	//   AND  : 000		/	36	/	100100
	//   OR   : 001		/	37	/	100101
	//   ADD  : 010		/	32	/	100000
	//   SUB  : 110		/	34	/	100010
	//   SLT  : 111		/	42	/	101010
	
	assign binvert = ( Signal[1] == 0 ) ? 1'b0 : 1'b1 ;
	assign sel = ( Signal == 6'b100100 ) ? 2'b00 :
				 ( Signal == 6'b100101 ) ? 2'b01 :
				 ( Signal == 6'b100000 ) ? 2'b10 :
				 ( Signal == 6'b100010 ) ? 2'b10 :
										   2'b11 ;
	assign less = 1'b0 ;
	assign BinvertCarry = ( Signal == 6'b100010 || Signal == 6'b101010 ) ? 1'b1 : 1'b0 ;
	
	
	Mux_1bALU b1( inputA[0], inputB[0], BinvertCarry, less, binvert, sel, cout[0], temp[0], trash );
	Mux_1bALU b2( inputA[1], inputB[1], cout[0], less, binvert, sel, cout[1], temp[1], trash );
	Mux_1bALU b3( inputA[2], inputB[2], cout[1], less, binvert, sel, cout[2], temp[2], trash );
	Mux_1bALU b4( inputA[3], inputB[3], cout[2], less, binvert, sel, cout[3], temp[3], trash );
	Mux_1bALU b5( inputA[4], inputB[4], cout[3], less, binvert, sel, cout[4], temp[4], trash );
	Mux_1bALU b6( inputA[5], inputB[5], cout[4], less, binvert, sel, cout[5], temp[5], trash );
	Mux_1bALU b7( inputA[6], inputB[6], cout[5], less, binvert, sel, cout[6], temp[6], trash );
	Mux_1bALU b8( inputA[7], inputB[7], cout[6], less, binvert, sel, cout[7], temp[7], trash );
	Mux_1bALU b9( inputA[8], inputB[8], cout[7], less, binvert, sel, cout[8], temp[8], trash );
	Mux_1bALU b10( inputA[9], inputB[9], cout[8], less, binvert, sel, cout[9], temp[9], trash );
	Mux_1bALU b11( inputA[10], inputB[10], cout[9], less, binvert, sel, cout[10], temp[10], trash );
	Mux_1bALU b12( inputA[11], inputB[11], cout[10], less, binvert, sel, cout[11], temp[11], trash );
	Mux_1bALU b13( inputA[12], inputB[12], cout[11], less, binvert, sel, cout[12], temp[12], trash );
	Mux_1bALU b14( inputA[13], inputB[13], cout[12], less, binvert, sel, cout[13], temp[13], trash );
	Mux_1bALU b15( inputA[14], inputB[14], cout[13], less, binvert, sel, cout[14], temp[14], trash );
	Mux_1bALU b16( inputA[15], inputB[15], cout[14], less, binvert, sel, cout[15], temp[15], trash );
	Mux_1bALU b17( inputA[16], inputB[16], cout[15], less, binvert, sel, cout[16], temp[16], trash );
	Mux_1bALU b18( inputA[17], inputB[17], cout[16], less, binvert, sel, cout[17], temp[17], trash );
	Mux_1bALU b19( inputA[18], inputB[18], cout[17], less, binvert, sel, cout[18], temp[18], trash );
	Mux_1bALU b20( inputA[19], inputB[19], cout[18], less, binvert, sel, cout[19], temp[19], trash );
	Mux_1bALU b21( inputA[20], inputB[20], cout[19], less, binvert, sel, cout[20], temp[20], trash );
	Mux_1bALU b22( inputA[21], inputB[21], cout[20], less, binvert, sel, cout[21], temp[21], trash );
	Mux_1bALU b23( inputA[22], inputB[22], cout[21], less, binvert, sel, cout[22], temp[22], trash );
	Mux_1bALU b24( inputA[23], inputB[23], cout[22], less, binvert, sel, cout[23], temp[23], trash );
	Mux_1bALU b25( inputA[24], inputB[24], cout[23], less, binvert, sel, cout[24], temp[24], trash );
	Mux_1bALU b26( inputA[25], inputB[25], cout[24], less, binvert, sel, cout[25], temp[25], trash );
	Mux_1bALU b27( inputA[26], inputB[26], cout[25], less, binvert, sel, cout[26], temp[26], trash );
	Mux_1bALU b28( inputA[27], inputB[27], cout[26], less, binvert, sel, cout[27], temp[27], trash );
	Mux_1bALU b29( inputA[28], inputB[28], cout[27], less, binvert, sel, cout[28], temp[28], trash );
	Mux_1bALU b30( inputA[29], inputB[29], cout[28], less, binvert, sel, cout[29], temp[29], trash );
	Mux_1bALU b31( inputA[30], inputB[30], cout[29], less, binvert, sel, cout[30], temp[30], trash );
	Mux_1bALU b32( inputA[31], inputB[31], cout[30], less, binvert, sel, cout[31], temp[31], set );

	assign S[31:1] = temp[31:1] ;
	assign S[0] = ( {binvert, sel} == 3'b111 ) ? set : temp[0] ;

	
endmodule
