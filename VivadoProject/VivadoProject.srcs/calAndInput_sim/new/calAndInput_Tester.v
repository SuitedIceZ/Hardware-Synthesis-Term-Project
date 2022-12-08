`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2022 02:26:08 PM
// Design Name: 
// Module Name: calAndInput_Tester
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


module calAndInput_Tester(

    );
    //input reg
    reg clk;
    reg [7:0] input_byte; //input byte in ascii code
    reg received; //high enable
    reg reset; //high enable
    
    //output wire
    //intermediate wire
    wire [31:0] A_num;
    wire [31:0] B_num;
    wire [2:0] operand_code;
    //carry on wire
    wire C_valid;
    wire [31:0] C_num;
    
    
    inputController inputControllerModule2(clk,input_byte,received,reset,A_num,B_num,operand_code,clear_answer/*,sign_state*/);
    calculatorSystem calculatorSystem_module2(clk,A_num,B_num,operand_code,reset||clear_answer,C_num,C_valid);
    
    always
        #10 clk = !clk;
        
    initial
    begin
        if(1)begin //set 1
          #0
        clk = 0;
        input_byte = 0;
        received = 0;
        reset = 0;
        
        #20
        input_byte = 8'h31; // 1
        received = 1;
        #20 received = 0;
        
        //#50 //debug
        //Ax10_R = -1*(A_num *10);
        
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
        
        #20
        input_byte = 8'h0A; // Enter to reset
        received = 1;
        #20 received = 0;     
        end

        if(1)begin //set 2
            #20
            input_byte = 8'h35; // 5
            received = 1;
            #20 received = 0;
            
            #20
            input_byte = 8'h34; // 4
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
            
            #20
            input_byte = 8'h2F; // divide operator
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
            input_byte = 8'h33; // 3
            received = 1;
            #20 received = 0;
            
            #20
            input_byte = 8'h37; // 7
            received = 1;
            #20 received = 0;
            
            #20
            input_byte = 8'h0A; // Enter
            received = 1;
            #20 received = 0;
        end
        #1000 $finish;
    end
endmodule
