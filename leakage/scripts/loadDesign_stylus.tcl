read_mmmc ../../design/viewDefinition_AOCV.tcl

read_physical -lef {../../libs/lef/FreePDK45_lib_v1.0.lef ../../libs/lef/FreePDK45_HVT_lib_v1.0.lef ../../libs/MACRO/LEF/pllclk.lef ../../libs/MACRO/LEF/ram_256X16A.lef ../../libs/MACRO/LEF/rom_512x16A.lef}

read_netlist "../../design/new.v.gz" -top dtmf_recvr_core
init_design 

read_def "../../design/new.def.gz"
