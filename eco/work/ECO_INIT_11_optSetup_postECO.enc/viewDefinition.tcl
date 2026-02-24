if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name libset_fast\
   -timing\
    [list ${::IMEX::libVar}/mmmc/FreePDK45_lib_v1.0_typical.lib\
    ${::IMEX::libVar}/mmmc/pllclk.lib\
    ${::IMEX::libVar}/mmmc/ram_256x16A.lib\
    ${::IMEX::libVar}/mmmc/rom_512x16A.lib]
create_library_set -name libset_slow\
   -timing\
    [list ${::IMEX::libVar}/mmmc/FreePDK45_lib_v1.0_worst.lib\
    ${::IMEX::libVar}/mmmc/pllclk.lib\
    ${::IMEX::libVar}/mmmc/ram_256x16A.lib\
    ${::IMEX::libVar}/mmmc/rom_512x16A.lib]
create_timing_condition -name default_mapping_tc_2\
   -library_sets [list libset_fast]
create_timing_condition -name default_mapping_tc_1\
   -library_sets [list libset_slow]
create_rc_corner -name corner_worst_RMIN\
   -pre_route_res 0.8\
   -post_route_res {0.8 0.8 0.8}\
   -pre_route_cap 1\
   -post_route_cap 1\
   -post_route_cross_cap 1\
   -pre_route_clock_res 0\
   -pre_route_clock_cap 0
create_rc_corner -name corner_worst_CMAX\
   -pre_route_res 1\
   -post_route_res {1 1 1}\
   -pre_route_cap 1.2\
   -post_route_cap {1.2 1.2 1.2}\
   -post_route_cross_cap {1.2 1.2 1.2}\
   -pre_route_clock_res 0\
   -pre_route_clock_cap 0
create_rc_corner -name corner_worst_CMIN\
   -pre_route_res 1\
   -post_route_res {1 1 1}\
   -pre_route_cap 0.8\
   -post_route_cap {0.8 0.8 0.8}\
   -post_route_cross_cap {0.8 0.8 0.8}\
   -pre_route_clock_res 0\
   -pre_route_clock_cap 0
create_rc_corner -name corner_worst_RCMAX\
   -pre_route_res 1.2\
   -post_route_res {1.2 1.2 1.2}\
   -pre_route_cap 1.2\
   -post_route_cap {1.2 1.2 1.2}\
   -post_route_cross_cap {1.2 1.2 1.2}\
   -pre_route_clock_res 0\
   -pre_route_clock_cap 0
create_rc_corner -name corner_worst_RMAX\
   -pre_route_res 1.2\
   -post_route_res {1.2 1.2 1.2}\
   -pre_route_cap 1\
   -post_route_cap 1\
   -post_route_cross_cap 1\
   -pre_route_clock_res 0\
   -pre_route_clock_cap 0
create_rc_corner -name corner_worst_RCMIN\
   -pre_route_res 0.8\
   -post_route_res {0.8 0.8 0.8}\
   -pre_route_cap 0.8\
   -post_route_cap {0.8 0.8 0.8}\
   -post_route_cross_cap {0.8 0.8 0.8}\
   -pre_route_clock_res 0\
   -pre_route_clock_cap 0
create_delay_corner -name delay_corner_slow_CMIN\
   -early_timing_condition {default_mapping_tc_1}\
   -late_timing_condition {default_mapping_tc_1}\
   -rc_corner corner_worst_CMIN
create_delay_corner -name delay_corner_fast_RCMAX\
   -early_timing_condition {default_mapping_tc_2}\
   -late_timing_condition {default_mapping_tc_2}\
   -rc_corner corner_worst_RCMAX
create_delay_corner -name delay_corner_fast_CMIN\
   -early_timing_condition {default_mapping_tc_2}\
   -late_timing_condition {default_mapping_tc_2}\
   -rc_corner corner_worst_CMIN
create_delay_corner -name delay_corner_fast_RCMIN\
   -early_timing_condition {default_mapping_tc_2}\
   -late_timing_condition {default_mapping_tc_2}\
   -rc_corner corner_worst_RCMIN
create_delay_corner -name delay_corner_slow_RMAX\
   -early_timing_condition {default_mapping_tc_1}\
   -late_timing_condition {default_mapping_tc_1}\
   -rc_corner corner_worst_RMAX
