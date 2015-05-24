`include "controlUnit.v"
`include "datapath.v"
module test_control_unit;



reg Clk;
wire IR_Enable, PC_Enable, NPC_Enable, ClrPC, ClrNPC,	Branch, RegDst, RegWrite, MemRead, MemWrite, ALUSrc,
isSigned, Zero, Neg, Carry, Overflow, RESET;
wire [1:0] MemtoReg, MUX_A_Sel, MUX_B_Sel, ramType;
wire [2:0] signedCompare, unsignedCompare;
wire [4:0] ALUOp;
wire [5:0] OpCode, functCode;
wire [31:0] m4;

controlUnit control_unit (IR_Enable, PC_Enable, NPC_Enable, ClrPC, ClrNPC,
	
	 Branch, RegDst, RegWrite, 
	MemRead, MemtoReg, ALUOp,
	MemWrite, ALUSrc, 
	MUX_A_Sel, MUX_B_Sel, 
	isSigned, signedCompare, unsignedCompare,
    isJump, ramType,	
	Zero, Neg, Carry, Overflow,	
	OpCode, functCode, RESET,  Clk
	);
datapath datapath (Clk, IR_Enable, RegDst, RegWrite, MemRead, ALUSrc, MemWrite,m4);




always @ (m4) begin
	$display("MAR Out: %d", m4[7:0]);
end

initial fork //Clock
	Clk = 1'b0;
	forever #25 Clk = ~Clk;
join

initial begin
end

endmodule