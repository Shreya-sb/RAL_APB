`include "uvm_macros.svh"
 import uvm_pkg::*;
`include "package.sv"

`include "design.v"
module tb;
  bit clk;
  bit rst;
  top_if vif(.clk(clk),.rst(rst));
  top DUT(.pclk(vif.clk),.presetn(vif.rst),.psel(vif.psel),.penable(vif.penable),.pwrite(vif.pwrite),.paddr(vif.paddr),.pwdata(vif.pwdata),.prdata(vif.prdata));

 initial begin
 clk = 0;
 rst = 0;
#10 rst =1;
 end

  always #10 clk = ~clk;
  
  initial begin
  uvm_config_db#(virtual top_if)::set(null, "*", "vif", vif);
  run_test("reg_test");  
  end
  
  initial begin
   $dumpfile("dump.vcd");
  $dumpvars;
  end
  
endmodule
