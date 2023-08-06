`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:00:59 03/29/2021 
// Design Name: 
// Module Name:    ex_mem 
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
module ex_mem( clk,zero_flag_alu,zero_flag_ex_mem,id_ex_register_rd,ex_mem_register_rd,alu_result,alu_result_ex_mem,id_ex_output_data_2,ex_mem_output_data_2, id_ex_memtoreg,id_ex_regwrite,id_ex_memread,id_ex_memwrite,id_ex_branch,ex_mem_memtoreg,ex_mem_regwrite,ex_mem_memread,ex_mem_memwrite,ex_mem_branch);
	
	input clk;
	input wire zero_flag_alu;
	input wire id_ex_memtoreg,id_ex_regwrite,id_ex_memread,id_ex_memwrite,id_ex_branch;
	input wire [4:0] id_ex_register_rd;
	input wire [31:0] id_ex_output_data_2;
	input wire [31:0] alu_result;
	output reg zero_flag_ex_mem;
	output reg [31:0] alu_result_ex_mem;
	output reg [4:0] ex_mem_register_rd;
	output reg [31:0] ex_mem_output_data_2;
	output reg ex_mem_memtoreg,ex_mem_regwrite,ex_mem_memread,ex_mem_memwrite,ex_mem_branch;
	
always @(posedge clk)
		begin
		zero_flag_ex_mem<=zero_flag_alu;
		alu_result_ex_mem<=alu_result;
		ex_mem_register_rd<=id_ex_register_rd;
		ex_mem_output_data_2<= id_ex_output_data_2;
		ex_mem_memtoreg<=id_ex_memtoreg;
		ex_mem_regwrite<=id_ex_regwrite;
		ex_mem_memread<=id_ex_memread;
		ex_mem_memwrite<=id_ex_memwrite;
		ex_mem_branch<=id_ex_branch;
		end
	
	
	
	
	
	
	
  


endmodule

