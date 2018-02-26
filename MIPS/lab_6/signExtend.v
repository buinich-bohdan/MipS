module signExtend(i_data, o_data,ext_op);
input   [15:0]  i_data;
input ext_op;
output  [31:0]  o_data;

	assign o_data [15:0] = i_data;
	assign o_data [31:16] = ext_op ? (i_data [15] ? 0'hffff : 0'h0000) : 0'h0000; 
endmodule