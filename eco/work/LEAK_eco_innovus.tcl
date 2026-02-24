# opt_signoff -leakage 
# set_db settings :
# 	 opt_signoff_fix_hold_with_margin 0.000
# 	 opt_signoff_eco_file_prefix "LEAK"
# 	 opt_signoff_verbose true
# 	 opt_signoff_read_eco_opt_db "ecoTimingDB"
# 	 opt_signoff_allow_multiple_incremental true
# =====================

report_resource
set_db eco_update_timing false
set_db eco_refine_place false 
set_db eco_prefix ESO
set_db eco_batch_mode true 
set_db eco_honor_dont_use false 
set_db eco_honor_dont_touch false 
set_db eco_honor_fixed_status false
catch { set_db eco_honor_fixed_wires false }
report_resource
set_db eco_batch_mode false
 
report_resource
set_db eco_update_timing true
set_db eco_refine_place true
set_db eco_prefix -reset
set_db eco_honor_dont_use true
set_db eco_honor_dont_touch true
set_db eco_honor_fixed_status true
set_db eco_honor_fixed_wires true
 
place_detail -eco true -hard_fence false
