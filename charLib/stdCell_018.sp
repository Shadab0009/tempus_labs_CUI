* Comment line - generic library

.subckt ADDFHX2 A B CI CO S 
m_m1 n6 A VDD VDD p l=0.18u w=1.68u as=0.5067p ad=0.8064p ps=1.411u pd=2.64u
m_m13 n17 A VDD VDD p l=0.18u w=0.9u ad=0.432p as=0.2714p pd=1.86u ps=0.756u
m2 n6 A VDD VDD p l=0.18u w=0.42u ad=0.2016p as=0.1267p pd=1.38u ps=0.3528u
m_m11 n9 n17 VDD VDD p l=0.18u w=1.14u as=0.3078p ad=0.432p ps=0.54u pd=2.1u
m4 n9 n17 VDD VDD p l=0.18u w=1.14u ad=0.3078p as=0.3078p pd=0.54u ps=0.54u
m_m10 n7 n13 n9 VDD p l=0.18u w=1.14u ad=0.3078p as=0.3078p pd=0.54u ps=0.54u
m6 n7 n13 n9 VDD p l=0.18u w=1.14u as=0.5472p ad=0.3078p ps=2.1u pd=0.54u
m_m8 n7 B n6 VDD p l=0.18u w=1.14u ad=0.3078p as=0.5472p pd=0.54u ps=2.1u
m8 n7 B n6 VDD p l=0.18u w=1.14u as=0.3078p ad=0.3078p ps=0.54u pd=0.54u
m_m6 n8 n13 n6 VDD p l=0.18u w=1.14u ad=0.45p as=0.3078p pd=1.08u ps=0.54u
m10 n8 n13 n6 VDD p l=0.18u w=1.14u as=0.432p ad=0.45p ps=2.1u pd=1.08u
m_m4 n8 B n9 VDD p l=0.18u w=1.14u ad=0.3078p as=0.5038p pd=0.54u ps=2.68u
m12 n8 B n9 VDD p l=0.18u w=1.14u as=0.6978p ad=0.3078p ps=2.68u pd=0.54u
m_m15 n13 B VDD VDD p l=0.18u w=1.08u ad=0.2916p as=0.4128p pd=0.54u ps=2.04u
m14 n13 B VDD VDD p l=0.18u w=1.08u as=0.2916p ad=0.2916p ps=0.54u pd=0.54u
m15 n13 B VDD VDD p l=0.18u w=1.08u ad=0.2978p as=0.2916p pd=0.602u ps=0.54u
m_m24 n14 n8 n13 VDD p l=0.18u w=1.36u ad=0.5446p as=0.375p pd=1.094u ps=0.758u
m_m22 n14 n7 n10 VDD p l=0.18u w=1.4u as=0.3893p ad=0.5606p ps=0.7592u pd=1.126u
m_m20 n11 n8 n10 VDD p l=0.18u w=1.44u ad=0.3888p as=0.4005p pd=0.54u ps=0.7808u
m_m18 n11 n7 n12 VDD p l=0.18u w=1.44u as=0.3888p ad=0.3888p ps=0.54u pd=0.54u
m_m31 n12 n10 VDD VDD p l=0.18u w=1.44u as=0.4753p ad=0.3888p ps=1.57u pd=0.54u
m_m25 n10 CI VDD VDD p l=0.18u w=1u ad=0.27p as=0.3301p pd=0.54u ps=1.09u
m22 n10 CI VDD VDD p l=0.18u w=1u as=0.3284p ad=0.27p ps=0.6957u pd=0.54u
m_m29 CO n14 VDD VDD p l=0.18u w=1.76u ad=0.6304p as=0.578p pd=2.72u ps=1.224u
m_m27 S n11 VDD VDD p l=0.18u w=1.76u ad=0.8448p as=0.6304p pd=2.72u ps=2.72u
m_m2 n6 A VSS VSS n l=0.1836u w=1.407u as=0.5445p ad=0.734p ps=1.781u pd=2.4u
m_m14 n17 A VSS VSS n l=0.18u w=0.6u ad=0.288p as=0.2322p pd=1.56u ps=0.7595u
m_m12 n9 n17 VSS VSS n l=0.18u w=0.76u as=0.2926p ad=0.3648p ps=1.42u pd=1.72u
m28 n9 n17 VSS VSS n l=0.18u w=0.76u ad=0.2127p as=0.2926p pd=0.69u ps=1.42u
m_m9 n7 B n9 VSS n l=0.18u w=0.76u ad=0.2052p as=0.2127p pd=0.54u ps=0.69u
m30 n7 B n9 VSS n l=0.18u w=0.76u as=0.3146p ad=0.2052p ps=1.74u pd=0.54u
m_m7 n7 n13 n6 VSS n l=0.18u w=0.76u ad=0.2052p as=0.3104p pd=0.54u ps=1.72u
m32 n7 n13 n6 VSS n l=0.18u w=0.76u as=0.2115p ad=0.2052p ps=0.6967u pd=0.54u
m_m5 n8 B n6 VSS n l=0.18u w=0.68u ad=0.1836p as=0.1893p pd=0.54u ps=0.6233u
m34 n8 B n6 VSS n l=0.18u w=0.68u as=0.3264p ad=0.1836p ps=1.64u pd=0.54u
m_m3 n8 n13 n9 VSS n l=0.18u w=0.76u as=0.3738p ad=0.3648p ps=1.1u pd=1.72u
m36 n8 n13 n9 VSS n l=0.18u w=0.76u ad=0.5338p as=0.3738p pd=2.46u ps=1.1u
m_m16 n13 B VSS VSS n l=0.18u w=1.08u as=0.4251p ad=0.696p ps=1.05u pd=2.76u
m38 n13 B VSS VSS n l=0.18u w=1.08u ad=0.2948p as=0.4251p pd=0.6353u ps=1.05u
m_m23 n14 n7 n13 VSS n l=0.18u w=0.96u ad=0.5284p as=0.262p pd=1.991u ps=0.5647u
m_m21 n14 n8 n10 VSS n l=0.18u w=0.92u as=0.2632p ad=0.5064p ps=0.831u pd=1.909u
m_m19 n11 n7 n10 VSS n l=0.18u w=0.94u ad=0.2543p as=0.269p pd=0.5442u ps=0.849u
m_m17 n11 n8 n12 VSS n l=0.18u w=0.96u as=0.2592p ad=0.2597p ps=0.54u pd=0.5558u
m_m32 n12 n10 VSS VSS n l=0.18u w=0.96u as=0.4211p ad=0.2592p ps=1.675u pd=0.54u
m_m26 n10 CI VSS VSS n l=0.18u w=0.68u ad=0.1836p as=0.2983p pd=0.54u ps=1.186u
m45 n10 CI VSS VSS n l=0.18u w=0.68u as=0.2983p ad=0.1836p ps=1.186u pd=0.54u
m_m30 CO n14 VSS VSS n l=0.18u w=1.2u ad=0.4512p as=0.5264p pd=2.16u ps=2.093u
m_m28 S n11 VSS VSS n l=0.18u w=1.2u ad=0.576p as=0.4512p pd=2.16u ps=2.16u
.ends ADDFHX2

