`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:37:15 03/15/2021 
// Design Name: 
// Module Name:    if_id 
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
module if_id(
	input clk,if_id_write,flush,
	input wire[31:0]if_Instruction_Code,
	input wire[31:0]if_pc,
	output reg [31:0]id_pc,
	output reg [31:0]id_Instruction_Code);

always @(posedge clk) begin
		if(if_id_write) begin
			id_pc<=if_pc;
			id_Instruction_Code<=if_Instruction_Code;
		end
		else begin
			id_pc<=id_pc<=32'b0;
			id_Instruction_Code<=32'b0;
			end
	end

endmodule
