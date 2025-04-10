module debouncer (
    input wire switchIn,
    input wire clk,
    input wire reset,
    output wire debounceout);

    wire beat;
    clockDividerHB #(3_333_333)CD (
    .clk(clk),
    .reset(reset),
    .enable(1'b1),
    .dividedClk(),
    .beat(beat)
    );


    reg[2:0] pipeline;

    always @(posedge clk) 
    begin
        if (reset) begin
            pipeline <= 3'b000;
        end
        else if (beat)
            begin 
                pipeline[0] <= switchIn;
                pipeline[1] <= pipeline[0];
                pipeline[2] <= pipeline[1];
            end     
    end

assign debounceout = &pipeline;

endmodule
