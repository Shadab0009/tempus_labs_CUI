##################################################
# Initialization Flow-  MMMC Mode-  Timing Step
##################################################
read_mmmc ../scripts/view_definition.tcl 

##################################################
# Initialization Flow-  MMMC Mode-  Physical Step
##################################################
#read_physical -lef {../../libs/lef/FreePDK45_lib_v1.0.lef ../../libs/MACRO/LEF/pllclk.lef ../../libs/MACRO/LEF/ram_256X16A.lef ../../libs/MACRO/LEF/rom_512x16A.lef}

#####################################################################
## Initialization Flow-  MMMC Mode-  Design Setup --> Load netlist 
#####################################################################
read_netlist ../../design/ECO_INIT_11_optSetup.enc.dat/dtmf_recvr_core.v.gz -top dtmf_recvr_core

##################################################
# Initialization Flow-  MMMC Mode-  Init Step
##################################################
init_design

################################
# Load netlist parasitics
################################
read_spef -rc_corner corner_worst_RCMAX ../../design/SPEF/corner_worst_RCMAX.spef.gz
read_spef -rc_corner corner_worst_RCMIN ../../design/SPEF/corner_worst_RCMIN.spef.gz

#########################
# Load Noise Setting
#########################
set_db delaycal_enable_si true
set_db si_glitch_enable_report true

############################################
# Read timing derates here if you have them
############################################
set_timing_derate -delay_corner delay_corner_slow_RCMAX -cell_delay -data  -early 0.82
set_timing_derate -delay_corner delay_corner_slow_RCMAX -cell_delay -data  -late  1.01
set_timing_derate -delay_corner delay_corner_slow_RCMAX -cell_delay -clock -early 0.9
set_timing_derate -delay_corner delay_corner_slow_RCMAX -cell_delay -clock -late  1.1
set_timing_derate -delay_corner delay_corner_slow_RCMAX -net_delay  -data  -early 0.82
set_timing_derate -delay_corner delay_corner_slow_RCMAX -net_delay  -data  -late  1.01
set_timing_derate -delay_corner delay_corner_slow_RCMAX -net_delay  -clock -early 0.9
set_timing_derate -delay_corner delay_corner_slow_RCMAX -net_delay  -clock -late  1.1

################################
# Calculate the timing results
################################
set_db timing_sdf_adjust_negative_setuphold true
update_timing -full

###################################
# Run a whole list of report examples
###################################
report_resource -start my_report_list
source ../scripts/reports.tcl