.subckt AND2X1 A B Y 

m_m3 n6 A VDD VDD p l=0.18u w=0.36u as=0.2366p ad=0.1998p ps=1.067u pd=1.09u
m_m1 n6 B VDD VDD p l=0.18u w=0.36u as=0.2366p ad=0.1998p ps=1.067u pd=1.09u
m_m5 Y n6 VDD VDD p l=0.18u w=0.9u ad=0.594p as=0.5914p pd=2.22u ps=2.667u
m_m4 n6 A n9 VSS n l=0.18u w=0.32u as=0.0608p ad=0.426p ps=0.38u pd=2.92u
m_m2 n9 B VSS VSS n l=0.18u w=0.32u as=0.243p ad=0.0608p ps=1.489u pd=0.38u
m_m6 Y n6 VSS VSS n l=0.18u w=0.6u ad=0.324p as=0.4556p pd=1.68u ps=2.791u
.ends AND2X1


.subckt AOI211X1 A0 A1 B0 C0 Y 
m_m3 n7 A1 VDD VDD p l=0.18u w=1.4u as=0.378p ad=0.672p ps=0.54u pd=2.36u
m_m2 n7 A0 VDD VDD p l=0.18u w=1.4u ad=0.378p as=0.378p pd=0.54u ps=0.54u
m_m5 n11 C0 n7 VDD p l=0.18u w=1.4u ad=0.266p as=0.378p pd=0.38u ps=0.54u
m_m6 Y B0 n11 VDD p l=0.18u w=1.4u ad=0.672p as=0.266p pd=2.36u ps=0.38u
m_m8 n13 A1 VSS VSS n l=0.18u w=0.8u ad=0.152p as=0.384p pd=0.38u ps=1.76u
m_m7 Y A0 n13 VSS n l=0.18u w=0.8u ad=0.2217p as=0.152p pd=0.7314u ps=0.38u
m_m4 Y C0 VSS VSS n l=0.18u w=0.6u as=0.2971p ad=0.1663p ps=1.31u pd=0.5486u
m_m1 Y B0 VSS VSS n l=0.18u w=0.6u ad=0.33p as=0.2971p pd=1.7u ps=1.31u
.ends AOI211X1

