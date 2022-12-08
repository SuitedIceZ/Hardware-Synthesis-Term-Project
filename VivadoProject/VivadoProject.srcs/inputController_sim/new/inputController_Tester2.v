`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2022 01:36:09 PM
// Design Name: 
// Module Name: inputController_Tester2
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


module inputController_Tester2(

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
    
    //internal debugger
    wire sign_state;
    
    inputController inputControllerModule(clk,input_byte,received,reset,A_num,B_num,operand_code,sign_state);
    
    //external debugger
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
        
        #20
        input_byte = 8'h31; // 1
        received = 1;
        #20 received = 0;
        
        #50 //debug
        Ax10_R = -1*(A_num *10);
        
        #20
        input_byte = 8'h33; // 3
        received = 1;
        #20 received = 0;
        
        #20
        input_byte = 8'h39; // 9
        received = 1;
        #20 received = 0;
        
        #20
        input_byte = 8'h0A; // Enter
        received = 1;
        #20 received = 0;
        
        #20
        input_byte = 8'h2D; // minus operator
        received = 1;
        #20 received = 0;
        
        #20
        input_byte = 8'h0A; // Enter
        received = 1;
        #20 received = 0;
        
        #20
        input_byte = 8'h2D; // minus sign
        received = 1;
        #20 received = 0;
        
        #20
        input_byte = 8'h38; // 8
        received = 1;
        #20 received = 0;
        
        #20
        input_byte = 8'h32; // 2
        received = 1;
        #20 received = 0;
        
        #20
        input_byte = 8'h0A; // Enter
        received = 1;
        #20 received = 0;
        
        #1000 $finish;
    end
endmodule
