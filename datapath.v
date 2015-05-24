`include "16bit_sign_extender.v"

`include "ALU.v"

`include "IR.v"
`include "Mult2to1.v"

`include "registerFile.v"
`include "Mult2to1_32b.v"
`include "RAM.v"
`include "pc.v"
`include "adder.v"
`include "shift_2.v"
`include "Pc_adder.v"


`include "Alusrcmux.v"
`include "LowReg.v"
`include "HiReg.v"
`include "Mult4to1_32b.v"
`include "controlUnit.v"

module datapath();
 wire [2:0] signedCompare, unsignedCompare;
 wire [4:0] m1Out, RS, RT, RS_, RT_, RD_, AluControl, m1Out_;
 wire [5:0] Op_Code;
 wire clrPC,ClrNPC, PC_Enable, PCSrc, zero, Branch,  IR_Enable, NPC_Enable, RegDst, RegWrite,
       MemRead, ALUSrc, isSigned, isJump, clk, Neg, Carry, Overflow,  MemWrite , hi_select, low_select, enable;
 wire [1:0] MemtoReg, selA, selB, ramType ;      
 wire [15:0] Immid, demux_A_out0, demux_A_out1;
 wire [31:0] m3Out, m5Out, pc_out, outputPC, se16_out, outputShift, branch_target, se5_out,
       m2Out, readdata2,readdata1, ALUResult, hi, low, Read_data, m4Out, NextPC, pc_out1, shift_out;
reg RESET, show;
wire AluEnable;
parameter sim_time = 3500;
integer data_file;
reg [31:0] scan_file;
reg [7:0] input_text;
integer memoryPosition, instruction, i;
`define NULL 0
initial #sim_time $finish;
//opcode rs rt rd sa function
initial 
begin
$display(" \n START \n");
data_file = $fopen("data.dat", "r");
  if(data_file == `NULL)
  begin
    $display("File is NULL");
    $finish;
  end
  memoryPosition = 0;
  while (!$feof(data_file))
  begin
    instruction = $fscanf(data_file, "%b", input_text);
    //ir1.internalMemory[memoryPosition] = input_text;
    ram.memoryloc[memoryPosition] = input_text;
    $display("Ram[%d] = %b", memoryPosition, ram.memoryloc[memoryPosition]);
    memoryPosition = memoryPosition + 1;
  end
  for(i = 0; i<memoryPosition; i = i + 4)
  begin
    ir1.internalMemory[i] = {ram.memoryloc[i], ram.memoryloc[i+1], ram.memoryloc[i+2], ram.memoryloc[i+3]};
    //$display("IR[%d] = %b", i, ir1.internalMemory[i]);
  end
$fclose(data_file);

end
    
    Clock tock(clk);

    RegisterFile rf1 (m1Out_,m4Out,RS_,readdata1,RT_, readdata2, RegWrite, clk, show); 

     pc pc1(clk, clrPC, PC_Enable, NextPC, pc_out,Branch,isJump);

     pc_adder pc2( pc_out, pc_out1);

    shift_2 shift(se16_out, shift_out);

    adder add(pc_out1, shift_out, branch_target);

    Mult2to1_32pc m6(pc_out1, branch_target, Branch, NextPC); //hardcoded selector 

    instruction_register ir1(clk, Op_Code, RS_, RT_, RD_, Immid, IR_Enable, pc_out);

    controlUnit cu(IR_Enable,  PC_Enable, NPC_Enable, clrPC,  ClrNPC, Branch,  RegDst, 
                  RegWrite,  MemRead,  MemtoReg,  AluControl, MemWrite, ALUSrc,  selA,   selB, 
                  isSigned,  signedCompare, unsignedCompare,  isJump,  ramType,  zero,  Neg,  Carry,
                  Overflow,  Op_Code, Immid[5:0],  RESET,  clk, AluEnable, RT_);

    
    Mult2to1 m1(RT_,RD_,RegDst, m1Out_);
    
    sixteensign_extension se1(se16_out, Immid, selA, enable);   

    ALuSrcMux m3(se16_out, readdata2, ALUSrc, m3Out); // Multiplexer connected to ALU

    ALU alu1(AluControl, readdata1, m3Out, Immid[10:6], {16'h000 , Immid}, ALUResult, zero, Overflow, Neg, AluEnable ); //fix add Rs / RT
    
    hiReg hi_(ALUResult, hi, hi_select);
   
    lowReg low_(ALUResult, low, low_select);   

    memory ram(MemWrite, MemRead, ramType, ALUResult, readdata2, Read_data); //de donde sale sizeSignal?

    Mult4to1_32b m4(Read_data, ALUResult, hi, low, MemtoReg, m4Out);// ultimo multiplexer que va hacia el regsiterfile
    
    initial begin
      RESET = 1;
      #15 RESET = 0;
      end
    

  initial begin
    #3490
    $display("RAM Output:");
    for(i = 0; i<57; i = i +1)
  begin
   //$display("%b %b %b %b", ram.memoryloc[i], ram.memoryloc[i+1], ram.memoryloc[i+2], ram.memoryloc[i+3]);
    //$display("IR[%d] = %b", i, ir1.internalMemory[i]);
    $display("Value [%d] = %b",i, ram.memoryloc[i]);
  end
  end
  initial begin
    #3495
    show = 1;
    $display("\n REG Output:");

  end
    
   
    
endmodule