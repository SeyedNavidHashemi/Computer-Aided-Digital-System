# Project 1: Approximate Multiplier System (FSM + Datapath)

This project is the RTL design of a hardware system that performs *approximate multiplication* on 16-bit numbers. This method is used in applications like IoT and embedded systems where processing speed and low power consumption are more critical than perfect precision.

### Core Algorithm (Effective Bits)

Instead of a full, complex 16x16 multiplication, the system uses a faster, smaller 8x8 multiplier by implementing a specific algorithm:

1.  **Scan Inputs:** For each 16-bit input, it finds the first `'1'` bit from the MSB.
2.  **Extract:** It extracts the **"Effective 8 Bits"** starting from that first `'1'`.
3.  **Multiply:** The two 8-bit "effective" numbers are multiplied using a standard 8x8 multiplier, producing a 16-bit result.
4.  **Reconstruct:** A 32-bit final result is built by padding the 16-bit product with the correct number of leading and trailing zeros, based on the original positions of the effective bits.

### System Architecture

The design follows a standard **Hoffman-model (FSM + Datapath)** architecture:

* **Controller (FSM):** A state machine that manages the overall process, including memory addresses and control signals for the datapath.
* **Datapath:** Contains the logic for bit scanning/extraction, the 8x8 multiplier, and I/O interfaces to the RAMs.

### System Operation

The system is designed to process a batch of 8 multiplications:

1.  On a `Start` signal, the controller begins.
2.  It reads 8 pairs of 16-bit operands from an **Input RAM** (which is pre-loaded from a `.txt` file).
3.  Each pair is processed by the datapath using the approximate algorithm.
4.  The final 8 32-bit results are written to an **Output RAM**.
5.  After the last operation, a `Done` signal is asserted, and the Output RAM's contents are saved to a `.txt` file.
