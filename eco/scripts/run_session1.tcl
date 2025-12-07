### Change these settings if needed based on your machine setup.

##This is for LSF using bsub
set_multi_cpu_usage -local_cpu 2 -cpu_per_remote_host 2 -remote_host 2
set_distributed_hosts -lsf

## Use this if you are using local machines only.
#set_multi_cpu_usage -local_cpu 2 -cpu_per_remote_host 2 -remote_host 2
#set_distributed_hosts -local

#set_multi_cpu_usage -local_cpu 8 -remote_host 2

distribute_read_design -design_script ../scripts/loadDesign_DMMMC.tcl -out_dir sta

distribute_views -views [list func_slow_RCMAX func_fast_RCMAX func_slow_RCMIN func_fast_RCMIN scan_slow_RCMAX scan_fast_RCMAX scan_slow_RCMIN scan_fast_RCMIN test_slow_RCMAX test_fast_RCMAX test_slow_RCMIN test_fast_RCMIN] -script ../scripts/sta.tcl

#gui_show


