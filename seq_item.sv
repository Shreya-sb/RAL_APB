class seq_item extends uvm_sequence_item;
  rand bit [4:0] paddr;
  rand bit pwrite;
  rand bit [7:0] pwdata;
  bit [7:0] prdata;
 
  `uvm_object_utils(seq_item)
  
  function new(string name = "seq_item");
    super.new(name);
  endfunction

  //constraint addr_range {paddr inside {[0:3]};}
  //constraint psel_value {soft psel==1;}
 
endclass
