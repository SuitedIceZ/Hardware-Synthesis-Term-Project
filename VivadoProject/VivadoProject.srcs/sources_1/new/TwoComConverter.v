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
    input clk,
    input [31:0] twoCom_number, //two complement decimal (assume already in range)
    input number_valid, // validity to show NaN , 1 = valid , 0 = NaN
    input reset,
    output reg [4:0] encode_sign,
    output reg [4:0] encode_0, // 0 as MSB
    output reg [4:0] encode_1,
    output reg [4:0] encode_2,
    output reg [4:0] encode_3 // 3 as LSB   => {s,0,1,2,3}
    );
    
    reg [1:0] state;
    reg [31:0] twoCon_number_template;
    reg [31:0] twoCom_number_buffer;
    
    wire [31:0] div1000;
    wire [31:0] div100;
    wire [31:0] div10;
    wire [31:0] div1;
    
    initial
    begin
        state = 0;
        twoCon_number_template = 0;
        twoCom_number_buffer = 0;
        encode_sign = 13; //Empty
        encode_0 = 13;
        encode_1 = 13;
        encode_2 = 13;
        encode_3 = 13;
    end
    
    pos_divider pos_divider_1000(clk,
                                (twoCom_number_buffer[31] ? -1*twoCom_number_buffer :twoCom_number_buffer),
                                1000,reset,div1000);
    pos_divider pos_divider_100(clk,
                                (twoCom_number_buffer[31] ? -1*twoCom_number_buffer :twoCom_number_buffer),
                                100,reset,div100);
    pos_divider pos_divider_10(clk,
                                (twoCom_number_buffer[31] ? -1*twoCom_number_buffer :twoCom_number_buffer),
                                10,reset,div10);                      
    pos_divider pos_divider_1(clk,
                                (twoCom_number_buffer[31] ? -1*twoCom_number_buffer :twoCom_number_buffer),
                                1,reset,div1);
    
    integer i;
    always @(posedge clk)
    begin
        if(number_valid)begin
            twoCom_number_buffer = twoCom_number;
            
            if(twoCom_number_buffer[31] == 1)begin //negative
                encode_sign <= 11;
                twoCom_number_buffer <= -1*twoCom_number_buffer; 
            end
            else
                encode_sign <= 13;
            encode_0 <= div1000;
            encode_1 <= div100 - (10*div1000);
            encode_2 <= div10 - (10*div100);
            encode_3 <= div1 - (10*div10);
            
            /*
            encode_3 = twoCom_number_buffer%10;
            twoCom_number_buffer = twoCom_number_buffer/10;
            
            encode_2 = twoCom_number_buffer%10;
            twoCom_number_buffer = twoCom_number_buffer/10;
            
            encode_1 = twoCom_number_buffer%10;
            twoCom_number_buffer = twoCom_number_buffer/10;
            
            encode_0 = twoCom_number_buffer%10; 
            */
        end else begin
            encode_sign = 13; //Empty
            encode_0 = 13;
            encode_1 = 12; //N
            encode_2 = 10; //a
            encode_3 = 12; //N
        end
            
        
    end
endmodule
