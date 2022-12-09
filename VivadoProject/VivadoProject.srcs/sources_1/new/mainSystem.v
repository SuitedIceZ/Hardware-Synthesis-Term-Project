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
    ,output wire [9:0] led //For test and debug
    ,output [6:0] seg,
    output dp,
    output [3:0] an
    );
    wire reset;
    assign reset = sw[0];
    //SinglePulser reset_sw_sp(reset,sw[0],clk);
    
    //input from uart (by keyboard in serial terminal)
    wire [7:0] input_byte; 
    
    //uart input
    uartSystem(clk,RsRx,RsTx,input_byte,received);
    
    //input memory controller
    wire [31:0] A_num; // two complement number
    wire [31:0] B_num; // two complement number
    wire [2:0] operand_code;
    //assign operand_code = 3; //hardcode always *
    inputController(clk,input_byte,received,reset,A_num,B_num,operand_code,clear_answer);

    //ALU and calculate system
    wire C_valid;
    wire [31:0] C_num;
    //assign C_valid = 1; //hardcode always valid
    calculatorSystem(clk,A_num,B_num,operand_code,reset||clear_answer,C_num,C_valid);
    
    //VGA system (can be comment for better gen time to debug in sevenSeg)
    VGA_system(clk,reset,A_num,B_num,C_num,C_valid,operand_code,stage_changed,Hsync,Vsync,{vgaRed, vgaGreen, vgaBlue});

    //LED and SevenSegment for debug
    assign led[3:0] = sw[3:0];
    
    wire [4:0] number_encoded_display [4:0];
    reg [31:0] choose_num;
    reg choose_valid;
    always @(posedge clk)begin
        choose_valid = 1;
        if(sw[1])begin
            choose_num = A_num;
        end else if(sw[2])begin
            choose_num = B_num;
        end else if(sw[3])begin
            choose_num = C_num;
            choose_valid = C_valid;
        end
        
    end
    //twoComConverter Display_num_converter(choose_num,choose_valid,number_encoded_display[0],number_encoded_display[1],number_encoded_display[2],number_encoded_display[3],number_encoded_display[4]);
    //tested bug here maybe modulo, divide => try separate clk to divide
    twoComConverter Display_num_converter(152,1,number_encoded_display[0],number_encoded_display[1],number_encoded_display[2],number_encoded_display[3],number_encoded_display[4]);
    
    
    wire [15:0] num_display = {number_encoded_display[1],number_encoded_display[2],number_encoded_display[3],number_encoded_display[4]};
    //wire [15:0] num_display = {4'h1,4'h0,4'h2,4'h4};
    assign led[8:4] = number_encoded_display[0];
    assign led[9] = choose_valid;
    SevenSegSystem(seg,dp,an,clk,num_display); //not bug
endmodule
