`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:48:01 02/21/2021 
// Design Name: 
// Module Name:    data_mem_1 
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
module data_mem_1(

	input wire [31:0] data_addr,          // Memory Address
	//input wire [31:0] data_write,    // Memory Address Contents
	input wire memwrite, memread,
	input wire [31:0]data_wdata,
	input wire data_req,
	input wire data_we,
	input wire clk,                  // clock
	output reg [31:0] data_rdata ,     // Output of Memory Address Contents
   output reg data_gnt,
	output reg data_rvalid
);

reg [31:0] MEM[0:255];  // 256 words of 32-bit memory

integer i;

initial begin
  data_rdata <= 0;
  for (i = 0; i < 256; i = i + 1) begin
    MEM[i] = i;
  end
end


always @(posedge clk) begin
	if (data_req==1 ) begin
		data_gnt<=1;
		data_rvalid<=1;
		end
	if (memwrite == 1 && data_we==1 ) begin
		MEM[data_addr]<= data_wdata;
		data_rvalid<=1;
		 
	end
  
	if (memread == 1 && data_we==0) begin
		data_rdata<= MEM[data_addr];
		
	end
end

endmodule
