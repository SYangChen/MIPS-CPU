
module Shifter( in, shamt, ctl, out  ) ;

	input[31:0]		in ;		// 資料
	input[4:0]		shamt ;		// 位移量
	input[2:0]		ctl ;		// 控制訊號
	output[31:0]	out ;
	
	wire[31:0]		temp ;
	wire[31:0]		temp2 ;
	wire[31:0]		temp3 ;
	wire[31:0]		temp4 ;
	wire[31:0]		temp5 ;
	
	
	// assign temp = ( shamt[0] == 1'b1 ) ? {in[30:0],1'b0} : in ;
	// shift 1 bit
	assign temp[31] = shamt[0] ? in[30] : in[31] ;
	assign temp[30] = shamt[0] ? in[29] : in[30] ;
	assign temp[29] = shamt[0] ? in[28] : in[29] ;
	assign temp[28] = shamt[0] ? in[27] : in[28] ;
	assign temp[27] = shamt[0] ? in[26] : in[27] ;
	assign temp[26] = shamt[0] ? in[25] : in[26] ;	
	assign temp[25] = shamt[0] ? in[24] : in[25] ;
	assign temp[24] = shamt[0] ? in[23] : in[24] ;
	assign temp[23] = shamt[0] ? in[22] : in[23] ;
	assign temp[22] = shamt[0] ? in[21] : in[22] ;
	assign temp[21] = shamt[0] ? in[20] : in[21] ;
	assign temp[20] = shamt[0] ? in[19] : in[20] ;
	assign temp[19] = shamt[0] ? in[18] : in[19] ;
	assign temp[18] = shamt[0] ? in[17] : in[18] ;
	assign temp[17] = shamt[0] ? in[16] : in[17] ;
	assign temp[16] = shamt[0] ? in[15] : in[16] ;
	assign temp[15] = shamt[0] ? in[14] : in[15] ;
	assign temp[14] = shamt[0] ? in[13] : in[14] ;
	assign temp[13] = shamt[0] ? in[12] : in[13] ;
	assign temp[12] = shamt[0] ? in[11] : in[12] ;	
	assign temp[11] = shamt[0] ? in[10] : in[11] ;
	assign temp[10] = shamt[0] ? in[9] : in[10] ;
	assign temp[9] = shamt[0] ? in[8] : in[9] ;
	assign temp[8] = shamt[0] ? in[7] : in[8] ;
	assign temp[7] = shamt[0] ? in[6] : in[7] ;
	assign temp[6] = shamt[0] ? in[5] : in[6] ;
	assign temp[5] = shamt[0] ? in[4] : in[5] ;
	assign temp[4] = shamt[0] ? in[3] : in[4] ;
	assign temp[3] = shamt[0] ? in[2] : in[3] ;
	assign temp[2] = shamt[0] ? in[1] : in[2] ;
	assign temp[1] = shamt[0] ? in[0] : in[1] ;
	assign temp[0] = shamt[0] ? 1'b0 : in[0] ;
	// assign temp2 = ( shamt[1] == 1'b1 ) ? {temp[29:0],2'b0} : temp ;
	// shift 2 bit
	assign temp2[31] = shamt[1] ? temp[29] : temp[31] ;
	assign temp2[30] = shamt[1] ? temp[28] : temp[30] ;
	assign temp2[29] = shamt[1] ? temp[27] : temp[29] ;
	assign temp2[28] = shamt[1] ? temp[26] : temp[28] ;
	assign temp2[27] = shamt[1] ? temp[25] : temp[27] ;
	assign temp2[26] = shamt[1] ? temp[24] : temp[26] ;	
	assign temp2[25] = shamt[1] ? temp[23] : temp[25] ;
	assign temp2[24] = shamt[1] ? temp[22] : temp[24] ;
	assign temp2[23] = shamt[1] ? temp[21] : temp[23] ;
	assign temp2[22] = shamt[1] ? temp[20] : temp[22] ;
	assign temp2[21] = shamt[1] ? temp[19] : temp[21] ;
	assign temp2[20] = shamt[1] ? temp[18] : temp[20] ;
	assign temp2[19] = shamt[1] ? temp[17] : temp[19] ;
	assign temp2[18] = shamt[1] ? temp[16] : temp[18] ;
	assign temp2[17] = shamt[1] ? temp[15] : temp[17] ;
	assign temp2[16] = shamt[1] ? temp[14] : temp[16] ;
	assign temp2[15] = shamt[1] ? temp[13] : temp[15] ;
	assign temp2[14] = shamt[1] ? temp[12] : temp[14] ;
	assign temp2[13] = shamt[1] ? temp[11] : temp[13] ;
	assign temp2[12] = shamt[1] ? temp[10] : temp[12] ;	
	assign temp2[11] = shamt[1] ? temp[9] : temp[11] ;
	assign temp2[10] = shamt[1] ? temp[8] : temp[10] ;
	assign temp2[9] = shamt[1] ? temp[7] : temp[9] ;
	assign temp2[8] = shamt[1] ? temp[6] : temp[8] ;
	assign temp2[7] = shamt[1] ? temp[5] : temp[7] ;
	assign temp2[6] = shamt[1] ? temp[4] : temp[6] ;
	assign temp2[5] = shamt[1] ? temp[3] : temp[5] ;
	assign temp2[4] = shamt[1] ? temp[2] : temp[4] ;
	assign temp2[3] = shamt[1] ? temp[1] : temp[3] ;
	assign temp2[2] = shamt[1] ? temp[0] : temp[2] ;
	assign temp2[1] = shamt[1] ? 1'b0 : temp[1] ;
	assign temp2[0] = shamt[1] ? 1'b0 : temp[0] ;
	// assign temp3 = ( shamt[2] == 1'b1 ) ? {temp2[27:0],4'b0} : temp2 ;
	// shift 4 bit
	assign temp3[31] = shamt[2] ? temp2[27] : temp2[31] ;
	assign temp3[30] = shamt[2] ? temp2[26] : temp2[30] ;
	assign temp3[29] = shamt[2] ? temp2[25] : temp2[29] ;
	assign temp3[28] = shamt[2] ? temp2[24] : temp2[28] ;
	assign temp3[27] = shamt[2] ? temp2[23] : temp2[27] ;
	assign temp3[26] = shamt[2] ? temp2[22] : temp2[26] ;	
	assign temp3[25] = shamt[2] ? temp2[21] : temp2[25] ;
	assign temp3[24] = shamt[2] ? temp2[20] : temp2[24] ;
	assign temp3[23] = shamt[2] ? temp2[19] : temp2[23] ;
	assign temp3[22] = shamt[2] ? temp2[18] : temp2[22] ;
	assign temp3[21] = shamt[2] ? temp2[17] : temp2[21] ;
	assign temp3[20] = shamt[2] ? temp2[16] : temp2[20] ;
	assign temp3[19] = shamt[2] ? temp2[15] : temp2[19] ;
	assign temp3[18] = shamt[2] ? temp2[14] : temp2[18] ;
	assign temp3[17] = shamt[2] ? temp2[13] : temp2[17] ;
	assign temp3[16] = shamt[2] ? temp2[12] : temp2[16] ;
	assign temp3[15] = shamt[2] ? temp2[11] : temp2[15] ;
	assign temp3[14] = shamt[2] ? temp2[10] : temp2[14] ;
	assign temp3[13] = shamt[2] ? temp2[9] : temp2[13] ;
	assign temp3[12] = shamt[2] ? temp2[8] : temp2[12] ;	
	assign temp3[11] = shamt[2] ? temp2[7] : temp2[11] ;
	assign temp3[10] = shamt[2] ? temp2[6] : temp2[10] ;
	assign temp3[9] = shamt[2] ? temp2[5] : temp2[9] ;
	assign temp3[8] = shamt[2] ? temp2[4] : temp2[8] ;
	assign temp3[7] = shamt[2] ? temp2[3] : temp2[7] ;
	assign temp3[6] = shamt[2] ? temp2[2] : temp2[6] ;
	assign temp3[5] = shamt[2] ? temp2[1] : temp2[5] ;
	assign temp3[4] = shamt[2] ? temp2[0] : temp2[4] ;
	assign temp3[3] = shamt[2] ? 1'b0 : temp2[3] ;
	assign temp3[2] = shamt[2] ? 1'b0 : temp2[2] ;
	assign temp3[1] = shamt[2] ? 1'b0 : temp2[1] ;
	assign temp3[0] = shamt[2] ? 1'b0 : temp2[0] ;
	// assign temp4 = ( shamt[3] == 1'b1 ) ? {temp3[23:0],8'b0} : temp3 ;
	// shift 8 bit
	assign temp4[31] = shamt[3] ? temp3[23] : temp3[31] ;
	assign temp4[30] = shamt[3] ? temp3[22] : temp3[30] ;
	assign temp4[29] = shamt[3] ? temp3[21] : temp3[29] ;
	assign temp4[28] = shamt[3] ? temp3[20] : temp3[28] ;
	assign temp4[27] = shamt[3] ? temp3[19] : temp3[27] ;
	assign temp4[26] = shamt[3] ? temp3[18] : temp3[26] ;	
	assign temp4[25] = shamt[3] ? temp3[17] : temp3[25] ;
	assign temp4[24] = shamt[3] ? temp3[16] : temp3[24] ;
	assign temp4[23] = shamt[3] ? temp3[15] : temp3[23] ;
	assign temp4[22] = shamt[3] ? temp3[14] : temp3[22] ;
	assign temp4[21] = shamt[3] ? temp3[13] : temp3[21] ;
	assign temp4[20] = shamt[3] ? temp3[12] : temp3[20] ;
	assign temp4[19] = shamt[3] ? temp3[11] : temp3[19] ;
	assign temp4[18] = shamt[3] ? temp3[10] : temp3[18] ;
	assign temp4[17] = shamt[3] ? temp3[9] : temp3[17] ;
	assign temp4[16] = shamt[3] ? temp3[8] : temp3[16] ;
	assign temp4[15] = shamt[3] ? temp3[7] : temp3[15] ;
	assign temp4[14] = shamt[3] ? temp3[6] : temp3[14] ;
	assign temp4[13] = shamt[3] ? temp3[5] : temp3[13] ;
	assign temp4[12] = shamt[3] ? temp3[4] : temp3[12] ;	
	assign temp4[11] = shamt[3] ? temp3[3] : temp3[11] ;
	assign temp4[10] = shamt[3] ? temp3[2] : temp3[10] ;
	assign temp4[9] = shamt[3] ? temp3[1] : temp3[9] ;
	assign temp4[8] = shamt[3] ? temp3[0] : temp3[8] ;
	assign temp4[7] = shamt[3] ? 1'b0 : temp3[7] ;
	assign temp4[6] = shamt[3] ? 1'b0 : temp3[6] ;
	assign temp4[5] = shamt[3] ? 1'b0 : temp3[5] ;
	assign temp4[4] = shamt[3] ? 1'b0 : temp3[4] ;
	assign temp4[3] = shamt[3] ? 1'b0 : temp3[3] ;
	assign temp4[2] = shamt[3] ? 1'b0 : temp3[2] ;
	assign temp4[1] = shamt[3] ? 1'b0 : temp3[1] ;
	assign temp4[0] = shamt[3] ? 1'b0 : temp3[0] ;
	// assign temp5 = ( shamt[4] == 1'b1 ) ? {temp4[15:0],16'b0} : temp4 ;
	// shift 16 bit
	assign temp5[31] = shamt[4] ? temp4[15] : temp4[31] ;
	assign temp5[30] = shamt[4] ? temp4[14] : temp4[30] ;
	assign temp5[29] = shamt[4] ? temp4[13] : temp4[29] ;
	assign temp5[28] = shamt[4] ? temp4[12] : temp4[28] ;
	assign temp5[27] = shamt[4] ? temp4[11] : temp4[27] ;
	assign temp5[26] = shamt[4] ? temp4[10] : temp4[26] ;	
	assign temp5[25] = shamt[4] ? temp4[9] : temp4[25] ;
	assign temp5[24] = shamt[4] ? temp4[8] : temp4[24] ;
	assign temp5[23] = shamt[4] ? temp4[7] : temp4[23] ;
	assign temp5[22] = shamt[4] ? temp4[6] : temp4[22] ;
	assign temp5[21] = shamt[4] ? temp4[5] : temp4[21] ;
	assign temp5[20] = shamt[4] ? temp4[4] : temp4[20] ;
	assign temp5[19] = shamt[4] ? temp4[3] : temp4[19] ;
	assign temp5[18] = shamt[4] ? temp4[2] : temp4[18] ;
	assign temp5[17] = shamt[4] ? temp4[1] : temp4[17] ;
	assign temp5[16] = shamt[4] ? temp4[0] : temp4[16] ;
	assign temp5[15] = shamt[4] ? 1'b0 : temp4[15] ;
	assign temp5[14] = shamt[4] ? 1'b0 : temp4[14] ;
	assign temp5[13] = shamt[4] ? 1'b0 : temp4[13] ;
	assign temp5[12] = shamt[4] ? 1'b0 : temp4[12] ;	
	assign temp5[11] = shamt[4] ? 1'b0 : temp4[11] ;
	assign temp5[10] = shamt[4] ? 1'b0 : temp4[10] ;
	assign temp5[9] = shamt[4] ? 1'b0 : temp4[9] ;
	assign temp5[8] = shamt[4] ? 1'b0 : temp4[8] ;
	assign temp5[7] = shamt[4] ? 1'b0 : temp4[7] ;
	assign temp5[6] = shamt[4] ? 1'b0 : temp4[6] ;
	assign temp5[5] = shamt[4] ? 1'b0 : temp4[5] ;
	assign temp5[4] = shamt[4] ? 1'b0 : temp4[4] ;
	assign temp5[3] = shamt[4] ? 1'b0 : temp4[3] ;
	assign temp5[2] = shamt[4] ? 1'b0 : temp4[2] ;
	assign temp5[1] = shamt[4] ? 1'b0 : temp4[1] ;
	assign temp5[0] = shamt[4] ? 1'b0 : temp4[0] ;
	
	assign out = ( ctl == 3'b011 ) ? (( shamt > 31 ) ? 32'b0 : temp5 ) : out ;

	
endmodule