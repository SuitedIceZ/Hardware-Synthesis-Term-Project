`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2022 05:07:45 PM
// Design Name: 
// Module Name: calculateSysten_tester
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


module calculateSysten_tester(

    );
        //input reg
    reg clk;
    reg [31:0] A_num;
    reg [31:0] B_num;
    reg [2:0] operand_code;
    reg reset;
    
    //output wire
    wire C_valid;
    wire [31:0] C_num;
    //assign C_valid = 1; //hardcode always valid
    calculatorSystem calculatorSystem_module(clk,A_num,B_num,operand_code,reset,C_num,C_valid);
    
    always
        #10 clk = !clk;
        
    initial
    begin
        #0
        clk = 0;
        A_num = 0;
        B_num = 0;
        operand_code = 0;
        reset = 0;
        
        #100
        A_num = 139;
        B_num = -82;
        operand_code = 2; //minus
        
        #100
        A_num = 109;
        B_num = -82;
        operand_code = 1; //plus
        
        #100
        A_num = 109;
        B_num = -82;
        operand_code = 3; //multi
        
        #100
        A_num = 139;
        B_num = -82;
        operand_code = 3; //multi
        
        #100
        A_num = 139;
        B_num = 82;
        operand_code = 3; //multi
        
        #100
        A_num = 5432;
        B_num = -82;
        operand_code = 4; //divide
        
        #100
        A_num = -5432;
        B_num = 82;
        operand_code = 4; //divide
        
        #100
        A_num = -5432;
        B_num = -82;
        operand_code = 4; //divide
        
        #100
        A_num = 5432;
        B_num = 82;
        operand_code = 4; //divide
        
        #100
        A_num = 5432;
        B_num = 0;
        operand_code = 4; //divide
        
        #100
        reset = 1;
        
        #1000 $finish;
    end
endmodule
