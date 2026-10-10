###################################################################

# Created by write_sdc on Sat Oct 10 06:27:50 2026

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -max_library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -min scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c -min_library scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports SE]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {SI[3]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {SI[2]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {SI[1]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {SI[0]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports UART_RX_IN]
set_load -pin_load 0.1 [get_ports {SO[3]}]
set_load -pin_load 0.1 [get_ports {SO[2]}]
set_load -pin_load 0.1 [get_ports {SO[1]}]
set_load -pin_load 0.1 [get_ports {SO[0]}]
set_load -pin_load 0.1 [get_ports UART_TX_O]
set_load -pin_load 0.1 [get_ports parity_error]
set_load -pin_load 0.1 [get_ports framing_error]
set_case_analysis 1 [get_ports test_mode]
create_clock [get_ports scan_clk]  -name SCAN_CLK  -period 100  -waveform {0 50}
set_clock_latency 0  [get_clocks SCAN_CLK]
set_clock_uncertainty -setup 0.2  [get_clocks SCAN_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks SCAN_CLK]
set_clock_transition -min -fall 0.05 [get_clocks SCAN_CLK]
set_clock_transition -max -fall 0.05 [get_clocks SCAN_CLK]
set_clock_transition -min -rise 0.05 [get_clocks SCAN_CLK]
set_clock_transition -max -rise 0.05 [get_clocks SCAN_CLK]
create_clock [get_ports REF_CLK]  -name REF_CLOCK  -period 20  -waveform {0 10}
set_clock_latency 0  [get_clocks REF_CLOCK]
set_clock_uncertainty -setup 0.2  [get_clocks REF_CLOCK]
set_clock_uncertainty -hold 0.1  [get_clocks REF_CLOCK]
set_clock_transition -min -fall 0.05 [get_clocks REF_CLOCK]
set_clock_transition -max -fall 0.05 [get_clocks REF_CLOCK]
set_clock_transition -min -rise 0.05 [get_clocks REF_CLOCK]
set_clock_transition -max -rise 0.05 [get_clocks REF_CLOCK]
create_clock [get_ports UART_CLK]  -name UART_CLOCK  -period 271.297  -waveform {0 135.648}
set_clock_latency 0  [get_clocks UART_CLOCK]
set_clock_uncertainty -setup 0.2  [get_clocks UART_CLOCK]
set_clock_uncertainty -hold 0.1  [get_clocks UART_CLOCK]
set_clock_transition -min -fall 0.05 [get_clocks UART_CLOCK]
set_clock_transition -max -fall 0.05 [get_clocks UART_CLOCK]
set_clock_transition -min -rise 0.05 [get_clocks UART_CLOCK]
set_clock_transition -max -rise 0.05 [get_clocks UART_CLOCK]
create_generated_clock [get_pins u_clk_gate/ECK]  -name ALU_CLK  -source [get_ports REF_CLK]  -master_clock REF_CLOCK  -divide_by 1  -add
set_clock_uncertainty -setup 0.2  [get_clocks ALU_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks ALU_CLK]
create_generated_clock [get_pins u_uart_rx/clk]  -name RX_CLK  -source [get_ports UART_CLK]  -master_clock UART_CLOCK  -divide_by 1  -add
set_clock_uncertainty -setup 0.2  [get_clocks RX_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks RX_CLK]
create_generated_clock [get_pins u_clk_divider/o_div_clk]  -name TX_CLK  -source [get_ports UART_CLK]  -master_clock UART_CLOCK  -divide_by 32  -add
set_clock_uncertainty -setup 0.2  [get_clocks TX_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks TX_CLK]
group_path -name INOUT  -from [list [get_ports scan_clk] [get_ports scan_rst] [get_ports test_mode] [get_ports SE] [get_ports {SI[3]}] [get_ports {SI[2]}] [get_ports {SI[1]}] [get_ports {SI[0]}] [get_ports RST_N] [get_ports UART_CLK] [get_ports REF_CLK] [get_ports UART_RX_IN]]  -to [list [get_ports {SO[3]}] [get_ports {SO[2]}] [get_ports {SO[1]}] [get_ports {SO[0]}] [get_ports UART_TX_O] [get_ports parity_error] [get_ports framing_error]]
group_path -name INREG  -from [list [get_ports scan_clk] [get_ports scan_rst] [get_ports test_mode] [get_ports SE] [get_ports {SI[3]}] [get_ports {SI[2]}] [get_ports {SI[1]}] [get_ports {SI[0]}] [get_ports RST_N] [get_ports UART_CLK] [get_ports REF_CLK] [get_ports UART_RX_IN]]
group_path -name REGOUT  -to [list [get_ports {SO[3]}] [get_ports {SO[2]}] [get_ports {SO[1]}] [get_ports {SO[0]}] [get_ports UART_TX_O] [get_ports parity_error] [get_ports framing_error]]
set_input_delay -clock SCAN_CLK  20  [get_ports SE]
set_input_delay -clock SCAN_CLK  20  [get_ports {SI[3]}]
set_input_delay -clock SCAN_CLK  20  [get_ports {SI[2]}]
set_input_delay -clock SCAN_CLK  20  [get_ports {SI[1]}]
set_input_delay -clock SCAN_CLK  20  [get_ports {SI[0]}]
set_input_delay -clock UART_CLOCK  54.2594  [get_ports UART_RX_IN]
set_output_delay -clock SCAN_CLK  20  [get_ports {SO[3]}]
set_output_delay -clock SCAN_CLK  20  [get_ports {SO[2]}]
set_output_delay -clock SCAN_CLK  20  [get_ports {SO[1]}]
set_output_delay -clock SCAN_CLK  20  [get_ports {SO[0]}]
set_output_delay -clock TX_CLK  1736.3  [get_ports UART_TX_O]
set_output_delay -clock UART_CLOCK  54.2594  [get_ports parity_error]
set_output_delay -clock UART_CLOCK  54.2594  [get_ports framing_error]
set_clock_groups -asynchronous -name REF_CLOCK_1 -group [list [get_clocks REF_CLOCK] [get_clocks ALU_CLK]] -group [list [get_clocks UART_CLOCK] [get_clocks RX_CLK] [get_clocks TX_CLK]] -group [get_clocks SCAN_CLK]
