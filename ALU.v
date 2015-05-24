module ALU(ALUControl, Input_A, Input_B, Input_C, Immid, ALUOut, zero, overflow, negative, enable);
input  [4:0] ALUControl;
input [31:0] Input_A,Input_B;
reg signed [31:0] Input_AS, Input_BS;
input [4:0] Input_C;//used for shifts //rs
output reg signed [31:0] ALUOut;
output reg overflow;
output reg zero;
output reg negative;
integer zeros;
input enable;
integer i;
integer one;
input [31:0] Immid; //6 + 6179 = 6185


always @(posedge enable) begin //reevaluate if these change
   //  $display("ALU HAS BEEN ENABLED");
   // $display("AluControl = %b  Input_A = %b   Input_B = %b ", ALUControl, Input_A, Input_B);
   
    case (ALUControl)
    	 0: begin //ADD    	 			
    	 			    ALUOut 	=   Input_A + Input_B;
						if ((Input_A[31] == Input_B[31]) && (Input_A[31] != ALUOut[31])) begin
						overflow = 1;
						end else begin
							overflow = 0;
						end
						negative = (ALUOut  < 0) ? 1 : 0;						
			 			zero = (ALUOut == 0) ? 1 : 0;			
					//$display("ALU.v - Activiating ADD Instrucion Input_A = %b Input_B = %b \n", Input_A, Input_B);
				end
		1: begin   //ADDU				
					 					
					ALUOut 		= Input_A + Input_B;
					overflow 	= 0;
					zero		= (ALUOut == 0) ? 1 : 0;
					//$display("ALU.v - Activiating ADDU Instrucion Input_A = %b Input_B = %b \n", Input_A, Input_B);
				end
		2: begin//SUB
					Input_AS = Input_A;
					Input_BS = Input_B;
					//$display ("InputA = %d InputAS = %d", Input_A, Input_AS);
					ALUOut 		= Input_AS - Input_BS;					
					if ((Input_A[31] != Input_B[31]) && (Input_B[31] != ALUOut[31])) begin
						overflow = 1;
					end else begin
						overflow = 0;
					end
					negative =   (ALUOut  < 0) ? 1 : 0;
					zero		= (ALUOut == 0) ? 1 : 0;
					// $display("ALU.v - Activiating SUB Instrucion Input_A = %b Input_B = %b \n", Input_A, Input_B);
					// $display("ALU.v - Substract Negtiv Flag= %d", negative);
				end
		3: begin   //SUBU	
					ALUOut 		= Input_A - Input_B;					 					
					overflow 	= 0;
					zero		= (ALUOut == 0) ? 1 : 0;
					//$display("ALU.v - Activiating SUBU Instrucion Input_A = %b Input_B = %b \n", Input_A, Input_B);
				end
		4: begin  //ADDI

					ALUOut 		= Input_A + Input_B;
					if ((Input_A[31] != Input_B[31]) && (Input_B[31] != ALUOut[31])) begin
						overflow = 1;
					end else begin
						overflow = 0;
					end
					zero		= (ALUOut == 0) ? 1 : 0;
					// $display ("ALUOUT Immediate: %b", ALUOut);
					// $display ("ALUControl: %b", ALUControl);
					//$display("ALU.v - Activiating ADDI Instrucion Input_A = %b Input_B = %b \n", Input_A, Input_B);
				end
		5: begin   //ADDiU				
									
					ALUOut 		= Input_A + Input_B;
					overflow 	= 0;
					zero		= (ALUOut == 0) ? 1 : 0;
					//$display("ALU.v - Activiating ADDIU Instrucion Input_A = %b Input_B = %b \n", Input_A, Input_B);
					//$display("ADDIU = %d", ALUOut);

				end
		6: begin  //SLT
					ALUOut 		= (Input_A < Input_B) ? 1 : 0;
					overflow 	= 0;
					zero		= (ALUOut == 0) ? 1 : 0;
					//$display("SLT Aluout = %b",  ALUOut);
					//$display("ALU.v - Activiating SLT Instrucion \n");
				end
		7: begin   //SLTU				
					 					
					ALUOut 		= (Input_A < Input_B) ? 1 : 0;
					overflow 	= 0;
					zero		= (ALUOut == 0) ? 1 : 0;
					//$display("ALU.v - Activiating SLTU Instrucion \n");
				end
		8: begin   //SLTI				
					 					
					ALUOut 		= (Input_A < Immid) ? 1 : 0;
					overflow 	= 0;
					zero		= (ALUOut == 0) ? 1 : 0;
					//$display("ALU.v - Activiating SLTI Instrucion \n");
				end
		9: begin   //SLTIU				
					 					
					ALUOut 		= (Input_A < Immid) ? 1 : 0;
					overflow 	= 0;
					zero		= (ALUOut == 0) ? 1 : 0;
					//$display("ALU.v - Activiating SLTiU Instrucion \n");
				end
		10: begin   //CLO							
					zeros = 32;					
					for (  i=31; i >= 0 ; i = i -1) begin
						if(Input_C[i] == 1) begin
							zeros = 31 - i;
							i = 0;
						end	
						end							
				end
		11: begin   //CLZ				
					 one = 32;					
						for (  i=31; i >= 0 ; i = i -1) begin
							if(Input_C[i] == 0) begin
								one = 31 - i;
								i = 0;
							end
						end						
						//#1  $display("%d",one);
				end
		12: begin //AND
					ALUOut 		= Input_A & Input_B;
					overflow 	= 0;
					zero		= (ALUOut == 0) ? 1 : 0;
					//$display("ALU.v - Activiating AND Instrucion Input_A = %b Input_B = %b \n", Input_A, Input_B);
				end
		13: begin //ANDI
				ALUOut 		= Input_A & Immid;
				overflow 	= 0;
				zero		= (ALUOut == 0) ? 1 : 0;
				//$display("Display desde ALU (AND = %b) " , ALUOut);
				//$display("ALU.v - Activiating ANDI Instrucion \n");
			end
		14: begin// OR
					ALUOut 		= Input_A | Input_B;
					overflow 	= 0;
					zero		= (ALUOut == 0) ? 1 : 0;
					//$display("ALU.v - Activiating OR Instrucion Input_A = %b Input_B = %b \n", Input_A, Input_B);
				end
		15: begin// ORI
					ALUOut 		= Input_A | Immid;
					overflow 	= 0;
					zero		= (ALUOut == 0) ? 1 : 0;
					//$display("ALU.v - Activiating ORI Instrucion \n");
				end
		16: begin//XOR
					ALUOut 		= Input_A ^ Input_B;
					overflow 	= 0;
					zero		= (ALUOut == 0) ? 1 : 0;
					//$display("ALU.v - Activiating XOR Instrucion \n");
				end
		17: begin//XORI
					ALUOut 		= Input_A ^ Immid;
					overflow 	= 0;
					zero		= (ALUOut == 0) ? 1 : 0;
					//$display("ALU.v - Activiating XORI Instrucion \n");
				end
		18: begin //NOR
					ALUOut 		= ~(Input_A | Input_B);
					overflow 	= 0;
					zero		= (ALUOut == 0) ? 1 : 0;
					//$display("ALU.v - Activiating NOR Instrucion \n");
					//$display("NOR Aluout = %b",  ALUOut);
				end
		19: begin//LUI   need fixing
					ALUOut 		= Input_A | Immid;
					overflow 	= 0;
					zero		= (ALUOut == 0) ? 1 : 0;
					//$display("ALU.v - Activiating LUI Instrucion \n");
				end
		20: begin  //SLL 
					ALUOut 		= Input_B << Input_C;
					overflow 	= 0;
					zero		= (ALUOut == 0) ? 1 : 0;
					//$display("ALU.v - Activiating SLL Instrucion \n");
					//$display("SLL Aluout = %b",  ALUOut);
				end
		21: begin  //SLLV 
					ALUOut 		= Input_B << Input_A;
					overflow 	= 0;
					zero		= (ALUOut == 0) ? 1 : 0;
					//$display("SLL Aluout = %b",  ALUOut);
				end
		22: begin  //SRA 
					ALUOut 		= Input_B >>> Input_C;
					overflow 	= 0;
					zero		= (ALUOut == 0) ? 1 : 0;
					//$display("SLL Aluout = %b",  ALUOut);
				end
		23: begin  //SRAV
					ALUOut 		= Input_B >>> Input_A;
					overflow 	= 0;
					zero		= (ALUOut == 0) ? 1 : 0;
					//$display("SLL Aluout = %b",  ALUOut);
				end
		24: begin  //SRL
					ALUOut 		= Input_B >> Input_C;
					overflow 	= 0;
					zero		= (ALUOut == 0) ? 1 : 0;
					//$display("SLL Aluout = %b",  ALUOut);
				end
		25: begin  //SRLV
					ALUOut 		= Input_B >> Input_A;
					overflow 	= 0;
					zero		= (ALUOut == 0) ? 1 : 0;
					//$display("SLL Aluout = %b",  ALUOut);
				end
		

        default:
				begin
					zero 		= 0;
					overflow 	= 0;
				end
             
    endcase
    
end

// always @(ALUOut) begin
//     	$display("Aluout from ALU module = %d" , Immid);
//     end
endmodule


