//`include "uvm_macros.svh"
//`include "reg_block.sv"
//import uvm_pkg ::*;

/*

class reg_seq extends uvm_sequence;
  `uvm_object_utils(reg_seq)
  reg_block regmodel;

  function new (string name = "reg_seq"); 
    super.new(name); 
  endfunction

  virtual task body; 
    uvm_status_e status;
    bit [7:0] rdata,rdata_m,dout;

    `uvm_info("SEQ", "====== REG2 ======", UVM_NONE);
    ////////////////////////initial value
    rdata = regmodel.reg2_inst.get();
    rdata_m = regmodel.reg2_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial Value -> Desired Value : %0h and Mirrored Value : %0h", rdata, rdata_m),UVM_NONE);

    ////////////////// update desire value
    regmodel.reg2_inst.set(8'h11);


    ///////////////// get desire value
    rdata = regmodel.reg2_inst.get();
    rdata_m = regmodel.reg2_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After Set -> Desired Value : %0h and Mirrored Value : %0h", rdata, rdata_m), UVM_NONE);

    
    ///////////////// call write method 
    //regmodel.reg2_inst.write(status,32'h25);
    regmodel.reg2_inst.update(status);
    rdata = regmodel.reg2_inst.get();
    rdata_m = regmodel.reg2_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After write update -> Desired Value : %0h and Mirrored Value : %0h", rdata, rdata_m),UVM_NONE);
    
   // regmodel.reg2_inst.read(status,dout);
   // rdata = regmodel.reg2_inst.get();
    //rdata_m = regmodel.reg2_inst.get_mirrored_value();
    //`uvm_info("SEQ", $sformatf("After Tx to DUT -> Desired Value : %0h and Mirrored Value : %0h and Read data:%0h", rdata, rdata_m,dout),UVM_NONE);

  endtask
endclass

*/
class reg_seq extends uvm_sequence;
  `uvm_object_utils(reg_seq)

  reg_block regmodel;

  function new (string name = "reg_seq");
    super.new(name);
  endfunction

  virtual task body;
    uvm_status_e status;
    bit [7:0] rdata, rdata_m, dout;

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


  
  endtask
endclass

