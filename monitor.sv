//`include "uvm_macros.svh"
//import pkg::*;


class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  uvm_analysis_port #(seq_item) mon_ap;
  virtual top_if vif;
  seq_item tr;
  
  function new(string name = "monitor", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon_ap = new("mon_ap",this);
    if(! uvm_config_db#(virtual top_if)::get (this, "", "vif", vif))`uvm_error("MON", "Error getting Interface Handle");
  endfunction
 
  virtual task run_phase(uvm_phase phase);
    forever begin
      repeat(3)@(posedge vif.clk);
      $display("-----MONITOR BEGIN-----");
	  if(vif.psel && vif.penable && vif.rst)begin
        tr = seq_item::type_id::create("seq_item");
        tr.paddr  =  vif.paddr;
        tr.pwrite =  vif.pwrite;
         if(vif.pwrite)begin
 	      tr.pwdata = vif.pwdata;
          @(posedge vif.clk);
          `uvm_info("MON", $sformatf("Mode : Write WDATA : %0d ADDR : %0d", vif.pwdata, vif.paddr), UVM_NONE);
           end
       else begin 
          @(posedge vif.clk);
          tr.prdata = vif.prdata;
          `uvm_info("MON", $sformatf("Mode : Write RDATA : %0d ADDR : %0d", vif.prdata, vif.paddr), UVM_NONE);
          end
          mon_ap.write(tr);
          end
       end
      //$display("pwdata:%0h,prdata:%0h",tr.pwdata,tr.prdata);
      $display("-----MONITOR END------");
    //end
  endtask
endclass
