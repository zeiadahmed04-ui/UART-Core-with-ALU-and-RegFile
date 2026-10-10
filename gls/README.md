# Gate-Level Simulation (TODO)

- `tb/`      testbench for netlist simulation (reuse `../tb/SYS_TOP_tb.v`)
- `scripts/` simulation run scripts
- `logs/`    simulation logs
- `waves/`   waveform dumps (VCD is git-ignored)

Run against: `../synthesis/results/System_Top.v` + `.sdf` (post-synthesis),
`../dft/results/System_Top.v` + `.sdf` (post-DFT), and the PnR netlist later.
