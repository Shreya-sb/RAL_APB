class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  uvm_analysis_port #(seq_item) mon_ap;
  virtual top_if.mp_mon vif;
  seq_item tr;
  
  function new(string name = "monitor", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon_ap = new("mon_ap",this);
    if(! uvm_config_db#(virtual top_if.mp_mon)::get (this, "", "vif", vif))`uvm_error("MON", "Error getting Interface Handle");
  endfunction
 
  /*virtual task run_phase(uvm_phase phase);
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
      $display("-----MONITOR END------");
  endtask*/

virtual task run_phase(uvm_phase phase);
    tr = seq_item::type_id::create("tr");
    forever begin
      //  repeat(3) @(vif.cb_mon);
      @(vif.cb_mon);
      $display("-------------monitor begin----------");
      tr.paddr    =   vif.cb_mon.paddr;
      tr.pwrite   =   vif.cb_mon.pwrite;
      tr.psel     =   vif.cb_mon.psel;
      tr.penable  =   vif.cb_mon.penable;
      tr.pwdata   =   vif.cb_mon.pwdata;
      tr.prdata   =   vif.cb_mon.prdata;

      mon_ap.write(tr);

    end
  endtask

endclass
