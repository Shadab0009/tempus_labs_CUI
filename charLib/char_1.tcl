# Set holding resistance to 1 ohm for cells that only output in 1 direction. 
# This is needed for tie hi/lo cells
set_parm port_gnd_r 1
set_parm port_vdd_r 1

set_supply -vdd 3.3 -gnd 0

generate_cell_lib			\
  -vdd {vdd}				\
  -gnd {gnd}				\
  -synlib { simple_timing.lib }		\
  -cell_list { INV }			\
  -file_list { simple_gates.sp 		\
               simple_transistors.sp }	\
  -file foundry_process_temp_cond.cdB	\
  -filler_list { ANT }				

# filler_list contains cells with no transistors

validate_cell_lib -cdb foundry_process_temp_cond.cdB
