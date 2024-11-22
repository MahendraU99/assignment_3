module even_parity_encoder(data,parity);
input [3:0] data,
output parity
assign parity = ^data; 
endmodule
