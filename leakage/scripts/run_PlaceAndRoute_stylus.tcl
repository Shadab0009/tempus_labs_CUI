read_db ../../design/for_Tempus_leakage.enc.dat 
# defIn "../design_PBA/new.def.gz"

set_multi_cpu_usage -local_cpu 16

source eco_innovus.tcl
ecoRoute
set_db extract_rc_coupled true
extract_parasitics

write_parasitics -rc_corner corner_worst_CMAX -spef_file new_ECO_CMAX.spef
write_parasitics -rc_corner corner_worst_RMAX -spef_file new_ECO_RMAX.spef
write_parasitics -rc_corner corner_worst_RCMAX -spef_file new_ECO_RCMAX.spef
write_parasitics -rc_corner corner_worst_CMIN -spef_file new_ECO_CMIN.spef
write_parasitics -rc_corner corner_worst_RMIN -spef_file new_ECO_RMIN.spef
write_parasitics -rc_corner corner_worst_RCMIN -spef_file new_ECO_RCMIN.spef

write_netlist new_PnR.v.gz
# defOut -routing -netlist -floorplan new_PnR.def.gz

exit
