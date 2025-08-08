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

/*class reg_test extends uvm_test;
  `uvm_component_utils(reg_test)
  
  reg1_seq seq1;
  reset_seq seq2;
  reg_seq seq3;

  environment env;

  function new(string name = "reg_test",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = environment::type_id::create("env",this);
    seq1 = reg1_seq::type_id::create("seq1", this);
    seq2 = reset_seq::type_id::create("seq2", this);
    seq3 = reg_seq::type_id::create("seq3", this);
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
  
    phase.raise_objection(this);
    seq3.regmodel = env.regmodel;
    seq3.start(env.agent_inst.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 20);
 endtask
endclass*/
