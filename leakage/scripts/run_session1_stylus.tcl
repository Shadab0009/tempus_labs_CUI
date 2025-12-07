set_distributed_hosts -local
set_multi_cpu_usage -local_cpu 16 -remote_host 4 -cpu_per_remote_host 4
distribute_read_db -design_script ../scripts/loadDesign_stylus.tcl -out_dir sta
distribute_views -views [list func_slow_CMAX func_fast_CMAX func_slow_RCMAX func_fast_RCMAX func_slow_RMAX func_fast_RMAX func_slow_CMIN func_fast_CMIN func_slow_RCMIN func_fast_RCMIN func_slow_RMIN func_fast_RMIN] -script ../scripts/sta_stylus.tcl



