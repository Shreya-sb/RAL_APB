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
