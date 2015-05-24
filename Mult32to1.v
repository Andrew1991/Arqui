module Mult32to1 (In1,In2,In3,In4,In5,In6,In7,In8,In9,In10,In11,In12,In13,In14,In15,In16,In17,In18,In19,In20,In21,In22,In23,In24,In25,In26,In27,In28,In29,In30,In31,In32,Sel,Out);
	

	input [31:0] In1, In2, In3, In4, In5,In6,In7,In8,In9,In10,In11,In12,In13,In14,In15,In16,In17,In18,In19,In20,In21,In22,In23,In24,In25,In26,In27,In28,In29,In30,In31,In32; // 32 32-bit inputs
	

	input [4:0] Sel; 				 // selector signal
	output reg [31:0] Out; 			 // 32-bit output
	always @(In1, In2, In3, In4, In5, In6, In7, In8, In9, In10, In11, In12, In13, In14, In15, In16, In17, In18, In19, In20, In21, In22, In23, In24, In25, In26, In27, In28, In29, In30, In31, In32, Sel)
		case (Sel) 					 // a 32->1 multiplexor
			0: Out <= In1;
			1: Out <= In2;
			2: Out <= In3;
			3: Out <= In4;
			4: Out <= In5;
			5: Out <= In6;
			6: Out <= In7;
			7: Out <= In8;
			8: Out <= In9;
			9: Out <= In10;
			10: Out <= In11;
			11: Out <= In12;
			12: Out <= In13;
			13: Out <= In14;
			14: Out <= In15;
			15: Out <= In16;
			16: Out <= In17;
			17: Out <= In18;
			18: Out <= In19;
			19: Out <= In20;
			20: Out <= In21;
			21: Out <= In22;
			22: Out <= In23;
			23: Out <= In24;
			24: Out <= In25;
			25: Out <= In26;
			26: Out <= In27;
			27: Out <= In28;
			28: Out <= In29;
			29: Out <= In30;
			30: Out <= In31;
			31: Out <= In32;

		endcase
endmodule