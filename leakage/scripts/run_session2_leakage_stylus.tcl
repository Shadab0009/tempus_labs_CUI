source ../scripts/loadDesign_stylus.tcl
source ../scripts/spef_new.tcl
set_db delaycal_enable_si true
set_db timing_analysis_cppr both
set_multi_cpu_usage -local_cpu 8

set_db opt_signoff_verbose true
set_db opt_signoff_read_eco_opt_db ECO-PBA
set_db opt_signoff_swap_inst true ; set_db opt_signoff_optimize_sequential_cells true
set_db opt_signoff_optimize_core_only true
opt_signoff -leakage


