module pc(clk, clrPC,PC_enable, NextPC, pc, branch, jump); 

	input clrPC , PC_enable, clk,branch, jump;
	input [31:0] NextPC;
	output reg [31:0] pc;
	reg [31:0]tempPC;
	reg flag;
 initial begin 
  flag = 0;
  pc = 0;
  tempPC = pc + 32'd4;
  //$display("pc.v - Initial Begin PC = %d tempPC = %d", pc, tempPC);

  end
  //reg [31:0]NextPC_;
   
always @(posedge clrPC, posedge PC_enable) begin
	//$display("pc.v - always statement clrPC = %d PC_Enable = %d", clrPC, PC_enable);
	if(clrPC) begin
		  pc = 0;
		  //$display("pc.v Pc clr");		
	end		
	else if(PC_enable)begin

		if (branch || jump) begin
			tempPC = NextPC;
			pc = NextPC;
			//pc = pc + 32'd4;
			//$display("Jump or branch active PC = %d", pc);
			flag = 1;

		end
		else if (((flag) == 1) && (tempPC != NextPC)) begin
			//$display ("pc.v - SECOND IF STATEMENT INSIDE PC_ENABLE");
			pc = tempPC;
			pc = NextPC;
			//assign NextPC = tempPC ;
			flag =0;
		end
		else begin
			//$display("pc.v - THIRD IF STATEMENT INSIDE PC_ENABLE");
			tempPC = NextPC + 32'd4;
			pc = NextPC;
			//$display("tempPC = %d pc = %d NextPC = %d", tempPC, pc, NextPC);

			
			
		end
					
		end	
	end

	// always @(pc) begin
	// 	$display("PC.v NextPC = %d  Pc = %d tempPC = %d", NextPC, pc, tempPC);
	// end
endmodule

