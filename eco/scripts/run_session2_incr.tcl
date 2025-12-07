source ../scripts/loadDesign_DMMMC.tcl

set_db delaycal_enable_si true

set_db opt_signoff_verbose true
set_db opt_signoff_read_eco_opt_db ecoTimingDB
source ../scripts/spef.tcl

set_db opt_signoff_allow_multiple_incremental true
set_db opt_signoff_eco_file_prefix DRV
opt_signoff -drv
set_db opt_signoff_eco_file_prefix SETUP
opt_signoff -setup
set_db opt_signoff_fix_hold_with_margin 0.3
set_db opt_signoff_eco_file_prefix HOLD
opt_signoff -hold

set_db opt_signoff_eco_file_prefix LEAK
opt_signoff -leakage

select_obj [get_db insts *ESOC*]