.subckt BUFX12 A Y 
m_m1 n3 A VDD VDD p l=0.1826u w=1.423u as=0.3249p ad=0.5968p ps=0.46u pd=2.27u
m1 n3 A VDD VDD p l=0.1826u w=1.423u ad=0.3049p as=0.3249p pd=0.46u ps=0.46u
m2 n3 A VDD VDD p l=0.1826u w=1.423u as=0.353p ad=0.3049p ps=0.5734u pd=0.46u
m_m3 Y n3 VDD VDD p l=0.182u w=1.803u ad=0.3939p as=0.4472p pd=0.46u
+ps=0.7266u
m4 Y n3 VDD VDD p l=0.182u w=1.803u as=0.4107p ad=0.3939p ps=0.46u pd=0.46u
m5 Y n3 VDD VDD p l=0.182u w=1.803u ad=0.3939p as=0.4107p pd=0.46u ps=0.46u
m6 Y n3 VDD VDD p l=0.182u w=1.803u as=0.4992p ad=0.3939p ps=0.56u pd=0.46u
m7 Y n3 VDD VDD p l=0.182u w=1.803u ad=0.3939p as=0.4992p pd=0.46u ps=0.56u
m8 Y n3 VDD VDD p l=0.182u w=1.803u as=0.8532p ad=0.3939p ps=2.73u pd=0.46u
m_m2 n3 A VSS VSS n l=0.18u w=0.42u as=0.1946p ad=0.2016p ps=0.9445u pd=1.38u
m10 n3 A VSS VSS n l=0.183u w=1.203u ad=0.2695p as=0.5574p pd=0.46u ps=2.706u
m11 n3 A VSS VSS n l=0.183u w=1.203u as=0.2651p ad=0.2695p ps=0.46u pd=0.46u
m_m4 Y n3 VSS VSS n l=0.183u w=1.203u ad=0.2575p as=0.2651p pd=0.46u ps=0.46u
m13 Y n3 VSS VSS n l=0.183u w=1.203u as=0.2711p ad=0.2575p ps=0.46u pd=0.46u
m14 Y n3 VSS VSS n l=0.183u w=1.203u ad=0.2575p as=0.2711p pd=0.46u ps=0.46u
m15 Y n3 VSS VSS n l=0.183u w=1.203u as=0.2711p ad=0.2575p ps=0.46u pd=0.46u
m16 Y n3 VSS VSS n l=0.183u w=1.203u ad=0.2575p as=0.2711p pd=0.46u ps=0.46u
m17 Y n3 VSS VSS n l=0.183u w=1.203u as=0.5168p ad=0.2575p ps=2.05u pd=0.46u
cp1 VSS 0 3.647f
cp2 n3 0 3.198f
cp3 n3 VSS 0.08624f
cp4 A 0 1.288f
cp5 A VSS 0.01143f
cp6 A n3 0.145f
cp7 Y 0 1.337f
cp8 Y VSS 0.2316f
cp9 Y n3 0.2431f
.ends BUFX12

