`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2025 06:10:09 PM
// Design Name: 
// Module Name: clockDividerHB
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


module clockDividerHB #(parameter integer THRESHOLD = 50_000_000)(
    input clk,
    input enable,
    input reset,
    output reg dividedClk,
    output beat
    );
    
    reg [31:0] counter;
    always @(posedge clk) begin
        if (reset == 1'b1 || counter >= THRESHOLD -1 )
            begin   
                counter <= 32'd0;
        end
        else if (enable == 1'b1) begin
            counter <= counter + 1'b1;
        end
    end
    always @(posedge clk) begin 
    if (reset == 1'b1) begin 
    dividedClk <= 1'b0; 
    end else if (counter >= THRESHOLD-1) begin 
    dividedClk <= ~dividedClk; 
    end 
    end 
    assign beat=(counter==THRESHOLD-1)&(dividedClk); 
endmodule
