interface top_if(input bit clk,input bit rst);
  
  logic pwrite;
  logic psel;
  logic penable;
  logic [31:0]paddr;
  logic [31:0]pwdata;
  logic [31:0]prdata;

 clocking cb_drv @(posedge clk);
    default input #0 output #0;
    input rst;
    inout psel;
    inout penable;
    inout pwrite;
    inout paddr;
    inout pwdata;
    input prdata;
  endclocking

  clocking cb_mon @(posedge clk);
    default input #0 output #0;
    input psel;
    input penable;
    input pwrite;
    input paddr;
    input pwdata;
    input prdata;
  endclocking

  modport mp_drv(clocking cb_drv, input clk, rst, prdata);
  modport mp_mon(clocking cb_mon, input clk, rst);
   
endinterface
