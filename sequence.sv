class sequence extends uvm_sequence#(seq_item);
  `uvm_object_utils(sequence)
  seq_item req;
  
  function new(string name = "sequence");
    super.new(name);
  endfunction
  
  virtual task body();
   `uvm_info(get_type_name(), "Base seq: Inside Body", UVM_LOW);
    wait_for_grant();
    seq_item.randomize();
    send_request(seq_item);
    wait_for_item_done();
  endtask
endclass

class reg_sequence extends uvm_sequence #(seq_item);
  `uvm_object_utils(reg_sequence)

  seq_item tr;
  reg_block regb_h;
  uvm_status_e   status;
  uvm_reg_data_t read_data;

  function new (string name = "reg_sequence");
    super.new(name);
  endfunction

  virtual task body();

    tr = seq_item::type_id::create("tr");

    bit[7:0] prdata_dv,prdata_mv;

    prdata_derived  = regb_h.c1.get();      
    prdata_mirrored = regb_h.c1.get_mirrored_value();

    `uvm_info("SEQ", $sformatf("Sending TX to SEQR: derived value = %0d mirrored value = %0d", tr.prdata_derived, tr.prdata_mirrored),UVM_LOW); 
    regb_h.c1.set(8'd5);
    prdata_derived = regb_h.c1.get();      
    prdata_mirrored = regb_h.c1.get_mirrored_value();

    `uvm_info("SEQ", $sformatf("Sending TX to SEQR: addr derived value = %0d mirrored value = %0d", tr.prdata_derived, tr.prdata_mirrored),UVM_LOW); 


    regb_h.c1.write(status,8'd5);

    prdata_derived = regb_h.c1.get();      
    prdata_mirrored = regb_h.c1.get_mirrored_value();

    `uvm_info("SEQ", $sformatf("Sending TX to SEQR: derived value = %0d mirrored value = %0d", tr.prdata_derived, tr.prdata_mirrored),UVM_LOW); 

  endtask

endclass
