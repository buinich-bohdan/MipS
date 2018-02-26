module mips_main();

	reg	i_clk, i_rst_n;
	
	initial begin
        i_rst_n = 1;
        #70 i_rst_n = 0;
        #10 i_rst_n = 1;
    end

    initial begin
        i_clk = 0;
        forever #50 i_clk = ~i_clk;
    end
	
	initial #15000 $stop;
	
    wire [31:0] pc, pc_add;
	wire [31:0] instr;
	wire [5:0]  OP = instr[31:26];
	wire [4:0]  RS = instr[25:21];
	wire [4:0]  RT = instr[20:16];
    wire [4:0]  RD = instr[15:11];
	wire [5:0]  FUNCT = instr[5:0];
	wire [15:0] IMM_16 = instr[15:0];
	wire [25:0] IMM_26 = instr[25:0];
	
	wire [31:0] Bus_A, Bus_B;
    wire [31:0] ALU_res;
	wire [3:0]  alu_ctrl;
    
    wire	regDst, jump, branch, memToReg, memWrite, aluSrc, regWrite, extOp, zf;
    wire [4:0]  mux_reg_dst;
    wire [31:0] mux_alu_src, sign_extend_out;

	wire [31:0] data_mem_out,mux_mem_to_reg,pc_mux_out;
	wire [29:0] jump_target;
	wire pc_src;
	
	pc _pc(.i_clk(i_clk),.i_rst_n(i_rst_n),.i_pc(pc_mux_out),.o_pc(pc));
	
	adder _pc_inc(.i_op1(pc),.i_op2(32'b01),.o_result(pc_add));
	
	rom instr_mem(.i_addr(pc[11:0]),.o_data(instr));
	
	regFile regs(.i_clk(i_clk),.i_raddr1(RS),.i_raddr2(RT),.i_waddr(mux_reg_dst),.i_wdata(mux_mem_to_reg),.i_we(regWrite),.o_rdata1(Bus_A),.o_rdata2(Bus_B));
	
	signExtend extender(.i_data(IMM_16),.o_data(sign_extend_out),.ext_op(extOp));
	
	defparam mux_regDst.WIDTH = 5;
	mux2in1 mux_regDst(.i_dat0(RT),.i_dat1(RD),.i_control(regDst),.o_dat(mux_reg_dst));
	
	mux2in1 mux_aluSrc(.i_dat0(Bus_B),.i_dat1(sign_extend_out),.i_control(aluSrc),.o_dat(mux_alu_src));
	
	alu alu(.i_op1(Bus_A),.i_op2(mux_alu_src),.i_control(alu_ctrl),.o_result(ALU_res),.o_zf(zf));
	
	aluControl aluControl(.i_aluOp(OP),.i_func(FUNCT),.o_aluControl(alu_ctrl));
	
	control ctrl(.i_instrCode(OP),.o_regDst(regDst),.o_jump(jump),.o_branch(branch),.o_memToReg(memToReg),.o_memWrite(memWrite),.o_aluSrc(aluSrc),.o_regWrite(regWrite),.o_extOp(extOp));
	
	mux2in1 mux_memToReg(.i_dat0(ALU_res),.i_dat1(data_mem_out),.i_control(memToReg),.o_dat(mux_mem_to_reg));
	
	//defparam data_mem.ADDR_WIDTH = 32;
	ram data_mem(.i_clk(i_clk),.i_addr(ALU_res),.i_data(Bus_B),.i_we(memWrite),.o_data(data_mem_out));
	
	next_pc next_pc(.i_pc_inc(pc_add[29:0]),.i_imm_26(IMM_26),.i_zero(zf),.i_branch(branch),.i_jump(jump),.o_pc_inc(jump_target),.o_pc_src(pc_src));
	
	mux2in1 pc_mux(.i_dat0(pc_add),.i_dat1({2'b0,jump_target}),.i_control(pc_src),.o_dat(pc_mux_out));
	
	
	
endmodule
