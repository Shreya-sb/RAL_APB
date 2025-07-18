class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
  uvm_analysis_imp#(seq_item,scoreboard) received_value;
  bit [7:0] temp_data;
  bit [31:0] temp;

  function new(input string name = "scoreboard", uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    received_value  = new("received_value", this);
$display("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
  endfunction

  virtual function void write(seq_item tr);
    `uvm_info("SCOREBOARD", $sformatf("Wr :%0b Addr : %0d Din:%0d Dout:%0d", tr.pwrite, tr.paddr, tr.pwdata, tr.prdata), UVM_NONE) 
    if(tr.pwrite == 1'b1)
      begin
        if(tr.paddr == 1'b0) 
          begin
            temp_data = tr.pwdata;
            `uvm_info("SCOREBOARD", $sformatf("Data Stored : %0d", tr.pwdata), UVM_NONE) 
          end
        else
          begin
            `uvm_info("SCOREBOARD", "No Such Addr", UVM_NONE)
          end
      end
    else
      begin
        if(tr.paddr == 1'b0) 
          begin
            if(tr.prdata == temp_data)begin
              `uvm_info("SCO", "Test Passed", UVM_NONE) 
            end
            else
              begin
                `uvm_info("SCO", "No Such Addr", UVM_NONE);
              end
          end
      end
$display("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
/*
if (tr.pwrite) begin
      temp[tr.paddr] = tr.pwdata;
      `uvm_info("SCOREBOARD", $sformatf("WRITE: Addr = %0h, Data = %0h", tr.paddr, tr.pwdata), UVM_MEDIUM);
    end else begin
      if (temp[tr.paddr] !== tr.prdata) begin
        `uvm_error("SCOREBOARD", $sformatf("Mismatch at Addr = %0h, Expected = %0h, Received = %0h", tr.paddr, temp[tr.paddr], tr.prdata));
      end else begin
        `uvm_info("SCOREBOARD", $sformatf("READ MATCH: Addr = %0h, Data = %0h", tr.paddr, tr.prdata), UVM_MEDIUM);
      end
    end*/
  endfunction
endclass
        
