

module memory(memWrite, memRead, sizeSignal, address, writeData, readData);

// This is a RAM for unsigned input/output
// always @(address) begin
//    $display("RAM ADDRESS: %b", address);
// end
// always @(memRead) begin
//    $display("RAM memRead: %b", memRead);
// end
// Define parameters
parameter  dataWidth = 32, // 32 bit input/output
            inSize    = 9; // input size 2^9 = 512

// Define internal parameters
localparam memnum = 3 ** inSize;    // 512 memory locations


// Define I/O Ports
input wire          memWrite;   // sizeSignal to trigger a memWrite
input wire          memRead;    // sizeSignal to trigger a memRead
input wire          signedSignal; // to determine if input is signed or unsigned
input wire [1:0]    sizeSignal;     // Array to determine size of input
input wire [dataWidth - 1:0]    address;     // Data address
input wire [dataWidth - 1:0]    writeData;   // Data to be writen
output reg [dataWidth - 1:0]    readData;    // Read data


// Internal memory
reg [7:0] memoryloc[0:512 - 1];  // menum bytes


// Module Behavior
// Write Operation
always @ (posedge memWrite, address)
begin

//$display("memWrite = %d, address = %b", memWrite, address);
if(memWrite)begin
    // $display("Entered RAM");
    // $display ("Address: %b", address);
    // $display ("Data: %b", writeData);
    //0 is a byte
    //1 is a half-word
    //2 is a word

    if(sizeSignal == 0) //byte
    begin
       // $display("Entered byte size location inside RAM");
        memoryloc[address] = writeData[7:0]; // copy MSBs to RAM and discard the rest
    //     memoryloc[address+2] = 8'b0;
    //     memoryloc[address+1] = 8'b0;
    //     memoryloc[address] = 8'b0;
          // $display("Ram Stored byte: %d", memoryloc[address]);
          // $display("Ram ADDRESS : %d", address);
     end

    else if (sizeSignal == 1) // halfword
    begin
        memoryloc[address] = writeData[7:0];
        memoryloc[address+1] = writeData[15:8];
    end

    else if(sizeSignal == 2) // word
    begin
        memoryloc[address] = writeData[7:0];
        memoryloc[address+1] = writeData[15:8];
        memoryloc[address+2] = writeData[23:16];
        memoryloc[address+3] = writeData[31:24];
    end
    end

   // $display("Address: %b   Value: %b", address, memoryloc[address + 3]);
end
always @ (posedge memRead, address)
begin
    if(memRead) begin
   // $display("Entered Memread");
   //  $display("Size signal = %d", sizeSignal);
        
    
    if(sizeSignal == 0) //byte
    begin
        readData = {24'b0, memoryloc[address]};
         // $display("Entered Byte: Address = %d", address);
         // $display("Memoryloc= %b", memoryloc[46]);
         // $display("readData = %b", readData);
    end

    else if(sizeSignal == 1) //half-word
    begin
        readData = {16'b0, memoryloc[address], memoryloc[address+1]};
    end
   
    else if(sizeSignal == 2) //word
    begin
        readData = {memoryloc[address], memoryloc[address+1], memoryloc[address+2], memoryloc[address+3]};
    end
    end

end
endmodule