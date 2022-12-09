`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2022 10:59:24 PM
// Design Name: 
// Module Name: SevenSegSystem
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


module SevenSegSystem(
    output [6:0] seg,
    output dp,
    output [3:0] an,
    input clk,
    input [15:0] num_display
    
    );
    wire targetClk;
    wire an0,an1,an2,an3;
    assign an = {an0,an1,an2,an3};
    
    wire [18:0] tclk;
    assign tclk[0] = clk;
    
    genvar c;
    generate for(c=0;c<18;c=c+1)
    begin
        clkDiv fdiv(tclk[c+1],tclk[c]);
    end endgenerate
    
    clkDiv fdivTarget(targetClk,tclk[18]);
    //wire [3:0] digitOut3,digitOut2,digitOut1,digitOut0;
    //RAMandInputSystem myRAMandInputSystem(clk,sw,digitOut1,digitOut0);
    
    wire [3:0] num0;
    wire [3:0] num1;
    wire [3:0] num2;
    wire [3:0] num3;
    
    //num 0 is leftmost hand side segment display
    assign num0=num_display[15:12]; 
    assign num1=num_display[11:8];
    assign num2=num_display[7:4];
    assign num3=num_display[3:0];
    
    quadSevenSeg q7seg(seg,dp,an0,an1,an2,an3,num0,num1,num2,num3,targetClk);
endmodule
