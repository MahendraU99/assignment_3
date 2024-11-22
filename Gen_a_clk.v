`timescale 1ns / 1ps

module clock_30 (
    input clk_in,
    input rst,
    output reg clk_out
);
    reg [3:0] clk_counter; // 4-bit counter

    always @(posedge clk_in or posedge rst) begin
        if (rst) begin
            clk_out <= 0;          // Reset clock output
            clk_counter <= 0;      // Reset counter
        end else begin
            if (clk_counter < 4'd9) begin
                clk_counter <= clk_counter + 1; // Increment counter
            end else begin
                clk_counter <= 0; // Reset counter when it reaches 10
            end

            // Generate 30% duty cycle
            if (clk_counter < 4'd3) begin
                clk_out <= 1;      // Output high for 3 counts
            end else begin
                clk_out <= 0;      // Output low for 7 counts
            end
        end
    end
endmodule
