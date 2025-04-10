module spot (
input wire clk,
input wire spot_in,
output wire spot_out);

reg r;
// you write the module code!

always @(posedge clk)
begin
    r <= spot_in;
end 

assign spot_out = spot_in & ~r;
    
endmodule