/*class scoreboard extends uvm_scoreboard;
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
    $display("------SCOREBOARD BUILD PHASE------");
  endfunction

  virtual function void write(seq_item tr);
    `uvm_info("SCOREBOARD", $sformatf("||pwrite||:%0b ||paddrr||:%0d ||pwdata||:%0d || prdata||:%0d", tr.pwrite, tr.paddr, tr.pwdata, tr.prdata), UVM_NONE) 
    if(tr.pwrite == 1'b1)
      begin
        if(tr.paddr == 1'b0) 
          begin
            temp_data = tr.pwdata;
            `uvm_info("--SCOREBOARD--", $sformatf("--->Data Stored : %0d", tr.pwdata), UVM_NONE) 
          end
        else
          begin
            `uvm_info("--SCOREBOARD--", "------------No Such Addr-----------", UVM_NONE)
          end
      end
    else
      begin
        if(tr.paddr == 1'b0) 
          begin
            if(tr.prdata == temp_data)begin
              `uvm_info("SCO","==========================Test Passed===========================", UVM_NONE) 
            end
            else
              begin
                `uvm_info("SCO", "=======================Test failed===========================", UVM_NONE);
              end
          end
      end
    $display("------------scoreboard end-----------------");
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
 /* endfunction
endclass 
//================================================
class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)

  uvm_analysis_imp#(seq_item, scoreboard) received_value;
  seq_item tr_q[$];  // Transaction queue

  bit [31:0] temp_data[16];

  function new(string name = "scoreboard", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    received_value = new("received_value", this);
  endfunction

  // Push incoming transactions into the queue
  virtual function void write(seq_item tr);
    tr_q.push_back(tr);
  endfunction

  // Run phase: poll the queue for new transactions
  virtual task run_phase(uvm_phase phase);
    seq_item tr;
    forever begin
      wait(tr_q.size() > 0);
        tr = tr_q.pop_front();

        //`uvm_info("SCOREBOARD", $sformatf("Wr :%0b Addr : %0d Din:%0d Dout:%0d", tr.pwrite, tr.paddr, tr.pwdata, tr.prdata), UVM_NONE)

        if (tr.pwrite == 1'b1) begin
        //if (tr.pwrite == 1'b1 && tr.psel==1 && tr.penable==1) begin
            temp_data[tr.paddr]  = tr.pwdata;
            `uvm_info("SCOREBOARD", $sformatf("Data Stored : %0h ", tr.pwdata), UVM_NONE)
            
        end else
            
        if (tr.pwrite == 1'b0 && tr.psel==1 && tr.penable==1) begin
			tr.prdata = temp_data[tr.paddr];

            `uvm_info("SCOREBOARD", $sformatf("Data Read : %0h ,from register:%0h", tr.prdata,temp_data[tr.paddr]), UVM_NONE)
        end 
 //       compare();
     end
   endtask

 /*virtual task compare();
            
            if (temp_data[tr.paddr] == tr.prdata) begin
              `uvm_info("SCO", $sformatf("Mismatch! Expected: %0p, Got: %0h", temp_data, tr.prdata),UVM_MEDIUM);
            
        //end
          end else begin
            `uvm_info("SCO", "No Such Addr", UVM_NONE);
          end
       
*/
      //end else begin
        // Avoid tight polling
  //      #1ns;
//      end
  //  end
 // endtask
//endclass


class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)

  uvm_analysis_imp#(seq_item, scoreboard) received_value;
  seq_item tr_q[$];  // Transaction queue

  bit [31:0] temp_data[16];   // Expected model of register values
  int match_count = 0;
  int mismatch_count = 0;

  function new(string name = "scoreboard", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    received_value = new("received_value", this);
  endfunction

  // Incoming transactions are pushed into the queue
  virtual function void write(seq_item tr);
    tr_q.push_back(tr);
  endfunction

  virtual task run_phase(uvm_phase phase);
    seq_item tr;
    forever begin
      wait(tr_q.size() > 0);
      tr = tr_q.pop_front();

      if (tr.psel == 1 && tr.penable == 1) begin

        if (tr.pwrite == 1'b1) begin  // WRITE
          temp_data[tr.paddr] = tr.pwdata;
          `uvm_info("SCOREBOARD", $sformatf("WRITE: Addr=%0h, Data Stored=%0h", tr.paddr, tr.pwdata), UVM_NONE);

        end else begin  // READ
          `uvm_info("SCOREBOARD", $sformatf("READ: Addr=%0h, DUT Data=%0h, Expected=%0h", tr.paddr, tr.prdata, temp_data[tr.paddr]), UVM_NONE);
          compare(tr);
        end

      end
    end
  endtask

  // Compare actual prdata with model
 /* virtual task compare(seq_item tr);
    //if (temp_data.exists(tr.paddr)) begin
      if (temp_data[tr.paddr] == tr.prdata) begin
        match_count++;
        `uvm_info("SCOREBOARD", $sformatf("MATCH at Addr=%0h: Expected=%0h, Got=%0h", tr.paddr, temp_data[tr.paddr], tr.prdata), UVM_LOW);
      end
      else begin
        mismatch_count++;
        `uvm_error("SCOREBOARD", $sformatf("MISMATCH at Addr=%0h: Expected=%0h, Got=%0h", tr.paddr, temp_data[tr.paddr], tr.prdata));
      end
     else begin
      `uvm_warning("SCOREBOARD", $sformatf("READ before WRITE at Addr=%0h", tr.paddr));
    end
  endtask*/
//======================

  virtual task compare(seq_item tr);
  if (temp_data[tr.paddr] == tr.prdata) begin
    match_count++;
    `uvm_info("SCOREBOARD", $sformatf("MATCH at Addr=%0h: Expected=%0h, Got=%0h", tr.paddr, temp_data[tr.paddr], tr.prdata), UVM_LOW);
  end else begin
    mismatch_count++;
    `uvm_error("SCOREBOARD", $sformatf("MISMATCH at Addr=%0h: Expected=%0h, Got=%0h", tr.paddr, temp_data[tr.paddr], tr.prdata));
  end
endtask

  // Report match and mismatch count at end of simulation
  virtual function void report_phase(uvm_phase phase);
    `uvm_info("SCOREBOARD", "------------------ FINAL SCOREBOARD REPORT ------------------", UVM_NONE);
    `uvm_info("SCOREBOARD", $sformatf("Total Matches   : %0d", match_count), UVM_NONE);
    `uvm_info("SCOREBOARD", $sformatf("Total Mismatches: %0d", mismatch_count), UVM_NONE);
  endfunction
endclass

