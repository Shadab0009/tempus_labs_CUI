create_library_set -name libset_slow \
-timing \
[list ../../libs/liberty/FreePDK45_lib_v1.0_worst.lib \
    ../../libs/liberty/FreePDK45_hvt_lib_v1.0_worst.lib \
    ../../libs/MACRO/LIBERTY/pllclk.lib \
    ../../libs/MACRO/LIBERTY/ram_256x16A.lib \
    ../../libs/MACRO/LIBERTY/rom_512x16A.lib] \
-aocv \
[list ../../design/slow.aocv]

create_library_set -name libset_fast \
-timing \
[list ../../libs/liberty/FreePDK45_lib_v1.0_typical.lib \
    ../../libs/liberty/FreePDK45_hvt_lib_v1.0_typical.lib \
    ../../libs/MACRO/LIBERTY/pllclk.lib \
    ../../libs/MACRO/LIBERTY/ram_256x16A.lib \
    ../../libs/MACRO/LIBERTY/rom_512x16A.lib] \
-aocv \
[list ../../design/slow.aocv]

####
create_timing_condition -name default_mapping_tc_2\
   -library_sets [list libset_fast]
create_timing_condition -name default_mapping_tc_1\
   -library_sets [list libset_slow]
####

create_rc_corner -name corner_worst_CMAX \
-pre_route_res 1 \
-post_route_res {1 1 1} \
-pre_route_cap 1.2 \
-post_route_cap {1.2 1.2 1.2} \
-post_route_cross_cap {1.2 1.2 1.2} \
-pre_route_clock_res 0 \
-pre_route_clock_cap 0
create_rc_corner -name corner_worst_RCMAX \
-pre_route_res 1.2 \
-post_route_res {1.2 1.2 1.2} \
-pre_route_cap 1.2 \
-post_route_cap {1.2 1.2 1.2} \
-post_route_cross_cap {1.2 1.2 1.2} \
-pre_route_clock_res 0 \
-pre_route_clock_cap 0
create_rc_corner -name corner_worst_RMAX \
-pre_route_res 1.2 \
-post_route_res {1.2 1.2 1.2} \
-pre_route_cap 1 \
-post_route_cap 1 \
-post_route_cross_cap 1 \
-pre_route_clock_res 0 \
-pre_route_clock_cap 0
create_rc_corner -name corner_worst_CMIN \
-pre_route_res 1 \
-post_route_res {1 1 1} \
-pre_route_cap 0.8 \
-post_route_cap {0.8 0.8 0.8} \
-post_route_cross_cap {0.8 0.8 0.8} \
-pre_route_clock_res 0 \
-pre_route_clock_cap 0
create_rc_corner -name corner_worst_RCMIN \
-pre_route_res 0.8 \
-post_route_res {0.8 0.8 0.8} \
-pre_route_cap 0.8 \
-post_route_cap {0.8 0.8 0.8} \
-post_route_cross_cap {0.8 0.8 0.8} \
-pre_route_clock_res 0 \
-pre_route_clock_cap 0
create_rc_corner -name corner_worst_RMIN \
-pre_route_res 0.8 \
-post_route_res {0.8 0.8 0.8} \
-pre_route_cap 1 \
-post_route_cap 1 \
-post_route_cross_cap 1 \
-pre_route_clock_res 0 \
-pre_route_clock_cap 0


###

create_delay_corner -name delay_corner_slow_CMAX -early_timing_condition {default_mapping_tc_1} -late_timing_condition {default_mapping_tc_1} -rc_corner corner_worst_CMAX


create_delay_corner -name delay_corner_slow_RCMAX -early_timing_condition {default_mapping_tc_1} -late_timing_condition {default_mapping_tc_1} -rc_corner corner_worst_RCMAX


create_delay_corner -name delay_corner_slow_RMAX -early_timing_condition {default_mapping_tc_1} -late_timing_condition {default_mapping_tc_1} -rc_corner corner_worst_RMAX


create_delay_corner -name delay_corner_fast_CMAX -early_timing_condition {default_mapping_tc_2} -late_timing_condition {default_mapping_tc_2} -rc_corner corner_worst_CMAX


create_delay_corner -name delay_corner_fast_RCMAX -early_timing_condition {default_mapping_tc_2} -late_timing_condition {default_mapping_tc_2} -rc_corner corner_worst_RCMAX


create_delay_corner -name delay_corner_fast_RMAX -early_timing_condition {default_mapping_tc_2} -late_timing_condition {default_mapping_tc_2} -rc_corner corner_worst_RMAX


create_delay_corner -name delay_corner_slow_CMIN -early_timing_condition {default_mapping_tc_1} -late_timing_condition {default_mapping_tc_1} -rc_corner corner_worst_CMIN

create_delay_corner -name delay_corner_slow_RCMIN -early_timing_condition {default_mapping_tc_1} -late_timing_condition {default_mapping_tc_1} -rc_corner corner_worst_RCMIN

create_delay_corner -name delay_corner_slow_RMIN -early_timing_condition {default_mapping_tc_1} -late_timing_condition {default_mapping_tc_1} -rc_corner corner_worst_RMIN

create_delay_corner -name delay_corner_fast_CMIN -early_timing_condition {default_mapping_tc_2} -late_timing_condition {default_mapping_tc_2} -rc_corner corner_worst_CMIN

create_delay_corner -name delay_corner_fast_RCMIN -early_timing_condition {default_mapping_tc_2} -late_timing_condition {default_mapping_tc_2} -rc_corner corner_worst_RCMIN

