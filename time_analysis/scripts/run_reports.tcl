
####################################################################################################################
# Reports that show detailed timing with Graph-Based Analysis, Advanced GBA, Path-Based Analysis and Exhaustive PBA
####################################################################################################################

#GBA
report_timing -max_paths 5 -path_type full_clock > gba_paths.rpt

#AGBA
set_db  timing_analysis_graph_pba_mode true
report_timing -path_type  full > agba_paths.rpt

#Disabling AGBA for further analysis
set_db  timing_analysis_graph_pba_mode false                             

#PBA
report_timing -retime path_slew_propagation -max_paths 5 -path_type full > pba_paths.rpt

#EPBA
set_db timing_path_based_exhaustive_pba_bounded_mode true
report_timing -retime path_slew_propagation -retime_mode exhaustive -max_paths 15 -nworst 2 -max_slack 0

