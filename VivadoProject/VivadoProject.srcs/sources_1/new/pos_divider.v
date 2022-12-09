`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2022 09:58:52 AM
// Design Name: 
// Module Name: pos_divider
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


module pos_divider(
    input clk,
    input [31:0] A_num,
    input [31:0] B_num,
    input reset,
    output reg [31:0] C_num
    );
    //calculate buffer
    reg divide_sign_buffer;
    reg [2:0] state;
    reg [31:0] A_template;
    reg [31:0] B_template;
    reg [31:0] A_buffer;
    reg [31:0] B_buffer;
    
    
    initial begin
        divide_sign_buffer = 0;
        state = 0;
        A_template = 10000; //inf
        B_template = 10000; //inf
        A_buffer = 0;
        B_buffer = 0;
        C_num = 0;
    end
    
    always @(posedge clk)begin
        if(reset)begin
            divide_sign_buffer = 0;
            state = 0;
            A_template = 10000; //inf
            B_template = 10000; //inf
            A_buffer = 0;
            B_buffer = 0;
            C_num = 0;
        end else
        if((A_num != A_template) || (B_num != B_template))begin //new A,B
            state <= 0;
            A_template <= A_num;
            B_template <= B_num;
            A_buffer <= A_num;
            B_buffer <= B_num;
            C_num <= 0;
            divide_sign_buffer <= 0;
        end else if(state == 0)begin //make negative to buffer
            divide_sign_buffer <= A_buffer[31] ^ B_buffer[31]; //sign buffer
            if(A_buffer[31] == 1 && B_buffer[31] == 1)begin //both neg
                 A_buffer <= -1*A_buffer;
                 B_buffer <= -1*B_buffer;
            end else if(A_buffer[31] == 1)begin //A neg
                 A_buffer <= -1*A_buffer;
            end else if(B_buffer[31] == 1)begin //B neg
                 B_buffer <= -1*B_buffer;
            end 
            state = 1;
        end else if(state == 1)begin //state minus A by B into count C each clock
            if(A_buffer >= B_buffer && B_buffer != 0)begin
                C_num <= C_num + 1;
                A_buffer <= A_buffer - B_buffer;
            end else begin
                state <= 2;
            end
        end else if(state == 2)begin //make C_num sign
            if(divide_sign_buffer)
                C_num <= C_num * -1;
            state <= 3;
        end
        
                    
                    
    end
endmodule
