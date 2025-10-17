# Event-Driven Logic Simulation (HCM-based)

This project implements an **event-driven simulator** for gate-level Verilog circuits,
using the **Hierarchical Connectivity Model (HCM)** library.  
It parses structural Verilog netlists, applies test vectors, and outputs simulation results
in **VCD format**.

⚠️ **Note**: The HCM library is not publicly available. External users may not be able
to compile this code. See: [HCM documentation](https://focused-lalande-5a6539.netlify.app/index.html).

---

## 📖 Overview
- Reads structural Verilog circuits using **HCM**.
- Accepts test vectors (`.vec.txt`) and signal definitions (`.sig.txt`).
- Simulates the circuit with an **event-driven algorithm**:
  - Maintains queues for **events** (node value changes) and **gates** (whose inputs changed).
  - Updates only gates affected by an event (efficient vs. compiled simulation).
- Dumps simulation results to `<top>.vcd`.

Implementation highlights:
- Flat netlist construction with `hcmFlatten`.
- `hcmsigvec` for parsing input vectors.
- `hcmvcd` for generating waveforms.
- Flip-flops initialized to **0** by default, following assignment requirements.

---

## 📂 Project Structure
```
event-driven-sim/
├─ docs/
│ └─ HW2.pdf # my report (no course handout)
├─ src/
│ ├─ HW2ex1.cc # event-driven simulator (uses HCM)
│ └─ stdcell_FF.v # updated DFF model (required for assignment)
├─ tools/
│ └─ Makefile # build script (expects HCM installed)
├─ examples/
│  └─ (place course test files here if you have access)
├─ results/
│ └─ (optional VCD outputs, e.g., TopLevel2806.vcd, TopLevel3540.vcd)
├─ .gitignore
├─ LICENSE
└─ README.md
```

---

## ⚙️ Build & Run
```bash
# Build (requires HCM installed and HCMPATH set)
make

# Run simulator
./event_sim <top-cell> <signals.sig.txt> <vectors.vec.txt> stdcell.v <verilog_files...>

# Example (assignment self-test)
./event_sim TopLevel2806 c2806.sig.txt c2806.vec.txt stdcell.v c2806.v
./event_sim TopLevel3540 c3540.sig.txt c3540.vec.txt stdcell.v c3540.v
```

The program produces TopLevel2806.vcd, TopLevel3540.vcd, etc.
You can view waveforms using VSCode WaveTrace Extension or GTKWave.

---

## 🚫 Not Included
- Original assignment handout and official test files (c2806, c3540, stdcell.v, etc.)
- Binary (`event_sim`) and intermediate object files (`*.o`).
- Waveform outputs (`*.vcd`) are not stored in this repo. If you want to reproduce,
  run the simulator with the official test vectors and view results in GTKWave or VSCode.
