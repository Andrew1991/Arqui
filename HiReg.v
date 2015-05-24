module hiReg(InputA, OutputA, sel);
	input [31:0] InputA;
	input sel;
	output reg [31:0] OutputA;

	always@(sel) begin
		if(sel)begin
			OutputA <= InputA;
		end
	end
endmodule