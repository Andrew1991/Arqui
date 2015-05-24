module Mult2to1_32b (In1,In2,Sel,Out);
	input [31:0] In1, In2;           // two 32-bit inputs
	input Sel; 				 // selector signal 2 bits
	output reg [31:0] Out; 			 // 32-bit output
	always @(Sel,In1, In2)
		case (Sel) 					
			0: Out =  In1;			
			1: Out =  In2;			
		endcase
	// initial 
	// #70 $display("Input for next PC = %d", In1);
endmodule

module Mult2to1_32bB (In1,In2,Sel,Out);
	input [31:0] In1, In2;           // two 32-bit inputs
	input [1:0] Sel; 				 // selector signal 2 bits
	output reg [31:0] Out; 			 // 32-bit output
	always @(Sel)
		case (Sel) 					
			0: Out = In1;			
			1: Out =  In2;			
		endcase
		//initial
		//#900$display("Mux B output: %d", Out);
endmodule

module Mult2to1_32pc (In1,In2,Sel,Out);
	//In1 = PC + 4
	//In2 = branch target
	input [31:0] In1, In2;           // two 32-bit inputs
	input Sel; 				 // selector signal 2 bits
	output reg [31:0] Out; 			 // 32-bit output
	always @(In1, In2, Sel)
		case (Sel) 					
			0: begin				
				Out =  In1;
				//$display("Case 0: Out = %d  In1 = %d", Out, In1);
			end			
			1: begin
				Out =  In2;
			    //$display("Case 1: Out = %d  In2 = %d", Out, In2);
			end			
		endcase		
endmodule
