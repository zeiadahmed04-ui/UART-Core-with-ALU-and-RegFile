
########################### Define Top Module ############################
                                                   
set top_module SYS_TOP


##################### Define Working Library Directory ######################
                                                   
define_design_lib work -path ./work

################## Design Compiler Library Files #setup ######################

puts "###########################################"
puts "#      #setting Design Libraries           #"
puts "###########################################"

#Add the path of the libraries to the search_path variable
lappend search_path /home/ICer/system_top/std_cells
lappend search_path /home/ICer/system_top/rtl

set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

## Standard Cell libraries 
set target_library [list $SSLIB $TTLIB $FFLIB]

## Standard Cell & Hard Macros libraries 
set link_library [list * $SSLIB $TTLIB $FFLIB]  

######################## Reading RTL Files #################################

puts "###########################################"
puts "#             Reading RTL Files           #"
puts "###########################################"

set file_format verilog
set_svf System_Top.svf 

read_file -format $file_format ALU_top.v
read_file -format $file_format ARITHMETIC_UNIT.v
read_file -format $file_format ASYNC_FIFO_TOP.v
read_file -format $file_format clk_divider.v
read_file -format $file_format CMP_UNIT.v
read_file -format $file_format Data_Sampling.v
read_file -format $file_format data_sync.v
read_file -format $file_format Decoder.v
read_file -format $file_format deserializer.v
read_file -format $file_format DF_SYNC.v
read_file -format $file_format edge_bit_counter.v
read_file -format $file_format FIFO_MEM_CNTRL.v
read_file -format $file_format FIFO_RD.v
read_file -format $file_format FIFO_WR.v
read_file -format $file_format FSM.v
read_file -format $file_format Fsm_tx.v
read_file -format $file_format LOGIC_UNIT.v
read_file -format $file_format Mux_4x1.v
read_file -format $file_format out_mux.v
read_file -format $file_format Parity_cal.v
read_file -format $file_format parity_check.v
read_file -format $file_format PULSE_GEN.v
read_file -format $file_format regfile.v
read_file -format $file_format rst_sych.v
read_file -format $file_format Serilizer.v
read_file -format $file_format SHIFT_UNIT.v
read_file -format $file_format start_check.v
read_file -format $file_format Stop_check.v
read_file -format $file_format system_fsm.v
read_file -format $file_format SYS_TOP.v
read_file -format $file_format Top.v
read_file -format $file_format UART_TX_Top.v
###################### Defining toplevel ###################################

current_design $top_module

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## Liniking All The Design Parts ########"
puts "###############################################"

link 

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## checking design consistency ##########"
puts "###############################################"

check_design

############################### Path groups ################################
puts "###############################################"
puts "################ Path groups ##################"
puts "###############################################"

group_path -name INREG -from [all_inputs]
group_path -name REGOUT -to [all_outputs]
group_path -name INOUT -from [all_inputs] -to [all_outputs]

#################### Define Design Constraints #########################
puts "###############################################"
puts "############ Design Constraints #### ##########"
puts "###############################################"

# Constraints
# ----------------------------------------------------------------------------
#
# 1. Master Clock Definitions
#
# 2. Generated Clock Definitions
#
# 3. Clock Uncertainties
#
# 4. Clock Latencies 
#
# 5. Clock Relationships
#
# 6. set input/output delay on ports
#
# 7. Driving cells
#
# 8. Output load

####################################################################################
           #########################################################
                  #### Section 1 : Clock Definition ####
           #########################################################
#################################################################################### 
# 1. Master Clock Definitions 
# 2. Generated Clock Definitions
# 3. Clock Latencies
# 4. Clock Uncertainties
# 4. Clock Transitions
####################################################################################

set CLK_NAME0 REF_CLOCK
set CLK_NAME1 UART_CLOCK


set CLK_REF_PER 20
set CLK_UART_PER 271.2968 


set CLK_SETUP_SKEW 0.2
set CLK_HOLD_SKEW 0.1
set CLK_LAT 0
set CLK_RISE 0.05
set CLK_FALL 0.05


set ALU_CLK_PER [expr $CLK_REF_PER * 1]
set RX_CLK_PER [expr $CLK_UART_PER * 1]
set TX_CLK_PER [expr $CLK_UART_PER * 32]




