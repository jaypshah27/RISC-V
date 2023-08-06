// This is used to bring together the instruction memory and the immediate value storage unit(constants.v)

module Inst_mem_integrated(
input reset,
input [31:0] inst_add,
output [31:0] inst_code
);

wire [11:0] const;
wire [20:1] const_20;
wire [31:0] const_32;
wire [31:0]inst_code1;
constants const_mod(reset, inst_add, const, const_20, const_32);


inst_mem inst_mem_mod(inst_add, reset, const, const_20, const_32, inst_code1);
assign inst_code = inst_code1;

endmodule