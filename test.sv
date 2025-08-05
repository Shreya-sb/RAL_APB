class test extends uvm_test;
  `uvm_component_utils(test)

  function new(string name = "test", uvm_component parent = null);
    super.new(name,parent);
  endfunction
  
  environment env;
  reg_seq rseq;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = environment::type_id::create("env",this);
    rseq = reg_seq::type_id::create("rseq");
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    rseq.regmodel = env.regmodel;
    rseq.start(env.agent_inst.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 20);
  endtask
endclass

class reset_test extends uvm_test;
  `uvm_component_utils(reset_test)
  function new(string name = "reset_test",uvm_component parent = null);
    super.new(name,parent);
  endfunction

   environment env;
  reset_seq rseq;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = environment::type_id::create("env",this);
    rseq = reset_seq::type_id::create("rseq");
  endfunction

//run phase 
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    rseq.regmodel = env.regmodel;
    rseq.start(env.agent_inst.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this,20); 
  endtask 
endclass


class backdoor_test extends uvm_test;
  `uvm_component_utils(backdoor_test)
  function new(string name = "backdoor_test",uvm_component parent = null);
    super.new(name,parent);
  endfunction

   environment env;
   backdoor_seq rseq;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = environment::type_id::create("env",this);
    rseq = backdoor_seq::type_id::create("rseq");
  endfunction

//run phase 
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    rseq.regmodel = env.regmodel;
    rseq.start(env.agent_inst.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this,20); 
  endtask 
endclass

class reg_test extends uvm_test;
  `uvm_component_utils(reg_test)
  reg_seq seq1;
  reset_seq seq2;

  environment env;

  function new(string name = "reg_test",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = environment::type_id::create("env",this);
    seq1 = reg_seq::type_id::create("seq1", this);
    seq2 = reset_seq::type_id::create("seq2", this);
  endfunction
  virtual task run_phase(uvm_phase phase);
     
    phase.raise_objection(this);
    seq1.regmodel = env.regmodel;
    seq1.start(env.agent_inst.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 20);

    phase.raise_objection(this);
    seq2.regmodel = env.regmodel;
    seq2.start(env.agent_inst.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 20);
  endtask
endclass
