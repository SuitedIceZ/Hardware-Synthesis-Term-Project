`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2022 07:54:52 PM
// Design Name: 
// Module Name: loadTemplate_Tester
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


module loadTemplate_Tester(

    );
    //input reg
    reg clk;
    reg [10:0] rLine;
    reg rLocation;
    
    //debugger
    reg [0:59] rWordTest;
    
    //output wire
    wire [0:59] rWord;
     
    loadmem_debugging loadmem_debugging1(clk,rLine,rLocation,rWord);
    always
        #10 clk = !clk;
        
    integer Si,x_offset,y_offset,number_encoded;
    initial
    begin
        //num
        //constant S1 = 0;
        #0
        clk = 0;
        rLine = 0;
        rLocation = 0;
        y_offset = 0;
        number_encoded = 2;
        $display("Test print 2");
        
        if(1)begin //print box
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
                #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
                #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
                #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        end
        
        #10
        number_encoded = 7;
        y_offset = 0;
        $display("Test print 7");
        if(1)begin //print box
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
                #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
                #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
                #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*96)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        end
        
        #10
        number_encoded = 1;
        rLocation = 1;
        y_offset = 0;
        $display("Test print +");
        
        if(1)begin //print box
        
        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;
        
        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        #10 rLine = (number_encoded*60)+y_offset;
        #30 $display("Test line : %d , rWord : %b",rLine,rWord);
        y_offset = y_offset + 1;

        end
        
        /*
        #10
        rWordTest = 112;
        $display("Test rWordTest : %d",rWord);
        
        #10
        rWordTest = 112;
        $display("Test rWordTest : %b",rWord);
        
        for(i = 0 ; i < 4 ; i = i + 1)begin
            #10
            $display("Test i : %d",i);
        end
        */
        #1000 $finish; 
    end
endmodule
