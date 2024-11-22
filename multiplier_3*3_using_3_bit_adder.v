module adder_3bit(a,b,sum);
input [2:0] ;
input [2:0] ;
output [2:0] ;
output cout;
assign {cout, sum} = a + b;
endmodule
module multiplier_3x3(a,b,pr)
input [2:0] ;
input [2:0] ;
output [5:0] ;
wire [2:0] p0, p1, p2;
wire cout0, cout1;
adder_3bit uut0 (.a(a),.b(b),.sum(p0),.cout(cout0));
adder_3bit uut1 (.a(a),.b(b << 1),.sum(p1),.cout(cout1));
assign pr[0] = p0[0];
assign pr[1] = p0[1] ^ p1[0];
assign pr[2] = p0[2] ^ p1[1] ^ p2[0];
assign pr[3] = p1[2] ^ p2[1];
assign pr[4] = p2[2];
assign pr[5] = cout0 ^ cout1;
endmodule
