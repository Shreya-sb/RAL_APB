class backdoor_seq extends uvm_sequence;
  `uvm_object_utils(backdoor_seq)
  reg_block regmodel;
  function new (string name = "backdoor_seq"); 
    super.new(name); 
  endfunction
  task body; 
    uvm_status_e status;
     bit [31:0] rdata, rdata_m, dout;
 
    regmodel.reg2_inst.poke(status, 4'hf);
    rdata = regmodel.reg2_inst.get();
    rdata_m = regmodel.reg2_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("POKE:Write -> Desired: %0h Mirrored: %0h",rdata, rdata_m), UVM_NONE);
    $display("-----------------------------------------------");
    regmodel.reg2_inst.peek(status, rdata);
//    `uvm_info(get_type_name(),$sformatf("PEEK:READ : %0h",dout),UVM_LOW);
    rdata = regmodel.reg2_inst.get();
    rdata_m = regmodel.reg2_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("AFTER PEEK--->Desired: %0h Mirrored: %0h", rdata, rdata_m), UVM_NONE);
  endtask
endclass
