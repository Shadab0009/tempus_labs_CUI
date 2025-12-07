read_libs \
../../libs/liberty/pllclk_slow.lib.gz  \
../../libs/liberty/scmetro_cmos10lp_rvt_ss_1p08v_125c.lib.gz  \
../../libs/liberty/scmetropmk_cmos10lp_rvt_ss_0p9v_1p08v_125c.lib.gz  \
../../libs/liberty/scmetropmk_cmos10lp_rvt_ss_1p08v_0p9v_125c.lib.gz  \
../../libs/liberty/rom_via_metro_ss_1p08v_1p08v_125c_syn.lib.gz  \
../../libs/liberty/sram_sp_metro_ss_1p08v_1p08v_125c_syn.lib.gz \
../../libs/liberty/scmetropmk_cmos10lp_rvt_ss_1p08v_125c.lib.gz 


read_libs -noise_libs ../../libs/scmetro_cmos10lp_rvt_ss_1p08v_125c.cdB

read_netlist "../../design/dtmf_recvr_core.v.postcts" -top dtmf_recvr_core
init_design

set_power_rail -power {VDD Avdd VDD_sw VDDL_sw VDDL} -force
set_power_rail -ground {VSS Avss} -force

read_sdc ../scripts/dtmf_recvr_core.sdc

read_spef ../../design/dtmf_recvr_core.spef.xcap12.postcts


