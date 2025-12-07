#######################################################
## CMD FILE
#######################################################
read_libs {../../libs/liberty/pllclk_slow.lib.gz ../../libs/liberty/rom_via_metro_ss_1p08v_1p08v_125c_syn.lib.gz ../../libs/liberty/scmetro_cmos10lp_rvt_ss_1p08v_125c.lib.gz ../../libs/liberty/scmetropmk_cmos10lp_rvt_ss_0p9v_125c.lib.gz ../../libs/liberty/scmetropmk_cmos10lp_rvt_ss_0p9v_1p08v_125c.lib.gz ../../libs/liberty/scmetropmk_cmos10lp_rvt_ss_1p08v_0p9v_125c.lib.gz ../../libs/liberty/scmetropmk_cmos10lp_rvt_ss_1p08v_125c.lib.gz ../../libs/liberty/sram_sp_metro_ss_1p08v_1p08v_125c_syn.lib.gz}

read_libs -noise_libs ../../libs/scmetro_cmos10lp_rvt_ss_1p08v_125c.cdB
read_physical -lef {../../libs/lef/FreePDK45_lib_v1.0.lef ../../libs/MACRO/LEF/pllclk.lef ../../libs/MACRO/LEF/ram_256X16A.lef ../../libs/MACRO/LEF/rom_512x16A.lef}

read_netlist "../../design/dtmf_recvr_core.v.postopt" -top dtmf_recvr_core
init_design 
read_def ../../design/full.def 

source ../scripts/dtmf_recvr_core.view

read_sdc ../scripts/dtmf_recvr_core.sdc

set_power_rail -force -power {VDD Avdd VDD_sw VDDL_sw VDDL}
set_power_rail -force -ground {VSS Avss}

read_spef ../../design/dtmf_recvr_core.spef.all14.postopt

set_db timing_analysis_type ocv
update_timing -full

