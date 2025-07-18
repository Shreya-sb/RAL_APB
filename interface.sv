interface top_if(input bit clk,input bit rst);
  
  logic pwrite;
  logic [4:0]paddr;
  logic [7:0]pwdata;
  logic [7:0]prdata;
   
endinterface
