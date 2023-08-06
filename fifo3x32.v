`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:02:15 02/13/2021 
// Design Name: 
// Module Name:    fifo 
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

module FIFO3x32(
  input clk, rst,
  input RdPtrClr, WrPtrClr, 
  input RdInc, WrInc,
  input [31:0] DataIn,
  output reg [31:0] DataOut,
  input rden, wren);
	
//signal declarations

	reg [31:0] fifo_array[2:0];
	reg [2:0] wrptr, rdptr;
	wire [2:0] wr_cnt, rd_cnt;
	reg [31:0]dmuxout;


always @(clk,rst,RdPtrClr,WrPtrClr,DataIn,rden,wren)
begin
 
if (rst==1)
begin 
wrptr<=000;
rdptr<=000;
DataOut<=000000000;
end
if (rst==0)
begin
if (wren==1)
	begin
	 fifo_array[wrptr]<=DataIn;
	 wrptr<=wrptr+001;
	end 
if (rden==1)
	begin
	 DataOut<=fifo_array[rdptr];
	rdptr<=rdptr+001;
	end
else if (rden==0)
begin
DataOut<=32'hz;
end
if (RdPtrClr==1)
  begin 
	rdptr<=000;
  end
if (WrPtrClr==1)
  begin 
	wrptr<=000;
  end
 //DataOut<=dmuxout;
end
end



endmodule
