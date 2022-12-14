`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2022 11:05:22 AM
// Design Name: 
// Module Name: calculatorSystem
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


module calculatorSystem(
    input clk,
    input [31:0] A_num, // two complement number
    input [31:0] B_num, // two complement number
    input [2:0] operand_code, // 0,1,2,3,4 for empty,+,-,*,/ in order
    input reset, // high enable reset
    output reg[31:0] C_num,
    output reg C_valid
    );
    
    reg divide_sign_buffer;
    
    initial
    begin
        C_num = 0;
        C_valid = 0;
        divide_sign_buffer = 0;
    end
    
    
    always @(posedge clk)begin
        if(reset)begin
            C_num = 0;
            C_valid = 0;
            divide_sign_buffer = 0;
        end 
        else begin
            C_valid = 1;
            if(operand_code == 1)begin //plus
                C_num = A_num + B_num;
            end else if(operand_code == 2)begin //minus
                C_num = A_num - B_num;
            end else if(operand_code == 3)begin //multi
                C_num = A_num * B_num;
            end else if(operand_code == 4)begin //divide
                if(B_num == 0) //cant divide by zero
                    C_valid = 0;
                else begin //manual config for auto synthesis divider module
                
                    divide_sign_buffer = A_num[31] ^ B_num[31]; //sign buffer
                    
                    if(A_num[31] == 1 && B_num[31] == 1)begin //both neg
                        C_num = (-1*A_num) / (-1*B_num);
                    end else if(A_num[31] == 1)begin //A neg
                        C_num = (-1*A_num) / B_num;
                    end else if(B_num[31] == 1)begin //B neg
                        C_num = A_num / (-1*B_num);
                    end else begin
                        C_num = A_num / B_num;
                    end
                    
                    if(divide_sign_buffer)
                        C_num = -1*C_num;
                    
                end
            end
            
            if((C_num[31] == 0) && (C_num > 9999))begin //out of bound
                C_valid = 0;
            end
            if( (C_num[31] == 1) && ( (-1*C_num) > 9999) )begin //out of bound
                C_valid = 0;
            end
        end
    end
endmodule
