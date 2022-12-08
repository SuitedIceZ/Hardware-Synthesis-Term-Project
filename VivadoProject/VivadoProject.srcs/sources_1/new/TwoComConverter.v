`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2022 02:57:45 PM
// Design Name: 
// Module Name: twoComConverter
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


module twoComConverter(
    input [31:0] twoCom_number, //two complement decimal (assume already in range)
    input number_valid, // validity to show NaN , 1 = valid , 0 = NaN
    output reg [4:0] encode_sign,
    output reg [4:0] encode_0, // 0 as MSB
    output reg [4:0] encode_1,
    output reg [4:0] encode_2,
    output reg [4:0] encode_3 // 3 as LSB   => {s,0,1,2,3}
    );
    reg [31:0] twoCom_number_buffer;
    initial
    begin
        encode_sign = 13; //Empty
        encode_0 = 13;
        encode_1 = 13;
        encode_2 = 13;
        encode_3 = 13;
    end
    
    integer i;
    always @*
    begin
        if(number_valid)begin
            twoCom_number_buffer = twoCom_number;
            
            if(twoCom_number_buffer < 0)begin
                encode_sign = 11;
                twoCom_number_buffer = -1*twoCom_number_buffer; 
            end
            else
                encode_sign = 13;
            
            encode_3 = twoCom_number_buffer%10;
            twoCom_number_buffer = twoCom_number_buffer/10;
            
            encode_2 = twoCom_number_buffer%10;
            twoCom_number_buffer = twoCom_number_buffer/10;
            
            encode_1 = twoCom_number_buffer%10;
            twoCom_number_buffer = twoCom_number_buffer/10;
            
            encode_0 = twoCom_number_buffer%10;
        end else begin
            encode_sign = 13; //Empty
            encode_0 = 13;
            encode_1 = 12; //N
            encode_2 = 10; //a
            encode_3 = 12; //N
        end
            
        
    end
endmodule
