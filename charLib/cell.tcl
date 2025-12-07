set_run_mode -process 180nm

# set the prefix for all CeltIC output files to cell
set_parm filename_prefix cell

# set the supply voltage at 3.3V and the ground voltage to 0V
set_supply -vdd 3.3 -gnd 0

# load the noise library and dspf file
load_netlist					\
	-cdb  { foundry_process_temp_cond.cdB }	\
	-dspf { inv_chain.dspf }	

# set the inputs and outputs
set_input {in1 in2}
set_output {out1 out2}

# process the netlists
process_netlist 

# optional Timing Windows File is not used in this analysis
# set the attacker slew to be 100ps
set_attacker_slew -default 100e-12 -skip_slew_calc

# analyze the circuit for noise
analyze_noise  

# generate a report sorted by receiver peak column
generate_report -waveforms -sort_by rcvr_peak
