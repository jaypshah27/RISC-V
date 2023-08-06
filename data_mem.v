`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:03:04 02/05/2021 
// Design Name: 
// Module Name:    Data_mem 
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
module Data_mem (
	input wire [31:0] addr,          // Memory Address
	input wire [31:0] write_data,    // Memory Address Contents
	input wire memwrite, memread,
	input wire clk,                  // clock
	output reg [31:0] read_data      // Output of Memory Address Contents
);

reg [31:0] MEM[0:255];  // 256 words of 32-bit memory

integer i;

initial begin
  read_data <= 0;
  for (i = 0; i < 256; i = i + 1) begin
    MEM[i] = i;
  end
end


always @(posedge clk) begin
  if (memwrite == 1'b1) begin
    MEM[addr] <= write_data;
  end
  
  if (memread == 1'b1) begin
    read_data <= MEM[addr];
  end
end

endmodule
