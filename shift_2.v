module shift_2(Input_A, output_A);
		input [31:0] Input_A;
		output reg signed [31:0] output_A;
always @(Input_A) begin
			//$display("Display before shift: %b", Input_A);
			output_A = Input_A << 2;
			//$display("Display after shift by 2: %d", output_A);
		end		
endmodule