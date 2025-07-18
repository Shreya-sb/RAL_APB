`include "uvm_macros.svh"
 import uvm_pkg::*;
`include "package.sv"

`include "design.v"
module tb;
  bit clk;
  bit rst;
  logic [4:0] paddr;
  logic [7:0] pwdata;
  logic [7:0] prdata;
  apb_slave DUT(.clk(clk),.rst(rst),.pwrite(pwrite),.paddr(paddr),.pwdata(pwdata),.prdata(prdata));
  
  top_if vif(.clk(clk),.rst(rst));

  always #10 clk = ~clk;
  
  initial begin
   rst=0;
   #10 rst=1;
   #10 rst=0;
  end
  initial begin
  uvm_config_db#(virtual top_if)::set(null, "*", "vif", vif);
  $dumpfile("dump.vcd");
  $dumpvars;
  end
  
  initial begin
  run_test("");  
  end
  
endmodule
