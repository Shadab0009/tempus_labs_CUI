
.subckt inv in out
MP1  out in VDD  VDD   pmos l=0.35e-6 w=0.7e-6 pd=1e-6 ps=1e-6
MN1  out in gnd  gnd   nmos l=0.35E-6 w=0.4E-6 pd=1e-6 ps=1e-6
.ends 

.subckt ant out
.ends
