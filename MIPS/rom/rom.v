module rom
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=8)
(
	input [(ADDR_WIDTH-1):0] i_addr,
	output [(DATA_WIDTH-1):0] o_data
);

parameter INIT_PROGRAM="rom_init.dat";   

reg [31:0] rom [0: ADDR_WIDTH-1];

reg [31:0] out;
	
reg [(ADDR_WIDTH-1):0] i_addr_r;

initial
	begin
i_addr_r=1;
#50 i_addr_r=0;
#50 i_addr_r=3;
	end

initial #200 $finish;
assign {i_addr}={i_addr_r};

	//assign o_data = {out[7:0],out[15:8],out[23:16],out[31:24]}; //flip bytes

initial
	begin
		$readmemh(INIT_PROGRAM, rom);

		end
	
	assign 	o_data = rom[i_addr[ADDR_WIDTH-1:0]];
		

endmodule

