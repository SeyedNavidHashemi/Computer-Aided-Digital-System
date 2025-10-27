# Project 3: Structural Synthesis of Approximate Multiplier

This project is a low-level synthesis exercise, re-implementing the Approximate Multiplier (from Project 1) using only primitive, pre-defined logic cells.

### Core Challenge: Manual Structural Synthesis

The primary challenge was to perform a **manual structural synthesis** of the entire FSM+Datapath architecture.
* All behavioral Verilog operators (like `+`, `&`, `^`) were **prohibited** in the main design.
* The entire system was built hierarchically using only the four fundamental **Actel FPGA logic cells** (C1, C2, S1, S2) provided for the course.

### Design Architecture

1.  **Module Primitives:** First, Verilog modules for the combinational (C1, C2) and sequential (S1, S2) Actel cells were created.
2.  **Datapath:** All necessary components (registers, multiplexers, the 8-bit multiplier, and bit-scanning logic) were built by structurally connecting these primitive Actel cells.
3.  **Controller (FSM):** The Hoffman-model FSM was also implemented at the gate level using only the Actel cells.
4.  **Gate Count Optimization:** A key goal was to minimize the total number of instantiated cells. A C++ script was used to traverse the final design and count the total gates, with a hard limit of 12,000 cells.

The final, complete design was verified in ModelSim.
