`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2022 06:21:17 PM
// Design Name: 
// Module Name: twoComConverter_Tester
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


module twoComConverter_Tester(

    );
    //input reg
    reg clk;
    reg [31:0] twoCom_number;
    reg number_valid;
    reg reset;
    
    //output wire
    wire [4:0] encode_sign;
    wire [4:0] encode_0;
    wire [4:0] encode_1;
    wire [4:0] encode_2;
    wire [4:0] encode_3;
    
    twoComConverter twoComConverter_A(clk,twoCom_number,number_valid,reset,encode_sign,encode_0,encode_1,encode_2,encode_3);
    
    always
        #10 clk = !clk;
    
    initial begin
        #0
        clk = 0;
        twoCom_number = 0;
        number_valid = 0;
        reset = 0;
        
        #10
        twoCom_number = 137;
        number_valid = 1;
        
        #10000
        twoCom_number = -12546;
        number_valid = 0;
        
        #10000
        twoCom_number = -546;
        number_valid = 1;
        
        #10000
        twoCom_number = -7981;
        number_valid = 1;
        
        #10000
        twoCom_number = 1;
        number_valid = 1;
        
        #10000
        twoCom_number = 23;
        number_valid = 1;
        
        #10000
        twoCom_number = 9876;
        number_valid = 1;
        
        #10000
        twoCom_number = 5432;
        number_valid = 1;
        
        #1000000 $finish;
    end
    
    
endmodule
