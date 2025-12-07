set reportDir reports
file mkdir $reportDir

#####################
# Reports that check design health
#####################
report_slack_histogram
report_annotated_parasitics         > ${reportDir}/annotated.rpt
report_analysis_coverage            > ${reportDir}/coverage.rpt

#####################
# Reports that describe constraints
#####################
report_clocks                  > ${reportDir}/clocks.rpt
report_case_analysis           > ${reportDir}/case_analysis.rpt
report_inactive_arcs           > ${reportDir}/inactive_arcs.rpt
 
#####################
# Reports that describe timing health
#####################
report_constraint -all_violators                                > ${reportDir}/allviol.rpt
report_analysis_summary                                         > ${reportDir}/analysis_summary.rpt
report_timing -path_type endpoint -fields {startpoint launch_clock_edge endpoint capture_data_edge slack view} -late -max_paths 5  > ${reportDir}/start_end_slack.rpt

#####################
# Reports that show detailed timing with Graph based analysis
#####################
report_timing -late   -max_paths 1 -nworst 1 -path_type full_clock -split_delay  > ${reportDir}/worst_max_path.rpt
report_timing -early  -max_paths 1 -nworst 1 -path_type full_clock -split_delay  > ${reportDir}/worst_min_path.rpt

#####################
# Reports that show detailed timing with Path based analysis
#####################
report_timing -retime path_slew_propagation -max_paths 50 -nworst 1 -path_type full_clock > ${reportDir}/pba_50_paths.rpt

