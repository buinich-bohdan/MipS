module shiftLeftBy2(i_data, o_data);
parameter WIDTH = 32;
input   [WIDTH-1:0]   i_data;
output  [WIDTH-1:0]   o_data;
reg [WIDTH-1:0]   data_r;

initial
data_r = 0'b11001;


assign i_data = data_r;
assign o_data=i_data<<2;

endmodule
