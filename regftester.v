`include "registerFile.v"


module test_regf;
	//initialize variables
    reg [31:0] In1;   			
    reg [4:0] addr1, addr2, waddr;
	wire  clk ;
	reg  Sel;
	//clock module instance
	Clock tock (clk);
	wire [31:0] Y1, Y2;        	 		
	parameter sim_time = 320;

	// instance of module register file
	RegisterFile rf1 (waddr,In1,addr1,Y1,addr2,Y2,Sel,clk);
	 
	   // setting simulation run-time
	initial #sim_time $finish;
	initial begin 
		 In1 = 16; 			        
		 waddr = 0;
		 addr2 = 31;
		 addr1 = 31;
		 Sel = 0;
	end
	// main testing block
	always @( posedge clk ) begin
			
			   In1 = In1 + 1;	
			   
			    waddr =  waddr + 1;
			    addr1 = addr1 + 1;
			    addr2 = addr2 + 1;
			    Sel   = 1;
			$display (" addr2  waddr 	    wdata                    Read2");	//print output header 
		    $monitor (" %b   %b %d  %b", addr2, waddr,In1,  Y2);    //print output signals formatted in binary representation
	
		
	end



endmodule