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
    input [3:0] sw,
    input RsRx,
    output wire [3:0] vgaRed, 
    output wire [3:0] vgaGreen, 
    output wire [3:0] vgaBlue,
    output wire Hsync, Vsync,
    output RsTx
    );
    wire reset;
    assign reset = sw[0];
    
    //input from uart (by keyboard in serial terminal)
    wire [7:0] input_byte; 
    
    //uart input
    uartSystem(clk,RsRx,RsTx,input_byte,received);
    
    //input memory controller
    wire [31:0] A_num; // two complement number
    wire [31:0] B_num; // two complement number
    wire [2:0] operand_code;
    //assign operand_code = 3; //hardcode always *
    inputController(clk,input_byte,received,reset,A_num,B_num,operand_code);

    //ALU and calculate system
    wire C_valid;
    wire [31:0] C_num;
    //assign C_valid = 1; //hardcode always valid
    calculatorSystem(clk,A_num,B_num,operand_code,C_num,C_valid);
    
    //VGA system
    VGA_system(clk,reset,A_num,B_num,C_num,C_valid,operand_code,stage_changed,Hsync,Vsync,{vgaRed, vgaGreen, vgaBlue});
endmodule
