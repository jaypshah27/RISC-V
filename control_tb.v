`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:46:09 03/13/2021
// Design Name:   control
// Module Name:   /home/ise/verilog projects/formal/control_tb.v
// Project Name:  formal
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module control_tb;

	// Inputs
	reg [6:0] funct7;
	reg [2:0] funct3;
	reg [6:0] opcode;

	// Outputs
	wire [3:0] if_id_alu_control;
	wire if_id_regwrite_control;
	wire if_id_memtoreg;
	wire if_id_alusrc;
	wire if_id_memread;
	wire if_id_memwrite;
	wire if_id_branch;
	wire [9:0]control;

	// Instantiate the Unit Under Test (UUT)
control uut (
    .funct7(funct7), 
    .funct3(funct3), 
    .opcode(opcode), 
    .if_id_alu_control(if_id_alu_control), 
    .if_id_regwrite_control(if_id_regwrite_control), 
    .if_id_memtoreg(if_id_memtoreg), 
    .if_id_alusrc(if_id_alusrc), 
    .if_id_memread(if_id_memread), 
    .if_id_memwrite(if_id_memwrite), 
    .if_id_branch(if_id_branch),
	 .control(control)
    );


	initial begin
		// Initialize Inputs
		funct7 = 0;
		funct3 = 0;
		opcode = 7'b0110011;		//add

		// Wait 100 ns for global reset to finish
		#10;
		funct7 = 0;
		funct3 = 6;
		opcode = 7'b0010011;		//ori
		
		#10;
		funct7 = 0;
		funct3 = 6;
		opcode = 7'b0000011;		//load
		
		#10;
		funct7 = 0;
		funct3 = 6;
		opcode = 7'b0100011;		//store
		
		#10;
		funct7 = 0;
		funct3 = 1;
		opcode = 7'b1001011;		//bne
		
		#10;
		funct7 = 1;
		funct3 = 1;
		opcode = 7'b1001111;		//jalr
		
		#10;
		funct7 = 0;
		funct3 = 1;
		opcode = 7'b1101111;		//jal
		
		#10;
		funct7 = 0;
		funct3 = 1;
		opcode = 7'b0010111;		//auipc
		
		
		
        
		// Add stimulus here

	end
	initial
    #100 $finish;
      
endmodule

