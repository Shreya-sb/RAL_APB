class reg_seq extends uvm_sequence;
  `uvm_object_utils(reg_seq)

  reg_block regmodel;

  function new (string name = "reg_seq");
    super.new(name);
  endfunction

  virtual task body;
    uvm_status_e status;
    bit [31:0] rdata, rdata_m, dout,reset_reg;

    ///////////////// REG1/////////////////////
    `uvm_info("SEQ", "====== REG1 ======", UVM_NONE);

    rdata   = regmodel.reg1_inst.get();
    rdata_m = regmodel.reg1_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial REG1 -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);

    regmodel.reg1_inst.set(8'h01);
    rdata   = regmodel.reg1_inst.get();
    rdata_m = regmodel.reg1_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After set REG1 -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);

    regmodel.reg1_inst.update(status);
    rdata   = regmodel.reg1_inst.get();
    rdata_m = regmodel.reg1_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After update  REG1 -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m, dout), UVM_NONE);



    regmodel.reg1_inst.write(status,8'h01);
    rdata   = regmodel.reg1_inst.get();
    rdata_m = regmodel.reg1_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After write REG1 -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m,dout), UVM_NONE);
    regmodel.reg1_inst.read(status,dout);
    rdata   = regmodel.reg1_inst.get();
    rdata_m = regmodel.reg1_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After read REG1 -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m,dout), UVM_NONE);


 //////////////////////////REG2//////////////////////////////////////////////////////
   `uvm_info("SEQ", "====== REG2 ======", UVM_NONE);

    rdata   = regmodel.reg2_inst.get();
    rdata_m = regmodel.reg2_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial REG2 -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);

    regmodel.reg2_inst.set(8'h11);
    rdata   = regmodel.reg2_inst.get();
    rdata_m = regmodel.reg2_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After set REG2 -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);

    regmodel.reg2_inst.update(status);
    rdata   = regmodel.reg2_inst.get();
    rdata_m = regmodel.reg2_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After update  REG2 -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m, dout), UVM_NONE);



    regmodel.reg2_inst.write(status,8'h11);
    rdata   = regmodel.reg2_inst.get();
    rdata_m = regmodel.reg2_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After write REG2 -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m,dout), UVM_NONE);
    regmodel.reg2_inst.read(status,dout);
    rdata   = regmodel.reg2_inst.get();
    rdata_m = regmodel.reg2_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After read REG2 -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m,dout), UVM_NONE);

    ///////////////// REG3 /////////////////////
    `uvm_info("SEQ", "====== REG3 ======", UVM_NONE);

    rdata   = regmodel.reg3_inst.get();
    rdata_m = regmodel.reg3_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial REG3 -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);

    regmodel.reg3_inst.set(8'h22);
    rdata   = regmodel.reg3_inst.get();
    rdata_m = regmodel.reg3_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After set REG3 -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);

    regmodel.reg3_inst.update(status);
    rdata   = regmodel.reg3_inst.get();
    rdata_m = regmodel.reg3_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After update REG3 -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m, dout), UVM_NONE);
    
    regmodel.reg3_inst.write(status,8'h12);
    rdata   = regmodel.reg3_inst.get();
    rdata_m = regmodel.reg3_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After write REG3 -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m,dout), UVM_NONE);
    regmodel.reg3_inst.read(status,dout);
    rdata   = regmodel.reg3_inst.get();
    rdata_m = regmodel.reg3_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After read REG3 -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m,dout), UVM_NONE);



    ///////////////// REG4 /////////////////////
    `uvm_info("SEQ", "====== REG4 ======", UVM_NONE);

    rdata   = regmodel.reg4_inst.get();
    rdata_m = regmodel.reg4_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial REG4 -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);

    regmodel.reg4_inst.set(8'h33);
    rdata   = regmodel.reg4_inst.get();
    rdata_m = regmodel.reg4_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After set REG4 -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);

    regmodel.reg4_inst.update(status);
    rdata   = regmodel.reg4_inst.get();
    rdata_m = regmodel.reg4_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After update REG4 -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m, dout), UVM_NONE);
     
    regmodel.reg4_inst.write(status,8'h23);
    rdata   = regmodel.reg4_inst.get();
    rdata_m = regmodel.reg4_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After write REG4 -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m,dout), UVM_NONE);
    regmodel.reg4_inst.read(status,dout);
    rdata   = regmodel.reg4_inst.get();
    rdata_m = regmodel.reg4_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After read REG4 -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m,dout), UVM_NONE);

   `uvm_info("SEQ", "====== REG2 RESET ======", UVM_NONE);

    reset_reg   = regmodel.reg2_inst.get_reset();
    //rdata_m = regmodel.reg2_inst.reset();
    `uvm_info("SEQ", $sformatf(" RESET for REG2 -> reset value:%0h", reset_reg), UVM_NONE);

   // regmodel.reg2_inst.get();
    rdata   = regmodel.reg2_inst.get();
    rdata_m = regmodel.reg2_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("before reset REG2 -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);
    $display("------applying reset to reg2------------"); 
    regmodel.reg2_inst.reset();
    rdata   = regmodel.reg2_inst.get();
    rdata_m = regmodel.reg2_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After reset REG2 -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m,dout), UVM_NONE);

 
  endtask
endclass


class reset_seq extends uvm_sequence;
  `uvm_object_utils(reset_seq)
  reg_block regmodel;

  function new (string name = "reset_seq");
    super.new(name);
  endfunction

   task body;
    uvm_status_e status;
    bit [31:0] rdata, rdata_m, dout, reset_reg;
   bit reset_status;
   `uvm_info("SEQ", "====== REG2 RESET ======", UVM_NONE);
    //////Check if register has reset value
    reset_status = regmodel.reg2_inst.has_reset();
    `uvm_info("SEQ", $sformatf("Reset Value is present: %0h ", reset_status), UVM_NONE);
    reset_reg   = regmodel.reg2_inst.get_reset();
    `uvm_info("SEQ", $sformatf(" RESET for REG2 -> reset value:%0h", reset_reg), UVM_NONE);

   // regmodel.reg2_inst.get();
    rdata   = regmodel.reg2_inst.get();
    rdata_m = regmodel.reg2_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("before reset REG2 -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);
    $display("------applying reset to reg2------------"); 
    regmodel.reg2_inst.reset();
    rdata   = regmodel.reg2_inst.get();
    rdata_m = regmodel.reg2_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After reset REG2 -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m,dout), UVM_NONE);

 
  endtask
endclass


