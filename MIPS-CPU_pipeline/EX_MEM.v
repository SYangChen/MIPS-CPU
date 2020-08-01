
				  
module EX_MEM( clk, in_ctl, MemWrite, MemRead, out_ctl, in_b_tgt, in_alu_out, in_rd2, in_wn, in_pc,
				out_b_tgt, out_alu_out, out_rd2, out_wn, out_pc ) ;
	input clk ;
	input [4:0] in_wn ;
	input [4:0] in_ctl ; 
	input [31:0] in_b_tgt, in_alu_out, in_rd2, in_pc ;
	
	output MemWrite, MemRead;
	output [2:0] out_ctl ;
	output [4:0] out_wn ;
	output [31:0] out_b_tgt, out_alu_out, out_rd2, out_pc ;

	
	reg MemWrite, MemRead;
	reg [2:0] out_ctl ;
	reg [4:0] out_wn ;
	reg [31:0] out_b_tgt, out_alu_out, out_rd2, out_pc ;
	initial begin
		MemRead = 1'b0 ;
		MemWrite = 1'b0 ;
		out_ctl = 3'b0 ;
		out_wn = 5'b0 ;
		out_b_tgt = 32'b0 ;
		out_alu_out = 32'b0 ;
		out_rd2 = 32'b0;
		out_pc = 32'b0 ;
	end
	
	always @( posedge clk ) begin
		
		MemRead = in_ctl[4] ;
		MemWrite = in_ctl[3] ;
		out_ctl = in_ctl[2:0] ;
		out_wn = in_wn ;
		out_b_tgt = in_b_tgt ;
		out_alu_out = in_alu_out ;
		out_rd2 = in_rd2;
		out_pc = in_pc ;

	end
	
endmodule