# Cadence Encounter(R) RTL Compiler
#   version v12.10-s012_1 (64-bit) built Jan 26 2013
#
# Run with the following arguments:
#   -logfile rc.log
#   -cmdfile rc.cmd

set_attr lib_search_path "../../libs/liberty ../../libs/MACRO/LIBERTY ../../libs/lef ../../libs/MACRO/LEF" /
set_attr library "FreePDK45_lib_v1.0_worst.lib pllclk.lib  ram_256x16A.lib  rom_512x16A.lib~" /
set_attr lef_library "FreePDK45_lib_v1.0.lef pllclk.lef  ram_256X16A.lef  rom_512x16A.lef" /
set RTL_LIST { \
accum_stat.v \
alu_32.v \
arb.v \
data_bus_mach.v \
data_sample_mux.v \
decode_i.v \
decoder.v \
digit_reg.v \
conv_subreg.v \
dma.v \
dtmf_recvr_core.v \
execute_i.v \
m16x16.v \
mult_32_dp.v \
port_bus_mach.v \
prog_bus_mach.v \
ram_128x16_test.v \
ram_256x16_test.v \
results_conv.v \
spi.v \
tdsp_core_glue.v \
tdsp_core_mach.v \
tdsp_core.v \
tdsp_data_mux.v \
tdsp_ds_cs.v \
test_control.v \
ulaw_lin_conv.v \
power_manager.v \
}
set_attr hdl_search_path "../../design/rtl" /
read_hdl $RTL_LIST
elaborate dtmf_recvr_core
read_sdc ../../design/dtmf_recvr_core.sdc
set_attr tns_opto true /
synthesize -to_mapped
report_timing
write_ets -no_exit -sdc ../../design/dtmf_recvr_core.sdc -libs "../../libs/liberty/FreePDK45_lib_v1.0_worst.lib ../../libs/MACRO/LIBERTY/pllclk.lib ../../libs/MACRO/LIBERTY/ram_256x16A.lib ../../libs/LIBERTY/rom_512x16A.lib" > run_tempus.tcl
write_design -encounter -basename syn/dtmf_recvr_core
