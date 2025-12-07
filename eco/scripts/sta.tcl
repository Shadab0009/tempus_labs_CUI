source ../scripts/spef.tcl
set_db delaycal_enable_si true


report_constraint -all_violators  > rep.vio.gz
report_analysis_coverage > rep.coverage
report_timing -path_type endpoint -fields {endpoint capture_data_edge slack view} -max_slack 0 > setup.rpt
report_timing -path_type endpoint -fields {endpoint capture_data_edge slack view} -max_slack 0 -early > hold.rpt

report_timing_summary > timing_summary

write_eco_opt_db
