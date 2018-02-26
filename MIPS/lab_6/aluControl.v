module aluControl(i_aluOp, i_func, o_aluControl);

localparam AND = 4'b0000, OR = 4'b0001, ADD = 4'b0010;
localparam SUB = 4'b0110, SOLT = 4'b0111, XOR = 4'b1100; //SOLT - Set On Less then 
 
input       [5:0]   i_aluOp;
input       [5:0]   i_func;
output  reg [3:0]   o_aluControl;
 
always @(*)
begin
	case(i_aluOp)
		6'b000000:
		case(i_func)
		6'b100000: o_aluControl <= ADD;
		6'b100010: o_aluControl <= SUB;
		6'b100100: o_aluControl <= AND;
		6'b100101: o_aluControl <= OR;	
		6'b100110: o_aluControl <= XOR;
		6'b101010: o_aluControl <= SOLT;
		default:    o_aluControl <= ADD;
		endcase
		6'b001000: o_aluControl <= ADD;
		6'b001001: o_aluControl <= ADD;
		6'b100011: o_aluControl <= ADD;
		6'b101011: o_aluControl <= ADD;
		6'b000100: o_aluControl <= SUB;
		6'b001100: o_aluControl <= AND;
		6'b001101: o_aluControl <= OR;
		6'b001010: o_aluControl <= SOLT;
		default:    o_aluControl <= ADD;
		
	endcase

end 
endmodule