create_delay_corner -name delay_corner_fast_RMAX\
   -early_timing_condition {default_mapping_tc_2}\
   -late_timing_condition {default_mapping_tc_2}\
   -rc_corner corner_worst_RMAX
create_delay_corner -name delay_corner_slow_RCMAX\
   -early_timing_condition {default_mapping_tc_1}\
   -late_timing_condition {default_mapping_tc_1}\
   -rc_corner corner_worst_RCMAX
create_delay_corner -name delay_corner_slow_RMIN\
   -early_timing_condition {default_mapping_tc_1}\
   -late_timing_condition {default_mapping_tc_1}\
   -rc_corner corner_worst_RMIN
create_delay_corner -name delay_corner_slow_CMAX\
   -early_timing_condition {default_mapping_tc_1}\
   -late_timing_condition {default_mapping_tc_1}\
   -rc_corner corner_worst_CMAX
create_delay_corner -name delay_corner_fast_RMIN\
   -early_timing_condition {default_mapping_tc_2}\
   -late_timing_condition {default_mapping_tc_2}\
   -rc_corner corner_worst_RMIN
create_delay_corner -name delay_corner_slow_RCMIN\
   -early_timing_condition {default_mapping_tc_1}\
   -late_timing_condition {default_mapping_tc_1}\
   -rc_corner corner_worst_RCMIN
create_delay_corner -name delay_corner_fast_CMAX\
   -early_timing_condition {default_mapping_tc_2}\
   -late_timing_condition {default_mapping_tc_2}\
   -rc_corner corner_worst_CMAX
create_constraint_mode -name functionnal_mode\
   -sdc_files\
    [list /dev/null]
create_constraint_mode -name test_mode\
   -sdc_files\
    [list /dev/null]
create_constraint_mode -name scan_mode\
   -sdc_files\
    [list /dev/null]
