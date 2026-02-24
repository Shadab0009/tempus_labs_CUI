# opt_signoff 
# set_db settings :
# 	 opt_signoff_eco_file_prefix "SETUP"
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
eco_add_repeater -cells BUF_X16 -name FE_ESOC5_n_2014 -hinst_guide RESULTS_CONV_INST -pins {  RESULTS_CONV_INST/p7139A29053/ZN } -relative_distance_to_sink 1 -location { 268.850000 348.600000 } -buffer_orient R0 
eco_add_repeater -cells BUF_X16 -name FE_ESOC6_n_253 -hinst_guide TDSP_CORE_INST/TDSP_CORE_GLUE_INST -pins {  TDSP_CORE_INST/TDSP_CORE_GLUE_INST/p7333D/ZN } -relative_distance_to_sink 1 -location { 229.140000 225.400000 } -buffer_orient R0 
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
