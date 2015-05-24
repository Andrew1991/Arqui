`include "register_modules.v"
`include "Mult32to1.v"

module Clock (output tick); // clock module to be used to sync all clock dependent components
    reg tick;
   initial tick = 0;
   always #15  tick = ~tick;

endmodule


//  de-multiplexer to be used to enable write register in register file 
module regf_edemux (binary_in, out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15, out16, out17, out18, out19, out20, out21, out22, out23, out24, out25, out26, out27, out28, out29, out30, out31, enable);

input [4:0] binary_in  ;
input  enable ;
output reg out0 , out1 , out2 , out3 , out4 , out5 , out6 , out7 , out8 , out9 , out10 , out11 , out12 , out13 , out14 , out15 , out16 , out17 , out18 , out19 , out20 , out21 , out22 , out23 , out24 , out25 , out26 , out27 , out28 , out29 , out30 , out31 ;
reg ooout0 ;
reg ooout1 ;
reg ooout2 ;
reg ooout3 ;
reg ooout4 ;
reg ooout5 ;
reg ooout6 ;
reg ooout7 ;
reg ooout8 ;
reg ooout9 ;
reg ooout10;
reg ooout11;
reg ooout12;
reg ooout13;
reg ooout14;
reg ooout15;
reg ooout16;
reg ooout17;
reg ooout18;
reg ooout19;
reg ooout20;
reg ooout21;
reg ooout22;
reg ooout23;
reg ooout24;
reg ooout25;
reg ooout26;
reg ooout27;
reg ooout28;
reg ooout29;
reg ooout30;
reg ooout31;
supply1 vdd;
always @(vdd)
  begin
   ooout0 <= 0;  ooout1 <= 0; ooout2 <= 0;  ooout3 <= 0;  ooout4 <= 0;  ooout5 <= 0;  ooout6 <= 0; ooout7 <= 0; ooout8 <= 0; ooout9 <= 0; ooout10 <= 0; ooout11 <= 0; ooout12 <= 0; ooout13 <= 0; ooout14 <= 0; ooout15 <= 0; ooout16 <= 0; ooout17 <= 0; ooout18 <= 0; ooout19 <= 0; ooout20 <= 0; ooout21 <= 0; ooout22 <= 0; ooout23 <= 0; ooout24 <= 0; ooout25 <= 0; ooout26 <= 0; ooout27 <= 0; ooout28 <= 0; ooout29 <= 0; ooout30 <= 0; ooout31 <= 0;

  
  end
always @(vdd)
begin
  out0 <= ooout0; out1 <= ooout1 ; out2 <= ooout2; out3 <= ooout3; out4 <= ooout4; out5 <= ooout5; out6 <= ooout6; out7 <= ooout7; out8 <= ooout8; out9 <= ooout9; out10 <= ooout10; out11 <= ooout11; out12 <= ooout12; out13 <= ooout13; out14 <= ooout14; out15 <= ooout15; out16 <= ooout16; out17 <= ooout17; out18 <= ooout18; out19 <= ooout19; out20 <= ooout20; out21 <= ooout21; out22 <= ooout22; out23 <= ooout23; out24 <= ooout24;
  out25 <= ooout25; out26 <= ooout26; out27 <= ooout27; out28 <= ooout28; out29 <= ooout29; out30 <= ooout30; out31 <= ooout31;
end