create_analysis_view -name test_slow_CMIN -constraint_mode test_mode -delay_corner delay_corner_slow_CMIN
create_analysis_view -name scan_fast_RMAX -constraint_mode scan_mode -delay_corner delay_corner_fast_RMAX
create_analysis_view -name func_slow_CMIN -constraint_mode functionnal_mode -delay_corner delay_corner_slow_CMIN
create_analysis_view -name test_fast_CMAX -constraint_mode test_mode -delay_corner delay_corner_fast_CMAX
create_analysis_view -name func_fast_CMAX -constraint_mode functionnal_mode -delay_corner delay_corner_fast_CMAX
create_analysis_view -name test_fast_RMIN -constraint_mode test_mode -delay_corner delay_corner_fast_RMIN
create_analysis_view -name scan_slow_RMAX -constraint_mode scan_mode -delay_corner delay_corner_slow_RMAX
create_analysis_view -name func_fast_RMIN -constraint_mode functionnal_mode -delay_corner delay_corner_fast_RMIN
create_analysis_view -name test_slow_RCMAX -constraint_mode test_mode -delay_corner delay_corner_slow_RCMAX
create_analysis_view -name scan_fast_RCMIN -constraint_mode scan_mode -delay_corner delay_corner_fast_RCMIN
create_analysis_view -name func_slow_RCMAX -constraint_mode functionnal_mode -delay_corner delay_corner_slow_RCMAX
create_analysis_view -name test_slow_CMAX -constraint_mode test_mode -delay_corner delay_corner_slow_CMAX
create_analysis_view -name func_slow_CMAX -constraint_mode functionnal_mode -delay_corner delay_corner_slow_CMAX
create_analysis_view -name test_slow_RMIN -constraint_mode test_mode -delay_corner delay_corner_slow_RMIN
create_analysis_view -name func_slow_RMIN -constraint_mode functionnal_mode -delay_corner delay_corner_slow_RMIN
create_analysis_view -name test_fast_RMAX -constraint_mode test_mode -delay_corner delay_corner_fast_RMAX
create_analysis_view -name scan_fast_CMIN -constraint_mode scan_mode -delay_corner delay_corner_fast_CMIN
create_analysis_view -name func_fast_RMAX -constraint_mode functionnal_mode -delay_corner delay_corner_fast_RMAX
create_analysis_view -name test_fast_RCMIN -constraint_mode test_mode -delay_corner delay_corner_fast_RCMIN
create_analysis_view -name scan_fast_RCMAX -constraint_mode scan_mode -delay_corner delay_corner_fast_RCMAX
create_analysis_view -name func_fast_RCMIN -constraint_mode functionnal_mode -delay_corner delay_corner_fast_RCMIN
create_analysis_view -name test_slow_RMAX -constraint_mode test_mode -delay_corner delay_corner_slow_RMAX
create_analysis_view -name scan_slow_CMIN -constraint_mode scan_mode -delay_corner delay_corner_slow_CMIN
create_analysis_view -name func_slow_RMAX -constraint_mode functionnal_mode -delay_corner delay_corner_slow_RMAX
create_analysis_view -name scan_slow_RCMIN -constraint_mode scan_mode -delay_corner delay_corner_slow_RCMIN
create_analysis_view -name scan_fast_CMAX -constraint_mode scan_mode -delay_corner delay_corner_fast_CMAX
create_analysis_view -name test_fast_RCMAX -constraint_mode test_mode -delay_corner delay_corner_fast_RCMAX
create_analysis_view -name scan_fast_RMIN -constraint_mode scan_mode -delay_corner delay_corner_fast_RMIN
create_analysis_view -name func_fast_RCMAX -constraint_mode functionnal_mode -delay_corner delay_corner_fast_RCMAX
create_analysis_view -name test_fast_CMIN -constraint_mode test_mode -delay_corner delay_corner_fast_CMIN
create_analysis_view -name scan_slow_CMAX -constraint_mode scan_mode -delay_corner delay_corner_slow_CMAX
create_analysis_view -name func_fast_CMIN -constraint_mode functionnal_mode -delay_corner delay_corner_fast_CMIN
create_analysis_view -name scan_slow_RMIN -constraint_mode scan_mode -delay_corner delay_corner_slow_RMIN
create_analysis_view -name test_slow_RCMIN -constraint_mode test_mode -delay_corner delay_corner_slow_RCMIN
create_analysis_view -name scan_slow_RCMAX -constraint_mode scan_mode -delay_corner delay_corner_slow_RCMAX
create_analysis_view -name func_slow_RCMIN -constraint_mode functionnal_mode -delay_corner delay_corner_slow_RCMIN
set_analysis_view -setup [list func_slow_CMAX func_fast_CMAX func_slow_RCMAX func_fast_RCMAX func_slow_RMAX func_fast_RMAX func_slow_CMIN func_fast_CMIN func_slow_RCMIN func_fast_RCMIN func_slow_RMIN func_fast_RMIN scan_slow_CMAX scan_fast_CMAX scan_slow_RCMAX scan_fast_RCMAX scan_slow_RMAX scan_fast_RMAX scan_slow_CMIN scan_fast_CMIN scan_slow_RCMIN scan_fast_RCMIN scan_slow_RMIN scan_fast_RMIN test_slow_CMAX test_fast_CMAX test_slow_RCMAX test_fast_RCMAX test_slow_RMAX test_fast_RMAX test_slow_CMIN test_fast_CMIN test_slow_RCMIN test_fast_RCMIN test_slow_RMIN test_fast_RMIN] -hold [list func_slow_CMAX func_fast_CMAX func_slow_RCMAX func_fast_RCMAX func_slow_RMAX func_fast_RMAX func_slow_CMIN func_fast_CMIN func_slow_RCMIN func_fast_RCMIN func_slow_RMIN func_fast_RMIN scan_slow_CMAX scan_fast_CMAX scan_slow_RCMAX scan_fast_RCMAX scan_slow_RMAX scan_fast_RMAX scan_slow_CMIN scan_fast_CMIN scan_slow_RCMIN scan_fast_RCMIN scan_slow_RMIN scan_fast_RMIN test_slow_CMAX test_fast_CMAX test_slow_RCMAX test_fast_RCMAX test_slow_RMAX test_fast_RMAX test_slow_CMIN test_fast_CMIN test_slow_RCMIN test_fast_RCMIN test_slow_RMIN test_fast_RMIN]
