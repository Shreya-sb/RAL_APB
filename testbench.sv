`include "uvm_macros.svh"
 import uvm_pkg::*;
`include "package.sv"

`include "design.v"
module tb;
  bit clk;
  bit rst;
 /* logic psel;
  logic penable;
  logic pwrite;
  logic [31:0] paddr;
  logic [31:0] pwdata;
  logic [31:0] prdata;*/
  top_if vif(.clk(clk),.rst(rst));
  top DUT(.pclk(vif.clk),.presetn(vif.rst),.psel(vif.psel),.penable(vif.penable),.pwrite(vif.pwrite),.paddr(vif.paddr),.pwdata(vif.pwdata),.prdata(vif.prdata));
  


//  top DUT(.PCLK(pclk),.PRESETn(rst),.PSEL(psel),.PENABLE(penable),.PWRITE(pwrite),.PADDR(paddr),.PWDATA(pwdata),.PRDATA(prdata));
  //apb_slave DUT(.clk(PCLK),.rst(PRESETn),.psel(PSEL),.penable(PENABLE),.pwrite(PWRITE),.paddr(PADDR),.pwdata(PWDATA),.prdata(PRDATA));
 initial begin
 clk = 0;
 //rst = 1;
 end

  always #10 clk = ~clk;
  
  initial begin
   rst=0;
   #10 rst=1;
  // #10 rst=0;
  end
  initial begin
  uvm_config_db#(virtual top_if)::set(null, "*", "vif", vif);
  $dumpfile("dump.vcd");
  $dumpvars;
  end
  
  initial begin
  run_test("test");  
  end
  
endmodule
