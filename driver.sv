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
  /*      bit [31:0] data;
        vif.rst <= 1'b1;
        vif.psel <= 0;
        vif.penable <= 0;
        vif.pwrite <= 0;
        vif.paddr <= 0;
        vif.pwdata <= 0;*/
  tr = seq_item::type_id::create("tr");
  forever begin
  seq_item_port.get_next_item(tr);
  drive(tr);
  seq_item_port.item_done();
  $display("-----------DRIVER----------"); 
  end
  endtask
  
  
  //////////////drive DUT
  task drive(seq_item tr);
 // if(vif.rst == 1'b1)begin
 /*@(posedge vif.clk);
    vif.psel    <= 1'b1;
    vif.penable <= 1'b0;
    vif.paddr   <= tr.paddr;
    vif.pwrite  <= tr.pwrite;
    vif.pwdata  <= tr.pwdata;
 
    // Step 2: Enable phase
    repeat(2) @(posedge vif.clk);
    vif.penable <= 1'b1;
 */
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
 // end
  endtask
  
endclass
