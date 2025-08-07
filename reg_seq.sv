class reg1_seq extends uvm_sequence;
  `uvm_object_utils(reg1_seq)

  reg_block regmodel;

  function new (string name = "reg1_seq");
    super.new(name);
  endfunction

  virtual task body;
    uvm_status_e status;
    bit [31:0] rdata, rdata_m, dout,reset_reg;
    ///////////////// CNTRL /////////////////////
    `uvm_info("SEQ", "====== CNTRL ======", UVM_NONE);

    rdata   = regmodel.cntrl_inst.get();
    rdata_m = regmodel.cntrl_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial CNTRL -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);

    regmodel.cntrl_inst.set(4'h1);
    rdata   = regmodel.cntrl_inst.get();
    rdata_m = regmodel.cntrl_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After set CNTRL -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);

    regmodel.cntrl_inst.update(status);
    rdata   = regmodel.cntrl_inst.get();
    rdata_m = regmodel.cntrl_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After update CNTRL -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m, dout), UVM_NONE);



    regmodel.cntrl_inst.write(status,4'h1);
    rdata   = regmodel.cntrl_inst.get();
    rdata_m = regmodel.cntrl_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After write CNTRL -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m,dout), UVM_NONE);
    regmodel.cntrl_inst.read(status,dout);
    rdata   = regmodel.cntrl_inst.get();
    rdata_m = regmodel.cntrl_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After read CNTRL -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m,dout), UVM_NONE);
   endtask
endclass


class reg_seq extends uvm_sequence;
  `uvm_object_utils(reg_seq)

  reg_block regmodel;

  function new (string name = "reg_seq");
    super.new(name);
  endfunction

  virtual task body;
    uvm_status_e status;
    bit [31:0] rdata, rdata_m, dout,reset_reg;
    ///////////////// CNTRL /////////////////////
/*    `uvm_info("SEQ", "====== CNTRL ======", UVM_NONE);

    rdata   = regmodel.cntrl_inst.get();
    rdata_m = regmodel.cntrl_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial CNTRL -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);

    regmodel.cntrl_inst.set(4'h1);
    rdata   = regmodel.cntrl_inst.get();
    rdata_m = regmodel.cntrl_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After set CNTRL -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);

    regmodel.cntrl_inst.update(status);
    rdata   = regmodel.cntrl_inst.get();
    rdata_m = regmodel.cntrl_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After update CNTRL -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m, dout), UVM_NONE);



    regmodel.cntrl_inst.write(status,4'h1);
    rdata   = regmodel.cntrl_inst.get();
    rdata_m = regmodel.cntrl_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After write CNTRL -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m,dout), UVM_NONE);
    regmodel.cntrl_inst.read(status,dout);
    rdata   = regmodel.cntrl_inst.get();
    rdata_m = regmodel.cntrl_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After read CNTRL -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m,dout), UVM_NONE);
