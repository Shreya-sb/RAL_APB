class driver extends uvm_driver#(seq_item);
 `uvm_component_utils(driver)
  seq_item tr;
  virtual top_if vif;
 
  function new(string path = "driver", uvm_component parent = null);
    super.new(path,parent);
  endfunction
 
  virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
    tr = seq_item::type_id::create("tr",this);
    if(!uvm_config_db#(virtual top_if)::get(this,"","vif",vif))
      `uvm_error("drv","Unable to access Interface");
  endfunction
  
  ///////////////main task of driver
  virtual task run_phase(uvm_phase phase);
  tr = seq_item::type_id::create("tr");
  vif.psel    <= 1'b0;
    vif.penable <= 1'b0;
    vif.pwrite  <= 1'b0;
    vif.paddr   <= 32'h0;
    vif.pwdata  <= 32'h0;

  forever begin
  seq_item_port.get_next_item(tr);
  drive();
  seq_item_port.item_done();
  $display("-----------DRIVER----------"); 
  end
  endtask
  
  
  //////////////drive DUT
  task drive();
 // if(vif.rst == 1'b1)begin
 if(tr.pwrite == 1'b1)
  begin 
  @(posedge vif.clk);
  vif.rst <= 1'b1;
     vif.paddr <= tr.paddr;
     vif.pwrite <= 1'b1;
     vif.pwdata <= tr.pwdata;
     vif.psel <= 1'b1;
     repeat(2)@(posedge vif.clk);
     vif.penable <= 1'b1; 
     `uvm_info("DRV", $sformatf("Data Write -> Wdata : %0h",vif.pwdata),UVM_NONE);
     @(posedge vif.clk);
     vif.psel <= 1'b0;
     vif.penable <=1'b0;
   end
 else
  begin
     @(posedge vif.clk);
     vif.pwrite <= 1'b0;
     vif.paddr <= tr.paddr;
     vif.psel <= 1'b1;
     repeat(2)@(posedge vif.clk);
     vif.penable <= 1'b1; 
     `uvm_info("DRV", $sformatf("Data READ -> read data : %0h",vif.prdata),UVM_NONE);
     @(posedge vif.clk);
     vif.psel <= 1'b0;
     vif.penable <=1'b0;
     tr.prdata = vif.prdata;
  end
  endtask
endclass
