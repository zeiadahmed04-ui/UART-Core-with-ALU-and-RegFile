###################################################################
################## Formality : RTL vs post-DFT netlist ############
###################################################################

set RTL_DIR "/home/ICer/system_top/rtl"
set DFT_DIR "/home/ICer/system_top/dft"

set SSLIB "/home/ICer/system_top/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/ICer/system_top/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/ICer/system_top/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

###################################################################
############################ Guidance #############################
###################################################################

set synopsys_auto_setup true

# The DFT script calls "set_svf System_Top.svf", so DC wrote its
# guidance into System_Top.svf (inside the dft folder)
set_svf $DFT_DIR/System_Top.svf

###################################################################
###################### Reference Container ########################
###################################################################

# Reference = DFT-ready RTL (SYS_TOP_dft.v, same ports as the netlist).
# Exclude the testbench AND the old SYS_TOP.v: both SYS_TOP.v and
# SYS_TOP_dft.v define module SYS_TOP, so reading both is a conflict.
set rtl_files [lsearch -all -inline -not -regexp [glob $RTL_DIR/*.v] {(_tb|/SYS_TOP)\.v$}]
read_verilog -container Ref $rtl_files

read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

set_reference_design Ref:/WORK/SYS_TOP
set_top Ref:/WORK/SYS_TOP

###################################################################
#################### Implementation Container #####################
###################################################################

# Implementation = post-DFT netlist ONLY.
# data_sync is now defined inside the netlist (analyze fix in DC), so
# the RTL data_sync.v workaround is removed (it would be a duplicate).
read_verilog -container Imp $DFT_DIR/System_Top.v

read_db -container Imp [list $SSLIB $TTLIB $FFLIB]

set_implementation_design Imp:/WORK/SYS_TOP
set_top Imp:/WORK/SYS_TOP

###################################################################
################### Functional (non-scan) mode ####################
###################################################################

# Prove DFT insertion did not change functional behaviour:
# test_mode = 0 selects the functional clocks/resets, SE = 0 keeps the
# scan flops in functional (D) mode. Must be done on BOTH sides,
# before "match".
set_constant -type port Ref:/WORK/SYS_TOP/test_mode 0
set_constant -type port Imp:/WORK/SYS_TOP/test_mode 0
set_constant -type port Imp:/WORK/SYS_TOP/SE 0

# Scan outputs only exist as real logic in the implementation; keep
# them out of the comparison (catch: ignore if a port is not found)
foreach i {0 1 2} {
    catch {set_dont_verify_point Imp:/WORK/SYS_TOP/SO\[$i\]}
}

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

report_guidance          > "guidance.rpt"
report_unmatched_points  > "unmatched_points.rpt"
report_passing_points    > "passing_points.rpt"
report_failing_points    > "failing_points.rpt"
report_aborted_points    > "aborted_points.rpt"
report_unverified_points > "unverified_points.rpt"

start_gui
