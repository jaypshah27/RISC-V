module forwarding_unit(
	input [4:0] ID_EX_RS1,           
	input [4:0] ID_EX_RS2,
	input [4:0] EX_MEM_RD,
	input [4:0] MEM_WB_RD,
	input  EX_MEM_RegWrite,
	input  MEM_WB_RegWrite,
	output reg [1:0] FWD_RS1,
	output reg [1:0] FWD_RS2
);

// output from forwarding unit is select lines for mux
/*
00 - no forwarding
01 - exec stage forwarding
10 - mem stage forwarding
*/
always@(*)
begin
	if(EX_MEM_RegWrite == 1 && EX_MEM_RD != 0 && EX_MEM_RD == ID_EX_RS1)
			FWD_RS1 = 2'b01;
	else if(MEM_WB_RegWrite == 1 && MEM_WB_RD != 0 && MEM_WB_RD == ID_EX_RS1 )
			FWD_RS1 = 2'b10;
	else
		   FWD_RS1 = 2'b00;
	
	if(EX_MEM_RegWrite == 1 && EX_MEM_RD != 0 && EX_MEM_RD == ID_EX_RS2)
			FWD_RS2 = 2'b01;
	else if(MEM_WB_RegWrite == 1 && MEM_WB_RD != 0 && MEM_WB_RD == ID_EX_RS2)
			FWD_RS2 = 2'b10;
	else
		   FWD_RS2 = 2'b00;
	
end
endmodule