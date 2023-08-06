/* This is the module where all the components of IFU are integrated*/

// Set as top module

module IFU(
	input clock,
	input reset,
	input [31:0]fetch_add,
	output [31:0]inst_code
    );
	 
	 wire [31:0] inst_address;
	 wire [31:0] transfer_inst_code;
	 
	 
	 address_fetch fetch_add_unit(fetch_add, inst_address,clock);
	 Inst_mem_integrated inst_mem_unit(reset,inst_address,transfer_inst_code);
	 prefetch_buffer prefetch_unit(transfer_inst_code, clock, reset, inst_code);
	 


endmodule