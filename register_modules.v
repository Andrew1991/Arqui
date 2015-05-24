// 32-bit register with
// asynchronous clear
module reg32(Datain,clk,Clr_,Dataout,LE);
	parameter n = 32;
	input [n-1:0] Datain;
	input clk, Clr_;
	input  LE;
	output reg [n-1:0] Dataout;

	always @(negedge Clr_, posedge clk,  LE)
		begin
		if (!Clr_)
			Dataout = 0;
		else if (LE)
			Dataout <= Datain;
			//$display("Displaying Datain: %b" , Datain);
		end
endmodule // 32 bit reg



module reg32_0(Datain,clk,Clr_,Dataout,LE);
	parameter n = 32;
	input [n-1:0] Datain;
	input clk, Clr_;
	input  LE;
	output reg [n-1:0] Dataout;

	always @(negedge Clr_, posedge clk)
		begin
		if (!Clr_)
			Dataout <= 0;
		else if (LE)
			Dataout <= 0;

		end
endmodule // 32 bit register 0