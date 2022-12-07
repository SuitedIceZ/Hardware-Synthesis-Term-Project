`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2022 11:16:47 PM
// Design Name: 
// Module Name: VGA_system
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


module VGA_system(
    input clk,
    input wire reset,
    input wire [31:0] A_num, 
    input wire [31:0] B_num,
    output hsync,
    output vsync,
    output [11:0] rgb
    );
    
    localparam H_DISPLAY       = 640; // horizontal display area
    localparam V_DISPLAY       = 480; // vertical display area
    
    // register for Basys 2 8-bit RGB DAC 
    reg [11:0] rgb_reg;
    
    // video status output from VGASync to tell when to route out rgb signal to DAC
    wire video_on;
    
    wire p_tick;
    wire [9:0] x, y;
    // instantiate VGASync
    VGASync vga_sync_unit (.clk(clk), .reset(reset), .hsync(hsync), .vsync(vsync),
                            .video_on(video_on), .p_tick(p_tick), .x(x), .y(y));
    
    // Array of screen
    reg [479:0] screen_mem [639:0]; //now base on white(1){4'hF,4'hF,4'hF} and black(0){4'h0,4'h0,4'h0} color only
    integer i,j;
    initial
    begin
        //initial screen
        for(i = 0 ; i < 640 ; i = i + 1)begin
            for(j = 0 ; j < 480 ; j = j + 1)begin
                screen_mem[i][j] = 0;
                if((291 <= i && i < 291 + 8) && (80 <= j && j < 396+80)) //the bar
                    screen_mem[i][j] = 1;
            end
        end
        
    end
    
    //Update screen mem to sub-memory mapped
    
    // [4:0] {4,3,2,1,0} = row1 , [9:5] {9,8,7,6,5} = row2 , [14:10] {14,13,12,11,10} = row3 , [15] = sign
    reg [9:0] pos_x [15:0];
    reg [9:0] pos_y [15:0];
    
    reg [6:0] size_x [15:0];
    reg [6:0] size_y [15:0];
    
    initial
    begin
        $readmemd("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_position/pos_x.txt",pos_x,0,15);
        $readmemd("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_position/pos_y.txt",pos_y,0,15);
        
        $readmemd("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_size/size_x.txt",size_x,0,15);
        $readmemd("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_size/size_y.txt",size_y,0,15);
    end
    // TODO : assign each rgb_reg to input_mem[y][x] screen
    // rgb buffer
    always @(posedge p_tick) begin
        rgb_reg = (screen_mem[y][x]) ? {4'hF,4'hF,4'hF} : {4'h0,4'h0,4'h0};
    end
    // output
    assign rgb = (video_on) ? rgb_reg : 12'b0;
endmodule
