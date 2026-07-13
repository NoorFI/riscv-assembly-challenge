# **RISCV ASSEMBLY CHALLENGE**
## *MEDS Training Programme*
### **Module 3 Grand Assignment**
### *Privileged Architecture Summary*

**Privilege Levels:**

RISC-V has multiple privilege modes for every software component. These provide varying levels of isolation and protection.

There are 3 main privilege levels, where each lower level has fewer permissions:
1. Machine Mode (M):
    - Highest privilege, level 3 encoding 11
    - Every RISCV processor must implemet M mode
    - Responsible for:
        - Booting the processor
        - Configuring Hardware
        - Initializing memory
        - Handling machine-level exceptions
        - Controlling interrupts
        - Accessing all machine CSRs
2. Supervisor Mode (S):
    - Medium privilege, level 1 encoding 01
    - Mainly used by the operating system kernel
    - Responsible for:
        - Managing virtual memory
        - Scheduling processes
        - Handling system calls
        - Allocating memory
        - Communicating with devices
3. User Mode (U):
    - Lowest privilege, level 0 encoding 00
    - Also known as application mode
    - This is where normal applications execute
    - Cannot directly perform operations such as disabling interrupts or allocating memory, they need to request the operating system (with S mode) to do it for them.

By ensuring that softwares only have permissions they actually need, privilege levels protect the system.</br>
A RISCV hardware thread (hart) normally runs application code in U mode, and to switch between modes, traps are used.</br>
A trap forces a switch to a trap handler, which usually runs in a more privileged mode. The hart will then execute the trap handler, which will eventually resume execution at or after the original trapped instruction in U mode.</br>
Traps that increase privilege levels are termed vertical traps while traps that remain at the same privilege level are termed horizontal traps.

**Key CSRs:**

CSR stands for Control and Status Register. These are special-purpose registers used by the processor to:
    - contol processor behaviour
    - configure hardware
    - manage interrupts 
    - handle exceptions
    - store system status

Unlike the general purpose registers (x0 to x31), CSRs are not used for normal arithmetic operations but instead contain info about the processor itself.

Following are some key CSRs and their details:
1. mstatus:
    - Machine Status Register
    - Stores processor status, privilege mode, and interrupt enable information
2. misa:
    - Machine ISA Register
    - Identifies supported ISA width and extensions
3. mtvec:
    - Machine Trap Vector Register
    - Holds the address of the machine trap handler
4. mepc:
    - Machine Exception Program Counter
    - Saves the address of the interrupted or faulting instruction
5. mcause:
    - Machine Cause Register
    - Records the reason for an exception or interrupt
6. mtval:
    - Machine Trap Value Register
    - Stores additional information about the trap, such as the faulting address
7. mie:
    - Machine Interrupt Enable Register
    - Enables or disables specific machine-level interrupts
8. mip:
    - Machine Interrupt Pending Register
    - Indicates which interrupts are currently pending
9. mscratch:
    - Machine Scratch Register
    - Temporary storage used bby the machine-mode trap handlers.
10. mvendorid:
    - Machine Vendor ID Register
    - Stores the unique ID of the processor manufacturer. Helps identify the hardware vendor
11. marchid:
    - Machine Architecture ID Register
    - Identifies the processor architecture or microarchitecture implementation. Distinguishes different CPU designs
12. mimpid:
    - Machine Implementation ID Register
    - Specifies the processor implementation or version number. Useful for identifying hardware revisions
13. mhartid:
    - Machine Hardware ID Register
    - Stores the unique ID of the current hardware thread (hart). Used in multicore processors to distinguish different cores/threads
14. medeleg:
    - Machine Extension Delegation Register
    - Determines which exceptions are delegated from Machine Mode to Supervisor Mode for handling
15. mideleg:
    - Machine Interrupt Delegation Register
    - Determines which interrupts are delegated from Machine Mode to Supervisor Mode
16. mcounteren:
    - Machine Counter Enable Register
    - Controls whether lower privilege levels (Supervisor/User) can access hardware performance counters and timers
17. mcountinhibit:
    - Machine Counter Inhibit Register
    - Enables or disables specific hardware counters to reduce unnecessary counting and save power
18. mconfigptr:
    - Machine Configuration Pointer Register
    - Points to a machine configuration data structure containing additional platform or hardware configuration information (if implemented)
19. mseccfg:
    - Machine Security Configuration Register
    - Controls machine-level security features, including memory protection and other security-related configurations (if implemented)

**Trap Handling Flow:**

A trap is an event that transfers control to privileged software due to an exception or interrupt. We covered some details in privilege levels, but the detailed sequence is provided below.

Trap Handling Sequence:
1. An exception or interrupt occurs.
2. The current PC is saved in mepc.
3. The trap cause is recorded in mcause.
4. Additional information is stored in mtval (if there is additional info).
5. Control is transferred to the trap handler address stored in mtvec.
6. The trap handler services the event.
7. The mret instruction restores execution from the address in mepc.

Author:</br>
***Noor Fatima***