*/

    ///////////////// REG1/////////////////////
    `uvm_info("SEQ", "====== REG1 ======", UVM_NONE);

    rdata   = regmodel.reg1_inst.get();
    rdata_m = regmodel.reg1_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial REG1 -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);

    regmodel.reg1_inst.set(32'h01);
    rdata   = regmodel.reg1_inst.get();
    rdata_m = regmodel.reg1_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After set REG1 -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);

    regmodel.reg1_inst.update(status);
    rdata   = regmodel.reg1_inst.get();
    rdata_m = regmodel.reg1_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After update  REG1 -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m, dout), UVM_NONE);



    regmodel.reg1_inst.write(status,32'h01);
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

    regmodel.reg2_inst.set(32'h11);
    rdata   = regmodel.reg2_inst.get();
    rdata_m = regmodel.reg2_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After set REG2 -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);

    regmodel.reg2_inst.update(status);
    rdata   = regmodel.reg2_inst.get();
    rdata_m = regmodel.reg2_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After update  REG2 -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m, dout), UVM_NONE);



    regmodel.reg2_inst.write(status,32'h11);
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

    regmodel.reg3_inst.set(32'h22);
    rdata   = regmodel.reg3_inst.get();
    rdata_m = regmodel.reg3_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After set REG3 -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);

    regmodel.reg3_inst.update(status);
    rdata   = regmodel.reg3_inst.get();
    rdata_m = regmodel.reg3_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After update REG3 -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m, dout), UVM_NONE);
    
    regmodel.reg3_inst.write(status,32'h12);
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

    regmodel.reg4_inst.set(32'h33);
    rdata   = regmodel.reg4_inst.get();
    rdata_m = regmodel.reg4_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After set REG4 -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);

    regmodel.reg4_inst.update(status);
    rdata   = regmodel.reg4_inst.get();
    rdata_m = regmodel.reg4_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After update REG4 -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m, dout), UVM_NONE);
     
    regmodel.reg4_inst.write(status,32'h23);
    rdata   = regmodel.reg4_inst.get();
    rdata_m = regmodel.reg4_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After write REG4 -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m,dout), UVM_NONE);
    regmodel.reg4_inst.read(status,dout);
    rdata   = regmodel.reg4_inst.get();
    rdata_m = regmodel.reg4_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After read REG4 -> Desired: %0h, Mirrored: %0h, Read: %0h", rdata, rdata_m,dout), UVM_NONE);
 
  endtask
endclass


class reset_seq extends uvm_sequence;
  `uvm_object_utils(reset_seq)
  reg_block regmodel;
  virtual top_if vif;

 
 function new (string name = "reset_seq");
    super.new(name);
  endfunction

   task body;
    uvm_status_e status;
    uvm_reg_data_t rdata, rdata_m, dout, reset_reg;
   bit reset_status;
 
 `uvm_info("SEQ", "====== REG1 RESET ======", UVM_NONE);
    reset_status = regmodel.reg1_inst.has_reset();
    `uvm_info("SEQ", $sformatf("Reset Value is present: %0b ", reset_status), UVM_NONE);
   
    reset_reg=regmodel.reg1_inst.get_reset();
    `uvm_info("SEQ", $sformatf(" REG1:reset value present in RAL model: 0x%08h",reset_reg), UVM_LOW);
     rdata   = regmodel.reg1_inst.get();         
     rdata_m = regmodel.reg1_inst.get_mirrored_value();
  `uvm_info("SEQ", $sformatf("before reset -> Desired: 0x%08h, Mirrored:0x%08h",rdata,rdata_m), UVM_LOW);
  $display("------ Applying reset value for REG1 ------");
  regmodel.reg1_inst.reset();
  regmodel.reg1_inst.mirror(status, UVM_CHECK);      // Read DUT and update mirrored
  rdata   = regmodel.reg1_inst.get();                    // Desired (same as before)
  rdata_m = regmodel.reg1_inst.get_mirrored_value();     // Now updated from DUT
  dout = rdata_m;
  `uvm_info("SEQ", $sformatf("After reset -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);
 if(dout !== reset_reg)begin
      `uvm_error("SEQ", $sformatf("Reset mismatch: DUT read = 0x%08h, Expected (RAL) = 0x%08h", dout, reset_reg));
    end else begin
      `uvm_info("SEQ", "Reset verification for REG1 passed!", UVM_LOW);
    end

`uvm_info("SEQ", "====== REG2 RESET ======", UVM_NONE);
reset_status = regmodel.reg2_inst.has_reset();
`uvm_info("SEQ", $sformatf("Reset Value is present: %0b ", reset_status), UVM_NONE);

reset_reg=regmodel.reg2_inst.get_reset();
`uvm_info("SEQ", $sformatf(" REG2:reset value present in RAL model: 0x%08h",reset_reg), UVM_LOW);
rdata   = regmodel.reg2_inst.get();
rdata_m = regmodel.reg2_inst.get_mirrored_value();
`uvm_info("SEQ", $sformatf("before reset -> Desired: 0x%08h, Mirrored:0x%08h",rdata,rdata_m), UVM_LOW);
$display("------ Applying reset value for REG2 ------");
regmodel.reg2_inst.reset();
regmodel.reg2_inst.mirror(status, UVM_CHECK);      // Read DUT and update mirrored
rdata   = regmodel.reg2_inst.get();                    // Desired (same as before)
rdata_m = regmodel.reg2_inst.get_mirrored_value();     // Now updated from DUT
dout = rdata_m;
`uvm_info("SEQ", $sformatf("After reset -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);
if(dout !== reset_reg)begin
  `uvm_error("SEQ", $sformatf("Reset mismatch: DUT read = 0x%08h, Expected (RAL) = 0x%08h", dout, reset_reg));
end else begin
  `uvm_info("SEQ", "Reset verification for REG2 passed!", UVM_LOW);
end

`uvm_info("SEQ", "====== REG3 RESET ======", UVM_NONE);
reset_status = regmodel.reg3_inst.has_reset();
`uvm_info("SEQ", $sformatf("Reset Value is present: %0b ", reset_status), UVM_NONE);

reset_reg=regmodel.reg3_inst.get_reset();
`uvm_info("SEQ", $sformatf(" REG3:reset value present in RAL model: 0x%08h",reset_reg), UVM_LOW);
rdata   = regmodel.reg3_inst.get();
rdata_m = regmodel.reg3_inst.get_mirrored_value();
`uvm_info("SEQ", $sformatf("before reset -> Desired: 0x%08h, Mirrored:0x%08h",rdata,rdata_m), UVM_LOW);
$display("------ Applying reset value for REG3 ------");
regmodel.reg3_inst.reset();
regmodel.reg3_inst.mirror(status, UVM_CHECK, UVM_FRONTDOOR);      // Read DUT and update mirrored
rdata   = regmodel.reg3_inst.get();                    // Desired (same as before)
rdata_m = regmodel.reg3_inst.get_mirrored_value();     // Now updated from DUT
dout = rdata_m;
`uvm_info("SEQ", $sformatf("After reset -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);
if(dout !== reset_reg)begin
  `uvm_error("SEQ", $sformatf("Reset mismatch: DUT read = 0x%08h, Expected (RAL) = 0x%08h", dout, reset_reg));
end else begin
  `uvm_info("SEQ", "Reset verification for REG3 passed!", UVM_LOW);
end


`uvm_info("SEQ", "====== REG4 RESET ======", UVM_NONE);
reset_status = regmodel.reg4_inst.has_reset();
`uvm_info("SEQ", $sformatf("Reset Value is present: %0b ", reset_status), UVM_NONE);

reset_reg=regmodel.reg4_inst.get_reset();
`uvm_info("SEQ", $sformatf(" REG4:reset value present in RAL model: 0x%08h",reset_reg), UVM_LOW);
rdata   = regmodel.reg4_inst.get();
rdata_m = regmodel.reg4_inst.get_mirrored_value();
`uvm_info("SEQ", $sformatf("before reset -> Desired: 0x%08h, Mirrored:0x%08h",rdata,rdata_m), UVM_LOW);
$display("------ Applying reset value for REG4 ------");
regmodel.reg4_inst.reset();
regmodel.reg4_inst.mirror(status, UVM_CHECK);      // Read DUT and update mirrored
rdata   = regmodel.reg4_inst.get();                    // Desired (same as before)
rdata_m = regmodel.reg4_inst.get_mirrored_value();     // Now updated from DUT
dout = rdata_m;
`uvm_info("SEQ", $sformatf("After reset -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);
if(dout !== reset_reg)begin
  `uvm_error("SEQ", $sformatf("Reset mismatch: DUT read = 0x%08h, Expected (RAL) = 0x%08h", dout, reset_reg));
end else begin
  `uvm_info("SEQ", "Reset verification for REG4 passed!", UVM_LOW);
end

/*
 `uvm_info("SEQ", "====== REG2 RESET ======", UVM_NONE);
    reset_status = regmodel.reg2_inst.has_reset();
    `uvm_info("SEQ", $sformatf("Reset Value is present: %0h ", reset_status), UVM_NONE);
   
    regmodel.reg2_inst.reset();
     rdata   = regmodel.reg2_inst.get();                  // Desired
     rdata_m = regmodel.reg2_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("before mirror REG2 -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);

   $display("------ Applying mirror (frontdoor) to read RTL reset value for REG2 ------");
  regmodel.reg2_inst.mirror(status, UVM_CHECK);      // Read DUT and update mirrored

  rdata   = regmodel.reg2_inst.get();                    // Desired (same as before)
  rdata_m = regmodel.reg2_inst.get_mirrored_value();     // Now updated from DUT
  `uvm_info("SEQ", $sformatf("After mirror -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);
  

  `uvm_info("SEQ", "====== REG3 RESET ======", UVM_NONE);
    reset_status = regmodel.reg3_inst.has_reset();
    `uvm_info("SEQ", $sformatf("Reset Value is present: %0h ", reset_status), UVM_NONE);
   
    regmodel.reg3_inst.reset();
     rdata   = regmodel.reg3_inst.get();                  // Desired
     rdata_m = regmodel.reg3_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("before mirror REG3 -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);

   $display("------ Applying mirror (frontdoor) to read RTL reset value for REG3 ------");
  regmodel.reg3_inst.mirror(status, UVM_CHECK);      // Read DUT and update mirrored

  rdata   = regmodel.reg3_inst.get();                    // Desired (same as before)
  rdata_m = regmodel.reg3_inst.get_mirrored_value();     // Now updated from DUT
  `uvm_info("SEQ", $sformatf("After mirror -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);
  
  
  `uvm_info("SEQ", "====== REG4 RESET ======", UVM_NONE);
    reset_status = regmodel.reg4_inst.has_reset();
    `uvm_info("SEQ", $sformatf("Reset Value is present: %0h ", reset_status), UVM_NONE);
   
    regmodel.reg4_inst.reset();
     rdata   = regmodel.reg4_inst.get();                  // Desired
     rdata_m = regmodel.reg4_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("before mirror REG4 -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);

   $display("------ Applying mirror (frontdoor) to read RTL reset value for REG3 ------");
  regmodel.reg4_inst.mirror(status, UVM_CHECK);      // Read DUT and update mirrored

  rdata   = regmodel.reg4_inst.get();                    // Desired (same as before)
  rdata_m = regmodel.reg4_inst.get_mirrored_value();     // Now updated from DUT
  `uvm_info("SEQ", $sformatf("After mirror -> Desired: %0h, Mirrored: %0h", rdata, rdata_m), UVM_NONE);
*/
  endtask
endclass

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
