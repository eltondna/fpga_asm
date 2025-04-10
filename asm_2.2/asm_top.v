
module asm_top(
        input reset,
        input clk,
        output [3:0] ssdAnode,
        output [6:0] ssdCathode
    );
    wire beat;
    wire m_beat;
    clockDividerHB(
        .clk(clk),
        .enable(1'b1),
        .reset(reset),
        .beat(beat),
        .dividedClk()
    );
    
    clockDividerHB #(.THRESHOLD(200_000) )(
        .clk(clk),
        .enable(1'b1),
        .reset(reset),
        .beat(m_beat),
        .dividedClk()
    );
    
    reg [1:0] digit = 0;
    always @(posedge clk) begin
        if (m_beat) digit <= digit + 1;
        else digit <= digit;
    end
    
    reg [2:0] row = 0;
    reg [2:0] col = 0;
    reg [3:0] anode_reg = 0;
    
    always @(posedge clk) begin
        case (digit)
            2'b00:begin row = 1; col = 3; anode_reg = 4'b0111;end
            2'b01:begin row = 3; col = 5; anode_reg = 4'b1011;end
            2'b10:begin row = 3; col = 5; anode_reg = 4'b1101;end
            2'b11:begin row = 3; col = 2; anode_reg = 4'b1110;end
        endcase
    
    end
    reg [6:0] ssd_reg;
    alpha_ref(
        .row(row),
        .col(col),
        .ssd(ssdCathode),
        .alpha(1),
        .r_c(0)
    );
    
    assign ssdAnode = anode_reg;

endmodule