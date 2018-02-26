module alu(i_op1, i_op2, i_control, o_result, o_zf);

localparam AND = 4'b0000, OR = 4'b0001, ADD = 4'b0010;
localparam SUB = 4'b0110, SOLT = 4'b0111, NOR = 4'b1100; //SOLT - Set On Less then
  
input       [31:0]  i_op1, i_op2;
input       [3:0]   i_control;
output  reg [31:0]  o_result;
output  reg            o_zf;

reg [31:0]  i_op1_r, i_op2_r;
reg [3:0] i_control_r;

initial
begin
#0
i_op1_r = 1;
i_op2_r = 1;

#50 i_control_r=0;
#50 i_control_r=1;
#50 i_control_r=2;
#50 i_control_r=6;
#50 i_control_r=7;
#50 i_control_r=12;
#50 i_control_r=16;

end 

assign {i_op1, i_op2, i_control} ={i_op1_r, i_op2_r, i_control_r};

always @(*)
    begin
		case (i_control)
			4'b0000: // AND
				o_result <= i_op1 & i_op2;
			4'b0001: // OR
				o_result <= i_op1 | i_op2;
		        4'b0010: // ADD
				o_result <= i_op1 + i_op2;
			4'b0110: // SUB
				o_result <= i_op1 - i_op2;
			4'b0111: begin // SOLT
				if (i_op1[31] != i_op2[31]) begin
					if (i_op1[31] > i_op2[31]) begin
						o_result <= 1;
					end else begin
						o_result <= 0;
					end
				end else begin
					if (i_op1 < i_op2)
					begin
						o_result <= 1;
					end
					else
					begin
						o_result <= 0;
					end
				end
			end
			4'b1100: // NOR
				o_result <= ~(i_op1 | i_op2);
		endcase
	end


	always @(o_result) begin
		if (o_result == 0) begin
			o_zf <= 1;
		end else begin
			o_zf <= 0;
		end
	
	end

endmodule
