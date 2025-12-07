set_multi_cpu_usage -local_cpu 4
set_db delaycal_enable_si true

set_db timing_analysis_cppr both

source ../scripts/spef_new.tcl

source eco_tempus.tcl
update_timing -full

report_analysis_summary -late > design_after_late.ECO.txt
report_analysis_summary -early > design_after_early.ECO.txt
report_timing -late -max_paths 10000000  -retime path_slew_propagation -path_type full_clock -split_delay -nworst 50 -max_slack 0 -analysis_summary_file postLeakage_pba.summary > postLeakage_pba.details
report_timing -early -max_paths 10000000  -retime path_slew_propagation -path_type full_clock -split_delay -nworst 50 -max_slack 0 -analysis_summary_file postLeakage_pba.early.summary 
