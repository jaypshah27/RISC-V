`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:10:45 02/03/2021 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
	 input [31:0] in1,in2, 
    input[3:0] alu_control,
    output reg [31:0] alu_result,
    output reg zero_flag
);
    always @(*)
    begin
        // Operating based on control input
        case(alu_control)

        4'b0000: alu_result = in1+in2; //add
        4'b0001: alu_result = in1-in2; //sub
        4'b0010: alu_result = in1|in2; //Bitwise OR
        4'b0011: alu_result = in1&in2; //Bitwise AND
        4'b0100: begin 
            if(in1<in2) 					  //set on less than	
            alu_result = 1;
            else
            alu_result = 0;
        end
        4'b0101: alu_result = in1<<in2; //shift left logical
        4'b0110: alu_result = in1>>in2; //shift rigt logical
		  4'b0111: begin 
            if(in1>in2) 					  //set on greater than	
            alu_result = 1;
            else
            alu_result = 0;
        end
        4'b1000: alu_result = in1^in2;  //xor
		  default: alu_result=1'bz;

        endcase

        // Setting Zero_flag if ALU_result is zero
        if (alu_result == 0)
            zero_flag = 1'b1;
        else
            zero_flag = 1'b0;
        
    end


endmodule
