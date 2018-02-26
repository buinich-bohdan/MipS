module next_pc(i_pc_inc,i_imm_26,i_zero,i_branch,i_jump,o_pc_inc,o_pc_src);

	input [29:0] i_pc_inc;
	input i_zero,i_branch,i_jump;
	input [25:0] i_imm_26;
	output [29:0] o_pc_inc;
	output o_pc_src;

	wire [31:0] i_add;
	
	signExtend se(.i_data(i_imm_26[15:0]),.ext_op(i_imm_26[15]),.o_data(i_add));
	
	assign o_pc_inc = i_jump ? {i_pc_inc[29:26],i_imm_26} : (i_add[29:0] + i_pc_inc);
	assign o_pc_src = (i_jump + (i_zero * i_branch));
	
endmodule
