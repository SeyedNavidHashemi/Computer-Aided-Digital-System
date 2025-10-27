# Project 5: Complete Eyeriss-Style Processing Element

This project completes the CNN Processing Element (PE) design from Project 4. It integrates the final accumulation datapath and an enhanced main controller to support various advanced data reuse strategies, which are critical for efficient CNN acceleration.

### Key Features & Enhancements

1.  **Partial Sum Accumulation Path:**
    * A **`Partial Sum ScratchPad`** (a 24x16b Register File) was added to store intermediate accumulation results.
    * An `Input Psum` port was added to feed partial sums from other PEs or a global buffer back into the datapath.
    * The main adder is now a true accumulator, summing the multiplier output with the stored `Psum` value (or `0` on a reset).

2.  **Enhanced PE Controller (FSM):**
    * The main FSM was significantly upgraded to manage complex data flows based on a new `mode` input, enabling three key data reuse patterns:
    * **Filter Reuse Mode:** Processes two different `IFMap` (input) streams against a single, reused `Filter`.
    * **IFMap Reuse Mode:** Processes one `IFMap` stream against two different `Filter` streams.
    * **Channel Accumulation Mode:** Performs a standard convolution, accumulating results from different input channels.

3.  **Dual-Mode Operation:**
    * The entire PE now operates in one of two top-level modes:
    * **Convolution Mode:** Performs the standard 1D convolution (multiply-accumulate) as described above.
    * **Psum-Only Mode:** Bypasses the multiplier to *only* sum incoming `Psum` data with the values already in the `Psum ScratchPad`.

This final design integrates all components (FIFO I/O, SPMs, a 2-stage Pipelined MAC, and an advanced FSM) into a complete and scalable Processing Element, forming the core of the Eyeriss-style accelerator.
