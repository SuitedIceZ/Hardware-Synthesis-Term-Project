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
    /*
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
    */
    
    //Update screen mem to sub-memory mapped
    
    // [4:0] {4,3,2,1,0} = row1 , [9:5] {9,8,7,6,5} = row2 , [14:10] {14,13,12,11,10} = row3 , [15] = sign
    reg [9:0] pos_x [15:0];
    reg [9:0] pos_y [15:0];
    
    reg [6:0] size_x [15:0];
    reg [6:0] size_y [15:0];
    // load size and position into mem from txt file
    initial
    begin
        $readmemd("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_position/pos_x.txt",pos_x,0,15);
        $readmemd("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_position/pos_y.txt",pos_y,0,15);
        
        $readmemd("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_size/size_x.txt",size_x,0,15);
        $readmemd("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_size/size_y.txt",size_y,0,15);
    end
    
    
    integer i,j;
    reg [59:0] pixel_mem_array [0:15][95:0];
    // initialize every pixel_mem_array to 0
    initial
    begin
        for(i = 0 ; i < 16 ; i = i + 1)begin
            for(j = 0 ; j < 96 ; j = j + 1)begin
                pixel_mem_array[i][j] = {60{1'b0}};
            end
        end
    end
        
    // TODO : assign each rgb_reg to input_mem[y][x] screen
    // rgb buffer
    integer Si;
    reg current_state;
    always @(posedge p_tick) begin
        //TODO : update pixel_mem_array
        /*for(Si = 0 ; Si < 16 ; Si = Si + 1)begin
            for(i = pos_y[Si] ; i <= pos_y[Si] + size_y [Si] ; i = i + 1)begin
                for(j = pos_x[Si] ; j <= pos_x[Si] + size_x [Si] ; j = j + 1)begin
                    //screen_mem[i][j] = pixel_mem_array[Si][i][j];
                    if(y == i && x == j)begin
                        current_state = pixel_mem_array[Si][i][j];
                    end
                end
            end
        end*/
        for(Si = 0 ; Si < 16 ; Si = Si + 1)begin
            if(pos_y[Si] <= y && y <=  pos_y[Si] + size_y[Si])begin
                if(pos_x[Si] <= x && x <= pos_x[Si] + size_x[Si])begin
                    current_state = pixel_mem_array[Si][y-pos_y[Si]][x-pos_x[Si]];
                end
            end
        end
        //Check x,y to each pixel_mem_array
        //Si = 0
        /*
        for(i = pos_y[Si] ; i <= pos_y[Si] + size_y [Si] ; i = i + 1)begin
            for(j = pos_x[Si] ; j <= pos_x[Si] + size_x [Si] ; j = j + 1)begin
                //screen_mem[i][j] = pixel_mem_array[Si][i][j];
                if(y == i && x == j)begin
                    current_state = pixel_mem_array[Si][i][j];
                end
            end
        end
        Si = Si + 1;
        //Si = 1
        for(i = pos_y[Si] ; i <= pos_y[Si] + size_y [Si] ; i = i + 1)begin
            for(j = pos_x[Si] ; j <= pos_x[Si] + size_x [Si] ; j = j + 1)begin
                //screen_mem[i][j] = pixel_mem_array[Si][i][j];
                if(y == i && x == j)begin
                    current_state = pixel_mem_array[Si][i][j];
                end
            end
        end
        Si = Si + 1;
        //Si = 2
        for(i = pos_y[Si] ; i <= pos_y[Si] + size_y [Si] ; i = i + 1)begin
            for(j = pos_x[Si] ; j <= pos_x[Si] + size_x [Si] ; j = j + 1)begin
                //screen_mem[i][j] = pixel_mem_array[Si][i][j];
                if(y == i && x == j)begin
                    current_state = pixel_mem_array[Si][i][j];
                end
            end
        end
        Si = Si + 1;
        //Si = 3
        for(i = pos_y[Si] ; i <= pos_y[Si] + size_y [Si] ; i = i + 1)begin
            for(j = pos_x[Si] ; j <= pos_x[Si] + size_x [Si] ; j = j + 1)begin
                //screen_mem[i][j] = pixel_mem_array[Si][i][j];
                if(y == i && x == j)begin
                    current_state = pixel_mem_array[Si][i][j];
                end
            end
        end
        Si = Si + 1;
        //Si = 4
        for(i = pos_y[Si] ; i <= pos_y[Si] + size_y [Si] ; i = i + 1)begin
            for(j = pos_x[Si] ; j <= pos_x[Si] + size_x [Si] ; j = j + 1)begin
                //screen_mem[i][j] = pixel_mem_array[Si][i][j];
                if(y == i && x == j)begin
                    current_state = pixel_mem_array[Si][i][j];
                end
            end
        end
        Si = Si + 1;
        //Si = 5
        for(i = pos_y[Si] ; i <= pos_y[Si] + size_y [Si] ; i = i + 1)begin
            for(j = pos_x[Si] ; j <= pos_x[Si] + size_x [Si] ; j = j + 1)begin
                //screen_mem[i][j] = pixel_mem_array[Si][i][j];
                if(y == i && x == j)begin
                    current_state = pixel_mem_array[Si][i][j];
                end
            end
        end
        Si = Si + 1;
        //Si = 6
        for(i = pos_y[Si] ; i <= pos_y[Si] + size_y [Si] ; i = i + 1)begin
            for(j = pos_x[Si] ; j <= pos_x[Si] + size_x [Si] ; j = j + 1)begin
                //screen_mem[i][j] = pixel_mem_array[Si][i][j];
                if(y == i && x == j)begin
                    current_state = pixel_mem_array[Si][i][j];
                end
            end
        end
        Si = Si + 1;
        //Si = 7
        for(i = pos_y[Si] ; i <= pos_y[Si] + size_y [Si] ; i = i + 1)begin
            for(j = pos_x[Si] ; j <= pos_x[Si] + size_x [Si] ; j = j + 1)begin
                //screen_mem[i][j] = pixel_mem_array[Si][i][j];
                if(y == i && x == j)begin
                    current_state = pixel_mem_array[Si][i][j];
                end
            end
        end
        Si = Si + 1;
        //Si = 8
        for(i = pos_y[Si] ; i <= pos_y[Si] + size_y [Si] ; i = i + 1)begin
            for(j = pos_x[Si] ; j <= pos_x[Si] + size_x [Si] ; j = j + 1)begin
                //screen_mem[i][j] = pixel_mem_array[Si][i][j];
                if(y == i && x == j)begin
                    current_state = pixel_mem_array[Si][i][j];
                end
            end
        end
        Si = Si + 1;
        //Si = 9
        for(i = pos_y[Si] ; i <= pos_y[Si] + size_y [Si] ; i = i + 1)begin
            for(j = pos_x[Si] ; j <= pos_x[Si] + size_x [Si] ; j = j + 1)begin
                //screen_mem[i][j] = pixel_mem_array[Si][i][j];
                if(y == i && x == j)begin
                    current_state = pixel_mem_array[Si][i][j];
                end
            end
        end
        Si = Si + 1;
        //Si = 10
        for(i = pos_y[Si] ; i <= pos_y[Si] + size_y [Si] ; i = i + 1)begin
            for(j = pos_x[Si] ; j <= pos_x[Si] + size_x [Si] ; j = j + 1)begin
                //screen_mem[i][j] = pixel_mem_array[Si][i][j];
                if(y == i && x == j)begin
                    current_state = pixel_mem_array[Si][i][j];
                end
            end
        end
        Si = Si + 1;
        //Si = 11
        for(i = pos_y[Si] ; i <= pos_y[Si] + size_y [Si] ; i = i + 1)begin
            for(j = pos_x[Si] ; j <= pos_x[Si] + size_x [Si] ; j = j + 1)begin
                //screen_mem[i][j] = pixel_mem_array[Si][i][j];
                if(y == i && x == j)begin
                    current_state = pixel_mem_array[Si][i][j];
                end
            end
        end
        Si = Si + 1;
        //Si = 12
        for(i = pos_y[Si] ; i <= pos_y[Si] + size_y [Si] ; i = i + 1)begin
            for(j = pos_x[Si] ; j <= pos_x[Si] + size_x [Si] ; j = j + 1)begin
                //screen_mem[i][j] = pixel_mem_array[Si][i][j];
                if(y == i && x == j)begin
                    current_state = pixel_mem_array[Si][i][j];
                end
            end
        end
        Si = Si + 1;
        //Si = 13
        for(i = pos_y[Si] ; i <= pos_y[Si] + size_y [Si] ; i = i + 1)begin
            for(j = pos_x[Si] ; j <= pos_x[Si] + size_x [Si] ; j = j + 1)begin
                //screen_mem[i][j] = pixel_mem_array[Si][i][j];
                if(y == i && x == j)begin
                    current_state = pixel_mem_array[Si][i][j];
                end
            end
        end
        Si = Si + 1;
        //Si = 14
        for(i = pos_y[Si] ; i <= pos_y[Si] + size_y [Si] ; i = i + 1)begin
            for(j = pos_x[Si] ; j <= pos_x[Si] + size_x [Si] ; j = j + 1)begin
                //screen_mem[i][j] = pixel_mem_array[Si][i][j];
                if(y == i && x == j)begin
                    current_state = pixel_mem_array[Si][i][j];
                end
            end
        end
        Si = Si + 1;
        //Si = 15
        for(i = pos_y[Si] ; i <= pos_y[Si] + size_y [Si] ; i = i + 1)begin
            for(j = pos_x[Si] ; j <= pos_x[Si] + size_x [Si] ; j = j + 1)begin
                //screen_mem[i][j] = pixel_mem_array[Si][i][j];
                if(y == i && x == j)begin
                    current_state = pixel_mem_array[Si][i][j];
                end
            end
        end
        */
        //check screen_mem boolean status
        if((291 <= y && y < 291 + 8) && (80 <= x && x < 396+80))begin
            current_state = 1;
        end
        rgb_reg = (current_state) ? {4'hF,4'hF,4'hF} : {4'h0,4'h0,4'h0};
    end
    // output
    assign rgb = (video_on) ? rgb_reg : 12'b0;
endmodule
