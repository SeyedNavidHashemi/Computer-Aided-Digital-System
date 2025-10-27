# Project 4: CNN Processing Element (Eyeriss PE)

This project integrates the FIFO buffers from Project 2 into a complete, functional **Processing Element (PE)**, which is the core building block of the Eyeriss CNN hardware accelerator.

The designed PE is capable of performing 1D convolutions, which are the fundamental operations in a CNN.

### Key Architectural Components

1.  **I/O Buffers (from Project 2):**
    * Uses the previously designed FIFO buffers for `IFMap` (Input Feature Map) and `Filter` data, as well as for the `Psum` (Partial Sum) output.
    * These buffers manage the handshaking and data flow into and out of the PE.

2.  **ScratchPad Memories (SPM):**
    * **Register File (12x16b):** A fast, register-based SPM for storing `IFMap` data. It features synchronous writes and asynchronous reads.
    * **SRAM (24x16b):** An SRAM-style SPM for storing `Filter` data, featuring synchronous reads and writes.

3.  **Datapath (1D Convolution Unit):**
    * A **2-stage Pipelined Multiplier** and an adder to perform the core Multiply-Accumulate (MAC) operations.
    * This datapath reads operands from the two ScratchPads, multiplies them, and accumulates the result to produce a partial sum (`Psum`).

4.  **Controller Units:**
    * **PE Control Unit (Main FSM):** The top-level controller that manages the entire process. It waits for data in the SPMs, activates the pipeline, and signals when a `Psum` calculation is complete.
    * **Buffer Read Controllers:** Small FSMs that automatically pull data from the input FIFOs into the ScratchPads as space becomes available.
    * **Address Generators:** Controller units that generate the correct read addresses for the `IFMap` and `Filter` SPMs to implement the sliding window for the 1D convolution, based on `filter_size` and `stride` inputs.

The entire system was designed in Verilog as a set of interconnected FSM+Datapath modules and verified in ModelSim.
