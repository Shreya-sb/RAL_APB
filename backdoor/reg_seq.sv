class backdoor_seq extends uvm_sequence;
  `uvm_object_utils(backdoor_seq)
  reg_block regmodel;
  function new (string name = "backdoor_seq"); 
    super.new(name); 
  endfunction
  task body; 
    uvm_status_e status;
     bit [31:0] rdata, rdata_m, dout;
        
    `uvm_info("SEQ", "====== CNTRL ======", UVM_NONE); 
    regmodel.cntrl_inst.poke(status, 4'hf);
    rdata = regmodel.cntrl_inst.get();
    rdata_m = regmodel.cntrl_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("POKE-->CNTRL:Write -> Desired: %0h Mirrored: %0h",rdata, rdata_m), UVM_NONE);
    $display("-----------------------------------------------");
    regmodel.cntrl_inst.peek(status, rdata);
    rdata = regmodel.cntrl_inst.get();
    rdata_m = regmodel.cntrl_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("AFTER PEEK CNTRL--->Desired: %0h Mirrored: %0h", rdata, rdata_m), UVM_NONE);
    
    `uvm_info("SEQ", "====== REG1 ======", UVM_NONE); 
    regmodel.reg1_inst.poke(status, 32'h001);
    rdata = regmodel.reg1_inst.get();
    rdata_m = regmodel.reg1_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("POKE-->REG1:Write -> Desired: %0h Mirrored: %0h",rdata, rdata_m), UVM_NONE);
    $display("-----------------------------------------------");
    regmodel.reg1_inst.peek(status, rdata);
    rdata = regmodel.reg1_inst.get();
    rdata_m = regmodel.reg1_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("AFTER PEEK REG1--->Desired: %0h Mirrored: %0h", rdata, rdata_m), UVM_NONE);
    
    `uvm_info("SEQ", "====== REG2 ======", UVM_NONE); 
    regmodel.reg2_inst.poke(status, 32'hABCD);
    rdata = regmodel.reg2_inst.get();
    rdata_m = regmodel.reg2_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("POKE-->REG2:Write -> Desired: %0h Mirrored: %0h",rdata, rdata_m), UVM_NONE);
    $display("-----------------------------------------------");
    regmodel.reg2_inst.peek(status, rdata);
    rdata = regmodel.reg2_inst.get();
    rdata_m = regmodel.reg2_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("AFTER PEEK REG2--->Desired: %0h Mirrored: %0h", rdata, rdata_m), UVM_NONE);
    
    `uvm_info("SEQ", "====== REG 3 ======", UVM_NONE); 
    regmodel.reg3_inst.poke(status, 32'hFFFFFF);
    rdata = regmodel.reg3_inst.get();
    rdata_m = regmodel.reg3_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("POKE-->REG3:Write -> Desired: %0h Mirrored: %0h",rdata, rdata_m), UVM_NONE);
    $display("-----------------------------------------------");
    regmodel.reg3_inst.peek(status, rdata);
    rdata = regmodel.reg3_inst.get();
    rdata_m = regmodel.reg3_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("AFTER PEEK REG3--->Desired: %0h Mirrored: %0h", rdata, rdata_m), UVM_NONE);
    
    `uvm_info("SEQ", "====== REG4 ======", UVM_NONE); 
    regmodel.reg4_inst.poke(status, 32'h1234);
    rdata = regmodel.reg4_inst.get();
    rdata_m = regmodel.reg4_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("POKE-->REG4:Write -> Desired: %0h Mirrored: %0h",rdata, rdata_m), UVM_NONE);
    $display("-----------------------------------------------");
    regmodel.reg4_inst.peek(status, rdata);
    rdata = regmodel.reg4_inst.get();
    rdata_m = regmodel.reg4_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("AFTER PEEK REG4--->Desired: %0h Mirrored: %0h", rdata, rdata_m), UVM_NONE);
  endtask
endclass
