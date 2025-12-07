##################################################
# Define the available libraries
##################################################
create_library_set -name libset_slow \
-timing \
[list ../../libs/liberty/FreePDK45_lib_v1.0_worst.lib \
    ../../libs/MACRO/LIBERTY/pllclk.lib \
    ../../libs/MACRO/LIBERTY/ram_256x16A.lib \
    ../../libs/MACRO/LIBERTY/rom_512x16A.lib]
create_library_set -name libset_fast \
-timing \
[list ../../libs/liberty/FreePDK45_lib_v1.0_typical.lib \
    ../../libs/MACRO/LIBERTY/pllclk.lib \
    ../../libs/MACRO/LIBERTY/ram_256x16A.lib \
    ../../libs/MACRO/LIBERTY/rom_512x16A.lib]

##################################################
# Define the Timing Condition corners
##################################################

create_timing_condition -name default_mapping_tc_2 -library_sets [list libset_fast]
create_timing_condition -name default_mapping_tc_1 -library_sets [list libset_slow]

##################################################
# Define the RC corners
##################################################
create_rc_corner -name corner_worst_RCMAX \
-pre_route_res 1.2 \
-post_route_res {1.2 1.2 1.2} \
-pre_route_cap 1.2 \
-post_route_cap {1.2 1.2 1.2} \
-post_route_cross_cap {1.2 1.2 1.2} \
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

##################################################
# Create the possible delay corners
# These are combinations of library and corners
##################################################
create_delay_corner -name delay_corner_slow_RCMAX -early_timing_condition {default_mapping_tc_1} -late_timing_condition {default_mapping_tc_1} -rc_corner corner_worst_RCMAX
create_delay_corner -name delay_corner_fast_RCMAX -early_timing_condition {default_mapping_tc_2} -late_timing_condition {default_mapping_tc_2} -rc_corner corner_worst_RCMAX
create_delay_corner -name delay_corner_slow_RCMIN -early_timing_condition {default_mapping_tc_1} -late_timing_condition {default_mapping_tc_1} -rc_corner corner_worst_RCMIN
create_delay_corner -name delay_corner_fast_RCMIN -early_timing_condition {default_mapping_tc_2} -late_timing_condition {default_mapping_tc_2} -rc_corner corner_worst_RCMIN

##################################################
# Define the available constraint types
##################################################
create_constraint_mode -name functional_mode -sdc_files [list ../../design/dtmf_recvr_core.pr.sdc]
create_constraint_mode -name scan_mode -sdc_files [list ../../design/dtmf_recvr_core.scan.sdc]
create_constraint_mode -name test_mode -sdc_files [list ../../design/dtmf_recvr_core.test.sdc]

##################################################
# Create the possbile views
# These are combinations of constraints, and delay corners
##################################################
create_analysis_view -name func_slow_RCMAX -constraint_mode functional_mode -delay_corner delay_corner_slow_RCMAX
create_analysis_view -name func_fast_RCMAX -constraint_mode functional_mode -delay_corner delay_corner_fast_RCMAX
create_analysis_view -name func_slow_RCMIN -constraint_mode functional_mode -delay_corner delay_corner_slow_RCMIN
create_analysis_view -name func_fast_RCMIN -constraint_mode functional_mode -delay_corner delay_corner_fast_RCMIN

create_analysis_view -name scan_slow_RCMAX -constraint_mode scan_mode -delay_corner delay_corner_slow_RCMAX
create_analysis_view -name scan_fast_RCMAX -constraint_mode scan_mode -delay_corner delay_corner_fast_RCMAX
create_analysis_view -name scan_slow_RCMIN -constraint_mode scan_mode -delay_corner delay_corner_slow_RCMIN
create_analysis_view -name scan_fast_RCMIN -constraint_mode scan_mode -delay_corner delay_corner_fast_RCMIN

create_analysis_view -name test_slow_RCMAX -constraint_mode test_mode -delay_corner delay_corner_slow_RCMAX
create_analysis_view -name test_fast_RCMAX -constraint_mode test_mode -delay_corner delay_corner_fast_RCMAX
create_analysis_view -name test_slow_RCMIN -constraint_mode test_mode -delay_corner delay_corner_slow_RCMIN
create_analysis_view -name test_fast_RCMIN -constraint_mode test_mode -delay_corner delay_corner_fast_RCMIN

##################################################
# Turn on the views that you want to use.
##################################################
set_analysis_view -setup [list func_slow_RCMAX func_fast_RCMAX func_slow_RCMIN func_fast_RCMIN scan_slow_RCMAX scan_fast_RCMAX scan_slow_RCMIN scan_fast_RCMIN test_slow_RCMAX test_fast_RCMAX test_slow_RCMIN test_fast_RCMIN] -hold [list func_slow_RCMAX func_fast_RCMAX func_slow_RCMIN func_fast_RCMIN scan_slow_RCMAX scan_fast_RCMAX scan_slow_RCMIN scan_fast_RCMIN test_slow_RCMAX test_fast_RCMAX test_slow_RCMIN test_fast_RCMIN]
