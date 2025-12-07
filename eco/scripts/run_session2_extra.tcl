source ../scripts/loadDesign_DMMMC.tcl

set_db delaycal_enable_si true
source ../scripts/spef.tcl
set_db opt_signoff_verbose true
set_db opt_signoff_hold_target_slack 0.5
set_db opt_signoff_read_eco_opt_db ecoTimingDB

opt_signoff -hold

select_obj [get_db insts *ESOC*]

