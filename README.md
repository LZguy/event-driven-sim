# Event-Driven Logic Simulator

An **event-driven simulator** for gate-level digital circuits.  
The tool uses the **HCM – Hierarchical Connectivity Model** library to parse and flatten Verilog netlists, simulate them over time with event scheduling, and produce waveform outputs (VCD format).

> ⚠️ Note: This repository contains **only my implementation and report**.  
> Standard cell libraries, test benches, and course-provided materials are **not included**.  
> To run the simulator, place your own Verilog benchmarks under `examples/`.

---

## 📑 Overview

- Implements an **event-driven simulation kernel**:  
  - Uses a **priority queue** of scheduled events (time, signal changes).  
  - At each step, events are popped in chronological order, updating affected nodes.  
  - Gates are evaluated lazily only when inputs change.  

- Supports:
  - **Structural Verilog parsing** via HCM.  
  - Logic primitives (AND, OR, NAND, NOR, INV, BUF, XOR).  
  - Constant sources (VDD, VSS).  
  - Dumping signal transitions into a **VCD file** for waveform inspection.  

- Output can be viewed in waveform viewers such as **GTKWave**.

---

## 📂 Project Structure

```
event-driven-sim/
├─ docs/
│ └─ HW2.pdf # My report
├─ src/
│ ├─ HW2ex1.cc # My implementation (uses HCM)
│ └─ Makefile # Build script
├─ submission/
│ └─ wet02_313551186_207910738.tar.gz # Original submission archive
├─ examples/
│ └─ (optional) place benchmark netlists here if you have access
├─ .gitignore
├─ LICENSE
└─ README.md
```

> **Note:** Standard cell libraries and Verilog test files from the assignment are **not included**.  
> If you have access, put them under `examples/` before running.

---

## ⚙️ Build Instructions

This project assumes HCM headers and libraries are installed on your system.

```bash
cd src
make
```
This will compile the simulator using the provided Makefile.

---

## ▶️ Usage

Run the simulator on a given netlist and testbench:
```bash
./event_sim <top_module> stdcell.v design.v testbench.v
```

The program will:
1. Parse and flatten the design with HCM.
2. Schedule and process events over time.
3. Write signal transitions into output.vcd.

You can then view results with GTKWave:
```bash
gtkwave output.vcd
```

---

## 🔑 Dependencies

- **HCM – Hierarchical Connectivity Model:**
Library used for netlist parsing and connectivity.
Documentation: https://focused-lalande-5a6539.netlify.app/index.html