create_clock -name $CLK_NAME0 -period $CLK_REF_PER -waveform "0 [expr $CLK_REF_PER/2]" [get_ports REF_CLK]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $CLK_NAME0]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks $CLK_NAME0]
set_clock_transition -rise $CLK_RISE  [get_clocks $CLK_NAME0]
set_clock_transition -fall $CLK_FALL  [get_clocks $CLK_NAME0]
set_clock_latency $CLK_LAT [get_clocks $CLK_NAME0]


create_clock -name $CLK_NAME1 -period $CLK_UART_PER -waveform "0 [expr $CLK_UART_PER/2]" [get_ports UART_CLK]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $CLK_NAME1]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks $CLK_NAME1]
set_clock_transition -rise $CLK_RISE  [get_clocks $CLK_NAME1]
set_clock_transition -fall $CLK_FALL  [get_clocks $CLK_NAME1]
set_clock_latency $CLK_LAT [get_clocks $CLK_NAME1]


create_generated_clock -name "ALU_CLK" -master_clock $CLK_NAME0 -source [get_ports REF_CLK] \
                       -divide_by 1  [get_pins u_clk_gate/ECK]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks ALU_CLK]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks ALU_CLK]

create_generated_clock -name "RX_CLK" -master_clock $CLK_NAME1 -source [get_ports UART_CLK] \
                       -divide_by 1 [get_pins u_uart_rx/clk]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks RX_CLK]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks RX_CLK]

create_generated_clock -name "TX_CLK" -master_clock $CLK_NAME1 -source [get_ports UART_CLK] \
                       -divide_by 32 [get_pins u_clk_divider/o_div_clk]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks TX_CLK]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks TX_CLK]


set_clock_groups -asynchronous -group [get_clocks {REF_CLOCK ALU_CLK}] \
                               -group [get_clocks {UART_CLOCK RX_CLK TX_CLK}]

					   
set_dont_touch_network [get_clocks {REF_CLOCK UART_CLOCK ALU_CLK RX_CLK TX_CLK}]
set_dont_touch_network [get_ports RST]



####################################################################################
           #########################################################
             #### Section 3 : set input/output delay on ports ####
####################################################################################
####################################################################################

set in1_delay  [expr 0.2*$TX_CLK_PER]
set out1_delay [expr 0.2*$TX_CLK_PER]

set in2_delay  [expr 0.2*$CLK_UART_PER]
set out2_delay [expr 0.2*$CLK_UART_PER]




#Constrain Input Paths
set_input_delay $in2_delay -clock UART_CLOCK [get_port RX_IN]

#Constrain Output Paths
set_output_delay $out1_delay -clock TX_CLK [get_port TX_OUT]
set_output_delay $out2_delay -clock UART_CLOCK [get_port parity_error]
set_output_delay $out2_delay -clock UART_CLOCK [get_port stop_error]

####################################################################################
           #########################################################
                  #### Section 4 : Driving cells ####
           #########################################################
####################################################################################

set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port RX_IN]

####################################################################################
           #########################################################
                  #### Section 5 : Output load ####
           #########################################################
####################################################################################

set_load 0.1 [get_port TX_OUT]
set_load 0.1 [get_port parity_error]
set_load 0.1 [get_port stop_error]

####################################################################################
           #########################################################
                 #### Section 6 : Operating Condition ####
           #########################################################
####################################################################################

# Define the Worst Library for Max(#setup) analysis
# Define the Best Library for Min(hold) analysis

set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" \
                         -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" \
			 -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" \
			 -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

####################################################################################
           #########################################################
                  #### Section 7 : wireload Model ####
           #########################################################
####################################################################################


####################################################################################
           #########################################################
                  #### Section 8 : multicycle path ####
           #########################################################
####################################################################################


####################################################################################
           #########################################################
                  #### Section 9 : Premapped Cells ####
           #########################################################
####################################################################################


###################### Mapping and optimization ########################
puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"

compile 

#############################################################################
# Write out Design after initial compile
#############################################################################

write_file -format verilog -hierarchy -output System_Top.v
write_file -format ddc -hierarchy -output System_Top.ddc
write_sdc  -nosplit System_Top.sdc
write_sdf           System_Top.sdf

################# reporting #######################

report_area -hierarchy > area.rpt
report_power -hierarchy > power.rpt
report_timing -max_paths 100 -delay_type min > hold.rpt
report_timing -max_paths 100 -delay_type max > setup.rpt
report_clock -attributes > clocks.rpt
report_constraint -all_violators > constraints.rpt

################# starting graphical user interface #######################

gui_start

#exit
