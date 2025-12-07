# Set holding resistance to 1 ohm for cells that only output in 1 direction. 
# This is needed for tie hi/lo cells
set_parm port_gnd_r 1
set_parm port_vdd_r 1

set_supply -vdd 3.3 -gnd 0
read_dotlib  simple_timing.lib

generate_cell_lib			\
  -vdd {vdd}				\
  -gnd {gnd}				\
  -cell_list { INV }			\
  -file_list { simple_gates.sp 		\
               simple_transistors.sp }	\
  -file lab1_kr.sp	\
  -text \
  -ecsm_si
  -filler_list { ANT }				

# filler_list contains cells with no transistors


