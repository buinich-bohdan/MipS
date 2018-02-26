module aluControl(i_aluOp, i_func, o_aluControl);
 
input       [1:0]   i_aluOp;
input       [5:0]   i_func;
output  reg [3:0]   o_aluControl;
  
reg [5:0] i_func_r;
reg [1:0] i_aluOp_r;

initial
begin
#0
i_aluOp_r = 1;
i_func_r = 6'b000000;
#50 i_func_r = 6'b000001;
#50 i_func_r = 6'b000010;
#50 i_func_r = 6'b000100;
#50 i_func_r = 6'b001000;
#50 i_func_r = 6'b010000;
#50 i_func_r = 6'b100000;
end 

assign {i_func, i_aluOp}={i_func_r,i_aluOp_r};

always @ (i_aluOp, i_func) 
	case({i_aluOp, i_func[5:0]})
		 7'b1000000: o_aluControl <=4'b0000; //and
		 7'b1000001: o_aluControl <=4'b0001; //or
		 7'b1000010: o_aluControl <=4'b0010; //add
		 7'b1000100: o_aluControl <=4'b0110; //sub
		 7'b1001000: o_aluControl <=4'b0111; //slt
		 7'b1010000: o_aluControl <=4'b1100; //nor
		 default:   o_aluControl <=4'b1111; //should not happen
	endcase

endmodule