module control(i_instrCode, 
               o_regDst,
               o_jump, 
               o_branch,
               o_memToReg,
               o_memWrite,
               o_aluSrc,
               o_regWrite,
			   o_extOp
               );
  
input   [5:0]  i_instrCode;
output reg           o_regDst;
output reg           o_jump; 
output reg           o_branch;
output reg           o_memToReg;
output reg           o_memWrite;
output reg           o_aluSrc;
output reg           o_regWrite;	
output reg           o_extOp;	


always@(*)
begin				
	case(i_instrCode)
		6'b000000: //R-type
		begin
			o_regDst   = 1'b1;
			o_regWrite = 1'b1;
			o_aluSrc   = 1'b0;
			o_branch   = 1'b0;
			o_jump     = 1'b0;
			o_memWrite = 1'b0;
			o_memToReg = 1'b0;
			o_extOp    = 1'b0;
		end
		6'b001001://addiu
		begin
			o_regDst   = 1'b0;
			o_regWrite = 1'b1;
			o_aluSrc   = 1'b1;
			o_branch   = 1'b0;
			o_jump     = 1'b0;
			o_memWrite = 1'b0;
			o_memToReg = 1'b0;
			o_extOp    = 1'b1;
		end
		6'b001000://addi
		begin
			o_regDst   = 1'b0;
			o_regWrite = 1'b1;
			o_aluSrc   = 1'b1;
			o_branch   = 1'b0;
			o_jump     = 1'b0;
			o_memWrite = 1'b0;
			o_memToReg = 1'b0;
			o_extOp    = 1'b1;
		end
		6'b100011://lw
		begin
			o_regDst   = 1'b0;
			o_regWrite = 1'b1;
			o_aluSrc   = 1'b1;
			o_branch   = 1'b0;
			o_jump     = 1'b0;
			o_memWrite = 1'b0;
			o_memToReg = 1'b1;
			o_extOp    = 1'b1;
		end
		6'b101011://sw
		begin
			o_regDst   = 1'b0;
			o_regWrite = 1'b0;
			o_aluSrc   = 1'b1;
			o_branch   = 1'b0;
			o_jump     = 1'b0;
			o_memWrite = 1'b1;
			o_memToReg = 1'b0;
			o_extOp    = 1'b1;
		end
		6'b000100://beq
		begin
			o_regDst   = 1'b0;
			o_regWrite = 1'b0;
			o_aluSrc   = 1'b0;
			o_branch   = 1'b1;
			o_jump     = 1'b0;
			o_memWrite = 1'b0;
			o_memToReg = 1'b0;
			o_extOp    = 1'b0;
		end
		6'b001100://andi
		begin
			o_regDst   = 1'b0;
			o_regWrite = 1'b1;
			o_aluSrc   = 1'b1;
			o_branch   = 1'b0;
			o_jump     = 1'b0;
			o_memWrite = 1'b0;
			o_memToReg = 1'b0;
			o_extOp    = 1'b0;
		end
		6'b001101://ori
		begin
			o_regDst   = 1'b0;
			o_regWrite = 1'b1;
			o_aluSrc   = 1'b1;
			o_branch   = 1'b0;
			o_jump     = 1'b0;
			o_memWrite = 1'b0;
			o_memToReg = 1'b0;
			o_extOp    = 1'b0;
		end
		6'b001010://slti
		begin
			o_regDst   = 1'b0;
			o_regWrite = 1'b1;
			o_aluSrc   = 1'b1;
			o_branch   = 1'b0;
			o_jump     = 1'b0;
			o_memWrite = 1'b0;
			o_memToReg = 1'b0;
			o_extOp    = 1'b1;
		end
		6'b000010://jump
		begin
			o_regDst   = 1'b0;
			o_regWrite = 1'b0;
			o_aluSrc   = 1'b0;
			o_branch   = 1'b0;
			o_jump     = 1'b1;
			o_memWrite = 1'b0;
			o_memToReg = 1'b0;
			o_extOp    = 1'b0;
		end
	endcase
end  
endmodule