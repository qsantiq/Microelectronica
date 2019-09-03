module mux_t(
input out_c,
input out_e,
output reg sel,
output reg [1:0] data_in,
output reg reset,
output reg clk);


 initial #31 clk <= 0;
	
	always
	#10 clk <= ~clk;
	initial begin
        
		$dumpfile("mux.vcd");
	  	$dumpvars;
          	$display ("Mux test");
		//#50;
		@(posedge clk);
        reset <= 0;
        data_in <='b10;
        @(posedge clk);
        sel <= 0;
        data_in <='b11;
        @(posedge clk);
        reset <= 1;
        data_in <='b10;
        sel <= 1;
        @(posedge clk);
        data_in <='b01;
        sel <= 0;
        @(posedge clk);
        data_in <='b11;
        sel <= 1;
        @(posedge clk);
        data_in <='b00;
        sel <= 1;
        @(posedge clk);
        data_in <='b11;
        sel <= 0;
        @(posedge clk);
        data_in <='b10;
        sel <= 1;
        @(posedge clk);
        data_in <='b01;
        sel <= 0;
        @(posedge clk);
        @(posedge clk);
		
		$finish;
	end

endmodule		
