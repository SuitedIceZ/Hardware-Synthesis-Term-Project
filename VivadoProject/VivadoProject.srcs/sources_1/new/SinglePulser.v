`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2022 01:42:36 AM
// Design Name: 
// Module Name: SinglePulser
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SinglePulser(
    output reg q = 0,
    input d,
    input clk
    );

reg prev = 0;
always @ (posedge clk) begin 
    prev <= d;
    q <= d && ~prev;
end

endmodule
