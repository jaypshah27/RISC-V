module prefetch_buffer(
    input [31:0] input_code,
    input clock,
	 input reset,
    output reg [31:0] output_code
    );
	 
	 reg [31:0] fifo [2:0];
	
	always @(posedge reset)
	begin 
	 fifo[0] = 1;
	 fifo[1] = 2;
	 fifo[2] = 3;
	end
	
	always @(posedge clock)
	begin
		
		output_code = fifo[0];
		
		fifo[0] = fifo[1];
		
		fifo[1] = fifo[2];
		
		fifo[2] = input_code;
		
	end


endmodule