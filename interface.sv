interface top_if(input bit clk,input bit rst);
  
  logic pwrite;
  logic psel;
  logic penable;
  logic [31:0]paddr;
  logic [31:0]pwdata;
  logic [31:0]prdata;
   
endinterface
