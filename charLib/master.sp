* First line is always a comment

.EQUIV p=pch n=nch
* You don't need to distinguish between nch.1, nch.2, ...
* make_cdb looks at the W/L of the transistors in the stdCell_018.sp and 
* maps it to the appropriate transistor model in transistors_018.lib
* by looking at the parameter LMIN and WMIN in each respective model

.temp 125

* The following line is a common error experienced by our customers
* who are not very familiar with SPICE netlists and the scaling commands.
* Since the parameters in transistors_018.sp already are in exponential form, 
* adding this option to the spice deck causes double division of the 
* transistor geometries and produces a warning "Effective channel length <= 0"
* in generate_cell_lib.  Instead of microns units become 1e-12 for geometries.
*This would be the offending command: ".options scale=1e-6"

.lib './transistors_018.sp' SS
* the SS library transistors_018.sp calls the MOS library explicitly
* (i.e. .lib 'transistors_018.sp' MOS)
* Together these 2 sections (libraries) make up the transistor parameters for a given operating condition.


* Add in the netlist for the gate level devices.
* Note: HDIF = 'hdifn' is declared in the transistor models, else this param 
* would need to be explicitly declared in the char.tcl file.
* A library with extracted parasitics will typically be about 10% more accurate.
* HDIF is not needed with an extracted library because the devices will have
* AS, PS, AD, PD parameters.
* For some large drive devices with shared S/D fingers, the error could be significantly higher if 
* AS, PS, AD and PD are not declared.
* For those not very familiar with HSPICE syntax, .inc and .include are equivalent.

.inc stdCell_018.sp

