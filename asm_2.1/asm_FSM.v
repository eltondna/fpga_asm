module asm_FSM(
    input enter,
    input clk,
    input reset,
    input beat,
    
    input alpha,
    input r_c,
    
    input r_btn,
    input c_btn,
    
    output [6:0] ssd,
    output [1:0] state_led,
    output [2:0] r_led,
    output [2:0] c_led
    );
    
    parameter IDLE = 2'b00, INPUT = 2'b01, DISPLAY = 2'b11;
    reg [1:0] state, nextState;
    reg [2:0] row_in;
    reg [2:0] col_in;
    reg [2:0] row_reg;
    reg [2:0] col_reg;
   

    
    // State changes (Sequential)
    always @(posedge clk) begin 
        if (reset) begin 
            state <= IDLE;
        end
        
        else state <= nextState;
    end 
    
    // State Logic (Combinational)
    always @(*) begin
        case (state)
            IDLE: begin
                if (enter) nextState = INPUT;
                else nextState = IDLE;
            end
            
            INPUT: begin
                if (enter) nextState = DISPLAY;
                else nextState = INPUT;
            end
             
            
            DISPLAY: begin 
                if (enter) nextState = IDLE;
                else nextState = DISPLAY;
            end
        endcase
    end
    
    // Record btn clicks (Sequential)
    always @(posedge clk) begin
        if (reset) begin
            row_reg <= 3'd0;
            col_reg <= 3'd0;
        end
    
        else if (state == INPUT) begin
            if (r_btn)
                row_reg <= row_reg + 3'd1;
            if (c_btn)
                col_reg <= col_reg + 3'd1;
        end
    end  
    
    // Check coordinate
    always @(posedge clk) begin 
        if (reset) begin
            row_in <= 3'd0;
            col_in <= 3'd0;
        end
    
        else if (beat && state == DISPLAY) begin
            row_in <= row_reg;
            col_in <= col_reg;
        end
    end
    
    alpha_ref(
        .alpha(alpha),
        .r_c(r_c),
        .row(row_in),
        .col(col_in),
        .ssd(ssd)
    );
  
    
    
    assign state_led = state;
    assign r_led = row_reg;
    assign c_led = col_reg;

endmodule