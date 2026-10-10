# RTL

One folder per module, sub-modules nested inside their parent (mirrors the instantiation hierarchy).

```
SYS_TOP/                 SYS_TOP.v (functional top), SYS_TOP_dft.v (DFT-ready top)
SYS_CTRL/                system_fsm.v
regfile/
ALU_TOP/                 ALU_top.v
  ARITHMETIC_UNIT/  CMP_UNIT/  LOGIC_UNIT/  SHIFT_UNIT/  DECODER/  mux4x1/ (out_mux.v)
ASYNC_FIFO_TOP/          ASYNC_FIFO_TOP.v
  FIFO_WR/  FIFO_RD/  FIFO_MEM_CNTRL/  DF_SYNC/
UART_RX_Top/             Top.v
  fsm/ (FSM.v)  edge_bit_counter/  Data_Sampling/  deserializer/
  start_check/  parity_check/  Stop_check/
UART_TX_Top/             UART_TX_Top.v
  Fsm_tx/  Serializer/ (Serilizer.v)  parity_cal/ (Parity_cal.v)  Mux_4x1/
clk_divider/  rst_sych/  data_sync/  PULSE_GEN/
CLK_GATE/  mux2x1/       present but not instantiated by SYS_TOP.v
```

Folder name = module name. Original file names are unchanged.
The testbench is in `../tb/`.

## Tool file lists

- `filelist.f`     functional flow (everything except `SYS_TOP_dft.v`)
- `filelist_dft.f` DFT flow (everything except `SYS_TOP.v`)

`SYS_TOP.v` and `SYS_TOP_dft.v` both define `SYS_TOP`; never read both.

Example: `vcs -f filelist.f ../tb/SYS_TOP_tb.v`

The old Design Compiler / Formality scripts use `glob $RTL_DIR/*.v`, which only sees a flat folder.
Switch them to read the file lists (e.g. `read_verilog [lsearch ...]` over the lines of `filelist.f`) or use `[exec find $RTL_DIR -name *.v]`.
