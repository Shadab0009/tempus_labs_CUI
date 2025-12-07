set_run_mode -process 180nm

set_supply -vdd 1.62 -gnd 0

# If TieHi or TieLo does not have both a pull up and pull down
# these envars cause the missing resistance to be very small. (default=1k ohm)
set_parm port_vdd_r 1
set_parm port_gnd_r 1

generate_cell_lib				\
  -synlib { ../library/stdCell.slow.lib }	\
  -vdd {vdd}					\
  -gnd {gnd vss}				\
  -cell_list { 					\
	ADDFHX2
	AND2X1
	AOI211X1
	BUFX12
	DFFX1
	TIEHI
	TIELO
	 } 					\
  -file_list { master.sp }			\
  -file generic_018u_125C_SS.cdB		

