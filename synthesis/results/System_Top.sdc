###################################################################

# Created by write_sdc on Sat Oct 10 03:43:48 2026

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -max_library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -min scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c -min_library scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports RX_IN]
set_load -pin_load 0.1 [get_ports TX_OUT]
set_load -pin_load 0.1 [get_ports parity_error]
set_load -pin_load 0.1 [get_ports stop_error]
create_clock [get_ports REF_CLK]  -name REF_CLOCK  -period 20  -waveform {0 10}
set_clock_latency 0  [get_clocks REF_CLOCK]
set_clock_uncertainty -setup 0.2  [get_clocks REF_CLOCK]
set_clock_uncertainty -hold 0.1  [get_clocks REF_CLOCK]
set_clock_transition -max -rise 0.05 [get_clocks REF_CLOCK]
set_clock_transition -min -rise 0.05 [get_clocks REF_CLOCK]
set_clock_transition -max -fall 0.05 [get_clocks REF_CLOCK]
set_clock_transition -min -fall 0.05 [get_clocks REF_CLOCK]
create_clock [get_ports UART_CLK]  -name UART_CLOCK  -period 271.297  -waveform {0 135.648}
set_clock_latency 0  [get_clocks UART_CLOCK]
set_clock_uncertainty -setup 0.2  [get_clocks UART_CLOCK]
set_clock_uncertainty -hold 0.1  [get_clocks UART_CLOCK]
set_clock_transition -max -rise 0.05 [get_clocks UART_CLOCK]
set_clock_transition -min -rise 0.05 [get_clocks UART_CLOCK]
set_clock_transition -max -fall 0.05 [get_clocks UART_CLOCK]
set_clock_transition -min -fall 0.05 [get_clocks UART_CLOCK]
create_generated_clock [get_pins u_clk_gate/ECK]  -name ALU_CLK  -source [get_ports REF_CLK]  -master_clock REF_CLOCK  -divide_by 1  -add
set_clock_uncertainty -setup 0.2  [get_clocks ALU_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks ALU_CLK]
create_generated_clock [get_pins u_uart_rx/clk]  -name RX_CLK  -source [get_ports UART_CLK]  -master_clock UART_CLOCK  -divide_by 1  -add
set_clock_uncertainty -setup 0.2  [get_clocks RX_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks RX_CLK]
create_generated_clock [get_pins u_clk_divider/o_div_clk]  -name TX_CLK  -source [get_ports UART_CLK]  -master_clock UART_CLOCK  -divide_by 32  -add
set_clock_uncertainty -setup 0.2  [get_clocks TX_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks TX_CLK]
group_path -name INOUT  -from [list [get_ports REF_CLK] [get_ports UART_CLK] [get_ports RST] [get_ports RX_IN]]  -to [list [get_ports TX_OUT] [get_ports parity_error] [get_ports stop_error]]
group_path -name INREG  -from [list [get_ports REF_CLK] [get_ports UART_CLK] [get_ports RST] [get_ports RX_IN]]
group_path -name REGOUT  -to [list [get_ports TX_OUT] [get_ports parity_error] [get_ports stop_error]]
set_input_delay -clock UART_CLOCK  54.2594  [get_ports RX_IN]
set_output_delay -clock TX_CLK  1736.3  [get_ports TX_OUT]
set_output_delay -clock UART_CLOCK  54.2594  [get_ports parity_error]
set_output_delay -clock UART_CLOCK  54.2594  [get_ports stop_error]
set_clock_groups -asynchronous -name REF_CLOCK_1 -group [list [get_clocks REF_CLOCK] [get_clocks ALU_CLK]] -group [list [get_clocks UART_CLOCK] [get_clocks RX_CLK] [get_clocks TX_CLK]]
