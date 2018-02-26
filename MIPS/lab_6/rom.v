module rom
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=12)
(
	input [(ADDR_WIDTH-1):0] i_addr,
	output [(DATA_WIDTH-1):0] o_data
	
	);

	reg [DATA_WIDTH-1:0] mem [0:4096];
	
	initial 
	begin
	$readmemb("rom_init.dat",mem);
	end
	
	assign o_data = mem [i_addr];

endmodule
