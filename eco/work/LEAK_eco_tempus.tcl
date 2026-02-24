# opt_signoff -leakage 
# set_db settings :
# 	 opt_signoff_fix_hold_with_margin 0.000
# 	 opt_signoff_eco_file_prefix "LEAK"
# 	 opt_signoff_verbose true
# 	 opt_signoff_read_eco_opt_db "ecoTimingDB"
# 	 opt_signoff_allow_multiple_incremental true
# =====================

report_resource
set_db eco_eso_mode true
set_db eco_prefix ESO
report_resource
set_db eco_eso_mode false
 
report_resource
set_db eco_prefix -reset
 
