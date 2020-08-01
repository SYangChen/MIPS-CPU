
module ID_EX( clk, in_ctl, RegDst, ALUSrc, ALUOp, Branch, out_ctl, in_rt, in_rd, in_imm, in_pc, 
				  in_rd1, in_rd2, out_rt, out_rd, out_imm, out_pc, out_rd1, out_rd2 );
	input clk ;
	input [9:0] in_ctl ;
	input [4:0] in_rt, in_rd ;
	input [31:0] in_imm, in_pc, in_rd1, in_rd2 ;

	output [31:0] out_imm, out_pc, out_rd1, out_rd2 ;
	output [4:0] out_rt, out_rd;
	output [4:0] out_ctl ; 
	output [1:0] ALUOp ;	
	output RegDst, ALUSrc, Branch;
	

	reg [31:0] out_imm, out_pc, out_rd1, out_rd2 ;
	reg [4:0] out_rt, out_rd ;
	reg [4:0] out_ctl ; 	
	reg [1:0] ALUOp ;
	reg RegDst, ALUSrc, Branch ;

	initial begin
		RegDst = 1'b0 ;
		ALUSrc = 1'b0 ;
		ALUOp = 2'b0 ;
		Branch = 1'b0 ;
		out_ctl = 5'b0 ;
		out_rt = 5'b0 ;
		out_rd = 5'b0;
		out_imm = 32'b0 ;
		out_pc = 32'b0 ;
		out_rd1 = 32'b0 ;
		out_rd2 = 32'b0;
	end

	
	always @( posedge clk ) begin
		RegDst = in_ctl[9] ;
		ALUSrc = in_ctl[8] ;
		ALUOp = {in_ctl[7], in_ctl[6]} ;
		Branch = in_ctl[5] ;
		out_ctl = in_ctl[4:0] ;
		out_rt = in_rt ;
		out_rd = in_rd ;
		out_imm = in_imm ;
		out_pc = in_pc ;
		out_rd1 = in_rd1 ;
		out_rd2 = in_rd2;
	end
	
endmodule
