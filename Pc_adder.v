module pc_adder(pc, Next_pc); 
		input signed [31:0] pc;
		input clk;
		output reg signed [31:0] Next_pc;
		initial
		Next_pc = 0;

always @(pc) begin
	 Next_pc = pc + 32'd4;
	// $display("NextPc after add = %d", Next_pc);
	// 	$display("PCin after add = %d", pc);;

end

endmodule

