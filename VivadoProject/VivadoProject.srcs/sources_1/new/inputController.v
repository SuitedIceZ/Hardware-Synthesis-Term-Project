`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2022 09:36:56 PM
// Design Name: 
// Module Name: inputController
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


module inputController(
    input clk,
    input wire [7:0] input_byte,
    input wire received,
    input reset,
    output reg [31:0] A_num, // two complement number
    output reg [31:0] B_num, // two complement number
    output reg [1:0] ALU_sign // 0,1,2,3 for +,-,*,/ inorder
    );
    reg [1:0] state; // 0 receiving A , 1 receiving Sign , 2  receiving B , 3 show answer
    reg [2:0] order_state; // 0,1,2,3,4 inorder
    
    reg sign_state;
    reg internal_reset;
    initial
    begin
        state = 0;
        order_state = 0;
        sign_state = 0;
        A_num = 0;
        B_num = 0;
        ALU_sign = 0;
        internal_reset = 0;
    end
    
    always @(posedge reset  )
    begin
        state = 0;
        order_state = 0;
        sign_state = 0;
        A_num = 0;
        B_num = 0;
        ALU_sign = 0;
        internal_reset = 0;
    end
    
    always @(posedge internal_reset)
    begin
        state = 0;
        order_state = 0;
        sign_state = 0;
        A_num = 0;
        B_num = 0;
        ALU_sign = 0;
        internal_reset = 0;
    end
    
    always @(posedge received)
    begin
        if(input_byte == 8'h0A)begin //Enter
            
            if(state == 0 && sign_state == 1)begin //convert to negative
                if(sign_state)
                    A_num = -1*A_num;
            end
            else if(state == 2 && sign_state == 1)begin
                if(sign_state)
                    B_num = -1*B_num;
            end
            sign_state = 0;
            
            if(state == 3) //reset
                internal_reset = 1;
            else
                state = state + 1;
        end
        else if(state == 0 || state == 2)begin //Input number
            if(order_state == 0)begin
                if(input_byte == 8'h2D)begin //minus
                    sign_state = 1;
                    order_state = 1;
                end 
                else if ( 8'h30 <= input_byte && input_byte <= 8'h39 )begin //number
                    order_state = 1;
                    if(state == 0)
                        A_num[7:0] = input_byte;
                    else
                        B_num[7:0] = input_byte;
                end
            end
            else if(order_state <= 4)begin
                if ( 8'h30 <= input_byte && input_byte <= 8'h39 )begin //number
                    order_state = order_state + 1;
                    if(state == 0)begin
                        A_num = A_num * 10;
                        A_num = A_num + input_byte;
                    end
                    else begin
                        B_num = B_num * 10;
                        B_num = B_num + input_byte;
                    end
                end
            end
        end
        else if(state == 1)begin //Input ALU_sign
            if(input_byte == 8'h2B) // +
                ALU_sign = 0;
            else if(input_byte == 8'h2D) // -
                ALU_sign = 1;
            else if(input_byte == 8'h2A) // *
                ALU_sign = 2;
            else if(input_byte == 8'h2F) // /
                ALU_sign = 3;
        end
    end
endmodule
