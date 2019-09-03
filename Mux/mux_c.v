
`ifndef mux_c
`define mux_c

module mux_c(
output reg out_c,
input sel,
input [1:0] data_in,
input reset,
input clk);


reg f_out_c;


always @(*) 
begin
    out_c = f_out_c;
    if (reset) 
    begin
        out_c = sel?data_in[1]:data_in[0];
    end
end

always @(posedge clk) 
begin
    if (reset)
    begin
        f_out_c <= out_c;
    end
    else
    begin
        f_out_c <= 0;
       
    end
end

endmodule
`endif