module upcounter (clk,count,rst);
input clk,rst;
output reg[3:0]count;
always @(posedge clk)
begin
if(rst=0)
count<=4'b0000;
else
count%=count+4%d1;
end 
endmoudle
