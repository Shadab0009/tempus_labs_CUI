################################################################
# Purpose:  Show a simple Tempus STA script
# Purpose:  Hightlight the order of operations and simple commands
# Author:   John Schritz   Sept 2013
################################################################

################################
# Setup threading and client counts
################################
set_multi_cpu_usage -local_cpu 8

################################
# Setup some global variables or report settings
################################
set_table_style -no_frame_fix_width -nosplit

################################
# Read the libraries
################################
read_libs     ../../libs/liberty/FreePDK45_lib_v1.0_worst.lib
read_libs     ../../libs/MACRO/LIBERTY/pllclk.lib
read_libs     ../../libs/MACRO/LIBERTY/ram_256x16A.lib   ../../libs/MACRO/LIBERTY/rom_512x16A.lib

################################
# Read the netlist in a gzipped format
################################
read_netlist "../../design/ECO_INIT_11_optSetup.enc.dat/dtmf_recvr_core.v.gz" -top dtmf_recvr_core
init_design 

################################
# Check how big the tescase is
################################
set cellCnt [sizeof_collection [get_cells -hierarchical *]]
puts "Your design has: $cellCnt instances"

################################
# Load parasitics
################################
read_spef  ../../design/SPEF/corner_worst_CMAX.spef.gz

################################
# Add constraints
################################
read_sdc ../../design/dtmf_recvr_core.pr.sdc

###################################
# Run reports
###################################
report_timing 


