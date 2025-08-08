**RAL
**
This design implements a 32-bit APB slave containing five registers (CTRL, REG1, REG2, REG3, REG4), each accessible via the APB bus. 
The registers have predefined reset values and are read/write capable. 
The APB interface includes standard signals such as Paddr, Pwdata, Prdata, Pwrite, Penable, Psel, Pclk, and Presetn
The register offsets range from 0x00 to 0x10, with unique default values for each register, enabling straightforward configuration and data handling through APB transactions.
