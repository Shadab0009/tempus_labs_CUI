### Change these settings if needed based on your machine setup.

##This is for LSF using bsub
set_multi_cpu_usage -local_cpu 2 -cpu_per_remote_host 2 -remote_host 2
set_distributed_hosts -lsf

## Use this if you are using local machines only.
#set_multi_cpu_usage -local_cpu 2 -cpu_per_remote_host 2 -remote_host 2
#set_distributed_hosts -local

distribute_read_design -design_script ../scripts/loadDesign_DMMMC_postECO.tcl -out_dir sta_postECO


distribute_views -views [list func_slow_CMAX func_slow_RCMAX func_fast_RCMAX func_slow_RMAX func_fast_RMAX func_slow_CMIN func_fast_CMIN func_slow_RCMIN func_fast_RCMIN func_slow_RMIN func_fast_RMIN scan_slow_CMAX scan_fast_CMAX scan_slow_RCMAX scan_fast_RCMAX scan_slow_RMAX scan_fast_RMAX scan_slow_CMIN scan_fast_CMIN scan_slow_RCMIN scan_fast_RCMIN scan_slow_RMIN scan_fast_RMIN test_slow_CMAX test_fast_CMAX test_slow_RCMAX test_fast_RCMAX test_slow_RMAX test_fast_RMAX test_slow_CMIN test_fast_CMIN test_slow_RCMIN test_fast_RCMIN test_slow_RMIN test_fast_RMIN] -script ../scripts/sta_postECO_signoff.tcl


