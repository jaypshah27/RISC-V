`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:26:40 03/26/2021 
// Design Name: 
// Module Name:    Decoder 
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
module Decoder(input_instr,output_data_1,output_data_2,clock,reset,write_data,sign_extend,bit_extend,regwrite,offset_u,rs1,rs2,rd,funct3,funct7,opcode);
		
	input [31:0] input_instr; // 32 bit instruction code input from instruction fetch stage
	input clock;
	input reset;
	input regwrite;

	input [31:0] write_data; // 32 bit result coming from ALU or Data Memory
	
	
   output [31:0] sign_extend;
	reg [31:0] sign_extend;
   output reg [31:0] output_data_1; // 32 bit output from from decoder going as input to ALU
	output reg [31:0] bit_extend;
	output reg [31:0] offset_u;

	
	
	output [31:0] output_data_2; // 32 bit output from from decoder going as input to ALU
	reg [31:0] output_data_2; // 32 bit output from from decoder going as input to ALU
	reg [31:0] register_risc [31:0]; //32 memory locations created each of lenth 32 bits
	output wire [4:0] rs1;
	output wire [4:0] rs2;
	output wire [4:0] rd;
	output wire [2:0] funct3;
	output wire [6:0] funct7;
	output wire [6:0] opcode;
	assign rs1=input_instr[19:15];
	assign rs2=input_instr[24:20];
	assign rd =input_instr[11:7];
	assign opcode=input_instr[6:0];
	assign funct3=input_instr[14:12];
	assign funct7=input_instr[31:25];
	
	
	
	
	
	always @(posedge clock)
   begin
	if(reset)
	begin
	register_risc[0]=32'h0;
	register_risc[1]=32'h1;
	register_risc[2]=32'h2;
	register_risc[3]=32'h3;
	register_risc[4]=32'h4;
	register_risc[5]=32'h5;
	register_risc[6]=32'h6;
	register_risc[7]=32'h7;
	register_risc[8]=32'h8;
	register_risc[9]=32'h9;
	register_risc[10]=32'h10;
	register_risc[11]=32'h11;
	register_risc[12]=32'h12;
	register_risc[13]=32'h13;
	register_risc[14]=32'h14;
	register_risc[15]=32'h15;
	register_risc[16]=32'h16;
	register_risc[17]=32'h17;
	register_risc[18]=32'h18;
	register_risc[19]=32'h19;
	register_risc[20]=32'h20;
	register_risc[21]=32'h21;
	register_risc[22]=32'h22;
	register_risc[23]=32'h23;
	register_risc[24]=32'h24;
	register_risc[25]=32'h25;
	register_risc[26]=32'h26;
	register_risc[27]=32'h27;
	register_risc[28]=32'h28;
	register_risc[29]=32'h29;
	register_risc[30]=32'h30;
	register_risc[31]=32'h31;
	end
	
	
	
	else
	begin
	
	output_data_1<=register_risc[rs1];
	output_data_2<=register_risc[rs2];
	if(regwrite)
	register_risc[rd]=write_data;
	else
	register_risc[rd]=32'h0;
	
	
	case(input_instr[6:0])
	 7'b1100111 : sign_extend={{20{input_instr[31]}},input_instr[31:20]}; // JALR instruction
	 7'b0010011: sign_extend={{20{input_instr[31]}},input_instr[31:20]}; // I type
	 7'b0100011:sign_extend={{20{input_instr[31]}},input_instr[31:25],input_instr[11:7]}; // store instructions
	 7'b1101111: sign_extend={{19{input_instr[31]}},input_instr[31],input_instr[7],input_instr[30:25],input_instr[11:8],1'b0}; //  JAL instruction
	 7'b1100011 : sign_extend={{20{input_instr[31]}},input_instr[31],input_instr[11],input_instr[30:25],input_instr[10:7]}; // conditional jump instructions
	 7'b0110111:offset_u={input_instr[31:12],{12{1'b0}}}; // offset for lui 
	 7'b0010111:offset_u={input_instr[31:12],{12{1'b0}}}; // offset for auipc
	 default: sign_extend=32'h0;
	endcase
	
	
	
	
	
	
   end	
	 
	 

		
	 
	 
	 
	 
	 
	 
	 
	 
	  

	
	
	
	
	
end	
	
	
	
	
	
	
	
	
	
	
	
	

endmodule
