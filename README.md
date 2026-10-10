# SYS_TOP – RTL-to-GDS Style ASIC Flow

SYS_TOP is a UART-based system: UART RX / TX, ALU, register file, async FIFO,
clock gating, clock dividers and reset/data synchronizers.
Technology: TSMC 0.13 µm (scmetro cl013g RVT), SS 1.08 V 125 °C / TT 1.2 V 25 °C / FF 1.32 V -40 °C.

## Flow status

| Stage | Tool | Status | Folder |
|-------|------|--------|--------|
| RTL design + testbench | - | Done | `rtl/`, `tb/` |
| Lint / CDC | SpyGlass | Project files only (see note) | `lint_cdc/` |
| Synthesis | Design Compiler | Done | `synthesis/` |
| Formality (RTL vs netlist) | Formality | Done, SUCCEEDED | `formality/rtl_vs_synthesis/` |
| DFT (scan insertion) | DC (insert_dft) | Done, 4 scan chains | `dft/` |
| Formality (RTL vs post-DFT) | Formality | Done, see `formality/rtl_vs_dft/` | `formality/rtl_vs_dft/` |
| Gate-level simulation | - | TODO | `gls/` |
| Place & Route | - | TODO | `pnr/` |

## Repository layout

```
rtl/                    Verilog design (SYS_TOP.v = functional top, SYS_TOP_dft.v = DFT-ready top)
tb/                     Testbench
lint_cdc/spyglass/      SpyGlass project, SGDC constraints, logs
synthesis/              scripts/ results/ (netlist, sdc, sdf, ddc, svf) reports/ logs/
dft/                    scripts/ results/ (scan netlist, sdc, sdf, spf, ddc) reports/ logs/
formality/
  rtl_vs_synthesis/     scripts/ reports/ logs/
  rtl_vs_dft/           scripts/ reports/ logs/
gls/                    Gate-level simulation (tb/ scripts/ logs/ waves/)
pnr/                    Place & route (scripts/ results/ reports/ logs/)
docs/images/            Screenshots per stage (rtl, lint_cdc, synthesis, dft, formality, gls, pnr)
```

> `SYS_TOP.v` and `SYS_TOP_dft.v` both define module `SYS_TOP`. Never compile them together.
> Use `SYS_TOP.v` for synthesis and `SYS_TOP_dft.v` for the DFT flow.

## Key results

| Metric | Synthesis | After DFT |
|--------|-----------|-----------|
| Total cell area | 27531.25 | 31630.87 |
| Scan chains | - | 4 (lengths 129 / 129 / 129 / 128) |
| Scan ports | - | `scan_clk`, `scan_rst`, `test_mode`, `SE`, `SI[3:0]`, `SO[3:0]` |

Setup slack after DFT is MET (see `dft/reports/setup.rpt`).

## Re-running

The Tcl scripts use absolute paths from the original workstation
(`/home/ICer/system_top/...`). Edit the variables at the top of each script
(`RTL_DIR`, `SYN_DIR`, `DFT_DIR`, library paths) to match your setup.
The standard-cell `.db` libraries are not included (licensed).

Order: `synthesis/scripts/syn_script.tcl` -> `formality/rtl_vs_synthesis` ->
`dft/scripts/DFT_script.tcl` -> `formality/rtl_vs_dft` -> GLS -> PnR.

## Notes

- SpyGlass: the dashboard/datasheet logs show a license checkout failure, so no lint/CDC report is included yet.
- Formality (RTL vs post-DFT): only 10 compare points matched by name; the log reports 30 unmatched reference points. Check `formality/rtl_vs_dft/reports/unmatched_points.rpt` before claiming full equivalence.

## Images

Add screenshots to `docs/images/<stage>/` and reference them from `docs/README.md`.
