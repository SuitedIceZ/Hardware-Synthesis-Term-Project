`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2022 02:21:36 PM
// Design Name: 
// Module Name: baudrate_gen
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


module baudrate_gen(
    input clk,
    output reg baud
    );
    
    integer counter;
    always @(posedge clk) begin
        counter = counter + 1;
        if (counter == 27) begin counter = 0; baud = ~baud; end 
        // Clock = 10ns
        // ClockFreq = 1/10ns = 100 MHz
        // Baudrate = 115200
        // counter = ClockFreq/Baudrate/32 325 as 9600 , 27 as 115200
    end
    
endmodule
