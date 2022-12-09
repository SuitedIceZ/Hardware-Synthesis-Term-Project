`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2022 10:17:05 AM
// Design Name: 
// Module Name: pos_divider_tester
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


module pos_divider_tester(

    );
    //input reg
    reg clk;
    reg [31:0] A_num;
    reg [31:0] B_num;
    reg reset;
    
    //output wire
    wire [31:0] C_num;
    
    pos_divider pos_divider1(clk,A_num,B_num,reset,C_num);
    
    always
        #10 clk = !clk;
        
    initial 
    begin
        #0
        clk = 0;
        A_num = 0;
        B_num = 0;
        reset = 0;
        
        #10
        A_num = 156;
        B_num = 7;

        #1000
        A_num = 5879;
        B_num = 1000;
        
        #1000
        A_num = -5879;
        B_num = 100;
        
        #1000
        A_num = -9999;
        B_num = -1;
        #1000000 $finish;
    end
endmodule
