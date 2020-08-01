
module IF_ID( clk, in_pc, in_instruction, out_pc, out_instruction );
	input clk ;
	input [31:0] in_pc, in_instruction ;
	output [31:0] out_pc, out_instruction ;
	reg [31:0] out_pc, out_instruction ;

	
	always @( posedge clk ) begin
		out_pc = in_pc ;
		out_instruction = in_instruction ;
	end
	
endmodule
