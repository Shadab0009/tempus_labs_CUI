set_multi_cpu_usage -local_cpu 4
set_db delaycal_enable_si true

set_db timing_analysis_cppr both
source ../scripts/spef_new.tcl


report_analysis_summary -late > design_before_late.ECO.txt
report_analysis_summary -early > design_before_early.ECO.txt
report_timing -late -max_paths 10000000  -retime path_slew_propagation -path_type full_clock -split_delay -nworst 50 -max_slack 0 -analysis_summary_file preLeakage_pba.summary 
report_timing -early -max_paths 10000000  -retime path_slew_propagation -path_type full_clock -split_delay -nworst 50 -max_slack 0 -analysis_summary_file preLeakage_pba.early.summary 

set_db opt_signoff_check_type both ; set_db opt_signoff_pba_effort high
set_db opt_signoff_retime path_slew_propagation
set_db opt_signoff_nworst 1000
set_db opt_signoff_max_paths 10000000
set_db opt_signoff_max_slack 10
set_db opt_signoff_write_eco_opt_db ECO-PBA
write_eco_opt_db

# set standalone_scenario [all_setup_analysis_views]
write_db sta_fixed.enc -overwrite
