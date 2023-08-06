`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:12:21 02/20/2021 
// Design Name: 
// Module Name:    LSU 
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
module LSU(
input wire data_rvalid,
input wire data_gnt,
input wire [31:0]data_rdata,alu_result,
output reg data_req,
output reg data_we,
output reg [31:0]data_addr,
output reg [31:0]data_wdata,
input wire clk
);
initial begin	 
data_req<=1;
data_addr<=alu_result;

end

always @(posedge clk) begin
data_we<=1;
if (data_we==1) begin
		data_wdata<=data_rdata;
		end
if (data_gnt==1 && data_rvalid==1) begin
		data_we<=0;
		end

end

endmodule
