`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2022 01:11:02 PM
// Design Name: 
// Module Name: mainSystem
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


module mainSystem(
    input clk,
    input sw,
    input RsRx,
    output RsTx
    );
    
    //input from uart (by keyboard in serial terminal)
    wire [7:0] input_byte; 
    
    //uart input
    uartSystem(clk,RsRx,RsTx,input_byte,received);
    
    //input memory controller
    wire [31:0] A_num;
    wire [31:0] B_num;
    inputController(clk,input_byte,received,reset,A_num,B_num);

    
endmodule
