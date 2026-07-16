# **RISCV ASSEMBLY CHALLENGE**
## *MEDS Training Programme*
### **Module 3 Grand Assignment**

**Project Description:**

This project contains 3 assembly programs and 2 selfstudy markdown files.

***Task 1: Array Processing***

File: part1_array_ops.s

Implements the following functions using the RISCV calling convention:
- sum: Sum of all values in array
- min: Minimum value in array
- max: Maximum value in array
- negative: Counts number of negative values in array

Each function accepts:

- a0 --> Pointer to array
- a1 --> Array size

and returns the result in a0.

***Task 2: Recursive Fibonacci with Memoization***

File: part2_recursion.s

Implements Recursive Fibonacci with memoization.</br>

Features:
- Recursive Fibonacci implementation
- Memoization using a cache stored in the .data section
- Stack-based recursive function calls
- Proper register preservation following the RISCV calling convention

Expected output:
~~~
Fib(20) = 6765
~~~

***Task 3: Instruction Encoding***

Files: part3_encoding.s & ENCODING_WORKSHEET.md

By taking 6 RISCV instructions, it includes:
- Manual encoding of RISCV instructions (R, I, S, B, U, and J formats) in markdown file.
- Assembly program that extracts and prints:
  - Opcode
  - Destination register (rd)
  - Source register (rs1)
  - funct3

using shift-and-mask operations.

***Privileged Specfications:***

File: PRIVILEGED_SUMMARY.md

A concise summary covering:

- RISCV privilege levels
- Important Machine-Level CSRs
- Trap handling flow

Based on the RISCV Privileged ISA Specification (Sections 3.1–3.4).

***C Extension Summary:***

File: EXTENSION_SUMMARY.md

A summary of the RISCV Compressed (C) Extension, including:

- Purpose of the compressed instruction set
- Benefits such as improved code density and reduced memory usage
- Common compressed instructions
- Practical applications in embedded systems and low-memory devices

**Installation:**

Follow these instructions inside bash:

1. Clone the repository:
    ~~~
    git clone https://github.com/<your-username>/riscv-assembly-challenge.git
    cd riscv-assembly-challenge
    ~~~

**Project Structure:**
~~~
riscv-assembly-challenge/ 
├── README.md
├── .gitignore
├── part1_array_ops.s       # Part 1: Array processing 
├── part2_recursion.s       # Part 2: Recursive algorithms 
├── part3_encoding.s        # Part 3: Instruction decoder in asm 
├── screenshots/            # Venus screenshots showing output 
└── docs/ 
    ├── ENCODING_WORKSHEET.md  # Hand-encoded instructions 
    ├── PRIVILEGED_SUMMARY.md  # Privileged spec self-study 
    └── EXTENSION_SUMMARY.md   # Extension self-study
~~~

**Simulator:**

Venus (https://venus.cs61c.org)

**Usage:**
1. Open Venus on your browser
2. Load the desired `.s` file.
3. Assemble and run the program.
4. View the output in the Venus console/output panel.


Author:</br>
***Noor Fatima***