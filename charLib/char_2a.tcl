
set_supply -vdd 1.62 -gnd 0

# If TieHi or TieLo does not have both a pull up and pull down
# these envars cause the missing resistance to be very small. (default=1k ohm)
set_parm port_vdd_r 1
set_parm port_gnd_r 1

# This command will fail. 
# We want to emphasize that setting -cell_list -all is not recommended.
generate_cell_lib				\
  -vdd {vdd}					\
  -gnd {gnd vss}				\
  -synlib { ../library/stdCell.slow.lib }	\
  -cell_list -all				\ 
  -file_list { master.sp }			\
  -file generic_018u_125C_SS.cdB		

# There is a -text switch to generate_cell_lib that outputs information about the cdB to a file. 
# It is not an ascii representation of the cdB. We don't suggest you use it as standard
# every time you use make_cdb, but it's existence is worth noting
