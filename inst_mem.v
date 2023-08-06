`timescale 1ns / 1ps

module inst_mem (
    input [31:0]inst_add,
    input reset,
    input [11:0] imm_val,
	 input [20:1] imm_20,
	 input [31:0] imm_32,
    output reg [31:0] inst_code
);

// byte addressable memory with 32 locations
reg [7:0] Memory [39:0];
wire [4:0] shamt = imm_val;

// r-type instructions: add, sub, sll, slt, sltu, xor, srl, sra, or, and
always @(reset)
    begin
        if(reset == 1)
        begin
            // Setting 32-bit instruction: add t1, s0,s1 => 0x00940333 
            Memory[3] = 8'h00;
            Memory[2] = 8'h94;
            Memory[1] = 8'h03;
            Memory[0] = 8'h33;
            // Setting 32-bit instruction: sub t2, s2, s3 => 0x413903b3
            Memory[7] = 8'h41;
            Memory[6] = 8'h39;
            Memory[5] = 8'h03;
            Memory[4] = 8'hb3;
            // Setting 32-bit instruction: slt t0, s4, s5 => 0x015a22b3
            Memory[11] = 8'h01;
            Memory[10] = 8'h5a;
            Memory[9] = 8'h22;
            Memory[8] = 8'hb3;
            // Setting 32-bit instruction: xor t3, s6, s7 => 0x017b4e33
            Memory[15] = 8'h01;
            Memory[14] = 8'h7b;
            Memory[13] = 8'h4e;
            Memory[12] = 8'h33;
            // Setting 32-bit instruction: sll t4, s8, s9
            Memory[19] = 8'h01;
            Memory[18] = 8'h9c;
            Memory[17] = 8'h1e;
            Memory[16] = 8'hb3;
            // Setting 32-bit instruction: srl t5, s10, s11
            Memory[23] = 8'h01;
            Memory[22] = 8'hbd;
            Memory[21] = 8'h5f;
            Memory[20] = 8'h33;
            // Setting 32-bit instruction: and t6, a2, a3
            Memory[27] = 8'h00;
            Memory[26] = 8'hd6;
            Memory[25] = 8'h7f;
            Memory[24] = 8'hb3;
            // Setting 32-bit instruction: or a7, a4, a5
            Memory[31] = 8'h00;
            Memory[30] = 8'hf7;
            Memory[29] = 8'h68;
            Memory[28] = 8'hb3;
				// sltu t0,s4,s5
				Memory[35] = 8'h01;
				Memory[34] = 8'h5a;
				Memory[33] = 8'h32;
				Memory[32] = 8'hb3;
				//sra t2, s2, s3
				Memory[39] = 8'h41;
				Memory[38] = 8'h39;
				Memory[37] = 8'h53;
				Memory[36] = 8'hb3;
				
        end
	end
	
	
    // making instruction code
    always @(inst_add or imm_val or imm_20 or imm_32)
    begin
	 //extend[20:1] <= {{8{imm_val[11]}},imm_val[11:0]}; 
        case(inst_add)
		  // R-type instructions
		   0: inst_code = {Memory[inst_add+3], Memory[inst_add+2], Memory[inst_add+1], Memory[inst_add]};
			4: inst_code = {Memory[inst_add+3], Memory[inst_add+2], Memory[inst_add+1], Memory[inst_add]};
			8: inst_code = {Memory[inst_add+3], Memory[inst_add+2], Memory[inst_add+1], Memory[inst_add]};
			12: inst_code = {Memory[inst_add+3], Memory[inst_add+2], Memory[inst_add+1], Memory[inst_add]};
			16: inst_code = {Memory[inst_add+3], Memory[inst_add+2], Memory[inst_add+1], Memory[inst_add]};
			20: inst_code = {Memory[inst_add+3], Memory[inst_add+2], Memory[inst_add+1], Memory[inst_add]};
			24: inst_code = {Memory[inst_add+3], Memory[inst_add+2], Memory[inst_add+1], Memory[inst_add]};
			28: inst_code = {Memory[inst_add+3], Memory[inst_add+2], Memory[inst_add+1], Memory[inst_add]};
			32: inst_code = {Memory[inst_add+3], Memory[inst_add+2], Memory[inst_add+1], Memory[inst_add]};
			36: inst_code = {Memory[inst_add+3], Memory[inst_add+2], Memory[inst_add+1], Memory[inst_add]};
		
		//I-type instructions
			  40: inst_code = {imm_val,5'b00100,3'b000,5'b00101,7'b0010011}; //addi t0, s0, imm 
			  44: inst_code = {imm_val,5'b00101,3'b010,5'b00110,7'b0010011}; //slti t1, s1, imm
			  48: inst_code = {imm_val,5'b10010,3'b011,5'b00111,7'b0010011}; //sltiu t2, s2, imm 
			  52: inst_code = {imm_val,5'b10011,3'b100,5'b11100,7'b0010011}; //ori t3, s3, imm
			  56: inst_code = {imm_val,5'b10100,3'b110,5'b11101,7'b0010011}; //xori t4, s4, imm
			  60: inst_code = {imm_val,5'b10101,3'b111,5'b11110,7'b0010011}; //andi t5, s5, imm
			  64: inst_code = {7'b0000000,shamt,5'b01010,3'b001,5'b10111,7'b0010011}; //slli s7, a0
			  68: inst_code = {7'b0000000,shamt,5'b01011,3'b101,5'b11000,7'b0010011}; //srli s8, a1
			  72: inst_code = {7'b0100000,shamt,5'b01100,3'b101,5'b11001,7'b0010011}; //srai s9, a2
			  
			//S-type instructions
			  76: inst_code = {imm_val[11:5],5'b11100,5'b10011,3'b010,imm_val[4:0],7'b0100011};//sw s3, t3, imm
			  80: inst_code = {imm_val[11:5],5'b11100,5'b10011,3'b001,imm_val[4:0],7'b0100011}; //sh s3, t3, imm
			  84: inst_code = {imm_val[11:5],5'b11100,5'b10011,3'b000,imm_val[4:0],7'b0100011}; //sb s3, t3, imm
			
			//Jump instructions
			  88: inst_code = {imm_val, 5'b00111, 3'b000, 5'b10010, 7'b1100111}; //jalr t2, s2, imm
			  92: inst_code = {imm_20[20],imm_20[10:1],imm_20[11],imm_20[19:12],5'b00111,7'b1101111}; //jal t2, imm
			
			//Load instructions
			  96: inst_code = {imm_val,5'b00101,3'b000,5'b00100,7'b0000011}; // lb 
			  100: inst_code = {imm_val,5'b00101,3'b001,5'b00100,7'b0000011}; // lh
			  104: inst_code = {imm_val,5'b00101,3'b010,5'b00100,7'b0000011}; // lw
			  108: inst_code = {imm_val,5'b00101,3'b100,5'b00100,7'b0000011}; // lbu
			  112: inst_code = {imm_val,5'b00101,3'b101,5'b00100,7'b0000011}; // lhu
			
			// branch instructions
			  116: inst_code = {imm_val[11],imm_val[9:4],5'b00110,5'b00101,3'b000,imm_val[3:0],imm_val[10],7'b1100011}; //beq t1,s1,imm
			  120: inst_code = {imm_val[11],imm_val[9:4],5'b00110,5'b00101,3'b001,imm_val[3:0],imm_val[10],7'b1100011}; //bne t1,s1,imm
			  124: inst_code = {imm_val[11],imm_val[9:4],5'b00110,5'b00101,3'b010,imm_val[3:0],imm_val[10],7'b1100011}; //blt t1,s1,imm
   		  128: inst_code = {imm_val[11],imm_val[9:4],5'b00110,5'b00101,3'b100,imm_val[3:0],imm_val[10],7'b1100011}; //bge t1,s1,imm
			  132: inst_code = {imm_val[11],imm_val[9:4],5'b00110,5'b00101,3'b101,imm_val[3:0],imm_val[10],7'b1100011}; //bltu t1,s1,imm
			  136: inst_code = {imm_val[11],imm_val[9:4],5'b00110,5'b00101,3'b110,imm_val[3:0],imm_val[10],7'b1100011}; //bgeu t1,s1,imm
			
			// U-type instructions
			  140: inst_code = {imm_32[31:12],5'b00111,7'b0110111}; //lui t2, imm
			  144: inst_code = {imm_32[31:12],5'b00111,7'b0010111}; //auipc t2, imm
	
				
		  endcase
	 end  	 

endmodule
