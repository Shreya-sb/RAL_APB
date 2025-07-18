/*module apb_slave(input clk,rst,pwrite,[4:0]paddr,[7:0]pwdata,output reg[7:0] prdata);
    
  reg [7:0] cntrl; 
  reg [7:0] reg1; 
  reg [7:0] reg2; 
  reg [7:0] reg3; 
  reg [7:0] reg4; 
  
  always @(posedge clk) 
    begin
       if(rst) begin
            cntrl <= 0;
            reg1 <= 0;
            reg2 <= 0;
            reg3 <= 0;
            reg4 <= 0;
            prdata <= 0;
        end 
    else begin
      
                if (pwrite) 
                  begin
                    case (paddr[4:2])
                        3'b000: cntrl <= pwdata;
                        3'b001: reg1 <= pwdata;
                        3'b010: reg2 <= pwdata;
                        3'b011: reg3 <= pwdata;
                        3'b100: reg4 <= pwdata;
                    endcase
                end 
              else 
                begin
                    case (paddr[4:2])
                        3'b000: prdata <= cntrl;
                        3'b001: prdata <= reg1;
                        3'b010: prdata <= reg2;
                        3'b011: prdata <= reg3;
                        3'b100: prdata <= reg4;
                    endcase
                end
            end
    end
endmodule*/
module apb_slave (
  input PCLK,
  input PRESETn,
  input PSEL,
  input PENABLE,
  input PWRITE,
  input [31:0] PADDR,
  input [31:0] PWDATA,
  output reg [31:0] PRDATA
);
  reg [31:0] slv_regs [0:4];
  always @(posedge PCLK or negedge PRESETn) begin
    if (!PRESETn) begin
      slv_regs[0] <= 32'h0000_0000;
      slv_regs[1] <= 32'hA5A5_0000;
      slv_regs[2] <= 32'h1234_9876;
      slv_regs[3] <= 32'h5A5A_5555;
      slv_regs[4] <= 32'h0000_FFFF;
      PRDATA <= 32'h0;
    end else if (PSEL && PENABLE) begin
      if (PWRITE)
        slv_regs[PADDR[3:2]] <= PWDATA;
      else
        PRDATA <= slv_regs[PADDR[3:2]];
    end
  end
endmodule
