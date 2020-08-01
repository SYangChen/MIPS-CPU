`timescale 1ns/1ns
module ALUControl( clk, Signal, SignaltoALU, SignaltoSHT, SignaltoDIV, SignaltoMUX, SignaltoHiLo );
	input clk ;
	input[5:0]	Signal ;
	output[5:0]	SignaltoALU ;
	output[5:0]	SignaltoSHT ;
	output[5:0]	SignaltoDIV ;
	output[5:0]	SignaltoHiLo ;
	output[1:0]	SignaltoMUX ;

//   Signal ( 6-bits)?
//   AND  : 36
//   OR   : 37
//   ADD  : 32
//   SUB  : 34
//   SRL  : 2
//   SLT  : 42
//   DIVU : 27
//	 HiLo : 16 / 18

	reg[5:0]	SignaltoALU ;
	reg[5:0]	SignaltoSHT ;
	reg[5:0]	SignaltoDIV ;
	reg[5:0]	SignaltoHiLo ;
	reg [5:0] SignaltoMUX ;
	reg [5:0] temp ;
	reg [6:0] counter ;


	// parameter AND = 6'b100100;
	// parameter OR  = 6'b100101;
	// parameter ADD = 6'b100000;
	// parameter SUB = 6'b100010;
	// parameter SLT = 6'b101010;

	// parameter SLL = 6'b000000;

	// parameter DIVU= 6'b011011;
	// parameter MFHI= 6'b010000;
	// parameter MFLO= 6'b010010;
	
	always@( Signal )
	begin
		if ( Signal == 6'b011011 ) begin   // DIVU
			counter = 0 ;			// 如果訊號改變成除法 就把counter歸0
			SignaltoDIV = Signal ;
			SignaltoMUX = Signal ;
		end
		else begin
			SignaltoMUX = Signal ;
			SignaltoSHT = Signal ;
			SignaltoALU = Signal ;
			SignaltoHiLo = Signal ;
		end
	end

	always@( posedge clk )
	begin
		temp = Signal ;
		if ( Signal == 6'b011011 )  // DIVU
		begin
			counter = counter + 1 ;
			if ( counter == 32 )	// 數32個clk然後開啟HiLo暫存器給除法器放值進去
			begin
				SignaltoDIV = 6'b111111 ; // Open HiLo reg for Div
				counter = 0 ;
				// SignaltoDIV = temp ;
			end
		end  
	end

endmodule