.subckt DFFX1 CK D Q QN 
m_m7 cn CK VDD VDD p l=0.18u w=0.64u as=0.6436p ad=0.32p ps=2.85u pd=1.64u
m_m22 n36 D VDD VDD p l=0.18u w=0.42u ad=0.0798p as=0.4224p pd=0.38u ps=1.87u
m_m21 pm c n36 VDD p l=0.18u w=0.42u ad=0.1641p as=0.0798p pd=0.81u ps=0.38u
m_m3 pm cn n32 VDD p l=0.18u w=0.42u as=0.0798p ad=0.1641p ps=0.38u pd=0.81u
m_m4 n32 m VDD VDD p l=0.18u w=0.42u as=0.2326p ad=0.0798p ps=1.361u pd=0.38u
m_m17 m pm VDD VDD p l=0.18u w=0.42u ad=0.2016p as=0.2326p pd=1.38u ps=1.361u
m_m9 c cn VDD VDD p l=0.18u w=0.44u as=0.2437p ad=0.2112p ps=1.426u pd=1.4u
m_m26 n38 m VDD VDD p l=0.18u w=1.12u ad=0.2128p as=0.6203p pd=0.38u ps=3.631u
m_m25 n10 cn n38 VDD p l=0.18u w=1.12u ad=0.4942p as=0.2128p pd=1.656u ps=0.38u
m_m11 n10 c n34 VDD p l=0.18u w=0.3u as=0.057p ad=0.1324p ps=0.38u pd=0.4437u
m_m12 n34 s VDD VDD p l=0.18u w=0.3u as=0.1587p ad=0.057p ps=0.9049u pd=0.38u
m_m1 Q n10 VDD VDD p l=0.18u w=0.44u ad=0.1193p as=0.2327p pd=0.5378u
+ps=1.327u
m_m19 s n10 VDD VDD p l=0.18u w=0.48u ad=0.2304p as=0.2538p pd=1.44u ps=1.448u
m13 Q n10 VDD VDD p l=0.18u w=0.46u as=0.2846p ad=0.1247p ps=1.617u pd=0.5622u
m_m15 QN s VDD VDD p l=0.18u w=0.9u ad=0.648p as=0.5569p pd=2.34u ps=3.163u
m_m8 cn CK VSS VSS n l=0.18u w=0.42u as=0.3598p ad=0.2016p ps=2.298u pd=1.38u
m_m24 n35 D VSS VSS n l=0.18u w=0.3u ad=0.057p as=0.257p pd=0.38u ps=1.642u
m_m23 pm cn n35 VSS n l=0.18u w=0.3u ad=0.1248p as=0.057p pd=0.8u ps=0.38u
m_m5 pm c n31 VSS n l=0.18u w=0.3u as=0.057p ad=0.1248p ps=0.38u pd=0.8u
m_m6 n31 m VSS VSS n l=0.18u w=0.3u as=0.1182p ad=0.057p ps=0.74u pd=0.38u
m_m18 m pm VSS VSS n l=0.18u w=0.3u ad=0.2064p as=0.1182p pd=1.58u ps=0.74u
m_m10 c cn VSS VSS n l=0.18u w=0.3u as=0.09808p ad=0.2094p ps=0.4731u pd=1.6u
m_m28 n37 m VSS VSS n l=0.18u w=0.74u ad=0.1406p as=0.2419p pd=0.38u ps=1.167u
m_m27 n10 c n37 VSS n l=0.18u w=0.74u ad=0.2445p as=0.1406p pd=1.138u ps=0.38u
m_m13 n10 cn n33 VSS n l=0.18u w=0.3u as=0.057p ad=0.09912p ps=0.38u pd=0.4615u
m_m14 n33 s VSS VSS n l=0.18u w=0.3u as=0.1556p ad=0.057p ps=0.8557u pd=0.38u
m_m2 Q n10 VSS VSS n l=0.18u w=0.6u ad=0.288p as=0.3111p pd=1.56u ps=1.711u
m_m20 s n10 VSS VSS n l=0.18u w=0.32u ad=0.2084p as=0.1659p pd=1.56u ps=0.9128u
m_m16 QN s VSS VSS n l=0.18u w=0.6u ad=0.288p as=0.481p pd=1.56u ps=3.38u
.ends DFFX1

.subckt TIEHI Y 
m_m1 Y n2 VDD VDD p l=0.18u w=1u ad=0.52p as=0.6476p pd=2.04u ps=4.2u
m_m2 n2 n2 VSS VSS n l=0.18u w=0.3u ad=0.2064p as=0.3774p pd=1.58u ps=3.08u
.ends TIEHI
*vss1 VSS1 0 0v

.subckt TIELO Y 
m_m1 n2 n2 VDD VDD p l=0.18u w=0.3u ad=0.2064p as=0.6198p pd=1.58u ps=4.98u
m_m2 Y n2 VSS VSS n l=0.18u w=0.56u ad=0.2688p as=0.4998p pd=1.52u ps=3.2u
.ends TIELO
