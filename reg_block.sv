class cntrl_field extends uvm_reg;
  `uvm_object_utils(cntrl_field)

  rand uvm_reg_field cntrl;

  covergroup cntrl_cov;
    option.per_instance = 1;
    coverpoint cntrl.value[3:0] {
     bins val = {[0:1]};}
  endgroup
  
  function new (string name = "cntrl");
    super.new(name,4,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cntrl_cov = new();
  endfunction

  ////////////////////////////// implementation of sample and sample_Values
  virtual function void sample(uvm_reg_data_t data,uvm_reg_data_t byte_en,bit is_read,uvm_reg_map map);
   cntrl_cov.sample();
  endfunction
  
  virtual function void sample_values();
   super.sample_values();
   cntrl_cov.sample();
  endfunction
  
  function void build;
    cntrl = uvm_reg_field::type_id::create("cntrl");
    cntrl.configure(this, 4, 0, "RW", 0, 0, 1, 1, 1);
  endfunction
endclass

class reg1_field extends uvm_reg;
  `uvm_object_utils(reg1_field)

  rand uvm_reg_field reg1;
  covergroup reg1_cov;
    option.per_instance = 1;
  
  coverpoint reg1.value[31:0] {
     bins val = {[0:32'h1FFF_FFFF]};
    }
  endgroup
  
  function new (string name = "reg1");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      reg1_cov = new();
  endfunction

  ////////////////////////////// implementation of sample and sample_Values
  virtual function void sample(uvm_reg_data_t data,uvm_reg_data_t byte_en,bit is_read,uvm_reg_map map);
   reg1_cov.sample();
  endfunction
  
  virtual function void sample_values();
   super.sample_values();
   reg1_cov.sample();
  endfunction
  
  function void build;
    reg1 = uvm_reg_field::type_id::create("reg1");
    reg1.configure(this, 32, 0, "RW", 0, 32'hA5A5_0000, 1, 1, 1);
  endfunction
endclass

class reg2_field extends uvm_reg;
  `uvm_object_utils(reg2_field)

  rand uvm_reg_field reg2;
  covergroup reg2_cov;
    option.per_instance = 1;
    coverpoint reg2.value[31:0] {
     bins val  = {[0:32'h1FFF_FFFF]};
  }
  endgroup
  
  function new (string name = "reg2");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      reg2_cov = new();
  endfunction

  ////////////////////////////// implementation of sample and sample_Values
  virtual function void sample(uvm_reg_data_t data,uvm_reg_data_t byte_en,bit is_read,uvm_reg_map map);
   reg2_cov.sample();
  endfunction
  
  virtual function void sample_values();
   super.sample_values();
   reg2_cov.sample();
  endfunction
  
  function void build;
    reg2 = uvm_reg_field :: type_id :: create("reg2");
    reg2.configure(this, 32, 0, "RW", 0,32'h1234_9876, 1, 1, 1);
  endfunction
endclass

class reg3_field extends uvm_reg;
  `uvm_object_utils(reg3_field)

  rand uvm_reg_field reg3;
  covergroup reg3_cov;
    option.per_instance = 1;

    coverpoint reg3.value[31:0] {
      bins val  = {[0:32'h1FFF_FFFF]};
  }  endgroup
  
  function new (string name = "reg3");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      reg3_cov = new();
  endfunction

  ////////////////////////////// implementation of sample and sample_Values
  virtual function void sample(uvm_reg_data_t data,uvm_reg_data_t byte_en,bit is_read,uvm_reg_map map);
   reg3_cov.sample();
  endfunction
  
  virtual function void sample_values();
   super.sample_values();
   reg3_cov.sample();
  endfunction
 

  function void build;
    reg3 = uvm_reg_field :: type_id :: create("reg3");
    reg3.configure(this, 32, 0, "RW", 0,32'h5A5A_5555, 1, 1, 1);
  endfunction
endclass

class reg4_field extends uvm_reg;
  `uvm_object_utils(reg4_field)

  rand uvm_reg_field reg4;
  covergroup reg4_cov;
    option.per_instance = 1;
    coverpoint reg4.value[31:0]{
      bins val  = {[0:32'h1FFF_FFFF]};
    }
  endgroup
   

  function new (string name = "reg4");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      reg4_cov = new();
  endfunction

  ////////////////////////////// implementation of sample and sample_Values
  virtual function void sample(uvm_reg_data_t data,uvm_reg_data_t byte_en,bit is_read,uvm_reg_map map);
   reg4_cov.sample();
  endfunction
  
  virtual function void sample_values();
   super.sample_values();
   reg4_cov.sample();
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
    
   
    uvm_reg::include_coverage("*", UVM_CVR_ALL);
   cntrl_inst = cntrl_field::type_id::create("cntrl_inst");
    cntrl_inst.build();
    cntrl_inst.configure(this);
   void'(cntrl_inst.set_coverage(UVM_CVR_FIELD_VALS)); //////enabling coverage for specific reg instance
   
    reg1_inst = reg1_field::type_id::create("reg1_inst");
    reg1_inst.build();
    reg1_inst.configure(this);
   void'( reg1_inst.set_coverage(UVM_CVR_FIELD_VALS)); //////enabling coverage for specific reg instance
    
    reg2_inst = reg2_field::type_id::create("reg2_inst");
    reg2_inst.build();
    reg2_inst.configure(this);
   void'(reg2_inst.set_coverage(UVM_CVR_FIELD_VALS)); //////enabling coverage for specific reg instance
    //reg2_inst.add_hdl_path_slice("reg2",0,32); //reg name in rtl,starting position,no.of bits wide 

   
    reg3_inst = reg3_field::type_id::create("reg3_inst");
    reg3_inst.build();
    reg3_inst.configure(this);
    void'(reg3_inst.set_coverage(UVM_CVR_FIELD_VALS)); //////enabling coverage for specific reg instance
   
    reg4_inst = reg4_field::type_id::create("reg4_inst");
    reg4_inst.build();
    reg4_inst.configure(this);
    void'(reg4_inst.set_coverage(UVM_CVR_FIELD_VALS)); //////enabling coverage for specific reg instance
 
    default_map = create_map("default_map",0,4,UVM_LITTLE_ENDIAN);
    default_map.add_reg(cntrl_inst,'h0,"RW");  
    default_map.add_reg(reg1_inst,'h04,"RW");
    default_map.add_reg(reg2_inst,'h08,"RW");
    add_hdl_path("tb.DUT","RTL");

    default_map.add_reg(reg3_inst,'h0c,"RW");
    default_map.add_reg(reg4_inst,'h10,"RW");
    lock_model();
  endfunction 
 
endclass
