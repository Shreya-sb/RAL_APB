class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
  uvm_analysis_imp#(transaction,scoreboard) recieved_value;
  bit [7:0] temp_data;
  bit [31:0] temp;

  function new(input string name = "scoreboard", uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    received_value  = new("received_value", this);
  endfunction

  virtual function void write(seq_item tr);
 /*   `uvm_info("SCOREBOARD", $sformatf("Wr :%0b Addr : %0d Din:%0d Dout:%0d", tr.wr, tr.addr, tr.din, tr.dout), UVM_NONE) 
    if(tr.PWRITE == 1'b1)
      begin
        if(tr.PADDR == 1'b0) 
          begin
            temp_data = tr.din;
            `uvm_info("SCOREBOARD", $sformatf("Data Stored : %0d", tr.din), UVM_NONE) 
          end
        else
          begin
            `uvm_info("SCOREBOARD", "No Such Addr", UVM_NONE)
          end
      end
    else
      begin
        if(tr.addr == 1'b0) 
          begin
            if(tr.dout == temp_data)begin
              `uvm_info("SCO", "Test Passed", UVM_NONE) 
            end
            else
              begin
                `uvm_info("SCO", "No Such Addr", UVM_NONE);
              end
          end
      end*/
if (tr.PWRITE) begin
      expected_mem[tr.PADDR] = tr.PWDATA;
      `uvm_info("SCOREBOARD", $sformatf("WRITE: Addr = %0h, Data = %0h", tr.PADDR, tr.PWDATA), UVM_MEDIUM);
    end else begin
      if (expected_mem[tr.PADDR] !== tr.PRDATA) begin
        `uvm_error("SCOREBOARD", $sformatf("Mismatch at Addr = %0h, Expected = %0h, Received = %0h", tr.PADDR, expected_mem[tr.PADDR], tr.PRDATA));
      end else begin
        `uvm_info("SCOREBOARD", $sformatf("READ MATCH: Addr = %0h, Data = %0h", tr.PADDR, tr.PRDATA), UVM_MEDIUM);
      end
    end
  endfunction
endclass
        
