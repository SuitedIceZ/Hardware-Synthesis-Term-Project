`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2022 02:18:17 PM
// Design Name: 
// Module Name: uartSystem
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


module uartSystem(
    input clk,
    input RsRx,
    output RsTx,
    output wire [7:0] data_out,
    output wire received
    );
    
    reg ena, last_rec;
    reg [7:0] data_in;
//    wire [7:0] data_out;
    wire sent, baud;//,received;
    
    baudrate_gen baudrate_gen(clk, baud);
    uart_rx receiver(baud, RsRx, received, data_out);
    uart_tx transmitter(baud, data_in, ena, sent, RsTx);
    
    always @(posedge baud) begin
        if (ena) ena = 0;
        if (~last_rec & received) begin
            data_in = data_out;
            
            if ( 8'h30 <= data_in && data_in <= 8'h39 ) ena = 1; //number
            if (data_in == 8'h0A) ena = 1; //Enter (Line feed)
            if (data_in == 8'h2B || data_in == 8'h2D || data_in == 8'h2A || data_in == 8'h2F)ena = 1; // +,-,*,/
//            if (data_in <= 8'h7A && data_in >= 8'h41) ena = 1; //Alphabet
            
        end
        last_rec = received;
    end
    
endmodule
