module address_fetch(
    input [31:0] inst_code,
    output reg [31:0] inst_address,
    input clock
    );	 
	 integer check = 0;
	 
	 always @(posedge clock)
		if(check == 0)
			begin
			inst_address = 0;
			check = 1;
			end
			
		// branch instructions
		else if(inst_code[6:0] == 7'b1100011 && check == 1)
		begin
			if(inst_code[31] == 1)
			inst_address = inst_address - {inst_code[7]+inst_code[30:25]+inst_code[12:8]};
			else
			inst_address = inst_address + {inst_code[7]+inst_code[30:25]+inst_code[12:8]};
		end
		
		else if(check == 1)
		inst_address = inst_address + 4;

endmodule
