source ../scripts/loadDesign_DMMMC.tcl
source ../scripts/spef.tcl
set_db delaycal_enable_si true

set_db opt_signoff_verbose true
set_db opt_signoff_read_eco_opt_db ecoTimingDB
set_db opt_signoff_resize_inst true

opt_signoff -drv 

select_obj [get_db insts *ESOC*]
