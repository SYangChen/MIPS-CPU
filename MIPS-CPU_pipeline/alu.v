/*
	Title:	ALU
	Input Port
		1. ctl: 由alu_ctl解碼完的控制訊號
		2. a:   inputA,第一筆要處理的資料
		3. b:   inputB,第二筆要處理的資料
	Output Port
		1. result: 最後處理完的結果
		2. zero:   branch指令所需要之輸出
*/

module alu( a, b, ctl, result, zero ) ;

	input[31:0]		a ;
	input[31:0]		b ;
	input[2:0]		ctl ;
	output[31:0]	result ;
	output			zero ;
	
	wire		less, binvert, set, trash ;
	wire[1:0]	sel ;
	wire[31:0]	temp, cout ;
	wire		BinvertCarry ;
	
	parameter AND = 3'b000 ;
	parameter OR  = 3'b001 ;
	parameter ADD = 3'b010 ;
	parameter SUB = 3'b110 ;
	parameter SLT = 3'b111 ;
	parameter SLL = 3'b011 ;
	//   ctl ( 3-bits)	/ sel / BinvertCarry
	//   AND  : 000		/ 00  / 0	
	//   OR   : 001		/ 01  / 0		
	//   ADD  : 010		/ 10  / 0	
	//   SUB  : 110		/ 10  / 1	
	//   SLT  : 111		/ 11  / 1	
	//	 SLL  : 011		/ 11  / 0
	
	assign binvert = ( ctl[2] == 1 ) ? 1'b1 : 1'b0 ; 		// SLT || SUB -> binvert = 1
	assign sel = ( ctl == AND ) ? 2'b00 :					// AND
				 ( ctl == OR ) ? 2'b01 :					// OR
				 ( ctl == ADD || ctl == SUB ) ? 2'b10 :		// ADD & SUB
									 2'b11 ;				// SLT
									 
	assign less = 1'b0 ;
	assign BinvertCarry = ( ctl == SUB || ctl == SLT ) ? 1'b1 : 1'b0 ; // SLT || SUB -> cin = 1
	
	
	Mux_1bALU b1( a[0], b[0], BinvertCarry, less, binvert, sel, cout[0], temp[0], trash );
	Mux_1bALU b2( a[1], b[1], cout[0], less, binvert, sel, cout[1], temp[1], trash );
	Mux_1bALU b3( a[2], b[2], cout[1], less, binvert, sel, cout[2], temp[2], trash );
	Mux_1bALU b4( a[3], b[3], cout[2], less, binvert, sel, cout[3], temp[3], trash );
	Mux_1bALU b5( a[4], b[4], cout[3], less, binvert, sel, cout[4], temp[4], trash );
	Mux_1bALU b6( a[5], b[5], cout[4], less, binvert, sel, cout[5], temp[5], trash );
	Mux_1bALU b7( a[6], b[6], cout[5], less, binvert, sel, cout[6], temp[6], trash );
	Mux_1bALU b8( a[7], b[7], cout[6], less, binvert, sel, cout[7], temp[7], trash );
	Mux_1bALU b9( a[8], b[8], cout[7], less, binvert, sel, cout[8], temp[8], trash );
	Mux_1bALU b10( a[9], b[9], cout[8], less, binvert, sel, cout[9], temp[9], trash );
	Mux_1bALU b11( a[10], b[10], cout[9], less, binvert, sel, cout[10], temp[10], trash );
	Mux_1bALU b12( a[11], b[11], cout[10], less, binvert, sel, cout[11], temp[11], trash );
	Mux_1bALU b13( a[12], b[12], cout[11], less, binvert, sel, cout[12], temp[12], trash );
	Mux_1bALU b14( a[13], b[13], cout[12], less, binvert, sel, cout[13], temp[13], trash );
	Mux_1bALU b15( a[14], b[14], cout[13], less, binvert, sel, cout[14], temp[14], trash );
	Mux_1bALU b16( a[15], b[15], cout[14], less, binvert, sel, cout[15], temp[15], trash );
	Mux_1bALU b17( a[16], b[16], cout[15], less, binvert, sel, cout[16], temp[16], trash );
	Mux_1bALU b18( a[17], b[17], cout[16], less, binvert, sel, cout[17], temp[17], trash );
	Mux_1bALU b19( a[18], b[18], cout[17], less, binvert, sel, cout[18], temp[18], trash );
	Mux_1bALU b20( a[19], b[19], cout[18], less, binvert, sel, cout[19], temp[19], trash );
	Mux_1bALU b21( a[20], b[20], cout[19], less, binvert, sel, cout[20], temp[20], trash );
	Mux_1bALU b22( a[21], b[21], cout[20], less, binvert, sel, cout[21], temp[21], trash );
	Mux_1bALU b23( a[22], b[22], cout[21], less, binvert, sel, cout[22], temp[22], trash );
	Mux_1bALU b24( a[23], b[23], cout[22], less, binvert, sel, cout[23], temp[23], trash );
	Mux_1bALU b25( a[24], b[24], cout[23], less, binvert, sel, cout[24], temp[24], trash );
	Mux_1bALU b26( a[25], b[25], cout[24], less, binvert, sel, cout[25], temp[25], trash );
	Mux_1bALU b27( a[26], b[26], cout[25], less, binvert, sel, cout[26], temp[26], trash );
	Mux_1bALU b28( a[27], b[27], cout[26], less, binvert, sel, cout[27], temp[27], trash );
	Mux_1bALU b29( a[28], b[28], cout[27], less, binvert, sel, cout[28], temp[28], trash );
	Mux_1bALU b30( a[29], b[29], cout[28], less, binvert, sel, cout[29], temp[29], trash );
	Mux_1bALU b31( a[30], b[30], cout[29], less, binvert, sel, cout[30], temp[30], trash );
	Mux_1bALU b32( a[31], b[31], cout[30], less, binvert, sel, cout[31], temp[31], set );

	
	
	assign result =  ( ctl == SLT ) ? { temp[31:1], set } : temp  ;
	// 如果是執行STL，結果最低位元需設為最高位元的carryout(set)
	// 如果是其他，將result設為ALU計算結果
	assign zero = ( result == 32'd0 ) ? 32'd1 : 32'd0 ;
	// 若執行SLT結果為0代表inputA、B相等，將zero設為1(true)

endmodule
