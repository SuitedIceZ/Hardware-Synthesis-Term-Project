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
    input wire load_ena, //high enable
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
    
    
    // [4:0] {4,3,2,1,0} = row1 , [9:5] {9,8,7,6,5} = row2 , [14:10] {14,13,12,11,10} = row3 , [15] = sign
    reg [9:0] pos_x [15:0];
    reg [9:0] pos_y [15:0];
    
    reg [6:0] size_x [15:0];
    reg [6:0] size_y [15:0];
    // load size and position into mem from txt file
    initial
    begin
        $readmemh("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_position/pos_x_h.txt",pos_x,0,15);
        $readmemh("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_position/pos_y_h.txt",pos_y,0,15);
        
        $readmemh("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_size/size_x_h.txt",size_x,0,15);
        $readmemh("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_size/size_y_h.txt",size_y,0,15);
    end
    
    
    integer i,j;
    
    reg [0:59] pixel_mem_array_0 [95:0];
    reg [0:59] pixel_mem_array_1 [95:0];
    reg [0:59] pixel_mem_array_2 [95:0];
    reg [0:59] pixel_mem_array_3 [95:0];
    reg [0:59] pixel_mem_array_4 [95:0];
    reg [0:59] pixel_mem_array_5 [95:0];
    reg [0:59] pixel_mem_array_6 [95:0];
    reg [0:59] pixel_mem_array_7 [95:0];
    reg [0:59] pixel_mem_array_8 [95:0];
    reg [0:59] pixel_mem_array_9 [95:0];
    reg [0:59] pixel_mem_array_10 [95:0];
    reg [0:59] pixel_mem_array_11 [95:0];
    reg [0:59] pixel_mem_array_12 [95:0];
    reg [0:59] pixel_mem_array_13 [95:0];
    reg [0:59] pixel_mem_array_14 [95:0];
    reg [0:59] pixel_mem_array_15 [59:0];
    // initialize every pixel_mem_array to 0
    initial
    begin
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C11.txt",pixel_mem_array_0,0,95);
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C1.txt",pixel_mem_array_1,0,95);
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C2.txt",pixel_mem_array_2,0,95);
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C3.txt",pixel_mem_array_3,0,95);
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C4.txt",pixel_mem_array_4,0,95);
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C13.txt",pixel_mem_array_5,0,95);
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C5.txt",pixel_mem_array_6,0,95);
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C6.txt",pixel_mem_array_7,0,95);
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C7.txt",pixel_mem_array_8,0,95);
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C9.txt",pixel_mem_array_9,0,95);
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C13.txt",pixel_mem_array_10,0,95);
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C13.txt",pixel_mem_array_11,0,95);
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C12.txt",pixel_mem_array_12,0,95);
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C10.txt",pixel_mem_array_13,0,95);
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C12.txt",pixel_mem_array_14,0,95);
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C17.txt",pixel_mem_array_15,0,59);
    end
    
    reg [4:0] input_encoded [15:0];
    // TODO : load pixel_mem_array every load_ena
    /*
    always @(posedge load_ena)begin
        for(i = 0 ; i < 16 ; i = i + 1)begin
            $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_position/pos_x.txt",pixel_mem_array_1,0,95);
        end
    end
        */
    // TODO : assign each rgb_reg to input_mem[y][x] screen
    // rgb buffer
    integer Si;
    reg current_state;
    always @(posedge p_tick) begin
        //TODO : update pixel_mem_array
        
        current_state = 0;
        //Check each number and sign boundary
        /*
        for(Si = 0 ; Si < 16 ; Si = Si + 1)begin
            if(pos_y[Si] <= y && y <=  pos_y[Si] + size_y[Si])begin
                if(pos_x[Si] <= x && x <= pos_x[Si] + size_x[Si])begin
//                    current_state = pixel_mem_array[Si][y-pos_y[Si]][x-pos_x[Si]];
                      current_state = 1;
                end
            end
        end
        */
        Si = 0;
        if(pos_y[Si] <= y && y <=  pos_y[Si] + size_y[Si])begin
                if(pos_x[Si] <= x && x <= pos_x[Si] + size_x[Si])begin
                    current_state = pixel_mem_array_0[y-pos_y[Si]][x-pos_x[Si]];
                end
        end
        Si = 1;
        if(pos_y[Si] <= y && y <=  pos_y[Si] + size_y[Si])begin
                if(pos_x[Si] <= x && x <= pos_x[Si] + size_x[Si])begin
                    current_state = pixel_mem_array_1[y-pos_y[Si]][x-pos_x[Si]];
                end
        end
        Si = 2;
        if(pos_y[Si] <= y && y <=  pos_y[Si] + size_y[Si])begin
                if(pos_x[Si] <= x && x <= pos_x[Si] + size_x[Si])begin
                    current_state = pixel_mem_array_2[y-pos_y[Si]][x-pos_x[Si]];
                end
        end
        Si = 3;
        if(pos_y[Si] <= y && y <=  pos_y[Si] + size_y[Si])begin
                if(pos_x[Si] <= x && x <= pos_x[Si] + size_x[Si])begin
                    current_state = pixel_mem_array_3[y-pos_y[Si]][x-pos_x[Si]];
                end
        end
        Si = 4;
        if(pos_y[Si] <= y && y <=  pos_y[Si] + size_y[Si])begin
                if(pos_x[Si] <= x && x <= pos_x[Si] + size_x[Si])begin
                    current_state = pixel_mem_array_4[y-pos_y[Si]][x-pos_x[Si]];
                end
        end
        Si = 5;
        if(pos_y[Si] <= y && y <=  pos_y[Si] + size_y[Si])begin
                if(pos_x[Si] <= x && x <= pos_x[Si] + size_x[Si])begin
                    current_state = pixel_mem_array_5[y-pos_y[Si]][x-pos_x[Si]];
                end
        end
        Si = 6;
        if(pos_y[Si] <= y && y <=  pos_y[Si] + size_y[Si])begin
                if(pos_x[Si] <= x && x <= pos_x[Si] + size_x[Si])begin
                    current_state = pixel_mem_array_6[y-pos_y[Si]][x-pos_x[Si]];
                end
        end
        Si = 7;
        if(pos_y[Si] <= y && y <=  pos_y[Si] + size_y[Si])begin
                if(pos_x[Si] <= x && x <= pos_x[Si] + size_x[Si])begin
                    current_state = pixel_mem_array_7[y-pos_y[Si]][x-pos_x[Si]];
                end
        end
        Si = 8;
        if(pos_y[Si] <= y && y <=  pos_y[Si] + size_y[Si])begin
                if(pos_x[Si] <= x && x <= pos_x[Si] + size_x[Si])begin
                    current_state = pixel_mem_array_8[y-pos_y[Si]][x-pos_x[Si]];
                end
        end
        Si = 9;
        if(pos_y[Si] <= y && y <=  pos_y[Si] + size_y[Si])begin
                if(pos_x[Si] <= x && x <= pos_x[Si] + size_x[Si])begin
                    current_state = pixel_mem_array_9[y-pos_y[Si]][x-pos_x[Si]];
                end
        end
        Si = 10;
        if(pos_y[Si] <= y && y <=  pos_y[Si] + size_y[Si])begin
                if(pos_x[Si] <= x && x <= pos_x[Si] + size_x[Si])begin
                    current_state = pixel_mem_array_10[y-pos_y[Si]][x-pos_x[Si]];
                end
        end
        Si = 11;
        if(pos_y[Si] <= y && y <=  pos_y[Si] + size_y[Si])begin
                if(pos_x[Si] <= x && x <= pos_x[Si] + size_x[Si])begin
                    current_state = pixel_mem_array_11[y-pos_y[Si]][x-pos_x[Si]];
                end
        end
        Si = 12;
        if(pos_y[Si] <= y && y <=  pos_y[Si] + size_y[Si])begin
                if(pos_x[Si] <= x && x <= pos_x[Si] + size_x[Si])begin
                    current_state = pixel_mem_array_12[y-pos_y[Si]][x-pos_x[Si]];
                end
        end
        Si = 13;
        if(pos_y[Si] <= y && y <=  pos_y[Si] + size_y[Si])begin
                if(pos_x[Si] <= x && x <= pos_x[Si] + size_x[Si])begin
                    current_state = pixel_mem_array_13[y-pos_y[Si]][x-pos_x[Si]];
                end
        end
        Si = 14;
        if(pos_y[Si] <= y && y <=  pos_y[Si] + size_y[Si])begin
                if(pos_x[Si] <= x && x <= pos_x[Si] + size_x[Si])begin
                    current_state = pixel_mem_array_14[y-pos_y[Si]][x-pos_x[Si]];
                end
        end
        Si = 15;
        if(pos_y[Si] <= y && y <=  pos_y[Si] + size_y[Si])begin
                if(pos_x[Si] <= x && x <= pos_x[Si] + size_x[Si])begin
                    current_state = pixel_mem_array_15[y-pos_y[Si]][x-pos_x[Si]];
                end
        end
        
        //Write bar
        if((291 <= y && y <= 291 + 8) && (80 <= x && x <= 396+80))begin
            current_state = 1;
        end
        
        //check screen_mem boolean status
        rgb_reg[11:0] = (current_state) ? {4'hF,4'hF,4'hF} : {4'h0,4'h0,4'h0};
        //rgb_reg[11:0] <= {12{1'b1}};
    end
    // output
    assign rgb = (video_on) ? rgb_reg : 12'b0;
endmodule
