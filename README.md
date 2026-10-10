# UART Core with ALU and Register File (SYS_TOP)

A UART-controlled system-on-chip block, taken from RTL through synthesis, DFT scan insertion and formal verification in an ASIC flow.

A host sends command frames over a serial UART link. The system decodes them and either accesses an internal register file or runs an arithmetic/logic operation on an 8-bit ALU, then sends the result back over UART through an asynchronous FIFO.

- **Technology:** TSMC 0.13 µm (`scmetro_tsmc_cl013g_rvt`)
- **Corners:** SS 1.08 V 125 °C (setup), TT 1.2 V 25 °C, FF 1.32 V −40 °C (hold)
- **Clocks:** `REF_CLK` 50 MHz (20 ns), `UART_CLK` ≈ 3.686 MHz (271.297 ns), two asynchronous domains

---

## Table of contents

1. [Architecture](#architecture)
2. [Command protocol](#command-protocol)
3. [Register map](#register-map)
4. [ALU operations](#alu-operations)
5. [Clocking and clock-domain crossing](#clocking-and-clock-domain-crossing)
6. [Repository layout](#repository-layout)
7. [Flow status](#flow-status)
8. [Results](#results)
9. [Simulation](#simulation)
10. [Re-running the flow](#re-running-the-flow)
11. [Known issues](#known-issues)
12. [License](#license)

---

## Architecture

```
                 UART_CLK domain                          REF_CLK domain
            ┌─────────────────────────┐             ┌──────────────────────────────────┐
 RX_IN ───► │  UART RX                │   8-bit     │  data_sync                       │
            │  (FSM, edge/bit counter,├──────────►  │  (pulse gen + 2FF sync)          │
            │   sampler, deserializer,│  + valid    └───────────────┬──────────────────┘
            │   parity/start/stop chk)│                             ▼
            └──┬──────────────────────┘             ┌──────────────────────────────────┐
   parity_error│ stop_error                         │  SYS_CTRL (system FSM)           │
                                                    └───┬──────────────┬───────────┬───┘
            ┌─────────────────────────┐                 │              │           │
            │  clk_divider            │                 ▼              ▼           ▼
            │  (÷ REG3, TX clock)     │            ┌─────────┐   ┌──────────┐ ┌──────────┐
            └──────────┬──────────────┘            │ RegFile │   │   ALU    │ │ Clock    │
                       │                           │ 22×8b   │   │ 8b → 16b │ │ gating   │
            ┌──────────▼──────────────┐            └─────────┘   └──────────┘ └──────────┘
 TX_OUT ◄───┤  UART TX                │◄── rdata ──┐
            │  (FSM, serializer,      │            │
            │   parity calc, mux)     │       ┌────┴─────────────────┐
            └─────────────────────────┘       │  Async FIFO          │◄── wdata (REF_CLK)
                                              │  8b × 16, gray ptrs  │
                                              └──────────────────────┘
```

| Block | Description |
|-------|-------------|
| `UART_RX_Top` | Oversampling receiver with start, parity and stop checking; drives `parity_error` / `stop_error` |
| `UART_TX_Top` | Transmitter with FSM, serializer, optional parity and output mux |
| `SYS_CTRL` | 12-state command FSM that decodes frames and sequences the regfile, ALU and TX path |
| `regfile` | 22 × 8-bit register file; REG0–REG3 are exposed as configuration/operand registers |
| `ALU_TOP` | Decoder plus arithmetic, logic, compare and shift units with registered outputs, producing a 16-bit result |
| `ASYNC_FIFO_TOP` | 8-bit × 16-deep asynchronous FIFO (gray-coded pointers, double-flop synchronizers) between `REF_CLK` and the UART TX clock |
| `data_sync` / `PULSE_GEN` | Multi-bit bus synchronizer for RX data into the `REF_CLK` domain |
| `rst_sych` | Asynchronous-assert, synchronous-release reset synchronizers (one per clock domain) |
| `clk_divider` | Programmable integer clock divider (ratio from REG3) producing the UART TX clock |
| Clock gate | Integrated clock gate (`TLATNCAX4M`) driving the ALU clock; enabled only while the ALU is in use |

---

## Command protocol

Every frame is one UART byte (8 data bits, optional parity, 1 stop bit). The first byte of a transaction is the command.

| Command | Byte sequence (host → chip) | Response (chip → host) |
|---------|-----------------------------|------------------------|
| **Register write** | `0xAA`, `ADDR`, `DATA` | none |
| **Register read** | `0xBB`, `ADDR` | 1 byte: register value |
| **ALU with operands** | `0xCC`, `A`, `B`, `FUNC` | 2 bytes: result `[7:0]`, then result `[15:8]` |
| **ALU, reuse operands** | `0xDD`, `FUNC` | 2 bytes: result `[7:0]`, then result `[15:8]` |

- `0xCC` stores `A` into REG0 and `B` into REG1, then runs the function.
- `0xDD` reuses whatever is already in REG0 and REG1.
- `FUNC` uses the low 4 bits of the received byte.
- Unknown command bytes are ignored and the FSM stays in idle.

---

## Register map

| Address | Name | Purpose |
|---------|------|---------|
| `0x00` | REG0 | ALU operand A |
| `0x01` | REG1 | ALU operand B |
| `0x02` | REG2 | UART configuration: `[0]` parity enable, `[1]` parity type, `[7:2]` RX prescale |
| `0x03` | REG3 | UART TX clock divider ratio |
| `0x04`–`0x15` | general purpose | Free read/write storage |

The register file has 22 entries (`0x00`–`0x15`). Accesses above that range are ignored.

The testbench configures `REG2 = 0x81` (prescale 32, parity enabled, even type) and `REG3 = 32`, which gives 115200 baud from the 3.686 MHz UART clock (32 × 115200 ≈ 3.686 MHz).

---

## ALU operations

| `FUNC` | Operation | Unit | Result |
|--------|-----------|------|--------|
| `0x0` | A + B | Arithmetic | 16-bit signed |
| `0x1` | A − B | Arithmetic | 16-bit signed |
| `0x2` | A × B | Arithmetic | 16-bit signed |
| `0x3` | A ÷ B (returns 0 if B = 0) | Arithmetic | 16-bit signed |
| `0x4` | A AND B | Logic | zero-extended |
| `0x5` | A OR B | Logic | zero-extended |
| `0x6` | A NAND B | Logic | zero-extended |
| `0x7` | A NOR B | Logic | zero-extended |
| `0x8` | A XOR B | Logic | zero-extended |
| `0x9` | A XNOR B | Logic | zero-extended |
| `0xA` | A == B → `1` | Compare | `0` otherwise |
| `0xB` | A > B → `2` | Compare | `0` otherwise |
| `0xC` | A < B → `3` | Compare | `0` otherwise |
| `0xD` | A >> 1 | Shift | zero-extended |
| `0xE` | A << 1 | Shift | 9 significant bits |

`0xF` is unused and produces no valid output.

---

## Clocking and clock-domain crossing

| Clock | Source | Period | Domain contents |
|-------|--------|--------|-----------------|
| `REF_CLK` | input port | 20 ns (50 MHz) | `SYS_CTRL`, regfile, ALU, FIFO write side, RX data synchronizer |
| `ALU_CLK` | gated `REF_CLK` | 20 ns | ALU only (clock-gated when idle) |
| `UART_CLK` | input port | 271.297 ns (≈ 3.686 MHz) | UART RX, clock divider |
| `TX_CLK` | `UART_CLK` ÷ REG3 | 32 × 271.297 ns | UART TX, FIFO read side |

The two groups (`REF_CLK`/`ALU_CLK` and `UART_CLK`/`RX_CLK`/`TX_CLK`) are declared asynchronous in the SDC. Crossings are handled by:

- `data_sync`: pulse-based enable synchronizer for the RX byte (UART → REF)
- `ASYNC_FIFO_TOP`: gray-coded pointers with 2-flop synchronizers for the TX path (REF → UART)
- `rst_sych`: separate reset synchronizer per domain

---

## Repository layout

```
rtl/                     Verilog design, one folder per module (mirrors hierarchy)
  SYS_TOP/               SYS_TOP.v (functional top) and SYS_TOP_dft.v (DFT-ready top)
  SYS_CTRL/  regfile/  ALU_TOP/  ASYNC_FIFO_TOP/  UART_RX_Top/  UART_TX_Top/
  clk_divider/  rst_sych/  data_sync/  PULSE_GEN/  CLK_GATE/  mux2x1/
  filelist.f             File list for the functional flow
  filelist_dft.f         File list for the DFT flow
tb/                      SYS_TOP_tb.v, self-checking testbench
lint_cdc/spyglass/       SpyGlass project, SGDC constraints, logs
synthesis/               scripts/  results/  reports/  logs/
dft/                     scripts/  results/  reports/  logs/
formality/
  rtl_vs_synthesis/      scripts/  reports/  logs/
  rtl_vs_dft/            scripts/  reports/  logs/
gls/                     Gate-level simulation (placeholder)
pnr/                     Place and route (placeholder)
docs/                    Documentation and per-stage screenshots
```

> **Important:** `SYS_TOP.v` and `SYS_TOP_dft.v` both define module `SYS_TOP`. Never compile them together. Use `SYS_TOP.v` for simulation and synthesis, and `SYS_TOP_dft.v` for the DFT flow.

---

## Flow status

| Stage | Tool | Status | Folder |
|-------|------|--------|--------|
| RTL design and testbench | none | Done | `rtl/`, `tb/` |
| Lint / CDC | SpyGlass | Project files only, no report (license checkout failed) | `lint_cdc/` |
| Synthesis | Design Compiler | Done | `synthesis/` |
| Formality: RTL vs synthesis netlist | Formality | Done, `SUCCEEDED` | `formality/rtl_vs_synthesis/` |
| DFT scan insertion | DC (`insert_dft`) | Done, 4 scan chains | `dft/` |
| Formality: RTL vs post-DFT netlist | Formality | `SUCCEEDED`, but see [known issues](#known-issues) | `formality/rtl_vs_dft/` |
| Gate-level simulation | none | TODO | `gls/` |
| Place and route | none | TODO | `pnr/` |

---

## Results

| Metric | Post-synthesis | Post-DFT |
|--------|----------------|----------|
| Total cell count | 2346 | 2423 |
| Sequential cells | 571 | 586 |
| Total cell area | 27531.25 | 31630.87 |
| Scan chains | n/a | 4 (lengths 129 / 129 / 129 / 128) |
| Setup timing | MET (worst slack 0.01 ns) | MET |
| Hold timing | MET (worst slack 0.33 ns) | MET (worst slack 0.35 ns) |

DFT adds about 14.9 % area (31630.87 vs 27531.25) for scan insertion.

**Scan interface added by DFT:** `scan_clk`, `scan_rst`, `test_mode`, `SE`, `SI[3:0]`, `SO[3:0]`.

Full reports are in `synthesis/reports/` and `dft/reports/` (area, power, setup, hold, clocks, constraints, scan chains).

---

## Simulation

`tb/SYS_TOP_tb.v` is a self-checking testbench that drives the DUT purely through its UART pins, using both clocks (50 MHz and ≈ 3.686 MHz) and 115200-baud framing. It checks:

- Configuration of REG2 and REG3 with readback
- Register-file write/read at several addresses (`0x05`, `0x15`)
- All 15 ALU functions through the `0xCC` command
- The `0xDD` command reusing REG0/REG1
- That `parity_error` and `stop_error` stay low

It prints `PASS` / `FAIL` per check and a final `ALL TESTS PASSED (N checks)` summary, and dumps `sys_top_tb.vcd`.

Example with VCS (run from `rtl/`):

```bash
vcs -f filelist.f ../tb/SYS_TOP_tb.v -o simv && ./simv
```

Any Verilog simulator that accepts the file list works the same way (for example `iverilog -c filelist.f ../tb/SYS_TOP_tb.v`, though that depends on the simulator's file-list support).

---

## Re-running the flow

The Tcl scripts contain absolute paths from the original workstation (`/home/ICer/system_top/...`). Edit the variables at the top of each script (`RTL_DIR`, `SYN_DIR`, `DFT_DIR`, library paths) before running. The licensed standard-cell `.db` libraries are **not** included.

Run order:

```
synthesis/scripts/syn_script.tcl
  → formality/rtl_vs_synthesis/scripts/fm_script.tcl
  → dft/scripts/DFT_script.tcl
  → formality/rtl_vs_dft/scripts/fm_script.tcl
  → gate-level simulation (TODO)
  → place and route (TODO)
```

The scripts use `glob $RTL_DIR/*.v`, which only sees a flat folder. Because the RTL is now organized in per-module subfolders, switch them to read `filelist.f` / `filelist_dft.f` or use `[exec find $RTL_DIR -name *.v]`.

---


## License

Released under the Eclipse Public License 2.0. See [LICENSE](LICENSE).
