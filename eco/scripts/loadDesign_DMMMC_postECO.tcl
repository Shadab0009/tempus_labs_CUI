read_mmmc ECO_INIT_11_optSetup_postECO.enc/viewDefinition.tcl

read_physical -lef {../../libs/lef/FreePDK45_lib_v1.0.lef ../../libs/MACRO/LEF/pllclk.lef ../../libs/MACRO/LEF/ram_256X16A.lef ../../libs/MACRO/LEF/rom_512x16A.lef}

read_netlist "ECO_INIT_11_optSetup_postECO.enc/dtmf_recvr_core.v.gz" -top dtmf_recvr_core
init_design 

read_def "ECO_INIT_11_optSetup_postECO.def"

