module wtf ;
	reg a;
	reg b;
	begin
		a <= 0;
		b <= 1;
	end
	case (a)
		0: begin
			case (b)
			0: begin
				$display("Yolo");
			end
			1: begin
				$display("WTF");
			end
			endcase
		end
		1: begin
			$display("END");
		end


	endcase
endmodule