### Change these settings if needed based on your machine setup

#this is for LSF using bsub
set_multi_cpu_usage -local_cpu 2 -cpu_per_remote_host 2 -remote_host 3
set_distributed_hosts -lsf

## Use this if you are using local machines only.
#set_multi_cpu_usage -local_cpu 2 -cpu_per_remote_host 2 -remote_host 2
#set_distributed_hosts -local

###
### Do NOT touch anything below for this lab design run...
###
distribute_read_design -design_script ../scripts/loadDesign_DMMMC.tcl -out_dir sta

distribute_views -views [list  \
  func_fast_RCMAX  \
  func_slow_RCMAX  \
  func_fast_RCMIN  \
  func_slow_RCMIN  \
  scan_fast_RCMAX  \
  scan_slow_RCMAX  \
  scan_fast_RCMIN  \
  scan_slow_RCMIN  \
  ] -script ../scripts/sta.tcl

### Uncomment and source this into Tempus for the merged timing report.
# merge_timing_reports -view_dirs [list func_fast_RCMAX func_slow_RCMAX func_fast_RCMIN func_slow_RCMIN scan_fast_RCMAX scan_slow_RCMAX scan_fast_RCMIN scan_slow_RCMIN] -base_report design_before_early.mtarpt.gz > merged_timing_reports_hold.mtarpt.gz
#read_timing_debug_report merged_timing_reports_hold.mtarpt.gz
#gui_show
#Open the Analysis Tab to view the histogram
