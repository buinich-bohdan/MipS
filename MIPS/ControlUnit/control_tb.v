module control_tb;
reg  [31:0]  i_instrCode;
wire         o_regDst;
wire         o_jump; 
wire         o_branch;
wire         o_memToReg;
wire [1:0]   o_aluOp;
wire         o_memWrite;
wire         o_aluSrc;
wire         o_regWrite;
wire         o_memRead;
wire [5:0]   o_func;

parameter period = 200;

control control_tb (.i_instrCode(i_instrCode), .o_regDst(o_regDst), .o_jump(o_jump), .o_branch(o_branch), .o_memToReg(o_memToReg), .o_aluOp(o_aluOp), .o_memWrite(o_memWrite), .o_aluSrc(o_aluSrc), .o_regWrite(o_regWrite), .o_memRead(o_memRead), .o_func(o_func));

initial begin
forever #period i_instrCode = $random;
end

endmodule
