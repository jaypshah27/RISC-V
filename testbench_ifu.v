module testbench_ifu;

	// Inputs
	reg clock;
	reg reset;
	reg [31:0] fetch_add;

	// Outputs
	wire [31:0] inst_code;

	// Instantiate the Unit Under Test (UUT)
	IFU uut (
		.clock(clock), 
		.reset(reset), 
		.fetch_add(fetch_add), 
		.inst_code(inst_code)
	);

	initial begin
		// Initialize Inputs
		reset = 1;
		
		fetch_add = 13;
		
		#5 reset = 0;
			
		#10 fetch_add = 18;
		
		#50 fetch_add = 20; 
		 
		

	end
	
	initial begin
	clock = 0;
	forever #5 clock = ~clock;
	end
	
	initial
	#200 $finish;
      
endmodule