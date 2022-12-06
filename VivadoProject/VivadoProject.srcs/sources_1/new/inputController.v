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
    input input_byte,
    input received,
    output A_num,
    output B_num
    );
    reg [1:0] state; // 0 receiving A , 1 receiving Sign , 2  receiving B , 3 show answer
    reg [7:0] buffer_byte;
    
    initial
    begin
        buffer_byte = 8'h00;
        state = 0;
    end
    
    always @(posedge received)
    begin
        
    end
endmodule
