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
    input wire [31:0] A_num, //two complement decimal (assume already in range)
    input wire [31:0] B_num, //two complement decimal (assume already in range)
    input wire [31:0] C_num, //two complement decimal (have C_valid to indicate in range)
    input wire C_valid,
    input wire [2:0] operand_code, // 0,1,2,3,4 for empty,+,-,*,/ in order
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
    
    //Load num and sign into template memory array
    reg [0:59] template_num_array [(14*96)-1:0];
    reg [0:59] template_sign_array [(5*60)-1:0];
    
    initial
    begin
        //num
        //constant S1 = 0;
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C0.txt",template_num_array,96*0,(96*(0+1))-1);
//        S1 = S1+1;
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C1.txt",template_num_array,96*1,(96*(1+1))-1);
//        S1 = S1+1;
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C2.txt",template_num_array,96*2,(96*(2+1))-1);
//        S1 = S1+1;
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C3.txt",template_num_array,96*3,(96*(3+1))-1);
//        S1 = S1+1;
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C4.txt",template_num_array,96*4,(96*(4+1))-1);
//        S1 = S1+1;
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C5.txt",template_num_array,96*5,(96*(5+1))-1);
//        S1 = S1+1;
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C6.txt",template_num_array,96*6,(96*(6+1))-1);
//        S1 = S1+1;
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C7.txt",template_num_array,96*7,(96*(7+1))-1);
//        S1 = S1+1;
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C8.txt",template_num_array,96*8,(96*(8+1))-1);
//        S1 = S1+1;
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C9.txt",template_num_array,96*9,(96*(9+1))-1);
//        S1 = S1+1;
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C10.txt",template_num_array,96*10,(96*(10+1))-1);
//        S1 = S1+1;
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C11.txt",template_num_array,96*11,(96*(11+1))-1);
//        S1 = S1+1;
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C12.txt",template_num_array,96*12,(96*(12+1))-1);
//        S1 = S1+1;
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C13.txt",template_num_array,96*13,(96*(13+1))-1);
        
        //sign
//        S1 = 0;
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C14.txt",template_sign_array,60*0,(60*(0+1))-1);
//        S1 = S1+1;
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C15.txt",template_sign_array,60*1,(60*(1+1))-1);
//        S1 = S1+1;
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C16.txt",template_sign_array,60*2,(60*(2+1))-1);
//        S1 = S1+1;
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C17.txt",template_sign_array,60*3,(60*(3+1))-1);
//        S1 = S1+1;
        $readmemb("D:/Education/year3/term1/HW_SYS_LAB/TermProject/resource/display_encoded/C18.txt",template_sign_array,60*4,(60*(4+1))-1);
        
    end
    /*
    twoComConverter A_num_converter(-7021,1,AS,A0,A1,A2,A3);
    twoComConverter B_num_converter(-8941,1,BS,B0,B1,B2,B3);
    twoComConverter C_num_converter(-10000,0,CS,C0,C1,C2,C3);*/
    //    wire [4:0] number_encoded_all = {AS,A0,A1,A2,A3,BS,B0,B1,B2,B3,CS,C0,C1,C2,C3};
    
    wire [4:0] number_encoded_all [15:0];
    /*twoComConverter A_num_converter(-7021,1,number_encoded_all[0],number_encoded_all[1],number_encoded_all[2],number_encoded_all[3],number_encoded_all[4]);
    twoComConverter B_num_converter(-8941,1,number_encoded_all[5],number_encoded_all[6],number_encoded_all[7],number_encoded_all[8],number_encoded_all[9]);
    twoComConverter C_num_converter(-10000,0,number_encoded_all[10],number_encoded_all[11],number_encoded_all[12],number_encoded_all[13],number_encoded_all[14]);
    */
    twoComConverter A_num_converter(A_num,1,number_encoded_all[0],number_encoded_all[1],number_encoded_all[2],number_encoded_all[3],number_encoded_all[4]);
    twoComConverter B_num_converter(B_num,1,number_encoded_all[5],number_encoded_all[6],number_encoded_all[7],number_encoded_all[8],number_encoded_all[9]);
    twoComConverter C_num_converter(C_num,C_valid,number_encoded_all[10],number_encoded_all[11],number_encoded_all[12],number_encoded_all[13],number_encoded_all[14]);
    
    assign number_encoded_all[15] = operand_code + 14;


    // rgb buffer config by current_state
    integer Si;
    reg current_state;
    always @(posedge p_tick) begin
        
        //Check number box
        current_state = 0;
        for(Si = 0 ; Si <= 14 ; Si = Si + 1)begin
            if(pos_y[Si] <= y && y <  pos_y[Si] + size_y[Si])begin
                if(pos_x[Si] <= x && x < pos_x[Si] + size_x[Si])begin
                    //current_state = number_encoded_all[Si*5:((Si+1)*5)-1];
                    current_state = template_num_array[(number_encoded_all[Si]*96)+(y-pos_y[Si])][x-pos_x[Si]];
                end
            end
        end
        
        //Check sign operand box
        Si = 15;
        if(pos_y[Si] <= y && y < pos_y[Si] + size_y[Si])begin
                if(pos_x[Si] <= x && x < pos_x[Si] + size_x[Si])begin
                    //current_state = template_sign_array[y-pos_y[Si]][x-pos_x[Si]];
                    current_state = template_sign_array[(number_encoded_all[Si]*60)+(y-pos_y[Si])][x-pos_x[Si]];
                end
        end
        
        //Write bar
        if((291 <= y && y < 291 + 8) && (80 <= x && x < 396+80))begin
            current_state = 1;
        end
        
        //check screen_mem boolean status
        rgb_reg[11:0] = (current_state) ? {4'hF,4'hF,4'hF} : {4'h0,4'h0,4'h0};
        //rgb_reg[11:0] <= {12{1'b1}};
    end
    // output
    assign rgb = (video_on) ? rgb_reg : 12'b0;
endmodule
