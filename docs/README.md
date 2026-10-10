# Documentation

Screenshots for each stage live in `images/<stage>/`. Suggested content:

| Folder | What to put there |
|--------|-------------------|
| `images/rtl/` | Block diagram, RTL waveforms from `tb/SYS_TOP_tb.v` |
| `images/lint_cdc/` | SpyGlass lint / CDC summary |
| `images/synthesis/` | Area, timing, power report snapshots |
| `images/dft/` | Scan chain report, DFT coverage |
| `images/formality/` | Verification succeeded / failing points screenshots |
| `images/gls/` | Gate-level waveforms |
| `images/pnr/` | Floorplan, placement, CTS, routed layout, final GDS view |

Embed an image in markdown like this:

```markdown
![Synthesis area report](images/synthesis/area.png)
```
