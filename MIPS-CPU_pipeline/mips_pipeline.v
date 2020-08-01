//	Title: MIPS Single-Cycle Processor
//	Editor: Selene (Computer System and Architecture Lab, ICE, CYCU)
module mips_pipeline( clk, rst );
	input clk, rst;


	reg[31:0] cycle ;
	initial begin
		cycle = 0;
	end 
	

	always@(posedge clk) begin
		cycle = cycle + 1;
	end

 /** 
	
	/* instruction bus
	wire[31:0] instr;
	
	 break out important fields from instruction
	wire [5:0] opcode, funct;
    wire [4:0] rs, rt, rd, shamt;
    wire [15:0] immed;
    wire [31:0] extend_immed, b_offset;
    wire [25:0] jumpoffset;
	datapath signals
    wire [4:0] rfile_wn;
    wire [31:0] rfile_rd1, rfile_rd2, rfile_wd, alu_b, alu_out, b_tgt,
                pc_incr, dmem_rdata, jump_addr, branch_addr;

	

	

	*/


	
	// ******************** vars **********************/
	
	// control_signals
	wire RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump, PCSrc, Jal ;
	wire EX_zero ;
	wire [2:0] Operation;
	wire [1:0] ALUOp ;
	wire [9:0] WME_signal, control_signals ;   // = { RegDst, ALUSrc, ALUOp, Branch, MemRead, MemWrite, MemtoReg, RegWrite, jal } ;
	wire [4:0] WM_signal ;    // = { MemRead, MemWrite, MemtoReg, RegWrite, jal } ;
	wire [2:0] W_signal ;     // = { MemtoReg, RegWrite, jal } ;

	
	
	// IF vars
	wire [31:0] pc, pc_next, jump_addr, branch_addr;
	wire [31:0] IF_pc_incr, IF_instr ;
	
	// ID vars
	wire [31:0] ID_pc_incr, ID_instr, ID_rfile_rd1, ID_rfile_rd2 ;
	wire [5:0] opcode;
    wire [4:0] rs, ID_rt, ID_rd, ID_shamt;
    wire [15:0] immed;
    wire [31:0] ID_extend_immed ;
    wire [25:0] jumpoffset;
   
    // EX vars
	wire [31:0] EX_pc_incr, EX_rfile_rd1, EX_rfile_rd2, EX_extend_immed, EX_b_tgt, EX_alu_out ; 
	wire [31:0] b_offset, alu_b, alu_result, shifter_result ;
	wire [5:0] funct ;
	wire [4:0] EX_rt, EX_rd, EX_rfile_wn ;
	wire alu_zero ;

	
	// MEM vars 
	wire [31:0] MEM_b_tgt, MEM_alu_out, MEM_rfile_rd2, MEM_dmem_rdata, MEM_pc_incr ;
	wire [4:0] MEM_rfile_wn ;
	
	// WB vars
	wire [31:0] WB_dmem_rdata, WB_alu_out, WB_rfile_wd, WB_pc_incr, rfile_wd ;
	wire [4:0] WB_rfile_wn, rfile_wn ;
	
	// ************** initialization ******************//

	
	// **************module instantiations*************//
	
	// IF Stage
	//assign pc_next = PCSrc ? MEM_b_tgt : IF_pc_incr ;
	reg32 PC( .clk(clk), .rst(rst), .en_reg(1'b1), .d_in(pc_next), .d_out(pc) );
	add32 PCADD( .a(pc), .b(32'd4), .result(IF_pc_incr) );
	memory InstrMem( .clk(clk), .MemRead(1'b1), .MemWrite(1'b0), .wd(32'd0), .addr(pc), .rd(IF_instr) );
	mux2 PCMUX( .sel(PCSrc), .a(IF_pc_incr), .b(EX_b_tgt), .y(branch_addr) );
	mux2 #(32) JMUX( .sel(Jump), .a(branch_addr), .b(jump_addr), .y(pc_next) );
	
	// IFID
	IF_ID IFID( .clk(clk), .in_pc(IF_pc_incr), .in_instruction(IF_instr), .out_pc(ID_pc_incr), .out_instruction(ID_instr) ) ;
	
	// ID Stage
	
	assign opcode = ID_instr[31:26];
    assign rs = ID_instr[25:21];
    assign ID_rt = ID_instr[20:16];
    assign ID_rd = ID_instr[15:11];
    assign immed = ID_instr[15:0];
    assign jumpoffset = ID_instr[25:0];
	assign WME_signal = rst ? 10'bxxxx0xxxxx : control_signals;
	reg_file RegFile( .clk(clk), .RegWrite(RegWrite), .RN1(rs), .RN2(ID_rt), .WN(rfile_wn), 
					  .WD(rfile_wd), .RD1(ID_rfile_rd1), .RD2(ID_rfile_rd2) );
	
	sign_extend SignExt( .immed_in(immed), .ext_immed_out(ID_extend_immed) ); // sign-extender
	control_pipeline CTL(.opcode(opcode), .control(control_signals), .Jump(Jump) );
	
	
	
	// IDEX
	ID_EX IDEX( .clk(clk), .in_ctl(WME_signal), .RegDst(RegDst), .ALUSrc(ALUSrc), .ALUOp(ALUOp), .Branch(Branch), .out_ctl(WM_signal), 
				  .in_rt(ID_rt), .in_rd(ID_rd), .in_imm(ID_extend_immed), .in_pc(ID_pc_incr), 
				  .in_rd1(ID_rfile_rd1), .in_rd2(ID_rfile_rd2), .out_rt(EX_rt), .out_rd(EX_rd), 
				  .out_imm(EX_extend_immed), .out_pc(EX_pc_incr), .out_rd1(EX_rfile_rd1), .out_rd2(EX_rfile_rd2) ) ;
				  
	// EX Stage
	mux2 ALUMUX( .sel(ALUSrc), .a(EX_rfile_rd2), .b(EX_extend_immed), .y(alu_b) );

	assign funct = EX_extend_immed[5:0] ;
	alu_ctl ALUCTL( .ALUOp(ALUOp), .Funct(EX_extend_immed[5:0]), .ALUOperation(Operation) );

	alu ALU( .ctl(Operation), .a(EX_rfile_rd1), .b(alu_b), .result(alu_result), .zero(EX_zero) );
	
	Shifter shifter( .in(alu_b), .shamt(EX_extend_immed[10:6]), .ctl(Operation), .out(shifter_result) );
	
	assign EX_alu_out = ( funct == 6'd0 && Operation == 3'b011 ) ? shifter_result : alu_result ;
	
	mux2 #(5) RFMUX( .sel(RegDst), .a(EX_rt), .b(EX_rd), .y(EX_rfile_wn) );

    assign b_offset = EX_extend_immed << 2; // branch offset shifter
	
	add32 BRADD( .a(EX_pc_incr), .b(b_offset), .result(EX_b_tgt) );
	
	
	// Jump offset shifter & concatenation
	assign jump_addr = { ID_pc_incr[31:28], jumpoffset << 2 };
	
	// EXMEM
	EX_MEM EXMEM( .clk(clk), .in_ctl(WM_signal), .MemWrite(MemWrite), .MemRead(MemRead), .out_ctl(W_signal),
				  .in_b_tgt(EX_b_tgt), .in_alu_out(EX_alu_out), .in_rd2(EX_rfile_rd2), .in_wn(EX_rfile_wn), .in_pc(EX_pc_incr), 
				  .out_b_tgt(MEM_b_tgt), .out_alu_out(MEM_alu_out), .out_rd2(MEM_rfile_rd2), .out_wn(MEM_rfile_wn), .out_pc(MEM_pc_incr) ) ;
				  

	// MEM Stage		  
	memory DatMem( .clk(clk), .MemRead(MemRead), .MemWrite(MemWrite), .wd(MEM_rfile_rd2), 
				   .addr(MEM_alu_out), .rd(MEM_dmem_rdata) );
				   
    and BR_AND(PCSrc, Branch, EX_zero);

    // MEMWB
	MEM_WB MEMWB( .clk(clk), .in_ctl(W_signal), .RegWrite(RegWrite), .Jal(Jal), .MemtoReg(MemtoReg), 
				  .in_dmem_rdata(MEM_dmem_rdata), .in_alu_out(MEM_alu_out), .in_wn(MEM_rfile_wn), .in_pc(MEM_pc_incr),
				  .out_dmem_rdata(WB_dmem_rdata), .out_alu_out(WB_alu_out), .out_wn(WB_rfile_wn), .out_pc(WB_pc_incr) ) ;

	// WB Stage

    mux2 WRMUX( .sel(MemtoReg), .a(WB_alu_out), .b(WB_dmem_rdata), .y(WB_rfile_wd) );
	mux2 JALWBMUX( .sel(Jal), .a(WB_rfile_wd), .b(WB_pc_incr), .y(rfile_wd) );
	mux2 #(5) JALWNMUX( .sel(Jal), .a(WB_rfile_wn), .b(5'd31), .y(rfile_wn) );
		   
				   
endmodule
