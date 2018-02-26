module adder(i_op1, i_op2, o_result);
input [31:0] i_op1, i_op2;
output reg [31:0] o_result;

reg [31:0] i_op1_r, i_op2_r;

initial
begin
#0
i_op1_r = 1;
i_op2_r = 2;
end 
initial #200 $finish;

always @(*)
		begin
	assign o_result= i_op1 + i_op2;
	end


assign {i_op1, i_op2} ={i_op1_r, i_op2_r};


endmodule