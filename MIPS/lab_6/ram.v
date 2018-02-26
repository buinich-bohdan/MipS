module ram	(input			i_clk, i_we,
		 input		[31:0]	i_addr,
		 input		[31:0]	i_data,
		 output		[31:0]	o_data);
integer i;
		 reg [31:0]	mem	[0:31];

initial 
begin
	for (i=0; i<20; i=i+1)
	begin
	mem[i]= i;
	end
end

	always @(posedge i_clk)
	begin
		if (i_we)
			mem [i_addr] <= i_data;
end
	assign o_data = mem [i_addr];

endmodule
