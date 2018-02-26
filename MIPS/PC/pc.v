module pc(i_clk, i_rst_n, i_pc, o_pc);

input               i_clk, i_rst_n;
input       [31:0]  i_pc;
output  reg [31:0]  o_pc;
   
reg [31:0]   pc_r;
reg clk_r, rst_r;


initial
begin 
clk_r=0;
forever #50 clk_r = ~clk_r;
end


initial
begin
pc_r = 20;
#100 rst_r = 0;
#50 rst_r = 1;
end
initial #300 $finish;

assign {i_pc,i_clk,i_rst_n} = {pc_r,clk_r,rst_r};


always @(posedge i_clk)
begin
    if(i_rst_n)
  o_pc = 0 ;
    else
  o_pc = i_pc;
end
endmodule


  