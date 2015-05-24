module Mult4to1_32b (In1,In2,In3, In4, Sel,Out);
	input [31:0] In1, In2, In3, In4;           // two 32-bit inputs
	input [1:0] Sel; 				 // selector signal 2 bits
	output reg [31:0] Out; 			 // 32-bit output
	always @(In1, In2, In3, In4, Sel)
		case (Sel) 					
			0: Out = In1;			
			1: Out = In2;	
			2: Out = In3;
			3: Out = In4;		
		endcase
		
		//#155$display("Output to RegisterFile = %d", Out);
endmodule
