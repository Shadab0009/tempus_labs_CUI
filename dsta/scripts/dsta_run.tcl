set design              doppler
set clientCnt           2
set clientThreadCnt     1
set masterThreadCnt     1

if {[info command distribute_partition] != "" } {
puts "You are starting Tempus in DSTA mode"
}

##################################
# DSTA part 1 set threading and start clients
##################################
set_multi_cpu_usage -local_cpu $masterThreadCnt -cpu_per_remote_host $clientThreadCnt -remote_host $clientCnt

#set_distributed_hosts -lsf
set_distributed_hosts -lsf -queue lnx64 -time_out 30 -shell_timeout 60

#set_distributed_hosts -local

distribute_start_clients

read_libs ../../libs/MACRO/LIBERTY/pllclk.lib
read_libs ../../libs/MACRO/LIBERTY/rom_512x16A.lib
read_libs ../../libs/MACRO/LIBERTY/ram_256x16A.lib
read_libs ../../libs/liberty/FreePDK45_lib_v1.0_typical_scan.lib
read_libs ../../libs/liberty/FreePDK45_lib_v1.0_worst.lib
read_libs ../../libs/liberty/FreePDK45_lib_v1.0_typical.lib

####
read_mmmc ../../cmmmc/scripts/view_definition.tcl
####

 # 8269 instances
read_netlist "../../design/ECO_INIT_11_optSetup.enc.dat/dtmf_recvr_core.v.gz" -top dtmf_recvr_core
init_design 

################################
# Check how big the tescase is
################################
set cellCnt [sizeof_collection [get_cells -hierarchical *]]
puts "Your design has: $cellCnt instances"

################################
# Read in the spef files
################################
read_spef -rc_corner corner_worst_RCMAX {../../design/SPEF/corner_worst_RCMAX.spef.gz}
read_spef -rc_corner corner_worst_RCMIN {../../design/SPEF/corner_worst_RCMIN.spef.gz}

##################################
# DSTA part 2 send the design to the clients
##################################
distribute_partition

################################
# Turn on SI analysis
################################
set_db delaycal_enable_si true

################################
# Calculate the timing results
################################
report_timing 

################################
# Create reports
################################
report_constraint -all_violators                            > all_vio.rpt
report_analysis_coverage                                    > coverage.rpt
report_timing -late -max_slack 0 -max_paths 100             > setup_100.rpt.gz
report_timing -early -max_slack 0 -max_paths 100            > hold_100.rpt.gz

distribute_print_client_usage
