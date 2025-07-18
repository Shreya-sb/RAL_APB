class driver extends uvm_driver#(seq_item);
 `uvm_component_utils(driver)
  seq_item tr;
  virtual top_if vif;
 
  function new(input string path = "driver", uvm_component parent = null);
  super.new(path,parent);
  endfunction
 
  virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
    tr = seq_item::type_id::create("tr",this);
    if(!uvm_config_db#(virtual top_if)::get(this,"","vif",vif))
      `uvm_error("drv","Unable to access Interface");
  endfunction
  
  ///////////////reset DUT at the start
/*  task reset_dut();
  @(posedge vif.clk);
  vif.rst <= 1'b1;
  vif.pwrite <= 1'b0;
  vif.pwdata <= 8'h00;
  vif.paddr <= 1'b0;
  vif.prdata <= 1'0;
 
   repeat(5)@(posedge vif.clk);
  `uvm_info("DRV", "System Reset", UVM_NONE);
     vif.rst <= 1'b0;
  endtask
*/

  ///////////////main task of driver
  virtual task run_phase(uvm_phase phase);
  tr = seq_item::type_id::create("tr");
  forever begin
  seq_item_port.get_next_item(tr);
  drive();
  seq_item_port.item_done(); 
  end
  endtask
  
  
     //////////////drive DUT
  task drive();
  @(posedge vif.clk);
  vif.rst <= 1'b0;
  vif.pwrite <= tr.pwrite;
  vif.paddr <= tr.paddr;
    if(tr.pwrite == 1'b1)
  begin
  vif.pwdata <= tr.pwdata;
  @(posedge vif.clk);
  `uvm_info("DRV", $sformatf("Data Write -> Wdata : %0d",vif.pwdata),UVM_NONE);
  end
  else
  begin 
  tr.prdata <= vif.prdata;//<= or =??
  @(posedge vif.clk);
  `uvm_info("DRV", $sformatf("Data Read -> Rdata : %0d",vif.prdata),UVM_NONE);
  end 
  endtask
  
endclass
