`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 06:45:52 PM
// Design Name: 
// Module Name: alpha_ref
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

module alpha_ref(
    input [2:0] col,
    input [2:0] row,
    input alpha,
    input r_c,
    output [6:0] ssd
    );
    
    reg [6:0] ssd_tmp;
    reg [2:0] digit;

    always @(*) begin
    ssd_tmp = 7'b1111110;   // -

    if (alpha) begin
        case (row)
            1:  begin
                if (col == 1) ssd_tmp = 7'b0001000; // A
                if (col == 2) ssd_tmp = 7'b1100000; // b
                if (col == 3) ssd_tmp = 7'b0110001; // C
                if (col == 4) ssd_tmp = 7'b1000010; // d
                if (col == 5) ssd_tmp = 7'b0110000; // E
            end
            
            2: begin
                if (col == 1) ssd_tmp = 7'b0111000; // F
                if (col == 2) ssd_tmp = 7'b0100000; // G
                if (col == 3) ssd_tmp = 7'b1001000; // H
                if (col == 4) ssd_tmp = 7'b0110000; // I
            end
    
            3: begin
                if (col == 2) ssd_tmp = 7'b1001110; // L
                if (col == 4) ssd_tmp = 7'b1101010; // n
                if (col == 5) ssd_tmp = 7'b0000001; // O
            end
            
            4: begin 
                if (col == 1) ssd_tmp = 7'b0011000; // P
                if (col == 3) ssd_tmp = 7'b0000101; // r
                if (col == 4) ssd_tmp = 7'b0100100; // S
                if (col == 5) ssd_tmp = 7'b1110000; // t
    
            end
        endcase  
    end

    else begin 
         digit = r_c ? row : col; 
         case (digit)
            1: ssd_tmp = 7'b1001111; 
            2: ssd_tmp = 7'b0010010;
            3: ssd_tmp = 7'b0000110;
            4: ssd_tmp = 7'b1001100;
            5: ssd_tmp = 7'b0100100;
         endcase
    end
   end
   assign ssd = ssd_tmp;
endmodule