always @ ( posedge enable)
begin
 // $display("Enable from RegsiteFile = %d", enable);
 // $display("binary in from RegsiteFile = %b", binary_in);

  
  if (enable) begin
    case (binary_in)
      0 : out0 <= enable;
      1 : out1 <= enable;
      2 : out2 <= enable;
      3 : out3 <= enable;
      4 : out4 <= enable;
      5 : out5 <= enable;
      6 : out6 <= enable;
      7 : out7 <= enable;
      8 : out8 <= enable;
      9 : out9 <= enable;
      10 : out10 <= enable;
      11 : out11 <= enable;
      12 : out12 <= enable;
      13 : out13 <= enable;
      14 : out14 <= enable;
      15 : out15 <= enable;
      16 : out16 <= enable;
      17 : out17 <= enable;
      18 : out18 <= enable;
      19 : out19 <= enable;
      20 : out20 <= enable;
      21 : out21 <= enable;
      22 : out22 <= enable;
      23 : out23 <= enable;
      24 : out24 <= enable;
      25 : out25 <= enable;
      26 : out26 <= enable;
      27 : out27 <= enable;
      28 : out28 <= enable;
      29 : out29 <= enable;
      30 : out30 <= enable;
      31 : out31 <= enable;
    endcase
  end
  
end

always @(enable) begin
 if(!enable) begin
       out0 <= 0;
       out1 <= 0;
       out2 <= 0;
       out3 <= 0;
       out4 <= 0;
       out5 <= 0;
       out6 <= 0;
       out7 <= 0;
       out8 <= 0;
       out9 <= 0;
       out10 <= 0;
       out11 <= 0;
       out12 <= 0;
       out13 <= 0;
       out14 <= 0;
       out15 <= 0;
       out16 <= 0;
       out17 <= 0;
       out18 <= 0;
       out19 <= 0;
       out20 <= 0;
       out21 <= 0;
       out22 <= 0;
       out23 <= 0;
       out24 <= 0;
       out25 <= 0;
       out26 <= 0;
       out27 <= 0;
       out28 <= 0;
       out29 <= 0;
       out30 <= 0;
       out31 <= 0;    
  end
end

endmodule 



// Register file  module
//                    1          5            1                     2                   0      clk
module RegisterFile(writeaddr, writedata, readaddr1, readdata1, readaddr2, readdata2, write, clock, show);
// initialize variables
input [4:0] writeaddr, readaddr1, readaddr2;
input [31:0] writedata;
input write,clock, show;
output wire [31:0] readdata1,readdata2;
wire [31:0] wd = writedata;
wire [4:0] radd1 = readaddr1, raddr2 = readaddr2, waddr = writeaddr;
// using place holder variables to store relevant values before outputting them
wire  oout0, oout1, oout2, oout3, oout4, oout5, oout6, oout7, oout8, oout9, oout10, oout11, oout12, oout13, oout14, oout15, oout16, oout17, oout18, oout19, oout20, oout21, oout22, oout23, oout24, oout25, oout26, oout27, oout28, oout29, oout30, oout31;

wire  [31:0] dataout0, dataout1, dataout2, dataout3, dataout4, dataout5, dataout6, dataout7, dataout8, dataout9, dataout10, dataout11, dataout12, dataout13, dataout14, dataout15, dataout16, dataout17, dataout18, dataout19, dataout20, dataout21, dataout22, dataout23, dataout24, dataout25, dataout26, dataout27, dataout28, dataout29, dataout30, dataout31;

//constants
supply1 vcc;
supply0 vdd;

regf_edemux writeenable (waddr, oout0, oout1, oout2, oout3, oout4, oout5, oout6, oout7, oout8, oout9, oout10, oout11, oout12, oout13, oout14, oout15, oout16, oout17, oout18, oout19, oout20, oout21, oout22, oout23, oout24, oout25, oout26, oout27, oout28, oout29, oout30, oout31, write);
  
// always @(writedata) begin
//  $display("Data to be stored: %b, Write address = %d", wd, writeaddr);
// end 


//register array

