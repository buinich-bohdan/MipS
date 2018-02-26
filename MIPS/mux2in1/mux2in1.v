module mux2in1(i_dat0, i_dat1, i_control, o_dat);

parameter WIDTH = 32;

input   [WIDTH-1:0]   i_dat0, i_dat1; 
input                 i_control;
output  [WIDTH-1:0]   o_dat;

reg [WIDTH-1:0]   dat0_r, dat1_r;
reg control_r; 

initial
begin
dat0_r = 20;
dat1_r = 10;
#50 control_r = 0;
#50 control_r = 1;
end
initial #200 $finish;

  assign {i_dat0,i_dat1,i_control} = {dat0_r,dat1_r,control_r};
  assign o_dat = (i_control) ? i_dat1 : i_dat0;

endmodule
