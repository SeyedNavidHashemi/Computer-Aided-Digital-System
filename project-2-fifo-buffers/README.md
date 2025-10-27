# Project 2: Parametric FIFO I/O Buffers

This project involved designing the input/output buffering system for a Processing Element (PE), a core component of a larger CNN (Convolutional Neural Network) hardware accelerator.

The primary goal was to create a robust, parameterized FIFO (First-In, First-Out) buffer that can manage data flow between different hardware modules using a standard handshaking protocol.

### Key Components Designed

1.  **Basic Buffer (Memory Array):**
    * A simple, synthesizable memory array was created to act as the core data storage.
    * This module was parameterized for data width, depth, and the number of simultaneous read/write operations.

2.  **Circular FIFO Controller:**
    * The main logic for a circular buffer, which wraps read/write pointers to reuse memory locations.
    * It uses the basic buffer for storage and adds control logic.
    * Manages the `full` and `empty` status of the buffer by comparing the read and write pointers.

### Core Features & Handshaking

* **Parameterized Parallel I/O:** The buffer is designed to be highly configurable. It supports parallel read (`PAR_READ`) and write (`PAR_WRITE`) operations, allowing 1, 2, or 4 data words to be read or written in a single clock cycle.

* **Handshake Protocol:** A robust ready/valid handshake mechanism was implemented to ensure data integrity and prevent overflow or underflow.
    * **Write Interface:** A module can only write data when `write_enable` is high and the buffer's `ready` signal is also high (indicating it's not full).
    * **Read Interface:** A module can only read data when `read_enable` is high and the buffer's `valid` signal is high (indicating it's not empty).

* **FSM + Datapath:** The entire system was implemented using a Hoffman-model (FSM) controller and a separate datapath, all written in Verilog and verified in ModelSim.