create_delay_corner -name delay_corner_fast_RMIN -early_timing_condition {default_mapping_tc_2} -late_timing_condition {default_mapping_tc_2} -rc_corner corner_worst_RMIN


create_constraint_mode -name functionnal_mode -sdc_files [list ../../design/dtmf_recvr_core.pr_leak.sdc]
create_constraint_mode -name scan_mode -sdc_files [list ../../design/dtmf_recvr_core.scan_leak.sdc]
create_constraint_mode -name test_mode -sdc_files [list ../../design/dtmf_recvr_core.test_leak.sdc]

create_analysis_view -name func_slow_CMAX -constraint_mode functionnal_mode -delay_corner delay_corner_slow_CMAX
create_analysis_view -name func_fast_CMAX -constraint_mode functionnal_mode -delay_corner delay_corner_fast_CMAX
create_analysis_view -name func_slow_RCMAX -constraint_mode functionnal_mode -delay_corner delay_corner_slow_RCMAX
create_analysis_view -name func_fast_RCMAX -constraint_mode functionnal_mode -delay_corner delay_corner_fast_RCMAX
create_analysis_view -name func_slow_RMAX -constraint_mode functionnal_mode -delay_corner delay_corner_slow_RMAX
create_analysis_view -name func_fast_RMAX -constraint_mode functionnal_mode -delay_corner delay_corner_fast_RMAX
create_analysis_view -name func_slow_CMIN -constraint_mode functionnal_mode -delay_corner delay_corner_slow_CMIN
create_analysis_view -name func_fast_CMIN -constraint_mode functionnal_mode -delay_corner delay_corner_fast_CMIN
create_analysis_view -name func_slow_RCMIN -constraint_mode functionnal_mode -delay_corner delay_corner_slow_RCMIN
create_analysis_view -name func_fast_RCMIN -constraint_mode functionnal_mode -delay_corner delay_corner_fast_RCMIN
create_analysis_view -name func_slow_RMIN -constraint_mode functionnal_mode -delay_corner delay_corner_slow_RMIN
create_analysis_view -name func_fast_RMIN -constraint_mode functionnal_mode -delay_corner delay_corner_fast_RMIN

create_analysis_view -name scan_slow_CMAX -constraint_mode scan_mode -delay_corner delay_corner_slow_CMAX
create_analysis_view -name scan_fast_CMAX -constraint_mode scan_mode -delay_corner delay_corner_fast_CMAX
create_analysis_view -name scan_slow_RCMAX -constraint_mode scan_mode -delay_corner delay_corner_slow_RCMAX
create_analysis_view -name scan_fast_RCMAX -constraint_mode scan_mode -delay_corner delay_corner_fast_RCMAX
create_analysis_view -name scan_slow_RMAX -constraint_mode scan_mode -delay_corner delay_corner_slow_RMAX
create_analysis_view -name scan_fast_RMAX -constraint_mode scan_mode -delay_corner delay_corner_fast_RMAX
create_analysis_view -name scan_slow_CMIN -constraint_mode scan_mode -delay_corner delay_corner_slow_CMIN
create_analysis_view -name scan_fast_CMIN -constraint_mode scan_mode -delay_corner delay_corner_fast_CMIN
create_analysis_view -name scan_slow_RCMIN -constraint_mode scan_mode -delay_corner delay_corner_slow_RCMIN
create_analysis_view -name scan_fast_RCMIN -constraint_mode scan_mode -delay_corner delay_corner_fast_RCMIN
create_analysis_view -name scan_slow_RMIN -constraint_mode scan_mode -delay_corner delay_corner_slow_RMIN
create_analysis_view -name scan_fast_RMIN -constraint_mode scan_mode -delay_corner delay_corner_fast_RMIN

create_analysis_view -name test_slow_CMAX -constraint_mode test_mode -delay_corner delay_corner_slow_CMAX
create_analysis_view -name test_fast_CMAX -constraint_mode test_mode -delay_corner delay_corner_fast_CMAX
create_analysis_view -name test_slow_RCMAX -constraint_mode test_mode -delay_corner delay_corner_slow_RCMAX
create_analysis_view -name test_fast_RCMAX -constraint_mode test_mode -delay_corner delay_corner_fast_RCMAX
create_analysis_view -name test_slow_RMAX -constraint_mode test_mode -delay_corner delay_corner_slow_RMAX
create_analysis_view -name test_fast_RMAX -constraint_mode test_mode -delay_corner delay_corner_fast_RMAX
create_analysis_view -name test_slow_CMIN -constraint_mode test_mode -delay_corner delay_corner_slow_CMIN
create_analysis_view -name test_fast_CMIN -constraint_mode test_mode -delay_corner delay_corner_fast_CMIN
create_analysis_view -name test_slow_RCMIN -constraint_mode test_mode -delay_corner delay_corner_slow_RCMIN
create_analysis_view -name test_fast_RCMIN -constraint_mode test_mode -delay_corner delay_corner_fast_RCMIN
create_analysis_view -name test_slow_RMIN -constraint_mode test_mode -delay_corner delay_corner_slow_RMIN
create_analysis_view -name test_fast_RMIN -constraint_mode test_mode -delay_corner delay_corner_fast_RMIN


set_analysis_view -setup [list func_slow_CMAX func_slow_RCMAX func_slow_RMAX func_slow_CMIN func_slow_RCMIN func_slow_RMIN] -hold [list func_fast_CMAX func_fast_RCMAX func_fast_RMAX func_fast_CMIN func_fast_RCMIN func_fast_RMIN]
