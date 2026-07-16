# **RISCV ASSEMBLY CHALLENGE**
## *MEDS Training Programme*
### **Module 3 Grand Assignment**
### *Extension Summary*

**Overview:**

A RISCV extension is a standardized set of additional instructions that expand the capabilities of the ISA. This makes RISCV more flexible, scalable and efficient.

Common RISCV Extensions:
1. Base Integer ISA (I)
2. Integer multiply/divide (M)
3. Atomic Instructions (A)
4. Single-Precision Floating Point (F)
5. Double-Precision Floating Point (D)
6. Compressed Instructions (C)
7. Vector Extension (V)
8. Bit-Manipulation (B)

We will look in detail at the C extension.

**Compressed Instructions Extension C :**

The C extension adds a set of 16 bit compressed instructions to the standard RISCV ISA.

Normally RISCV instructions are 32 bits (4 bytes) long, this makes them 16 bit (2  byte) long. Using half as much memory.

With this extension, frequently used instructions can be encoded as 16 bit instructions while less common instructions remain in 32 bit format. The processor automatically recognizes whether the next instruction is 16 bits or 32.

The C extension was introduced because many embedded devices have small flash memory or limited RAM. This makes programs execute more efficiently without changing their functionality.

Example:
~~~
Standard Instuction 32-bits:
addi x5, x5, 1
Compressed Instruction 16-bits:
c.addi x5, 1
~~~

Practical Applications:
1. Embedded Systems
2. Better Cache performance
3. Lower Power consumption
4. Faster program loading

Author:</br>
***Noor Fatima***