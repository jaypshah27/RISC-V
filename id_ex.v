`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:32:59 03/16/2021 
// Design Name: 
// Module Name:    id_ex 
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
module id_ex(
	input wire[4:0]if_id_register_rs1,if_id_register_rs2,if_id_register_rd,
	input	wire[31:0]if_id_output_data_1,if_id_output_data_2,if_id_sign_extend_immediate,
	input wire clk,
	input wire [9:0]control,
	output reg [31:0]id_ex_output_data1,id_ex_output_data_2,id_ex_sign_extend_immediate,
	output reg	[4:0]id_ex_register_rs1,id_ex_register_rs2,id_ex_register_rd,
	output reg	id_ex_memtoreg,id_ex_alusrc,id_ex_memread,id_ex_memwrite,id_ex_branch,id_ex_regwrite_control,
	output reg [3:0]id_ex_alu_control
	
    );
always @(posedge clk) begin
	
	id_ex_output_data1<=if_id_output_data_1;
	id_ex_output_data_2<=if_id_output_data_2;
	id_ex_sign_extend_immediate<=if_id_sign_extend_immediate;
	
	id_ex_register_rs1<=if_id_register_rs1;
	id_ex_register_rs2<=if_id_register_rs2;
	id_ex_register_rd<=if_id_register_rd;
	
	id_ex_memtoreg<=control[0];
	id_ex_alusrc<=control[4];
	id_ex_memread<=control[3];
	id_ex_memwrite<=control[2];
	id_ex_branch<=control[1];
	id_ex_alu_control<=control[8:5];
	id_ex_regwrite_control<=control[9];
	
end
endmodule
