set reportDir reports
file mkdir $reportDir

#####################
# Reports that check design health
#####################
check_design  -type timing -out_file        ${reportDir}/check_design.rpt
report_annotated_parasitics         > ${reportDir}/annotated.rpt
report_analysis_coverage            > ${reportDir}/coverage.rpt

###################################
# Reports that describe constraints
####################################
report_clocks                       > ${reportDir}/clocks.rpt
report_case_analysis                > ${reportDir}/case_analysis.rpt
report_inactive_arcs                > ${reportDir}/inactive_arcs.rpt
 
######################################
# Reports that describe timing health
######################################
report_constraint -all_violators                                > ${reportDir}/allviol.rpt
report_analysis_summary                                         > ${reportDir}/analysis_summary.rpt
report_timing -path_type endpoint -fields {startpoint launch_clock_edge endpoint capture_data_edge slack view} -late -max_paths 5  > ${reportDir}/start_end_slack.rpt

#############################################
# Reports that show detailed timing analysis
#############################################
report_timing -path_type endpoint -fields {endpoint capture_data_edge slack view} -max_slack 0                     > ${reportDir}/setup_1.rpt
report_timing -path_type endpoint -fields {endpoint capture_data_edge slack view} -max_slack 0 -early              > ${reportDir}/hold_1.rpt
report_timing -late  -max_slack 0 -max_paths 100                         > ${reportDir}/setup_100.rpt.gz
report_timing -early -max_slack 0 -max_paths 100                         > ${reportDir}/hold_100.rpt.gz

########################################
# Report for gate simulations with delay
########################################
write_sdf -recompute_parallel_arcs    ${reportDir}/out.sdf

