`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2022 08:11:59 PM
// Design Name: 
// Module Name: loadmem_debugging
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


module loadmem_debugging(
    input clk,
    input [10:0] rLine,
    input rLocation, // 0 = num , 1 = sign
    output reg [0:59] rWord
    );
    reg [0:59] template_num_array [(14*96)-1:0];
    reg [0:59] template_sign_array [(5*60)-1:0];
    
    initial begin
        rWord = 0;
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
    
    always @(posedge clk)begin
        if(rLocation)begin
            rWord = template_sign_array[rLine];
        end else begin
            rWord = template_num_array[rLine];
        end
        //$monitor(rWord);
    end
endmodule
