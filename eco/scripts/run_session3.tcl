# For LSF, uncomment and use this setting...
#set_multi_cpu_usage -local_cpu 8 -cpu_per_remote_host 8 -remote_host 2
#set_distributed_hosts -lsf

#For some Cadence classrooms or machines with single CPUs, uncomment and use this setting...
set_distributed_hosts -local
set_multi_cpu_usage -local_cpu 8 -cpu_per_remote_host 8 -remote_host 2

distribute_read_design -design_script ../scripts/loadDesign_DMMMC_postECO.tcl -out_dir sta_postECO


distribute_views -views [list func_slow_CMAX func_slow_RCMAX func_fast_RCMAX func_slow_RMAX func_fast_RMAX func_slow_CMIN func_fast_CMIN func_slow_RCMIN func_fast_RCMIN func_slow_RMIN func_fast_RMIN scan_slow_CMAX scan_fast_CMAX scan_slow_RCMAX scan_fast_RCMAX scan_slow_RMAX scan_fast_RMAX scan_slow_CMIN scan_fast_CMIN scan_slow_RCMIN scan_fast_RCMIN scan_slow_RMIN scan_fast_RMIN test_slow_CMAX test_fast_CMAX test_slow_RCMAX test_fast_RCMAX test_slow_RMAX test_fast_RMAX test_slow_CMIN test_fast_CMIN test_slow_RCMIN test_fast_RCMIN test_slow_RMIN test_fast_RMIN] -script ../scripts/sta_postECO.tcl

foreach mtarpt_file [glob -nocomplain sta_postECO/*/design_before_early.mtarpt.gz] {
            read_timing_debug_report -name before_early $mtarpt_file}
analyze_paths_by_view
write_category_summary category_before_early.rpt


gui_show


suspend

foreach mtarpt_file [glob -nocomplain sta_postECO/*/design_before_late.mtarpt.gz] {
            read_timing_debug_report -name before_late $mtarpt_file}
analyze_paths_by_view
write_category_summary category_before_late.rpt

