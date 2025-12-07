#set_distribute_host -local
set_multi_cpu_usage -local_cpu 1
set_db timing_disable_invalid_clock_check true
################################
# Load multiple scenario definitions
################################
read_mmmc ../scripts/view_definition_aocv.tcl

# 8269 instances
read_netlist "../../design/ECO_INIT_11_optSetup.enc.dat/dtmf_recvr_core.v.gz" -top dtmf_recvr_core
init_design 

################################
# Load netlist parasitics
################################
read_spef -rc_corner corner_worst_RCMAX "../../design/SPEF/corner_worst_RCMAX.spef.gz"
read_spef -rc_corner corner_worst_RCMIN "../../design/SPEF/corner_worst_RCMIN.spef.gz"

################################
# Check testcase size
################################
# MANUALLY TRANSLATE (WARN-14): Argument '-hier' for command 'get_cells' partially matches '-hierarchical'.
set cellCnt [sizeof_collection [get_cells -hierarchical *]]
puts "Your design has: $cellCnt instances"

################################
# Adjust timer settings
################################
# Turn on SI analysis
#set_db delaycal_enable_si true 
# Turn on glitch analysis
#set_db si_glitch_enable_report true

################################
# Read timing derates here if you have them
################################
set_timing_derate -delay_corner delay_corner_slow_RCMAX -cell_delay -data  -early 0.82
set_timing_derate -delay_corner delay_corner_slow_RCMAX -cell_delay -data  -late  1.01
set_timing_derate -delay_corner delay_corner_slow_RCMAX -cell_delay -clock -early 0.9
set_timing_derate -delay_corner delay_corner_slow_RCMAX -cell_delay -clock -late  1.1
set_timing_derate -delay_corner delay_corner_slow_RCMAX -net_delay  -data  -early 0.82
set_timing_derate -delay_corner delay_corner_slow_RCMAX -net_delay  -data  -late  1.01
set_timing_derate -delay_corner delay_corner_slow_RCMAX -net_delay  -clock -early 0.9
set_timing_derate -delay_corner delay_corner_slow_RCMAX -net_delay  -clock -late  1.1

puts "All done"

