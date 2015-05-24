`include "datapath.v"

module tester();
	
	reg MemWrite;
	reg ALUSrc;
	reg RegWrite;
	reg selA, selB, selC;
	reg RegDSt, MemRead, Signed, branch, MemtoReg, clrPc;
	wire clk;
	wire [31:0] Y;
	// parameter sim_time = 800;
	Clock tock(clk);

	datapath d1(clrPc, MemWrite, ALUSrc, RegWrite, selA, selB, selC, RegDSt, MemRead, MemtoReg, Signed, branch, clk, Y);

	// initial #sim_time $finish;
	initial begin
		clrPc = 1;
	end
	
     

	
    always @( posedge clk ) begin
		
    	MemWrite = 0;				
		Signed = 1;
		RegDSt = 1;
		ALUSrc = 1;
		RegWrite = 1;
		selC = 0;
		selB = 0;
		selA = 0;
		branch = 0;
		MemRead = 0;
		MemtoReg = 1;
		

		clrPc =  0;
		MemWrite = 0;				
		Signed = 1;
		RegDSt = 1;
		ALUSrc = 1;
		RegWrite = 1;
		selC = 0;
		selB = 0;
		selA = 0;
		branch = 0;
		MemRead = 0;
		MemtoReg = 1;
		//clrPc = #5 0;
		// 	MemWrite = 0;
				
		// Signed = 1;
		// RegDSt = 1;
		// ALUSrc = 1;
		// RegWrite = 1;
		// selC = 0;
		// selB = 0;
		// selA = 0;
		// branch = 0;
		// MemRead = 0;
		// MemtoReg = 1;
		// clrPc = #5 0;
		// 	MemWrite = 0;
				
		// Signed = 1;
		// RegDSt = 1;
		// ALUSrc = 1;
		// RegWrite = 1;
		// selC = 0;
		// selB = 0;
		// selA = 0;
		// branch = 0;
		// MemRead = 0;
		// MemtoReg = 1;
		// clrPc = #5 0;

		
			//$display (" output: %b" , Y);	//print output header 	
	end
endmodule