# Kronecker Product and Matrix Multiplication Accelerator (Verilog)

Parameterised hardware for the **Kronecker product** and **matrix multiplication** of signed 8-bit matrices. Both are built on a gate-level **Baugh-Wooley signed array multiplier**. Simulated in Vivado.

## Architecture
- **Multiplier (`multiplier.v`):** 8×8 signed Baugh-Wooley array multiplier giving a 16-bit product
  - `white_box`: AND partial product + full adder
  - `grey_box`: NAND partial product (sign terms) + full adder
  - Final ripple row of full adders with Baugh-Wooley correction constants
- **Full adder (`full_adder.v`):** built from XNOR gates and a 2:1 MUX
- **Kronecker product (`kronecker_product.v`):** A (N1×N2) ⊗ B (M1×M2), with one multiplier per output element, fully parallel
- **Matrix multiplication (`matrix_multiplication.v`):** A (E1×E2) × B (E2×F2), with parallel partial products and per-element accumulation

All matrix sizes are module parameters. Inputs and outputs are flattened bit-vectors (8-bit elements in, 16-bit elements out).

## Simulation results

**Kronecker product (2×2 ⊗ 2×2)**
```
A =  -4   3        B =   8  -117
     -2   1              6   -50

A ⊗ B =
  -32   468   24  -351
  -24   200   18  -150
  -16   234    8  -117
  -12   100    6   -50
```

**Matrix multiplication (4×4 × 4×3)**
```
A row = [4 -1 -2 3]          B = [-3  2  6; -5 -3  2; 6 -5 -3; 2  6 -5]
Y row = [-13 39 13]
```

## Repository structure
```
src/   multiplier.v, white_box.v, grey_box.v, full_adder.v,
       kronecker_product.v, matrix_multiplication.v
tb/    kronecker_product_tb.v, matrix_multiplication_tb.v
```

## How to implement

**Option A: Vivado (2020.x or newer)**
1. Create a new RTL project with no sources added yet. Any part works, since this is simulation only.
2. **Add Sources → design sources:** add every file in `src/`.
3. **Add Sources → simulation sources:** add `tb/kronecker_product_tb.v` and `tb/matrix_multiplication_tb.v`.
4. In the *Simulation Sources* tree, right-click the testbench you want and choose **Set as Top**.
5. **Run Simulation → Run Behavioral Simulation.** The result matrices print in the Tcl console. Add `A`, `B` and `Y` to the waveform if you want to inspect them.

**Option B: Icarus Verilog (free, any OS)**
1. Install it: `sudo apt install iverilog` (Linux), `brew install icarus-verilog` (macOS), or the Windows installer from bleyer.org/icarus.
2. Clone the repo and run:
```bash
git clone https://github.com/Vipul-9/kronecker-matmul-accelerator.git
cd kronecker-matmul-accelerator
iverilog -o kp src/*.v tb/kronecker_product_tb.v && vvp kp
iverilog -o mm src/*.v tb/matrix_multiplication_tb.v && vvp mm
```
3. The output should match the *Simulation results* above.

**Using your own matrices**
- Set the sizes through parameters: `N1, N2, M1, M2` for the Kronecker product, and `E1, E2, F2` for matrix multiplication.
- Pack the elements row-major into the flattened inputs, with 8-bit signed elements per input and 16-bit signed elements per output. The testbenches show the packing.
- Keep inputs within −128…127. Products are exact in 16 bits. Accumulated matrix-multiplication sums can overflow 16 bits for large `E2` or values near full scale.

**Synthesising for an FPGA (optional)**
- Set `kronecker_product` or `matrix_mul` as top and run synthesis to see LUT usage and timing.
- The fully parallel design uses one multiplier per product, so resources grow quickly with matrix size. Start with 2×2 or 4×4.

## Contributing
I'm open to open-source contributions and collaboration. Issues and pull requests are welcome.
You can reach me at **vipulatluri98@gmail.com**.
