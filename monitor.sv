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
    tr = seq_item::type_id::create("seq_item");
    forever begin
      repeat(3)@(vif.clk);
	  tr.pwdata = vif.pwdata;
      tr.paddr  =  vif.paddr;
      tr.pwrite =  vif.pwrite;
 	  tr.prdata = vif.prdata;
      mon_ap.write(tr);
    end
  endtask
endclass
