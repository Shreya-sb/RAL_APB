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
    deafult_map.add_reg(cntrl_inst,'h0,"RW");  
    deafult_map.add_reg(reg1_inst,'h4,"RW");
    deafult_map.add_reg(reg2_inst,'h8,"RW");
    deafult_map.add_reg(reg3_inst,'hc,"RW");
    deafult_map.add_reg(reg4_inst,'h10,"RW");
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