reg32 r0 (32'd0, clock,vdd,dataout0,oout0);
reg32 r1 (wd, clock,vcc,dataout1,oout1);
reg32 r2 (wd, clock,vcc,dataout2,oout2);
reg32 r3 (wd, clock,vcc,dataout3,oout3);
reg32 r4 (wd, clock,vcc,dataout4,oout4);
reg32 r5 (wd, clock,vcc,dataout5,oout5);
reg32 r6 (wd, clock,vcc,dataout6,oout6);
reg32 r7 (wd, clock,vcc,dataout7,oout7);
reg32 r8 (wd, clock,vcc,dataout8,oout8);
reg32 r9 (wd, clock,vcc,dataout9,oout9);
reg32 r10 (wd, clock,vcc,dataout10,oout10);
reg32 r11 (wd, clock,vcc,dataout11,oout11);
reg32 r12 (wd, clock,vcc,dataout12,oout12);
reg32 r13 (wd, clock,vcc,dataout13,oout13);
reg32 r14 (wd, clock,vcc,dataout14,oout14);
reg32 r15 (wd, clock,vcc,dataout15,oout15);
reg32 r16 (wd, clock,vcc,dataout16,oout16);
reg32 r17 (wd, clock,vcc,dataout17,oout17);
reg32 r18 (wd, clock,vcc,dataout18,oout18);
reg32 r19 (wd, clock,vcc,dataout19,oout19);
reg32 r20 (wd, clock,vcc,dataout20,oout20);
reg32 r21 (wd, clock,vcc,dataout21,oout21);
reg32 r22 (wd, clock,vcc,dataout22,oout22);
reg32 r23 (wd, clock,vcc,dataout23,oout23);
reg32 r24 (wd, clock,vcc,dataout24,oout24);
reg32 r25 (wd, clock,vcc,dataout25,oout25);
reg32 r26 (wd, clock,vcc,dataout26,oout26);
reg32 r27 (wd, clock,vcc,dataout27,oout27);
reg32 r28 (wd, clock,vcc,dataout28,oout28);
reg32 r29 (wd, clock,vcc,dataout29,oout29);
reg32 r30 (wd, clock,vcc,dataout30,oout30);
reg32 r31 (wd, clock,vcc,dataout31,oout31);

Mult32to1 read1 (dataout0, dataout1, dataout2, dataout3, dataout4, dataout5, dataout6, dataout7, dataout8, dataout9, dataout10, dataout11, dataout12, dataout13, dataout14, dataout15, dataout16, dataout17, dataout18, dataout19, dataout20, dataout21, dataout22, dataout23, dataout24, dataout25, dataout26, dataout27, dataout28, dataout29, dataout30, dataout31, readaddr1, readdata1);
Mult32to1 read2 (dataout0, dataout1, dataout2, dataout3, dataout4, dataout5, dataout6, dataout7, dataout8, dataout9, dataout10, dataout11, dataout12, dataout13, dataout14, dataout15, dataout16, dataout17, dataout18, dataout19, dataout20, dataout21, dataout22, dataout23, dataout24, dataout25, dataout26, dataout27, dataout28, dataout29, dataout30, dataout31,readaddr2,readdata2);



 always @(dataout1) begin
      $display("Saving in Regsiter 1 = %d", dataout1);
 end
 always @(dataout2) begin
      $display("Saving in Regsiter 2 = %d", dataout2);
 end
 always @(dataout3) begin
      $display("Saving in Regsiter 3 = %d", dataout3);
 end
 always @(dataout4) begin
      $display("Saveing in Regsiter 4 = %d ", dataout4);
 end
 always @(dataout5) begin
      $display("Saving in Regsiter 5 = %d ", dataout5);
 end
 always @(dataout6) begin
      $display("Saveing in Regsiter 6 = %b ", dataout6);
 end
 always @(dataout7) begin
      $display("Saveing in Regsiter 7 = %b ", dataout7);
 end
 always @(dataout8) begin
      $display("Saveing in Regsiter 8 = %b \n", dataout8);
 end
 always @(dataout9) begin
      $display("Saveing in Regsiter 9 = %b \n", dataout9);
 end
 always @(dataout10) begin
      $display("Saveing in Regsiter 10 = %b \n", dataout10);
 end
 always @(dataout11) begin
      $display("Saveing in Regsiter 11 = %b \n", dataout11);
 end
 always @(dataout12) begin
      $display("Saveing in Regsiter 12 = %b \n", dataout12);
 end
 always @(dataout13) begin
      $display("Saveing in Regsiter 13 = %b \n", dataout13);
 end
 always @(dataout14) begin
      $display("Saveing in Regsiter 14 = %b \n", dataout14);
 end
 always @(dataout15) begin
      $display("Saveing in Regsiter 15 = %b \n", dataout15);
 end
 always @(dataout16) begin
      $display("Saveing in Regsiter 16 = %b \n", dataout16);
 end
 always @(dataout17) begin
      $display("Saveing in Regsiter 17= %b \n", dataout17);
 end
 always @(dataout18) begin
      $display("Saveing in Regsiter 18 = %b \n", dataout18);
 end
 always @(dataout19) begin
      $display("Saveing in Regsiter 19 = %b \n", dataout19);
 end
 always @(dataout20) begin
      $display("Saveing in Regsiter 20 = %b \n", dataout20);
 end
 always @(dataout21) begin
      $display("Saveing in Regsiter 21 = %b \n", dataout21);
 end
 always @(dataout22) begin
      $display("Saveing in Regsiter 22 = %b\n", dataout22);
 end
 always @(dataout23) begin
      $display("Saveing in Regsiter 23 = %b \n", dataout23);
 end
 always @(dataout24) begin
      $display("Saveing in Regsiter 24 = %b \n", dataout24);
 end
 always @(dataout25) begin
      $display("Saveing in Regsiter 25 = %b \n", dataout25);
 end
 always @(dataout26) begin
      $display("Saveing in Regsiter 26 = %b \n", dataout26);
 end
 always @(dataout27) begin
      $display("Saveing in Regsiter 27 = %b \n", dataout27);
 end
 always @(dataout28) begin
      $display("Saveing in Regsiter 28 = %b \n", dataout28);
 end
 always @(dataout29) begin
      $display("Saveing in Regsiter 29 = %b \n", dataout29);
 end
 always @(dataout30) begin
      $display("Saveing in Regsiter 30 = %b \n", dataout30);
 end
 always @(dataout31) begin
      $display("Saveing in Regsiter 31 = %b \n", dataout31);
 end
 
always @(posedge show) begin
$display("Regsiter 0 = %d ", dataout0);
$display("Regsiter 1 = %d ", dataout1);
$display("Regsiter 2 = %d ", dataout2);
$display("Regsiter 3 = %d ", dataout3);
$display("Regsiter 4 = %d ", dataout4);
$display("Regsiter 5 = %d ", dataout5);
$display("Regsiter 6 = %d ", dataout6);
$display("Regsiter 7 = %d ", dataout7);
$display("Regsiter 8 = %d ", dataout8);
$display("Regsiter 9 = %d ", dataout9);
$display("Regsiter 10 = %d ", dataout10);
$display("Regsiter 11 = %d ", dataout11);
$display("Regsiter 12 = %d ", dataout12);
$display("Regsiter 13 = %d ", dataout13);
$display("Regsiter 14 = %d ", dataout14);
$display("Regsiter 15 = %d ", dataout15);
$display("Regsiter 16 = %d ", dataout16);
$display("Regsiter 17 = %d ", dataout17);
$display("Regsiter 18 = %d ", dataout18);
$display("Regsiter 19 = %d ", dataout19);
$display("Regsiter 20 = %d ", dataout20);
$display("Regsiter 21 = %d ", dataout21);
$display("Regsiter 22 = %d ", dataout22);
$display("Regsiter 23 = %d ", dataout23);
$display("Regsiter 24 = %d ", dataout24);
$display("Regsiter 25 = %d ", dataout25);
$display("Regsiter 26 = %d ", dataout26);
$display("Regsiter 27 = %d ", dataout27);
$display("Regsiter 28 = %d ", dataout28);
$display("Regsiter 29 = %d ", dataout29);
$display("Regsiter 30 = %d ", dataout30);
$display("Regsiter 31 = %d ", dataout31); 
end

endmodule