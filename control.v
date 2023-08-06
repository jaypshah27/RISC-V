`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:02:07 02/03/2021 
// Design Name: 
// Module Name:    control 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module control(
    input [6:0] funct7,
    input [2:0] funct3,
    input [6:0] opcode,
	 //input [11:0] immI,
    output reg [3:0] if_id_alu_control,
	 output reg [9:0]control,
    output reg if_id_regwrite_control,if_id_memtoreg,if_id_alusrc,if_id_memread,if_id_memwrite,if_id_branch
    );
always @(funct3 or funct7 or opcode /*or immI*/)
    begin
        if (opcode == 7'b0110011) begin // R-type instructions

            if_id_regwrite_control = 1;
				if_id_memtoreg=0;
				if_id_alusrc=0;
				if_id_memread=0;
				if_id_memwrite=0;
				if_id_branch=0;
				
            case (funct3)
                0: begin
                    if(funct7 == 0)
                    if_id_alu_control = 4'b0000; // ADD
                    else if(funct7 == 32)
                    if_id_alu_control = 4'b0001; // SUB
                end
                6: if_id_alu_control = 4'b0010; // OR
                7: if_id_alu_control = 4'b0011; // AND
                1: if_id_alu_control = 4'b0101; // SLL
                5: begin 
							if(funct7==0)
							if_id_alu_control = 4'b0110; // SRL
							else if(funct7==32)
							if_id_alu_control = 4'b0110	;  //SRA
					    end
				2: if_id_alu_control = 4'b0100; // SLT
				3: if_id_alu_control = 4'b0100; // SLTU
				4: if_id_alu_control = 4'b1000; // XOR
				default: if_id_alu_control=4'b1111;
            endcase
			end
			
			if (opcode==7'b0010011) begin //I-type instructions
				
				if_id_regwrite_control=1;
				if_id_memtoreg=0;
				if_id_alusrc=1;
				if_id_memread=0;
				if_id_memwrite=0;
				if_id_branch=0;
				
				case (funct3)
					0: if_id_alu_control = 4'b0000; // ADDI
					//2: alu_control = 4'b1111; // STLI
					//3: alu_control = 4'b1111; // STLIU
					4: if_id_alu_control = 4'b1000; // XORI
					6: if_id_alu_control = 4'b0010; // ORI
					7: if_id_alu_control = 4'b0011; // ANDI
					1: if_id_alu_control = 4'b0101; // SLLI
					5: begin
						if (funct7==0)
						if_id_alu_control = 4'b0110; // SRLI 
					   else if (funct7==32)
						if_id_alu_control = 4'b0110; // SRAI
						end
					default: if_id_alu_control=4'b1111;
				endcase
         end
			
			if (opcode==7'b0000011) begin // Load - Instructions
				
				if_id_regwrite_control=1;	
				if_id_memtoreg=1;
				if_id_alusrc=1;
				if_id_memread=1;
				if_id_memwrite=0;
				if_id_branch=0;
				if_id_alu_control = 4'b0000; //load
					
			end
			
			if (opcode==7'b0100011) begin // STORE - Instructions
				
				if_id_regwrite_control=0;
				if_id_memtoreg=1'bx;
				if_id_alusrc=1;
				if_id_memread=0;
				if_id_memwrite=1;
				if_id_branch=0;
				if_id_alu_control = 4'b0000; // store
					
			end
			
			if (opcode==7'b1001011) begin // B - Instructions
				
				if_id_regwrite_control=0;
				if_id_memtoreg=1'bx;
				if_id_alusrc=0;
				if_id_memread=0;
				if_id_memwrite=0;
				if_id_branch=1;
				
				case (funct3)
					0: if_id_alu_control = 4'b0001; // beq
					1: if_id_alu_control = 4'b0001; // bne
					4: if_id_alu_control = 4'b0100; // blt
					5: if_id_alu_control = 4'b0111; // bge
					6: if_id_alu_control = 4'b0100; // bltu
					7: if_id_alu_control = 4'b0111; // bgeu
					default: if_id_alu_control=4'b1111;
				endcase
			end
			
			if (opcode==7'b1001111)begin
				if_id_regwrite_control=1;
				if_id_memtoreg=1'bx;
				if_id_alusrc=1;
				if_id_memread=1;
				if_id_memwrite=0;
				if_id_branch=1;
				if_id_alu_control = 4'b0000; // jalr 
				end
			if (opcode==7'b1101111) begin
				if_id_regwrite_control=1;
				if_id_memtoreg=1'bx;
				if_id_alusrc=1;
				if_id_memread=1;
				if_id_memwrite=0;
				if_id_branch=1;
				if_id_alu_control = 4'b0000; // jal
				end
			//if (opcode==7'b0110111)
				//alu_control = 6'b1111; // lui
			if (opcode==7'b0010111) begin
				if_id_regwrite_control=1;
				if_id_memtoreg=1'bx;
				if_id_alusrc=1;
				if_id_memread=1;
				if_id_memwrite=0;
				if_id_branch=1;
				if_id_alu_control = 4'b0000; // auipc
				end
			control={if_id_regwrite_control,if_id_alu_control,if_id_alusrc,if_id_memread,if_id_memwrite,if_id_branch,if_id_memtoreg};//9,{8,7,6,5},4,3,2,1,0
    end

endmodule
