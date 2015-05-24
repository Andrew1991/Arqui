
module instruction_register(clk, controlUnit, RS, RT, RD, immediate, IR_enable, pcin);


input  clk, IR_enable;
//input   [31:0] programCounter; //instruction to be read
output reg [5:0] controlUnit;
output reg [4:0] RS;
output reg [4:0] RT;
output reg [4:0] RD;
output reg [15:0] immediate;
integer pc =0;
 input [31:0] pcin;
reg [31:0] temp;
reg [31:0] internalMemory [0:140];
integer stop =0;
 
		
always @(posedge IR_enable) begin
		     temp = internalMemory[pcin];		   
		     controlUnit =  temp[31:26];			 
			 RS =  temp[25:21];
			 RT =  temp[20:16];
			 RD = temp[15:11];
			 immediate = temp[15:0];			
		    // $display("pc = %d" , pcin);			
	end

	
endmodule