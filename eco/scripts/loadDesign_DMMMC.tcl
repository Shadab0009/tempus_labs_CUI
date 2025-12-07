read_mmmc ../../design/viewDefinition.tcl

read_physical -lef {../../libs/lef/FreePDK45_lib_v1.0.lef ../../libs/MACRO/LEF/pllclk.lef ../../libs/MACRO/LEF/ram_256X16A.lef ../../libs/MACRO/LEF/rom_512x16A.lef}

read_netlist "../../design/ECO_INIT_11_optSetup.enc.dat/dtmf_recvr_core.v.gz" -top dtmf_recvr_core
init_design 

read_def "../../design/full.def"
