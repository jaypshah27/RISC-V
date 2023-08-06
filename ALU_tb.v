`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:08:29 03/13/2021
// Design Name:   ALU
// Module Name:   /home/ise/verilog projects/formal/ALU_tb.v
// Project Name:  formal
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

	// Inputs
	reg [31:0] in1;
	reg [31:0] in2;
	reg [3:0] alu_control;

	// Outputs
	wire [31:0] alu_result;
	wire zero_flag;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.in1(in1), 
		.in2(in2), 
		.alu_control(alu_control), 
		.alu_result(alu_result), 
		.zero_flag(zero_flag)
	);

	initial begin
		// Initialize Inputs
		in1 = 8;
		in2 = 10;
		alu_control = 4'b0001;		//sub

		// Wait 100 ns for global reset to finish
		
		#10;
      in1 = 8;
		in2 = 10;
		alu_control = 4'b0111;		//set on greater than
		
		#10;
      in1 = 8;
		in2 = 10;
		alu_control = 4'b0011;		//bitwise and
		
		
		// Add stimulus here

	end
	
	initial
    #50 $finish;
      
endmodule

