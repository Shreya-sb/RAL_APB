class seq_item extends uvm_sequence_item;
  rand bit [31:0] paddr;
  rand bit pwrite;
  rand bit psel;
  rand bit penable;
  rand bit [31:0] pwdata;
  bit [31:0] prdata;
 
  `uvm_object_utils(seq_item)
  
  function new(string name = "seq_item");
    super.new(name);
  endfunction
endclass
