module constants(
    input reset,
    input [31:0] inst_add,
    output reg [11:0] const,
	 output reg [20:1] const_20,
	 output reg [31:0] const_32
);
	reg [11:0] memory [26:0];
   reg [20:1] jal_const;
	reg [31:0] U_const;
	
	// initializing memory
	always @(posedge reset)
	begin
		
	memory[0] = 8;
	memory[1] = 8;
	memory[2] = 8;
	memory[3] = 8;
	memory[4] = 8;
	memory[5] = 8; 
	memory[6] = 8;
	memory[7] = 8;
	memory[8] = 8;
	memory[9] = 8;
	memory[10] = 8;
	memory[11] = 8;
	memory[12] = 8;
	memory[13] = 8;
	memory[14] = 8;
	memory[15] = 8;
	memory[16] = 8;
	memory[17] = 8;
	memory[18] = 8;
	memory[19] = 8;
	memory[20] = 8;
	memory[21] = 8;
	memory[22] = 8;
	memory[23] = 8;
	memory[24] = 8;
	memory[25] = 8;
	memory[26] = 8;
	U_const = 246;
	jal_const = 123;
	end
	
	// assigning const based on corresponding instruction address
    always@(inst_add)
    begin
        case(inst_add)
		  0: const = memory[0];
		  1: const = memory[1];
		  2: const = memory[2];
		  3: const = memory[3];
		  4: const = memory[4];
		  5: const = memory[5];
		  6: const = memory[6];
		  7: const = memory[7];
		  8: const = memory[8];
		  9: const = memory[9];
		  10: const = memory[10];
		  11: const = memory[11];
		  12: const = memory[12];
		  13: const_20 = jal_const;
		  14: const = memory[14];
		  15: const = memory[15];
		  16: const = memory[16];
		  17: const = memory[17];
		  18: const = memory[18];
		  19: const = memory[19];
		  20: const = memory[20];
		  21: const = memory[21];
		  22: const = memory[22];
		  23: const = memory[23];
		  24: const = memory[24];
		  25: const_32 = U_const;
		  26: const_32 = U_const;
		  default:
		  $display("Error in input");
		  endcase
		  
    end

endmodule
