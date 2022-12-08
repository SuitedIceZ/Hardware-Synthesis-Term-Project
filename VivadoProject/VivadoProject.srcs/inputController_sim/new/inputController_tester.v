`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2022 12:45:06 PM
// Design Name: 
// Module Name: inputController_tester
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


module inputController_tester(

    );
    //input reg
    reg clk;
    reg [7:0] input_byte; //input byte in ascii code
    reg received; //high enable
    reg reset; //high enable
    
    //output wire
    wire [31:0] A_num;
    wire [31:0] B_num;
    wire [2:0] operand_code;
    
    inputController inputControllerModule(clk,input_byte,received,reset,A_num,B_num,operand_code);
    
    //debugger
    reg [31:0] Ax10_R;
    wire [31:0] Ax10_W;
    assign Ax10_W = Ax10_R;
    
    //clock sim
    always
        #10 clk = !clk;
       
    //procedure sim 
    initial
    begin
        #0
        clk = 0;
        input_byte = 0;
        received = 0;
        reset = 0;
        
        #10
        input_byte = 8'h31; // 1
        received = 1;
        
        #20
        received = 0;
        Ax10_R = (A_num *10);
        
        #10
        input_byte = 8'h33; // 3
        received = 1;
        
        #20
        received = 0;
        
        #1000 $finish;
    end
    
endmodule
