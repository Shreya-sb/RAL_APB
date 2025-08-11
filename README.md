# RAL
This design implements a 32-bit APB slave containing five registers (CTRL, REG1, REG2, REG3, REG4), each accessible via the APB bus. 
The registers have predefined reset values and are read/write capable. 
The APB interface includes standard signals such as Paddr, Pwdata, Prdata, Pwrite, Penable, Psel, Pclk, and Presetn
The register offsets range from 0x00 to 0x10, with unique default values for each register, enabling straightforward configuration and data handling through APB transactions.

<img width="801" height="366" alt="image" src="https://github.com/user-attachments/assets/87e1b3e5-ceb6-465f-9d58-f9d32125d7ff" />

<img width="844" height="442" alt="image" src="https://github.com/user-attachments/assets/181e618b-5385-4d4f-b3d6-88f2247b7d52" />

# COMMANDS:
## FRONTDOOR:
vlog testbench.sv

vsim -c -do "run -all;exit;" tb

## BACKDOOR:
vsim tb -voptargs=+acc=npr -l tb.log -c -do "run -all;quit;"

## COVERAGE:
vlog -sv +acc +cover +fcover -l tb. tb.sv
vsim -vopt work.tb -voptargs=+acc=npr -assertdebug -l run.log -coverage -c -do "coverage save -onexit -assert -directive -cvg -codeAll coverage.ucdb; coverage report -detail;run -all; exit"; 
vcover report -html coverage.ucdb -htmldir covReport -details;

cd covReport

firefox index.html
