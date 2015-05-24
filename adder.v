module adder(pc, InputA, branch_target);
		input signed [31:0] pc;
		input signed [31:0] InputA;
		output reg signed [31:0] branch_target;
		
always @(pc, InputA) begin
	  //PC = 
	  //$display("Adder branch target: Initial Input from shift: %d", InputA);
	  branch_target = (pc -4) + InputA;		
	 // $display("Branch target = %d PC = %d, InputA = %d", branch_target, pc, InputA);
	end


endmodule