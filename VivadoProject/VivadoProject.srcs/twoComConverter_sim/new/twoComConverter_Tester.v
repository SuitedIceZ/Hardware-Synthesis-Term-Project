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
    reg [31:0] twoCom_number;
    reg number_valid;
    
    //output wire
    wire [4:0] encode_sign;
    wire [4:0] encode_0;
    wire [4:0] encode_1;
    wire [4:0] encode_2;
    wire [4:0] encode_3;
    
    twoComConverter twoComConverter_A(twoCom_number,number_valid,encode_sign,encode_0,encode_1,encode_2,encode_3);
    
    initial begin
        #0
        twoCom_number = 0;
        number_valid = 0;
        
        #10
        twoCom_number = 137;
        number_valid = 1;
        
        #10
        twoCom_number = -12546;
        number_valid = 0;
        
        #10
        twoCom_number = -546;
        number_valid = 1;
        
        #10
        twoCom_number = -7981;
        number_valid = 1;
        
        #10
        twoCom_number = 1;
        number_valid = 1;
        
        #10
        twoCom_number = 23;
        number_valid = 1;
        
        #10
        twoCom_number = 9876;
        number_valid = 1;
        
        #10
        twoCom_number = 5432;
        number_valid = 1;
    end
    
    
endmodule
