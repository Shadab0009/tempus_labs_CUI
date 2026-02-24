# opt_signoff -drv 
# set_db settings :
# 	 opt_signoff_verbose true
# 	 opt_signoff_read_eco_opt_db "ecoTimingDB"
# 	 opt_signoff_resize_inst true
# =====================

report_resource
set_db eco_update_timing false
set_db eco_refine_place false 
set_db eco_prefix ESO
set_db eco_batch_mode true 
set_db eco_honor_dont_use false 
set_db eco_honor_dont_touch false 
set_db eco_honor_fixed_status false
catch { set_db eco_honor_fixed_wires false }
eco_update_cell -insts {RAM_128x16_TEST_INST/FE_OFC42_tdsp_data_out_4_} -cells BUF_X16 -location { 305.520000 232.400000 } -orient R180
eco_update_cell -insts {FE_OFC19_tdsp_data_out_0_} -cells BUF_X32 -location { 289.940000 280.000000 } -orient R180
eco_update_cell -insts {FE_OFCC479_FE_OFN12_tdsp_data_out_10_} -cells BUF_X32 -location { 294.500000 303.800000 } -orient R0
eco_update_cell -insts {FE_OFC43_ds_datain_3_} -cells BUF_X16 -location { 73.150000 254.800000 } -orient MX
eco_update_cell -insts {FE_OFCC543_FE_OFN407_tdsp_data_out_13_} -cells BUF_X32 -location { 301.340000 302.400000 } -orient MX
eco_update_cell -insts {FE_OFCC540_FE_OFN14_tdsp_data_out_12_} -cells BUF_X32 -location { 300.580000 340.200000 } -orient R0
eco_update_cell -insts {DATA_SAMPLE_MUX_INST/Fp9491A479} -cells INV_X16 -location { 195.320000 256.200000 } -orient R0
eco_update_cell -insts {RAM_128x16_TEST_INST/FE_OFC100_t_addrs_0_} -cells BUF_X32 -location { 277.210000 289.800000 } -orient R0
eco_add_repeater -cells BUF_X4 -name FE_ESOC0_FE_OFN24_tdsp_data_out_8 -hinst_guide RESULTS_CONV_INST -pins {  RESULTS_CONV_INST/p7148A29051/A } -relative_distance_to_sink 0 -location { 256.880000 341.600000 } -buffer_orient MX 
eco_add_repeater -cells BUF_X32 -name FE_ESOC1_FE_OFN16_ds_datain_0 -hinst_guide dtmf_recvr_core -pins {  FE_OFC16_ds_datain_0_/Z } -relative_distance_to_sink 1 -location { 85.690000 253.400000 } -buffer_orient R0 
eco_add_repeater -cells BUF_X32 -name FE_ESOC2_FE_OFN52_ds_datain_1 -hinst_guide dtmf_recvr_core -pins {  FE_OFC52_ds_datain_1_/Z } -relative_distance_to_sink 1 -location { 79.610000 254.800000 } -buffer_orient MX 
eco_add_repeater -cells BUF_X8 -name FE_ESOC3_n_623 -hinst_guide TDSP_CORE_INST/EXECUTE_INST -pins {  TDSP_CORE_INST/EXECUTE_INST/p8543A/ZN } -relative_distance_to_sink 1 -location { 224.390000 240.800000 } -buffer_orient MX 
eco_add_repeater -cells BUF_X32 -name FE_ESOC4_ds_datain_12 -hinst_guide DATA_SAMPLE_MUX_INST -pins {  DATA_SAMPLE_MUX_INST/Fp9562A492/ZN } -relative_distance_to_sink 1 -location { 258.780000 267.400000 } -buffer_orient R0 
report_resource
set_db eco_batch_mode false
 
report_resource
set_db eco_update_timing true
set_db eco_refine_place true
set_db eco_prefix -reset
set_db eco_honor_dont_use true
set_db eco_honor_dont_touch true
set_db eco_honor_fixed_status true
set_db eco_honor_fixed_wires true
 
place_detail -eco true -hard_fence false
