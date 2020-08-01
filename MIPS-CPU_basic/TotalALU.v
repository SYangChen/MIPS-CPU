`timescale 1ns/1ns
module TotalALU( clk, reset, dataA, dataB, Signal, Output );
	input		reset ;
	input		clk ;
	input[31:0]	dataA ;
	input[31:0]	dataB ;
	input[5:0]	Signal ;
	output[31:0]Output ;

//   Signal ( 6-bits)?
//   AND  : 36
//   OR   : 37
//   ADD  : 32
//   SUB  : 34
//   SRL  : 2
//   SLT  : 42
//   DIVU : 27
/*
定義各種訊號
*/
//============================
	wire [5:0]  SignaltoALU ;
	wire [5:0]  SignaltoSHT ;
	wire [5:0]  SignaltoDIV ;
	wire [5:0]  SignaltoMUX ;
	wire [5:0]  SignaltoHiLo ;
	wire [31:0] ALUOut, HiOut, LoOut, ShifterOut ;
	wire [31:0] dataOut ;
	wire [63:0] DivAns ;
/*
定義各種接線
*/
//============================
ALUControl ALUControl( clk, Signal, SignaltoALU, SignaltoSHT, SignaltoDIV, SignaltoMUX, SignaltoHiLo );
ALU_32b ALU_32b( dataA, dataB, SignaltoALU, ALUOut ) ;
Divider Divider( clk, reset, dataA, dataB, SignaltoDIV, DivAns );
Shifter Shifter( dataA, dataB, SignaltoSHT, ShifterOut  ) ;
HiLo HiLo( clk, DivAns, SignaltoHiLo, HiOut, LoOut, reset );
MUX MUX( ALUOut, HiOut, LoOut, ShifterOut, SignaltoMUX, dataOut );
// -------------------------------
/*
建立各種module
*/
assign Output = dataOut ;


endmodule