module ram(i_clk, i_addr, i_data, i_we, o_data);
parameter DATA_WIDTH = 32;
parameter ADDR_WIDTH = 5; //32 4-byte words 

input                     i_clk, i_we;
input   [ADDR_WIDTH-1:0]  i_addr;
input   [DATA_WIDTH-1:0]  i_data;
output  [DATA_WIDTH-1:0]  o_data;

  
reg  i_clk_r,i_we_r ;
reg [ADDR_WIDTH-1:0]  i_addr_r;
reg [DATA_WIDTH-1:0]  i_data_r;

initial
begin 
i_clk_r=0;
forever #50 i_clk_r = ~i_clk_r;
end

initial
begin
i_we_r = 1;
i_data_r = 244;
#100 i_addr_r = 0;
#200 i_we_r = 0; 
#100 i_data_r = 140; 
#100 i_addr_r = 1;
#200 i_we_r = 1;
end 

initial #2500 $finish;

assign {i_clk,i_we,i_addr,i_data}={i_clk_r,i_we_r,i_addr_r,i_data_r};

      reg [31:0] ram [3:0];  
 
      always @(posedge i_clk) begin  
           if (i_we)  
                ram[i_addr] <= i_data;  
      end  
      assign o_data =  ram[i_addr];

endmodule
