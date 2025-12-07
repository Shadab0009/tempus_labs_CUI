##### View definition file does not have LEFs.
read_libs {../../libs/liberty/FreePDK45_lib_v1.0_worst.lib  ../../libs/MACRO/LIBERTY/pllclk.lib  ../../libs/MACRO/LIBERTY/ram_256x16A.lib  ../../libs/MACRO/LIBERTY/rom_512x16A.lib ../../libs/liberty/FreePDK45_lib_v1.0_typical.lib }

read_physical -lef {  ../../libs/lef/FreePDK45_lib_v1.0.lef   \
  ../../libs/MACRO/LEF/pllclk.lef  \
  ../../libs/MACRO/LEF/ram_256X16A.lef  \
  ../../libs/MACRO/LEF/rom_512x16A.lef}


read_netlist "../../design/dtmf_recvr_core.v.gz" -top dtmf_recvr_core
init_design 
source ../scripts/viewDefinition.tcl
read_def "../../design/full.def"
