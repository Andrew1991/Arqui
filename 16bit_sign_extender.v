module sixteensign_extension(out, in, selector,enable);   
    output  [31:0] out;    
    input   [15:0] in;
	input [1:0] selector;
	reg [31:0] out;
     output reg enable;
    
    /* Fill in the implementation here... */ 
    always @ (in,selector)
		 begin
			if (selector == 0) 
				begin
					if(in[15] == 0)begin
						out = {16'h0000 , in};
						enable =1;
					end
						
					else begin
						out = {16'hffff, in};
						enable =1;
					end
						
				end 
			else 
				begin
					if (selector == 1)begin
						out = {16'h0000 , in};
						enable =1;
					end					
			  			   				
			  	end
			 enable =0;
		 end
	 
endmodule

