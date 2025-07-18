//`include "uvm_macros.svh"
//import uvm_pkg::*;
//`include "package.sv"

//`include "registers.sv"

class cntrl_field extends uvm_reg;
  `uvm_object_utils(cntrl_field)

  rand uvm_reg_field cntrl;

  function new (string name = "cntrl_field");
    super.new(name,4,UVM_NO_COVERAGE);
  endfunction

  function void build;
    cntrl = uvm_reg_field :: type_id :: create("cntrl");
    cntrl.configure(this, 4, 0, "RW", 0, 0, 1, 1, 1);
  endfunction
endclass

class reg1_field extends uvm_reg;
  `uvm_object_utils(reg1_field)

  rand uvm_reg_field reg1;

  function new (string name = "reg1");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build;
    reg1 = uvm_reg_field :: type_id :: create("reg1");
    reg1.configure(this, 32, 0, "RW", 0, 32'hA5A5_0000, 1, 1, 1);
  endfunction
endclass

class reg2_field extends uvm_reg;
  `uvm_object_utils(reg2_field)

  rand uvm_reg_field reg2;

  function new (string name = "reg2");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build;
    reg2 = uvm_reg_field :: type_id :: create("reg2");
    reg2.configure(this, 32, 0, "RW", 0,32'h1234_9876, 1, 1, 1);
  endfunction
endclass

class reg3_field extends uvm_reg;
  `uvm_object_utils(reg3_field)

  rand uvm_reg_field reg3;

  function new (string name = "reg3");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build;
    reg3 = uvm_reg_field :: type_id :: create("reg3");
    reg3.configure(this, 32, 0, "RW", 0,32'h5A5A_5555, 1, 1, 1);
  endfunction
endclass

class reg4_field extends uvm_reg;
  `uvm_object_utils(reg4_field)

  rand uvm_reg_field reg4;

  function new (string name = "reg4");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build;
    reg4 = uvm_reg_field :: type_id :: create("reg4");
    reg4.configure(this, 32, 0, "RW", 0, 32'h0000_FFFF, 1, 1, 1);
  endfunction
endclass

class reg_block extends uvm_reg_block;
  `uvm_object_utils(reg_block)
   cntrl_field cntrl_inst;
   reg1_field reg1_inst;
   reg2_field reg2_inst;
   reg3_field reg3_inst;
   reg4_field reg4_inst;
  
  function new(string name = "reg_block");
    super.new(name,UVM_NO_COVERAGE);
  endfunction
  
  function void build;
    cntrl_inst = cntrl_field::type_id::create("cntrl_inst");
    cntrl_inst.build();
    cntrl_inst.configure(this);
    
    reg1_inst = reg1_field::type_id::create("reg1_inst");
    reg1_inst.build();
    reg1_inst.configure(this);
    
    reg2_inst = reg2_field::type_id::create("reg2_inst");
    reg2_inst.build();
    reg2_inst.configure(this);
    
    reg3_inst = reg3_field::type_id::create("reg3_inst");
    reg3_inst.build();
    reg3_inst.configure(this);
    
    reg4_inst = reg4_field::type_id::create("reg4_inst");
    reg4_inst.build();
    reg4_inst.configure(this);
    
    default_map = create_map("default_map",0,4,UVM_LITTLE_ENDIAN);
    default_map.add_reg(cntrl_inst,'h0,"RW");  
    default_map.add_reg(reg1_inst,'h4,"RW");
    default_map.add_reg(reg2_inst,'h8,"RW");
    default_map.add_reg(reg3_inst,'hc,"RW");
    default_map.add_reg(reg4_inst,'h10,"RW");
    default_map.set_auto_predict(1);
    lock_model();
  endfunction 
 
endclass
  module tb;
  reg_block t1;
  initial begin
    t1 = new("reg_block");
    t1.build();
  end
endmodule 
