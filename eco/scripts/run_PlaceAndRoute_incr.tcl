read_db ../../design/ECO_INIT_11_optSetup.enc.dat

set_db extract_rc_coupled true ; set_db extract_rc_engine post_route ; set_db extract_rc_effort_level low
set_multi_cpu_usage -local_cpu 8 -cpu_per_remote_host 8 -remote_host 2
extract_rc

source DRV_eco_innovus.tcl
source SETUP_eco_innovus.tcl
source HOLD_eco_innovus.tcl
source LEAK_eco_innovus.tcl

route_eco
extract_rc

write_db -verilog ECO_INIT_11_optSetup_postECO.enc
write_def -floorplan -netlist -routing -io_row  ECO_INIT_11_optSetup_postECO.def


set fpw2 [open spef_after.tcl w]
if {[file exists SPEF_AFTER]==0} {catch [exec mkdir SPEF_AFTER]}
foreach rc [all_rc_corners] {
    write_parasitics -rc_corner $rc -spef_file SPEF_AFTER/$rc.spef.gz
    puts $fpw2 "read_spef -rc_corner $rc SPEF_AFTER/$rc.spef.gz"}
close $fpw2
