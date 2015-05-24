module ALuSrcMux (In1,In2,Sel,Out);
	input [31:0] In1, In2;           // two 32-bit inputs
	input Sel; 				 // selector signal 2 bits
	output reg [31:0] Out; 			 // 32-bit output
	always @(Sel,In1, In2)
		case (Sel) 					
			0: Out =  In1;			
			1: Out =  In2;			
		endcase
		// initial
		// $display("ALuSrcMux out = %d", Out);
endmodule
