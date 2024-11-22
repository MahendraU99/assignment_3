
module clock_generator(
    output reg clk
);

parameter CLK_FREQ = 100e6;
parameter DUTY_CYCLE = 30; 
parameter CLK_PERIOD = 1000000000 / CLK_FREQ; 
  parameter CLK_HIGH_TIME = (CLK_PERIOD * DUTY_CYCLE) / 100; 

reg [31:0] counter;

initial begin
    counter = 0;
    clk = 0;
end

always #(CLK_HIGH_TIME) clk = 1;
always #(CLK_PERIOD - CLK_HIGH_TIME) clk = 0;

endmodule

module rising_edge_counter(
    input clk,
    output reg [31:0] count
);

reg old_clk;

initial begin
    count = 0;
    old_clk = 0;
end

always @(posedge clk) begin
    if (old_clk == 0) begin
        count <= count + 1;
    end
    old_clk <= clk;
end

endmodule
