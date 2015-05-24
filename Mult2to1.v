module Mult2to1 (In1,In2,Sel,Out);
	input [4:0] In1, In2;           // two 32-bit inputs
	input Sel; 				 // selector signal 2 bits
	output reg [4:0] Out; 			 // 32-bit output
	always @(Sel,In2,In1)
		case (Sel) 					
			0: Out =  In1;			
			1: Out =  In2;			
		endcase
endmodule
