				  
module MEM_WB( clk, in_ctl, RegWrite, MemtoReg, Jal, in_dmem_rdata, in_alu_out, in_wn, in_pc, out_dmem_rdata, out_alu_out, out_wn, out_pc );
	input clk ;
	input [2:0] in_ctl ;
	input [4:0] in_wn ;
	input [31:0] in_dmem_rdata, in_alu_out, in_pc ;
	
	output RegWrite, MemtoReg, Jal;
	output [4:0] out_wn ;
	output [31:0] out_dmem_rdata , out_alu_out, out_pc ;

	
	reg RegWrite, MemtoReg, Jal;
	reg [4:0] out_wn ;
	reg [31:0] out_dmem_rdata , out_alu_out, out_pc ;
	
	initial begin
		MemtoReg = 1'b0 ;
		RegWrite = 1'b0 ;
		Jal = 1'b0 ;
		out_wn = 5'b0 ;
		out_dmem_rdata = 32'b0 ;
		out_alu_out = 32'b0 ;
		out_pc = 32'b0 ;
	end
	
	always @( posedge clk ) begin
		MemtoReg = in_ctl[2] ;
		RegWrite = in_ctl[1] ;
		Jal = in_ctl[0] ;
		out_wn = in_wn ;
		out_dmem_rdata = in_dmem_rdata ;
		out_alu_out = in_alu_out ;
		out_pc = in_pc ;
	end
	
endmodule