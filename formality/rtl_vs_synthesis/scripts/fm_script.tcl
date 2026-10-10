###################################################################
########################### Variables #############################
###################################################################

set RTL_DIR "/home/ICer/system_top/rtl"
set SYN_DIR "/home/ICer/system_top/sythesis"

set SSLIB "/home/ICer/system_top/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/ICer/system_top/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/ICer/system_top/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

###################################################################
############################ Guidance #############################
###################################################################

set synopsys_auto_setup true

# SVF written by Design Compiler (default.svf is the real one;
# System_Top.svf is empty, so do not use it)
set_svf $SYN_DIR/default.svf

###################################################################
###################### Reference Container ########################
###################################################################

# Reference = RTL (all RTL files except the testbench)
set rtl_files [lsearch -all -inline -not -regexp [glob $RTL_DIR/*.v] {_tb\.v$}]
read_verilog -container Ref $rtl_files

read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

set_reference_design Ref:/WORK/SYS_TOP
set_top Ref:/WORK/SYS_TOP

###################################################################
#################### Implementation Container #####################
###################################################################

# Implementation = synthesized netlist.
# NOTE: System_Top.v instantiates data_sync but does NOT define it
# (no "module data_sync" in the netlist), so the RTL definition is
# added here as a workaround. data_sync is therefore NOT really
# verified against synthesis. Regenerate the netlist from DC to fix.
read_verilog -container Imp [list $SYN_DIR/System_Top.v $RTL_DIR/data_sync.v]

read_db -container Imp [list $SSLIB $TTLIB $FFLIB]

set_implementation_design Imp:/WORK/SYS_TOP
set_top Imp:/WORK/SYS_TOP

###################################################################
###################### Matching Compare Points ####################
###################################################################

match

###################################################################
######################### Run Verification ########################
###################################################################

set successful [verify]

if {!$successful} {
    diagnose
    analyze_points -failing
}

###################################################################
########################### Reporting #############################
###################################################################

report_passing_points    > "passing_points.rpt"
report_failing_points    > "failing_points.rpt"
report_aborted_points    > "aborted_points.rpt"
report_unverified_points > "unverified_points.rpt"

start_gui
