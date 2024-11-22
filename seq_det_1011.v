module seq_det_1011(x,clk,reset,z);
input x,clk,reset;
output reg z;
parameters s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s1=3'b100;
reg[2:0]ps,ns;
always @(ps,x)
begin 
case(ps)
so:ns=x?s1:s0;
s1:
ns=x?s1:s2;
s2:
ns=x?s3:s0;
s3:
ns=x?s4:s2;
s4:
ns=x?s1:s2;
default:ns=s0;
endcase
end
always @(ps)
begin
if (ps==s4)
z=1;
else
z=0;
end
always @(posedge clk,posedge reset)
if (reset)
ps=s0;
else
ps=ns;
endmodule
