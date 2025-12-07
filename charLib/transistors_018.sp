
* First line is always a comment

*  ******************************************
*  *             SPICE MODELS               *
*  ******************************************

******************************************************************************
*                                                                            *
*       IN THIS MODEL LIB CONTAINS :                                         *
*                                                                            *
*       1.LIB TT                                                             *
*             SS                                                             *
*             FF                                                             *
*                                                                            *     
*       2.LIB DIO  (not included here)                                                          *
*                                                                            *
******************************************************************************
******************************************************************************                                         *
*  note:                                                                     *
*      corner_name                                                           *
*       TT : typical model                                                   *
*       SS : Slow NMOS Slow PMOS model                                       *
*       FF : Fast NMOS Fast PMOS model                                       *
*                                                                            *
******************************************************************************
***************************************************************               
*                                                             *               
*                Nominal Supply = 1.8V                        *               
*                                                             *              
***************************************************************             
*****************  TYPICAL MODEL ***************              
.LIB TT
.param
+toxn   = 4.0E-09         toxp   = 4.0E-09
+dvthn  = 0               dvthp  = 0
+dxl    = 0               dxw    = 0
+cjn    = 0.001           cjp    = 0.0011
+cjswn  = 2.0E-10         cjswp  = 2.4E-10
+cjswgn = 3.3E-10         cjswgp = 4.2E-10
+cgon   = 3.7E-10         cgop   = 3.3E-10
+hdifn  = 2E-07           hdifp  = 2E-07
.lib './transistors_018.sp' MOS
.ENDL TT
*****************  Slow N, Slow P MODEL ***************
.LIB SS
.param
+toxn   = 4.1E-09         toxp   = 4.1E-09
+dvthn  = 0.1             dvthp  = -0.067   
+dxl    = 1E-08           dxw    = -2E-08 
+cjn    = 0.001           cjp    = 0.0012
+cjswn  = 2.1E-10         cjswp  = 2.6E-10
+cjswgn = 3.5E-10         cjswgp = 4.4E-10
+cgon   = 3.4E-10         cgop   = 3.1E-10
+hdifn  = 2E-07           hdifp  = 2E-07    
.lib './transistors_018.sp' MOS                         
.ENDL SS                                    
*****************   Fast N, Fast P MODEL ***************
.LIB FF
.param
+toxn   = 3.9E-09         toxp   = 3.9E-09
+dvthn  = -0.1            dvthp  = 0.07
+dxl    = -1E-08          dxw    = 2E-08
+cjn    = 0.0009          cjp    = 0.00104
+cjswn  = 1.1E-10         cjswp  = 2.3E-10
+cjswgn = 3.2E-10         cjswgp = 4.0E-10
+cgon   = 3.8E-10         cgop   = 3.4E-10
+hdifn  = 2E-07           hdifp  = 2E-07
.lib './transistors_018.sp' MOS
.ENDL FF

.LIB MOS
***************************************************************
*                                                             *
*               1.8V  MOS DEVICES MODEL                       *
*                                                             *
***************************************************************
*

.MODEL nch.1              NMOS   (                  LMIN     = 1.8E-07
+LMAX    = '5E-07-dxl'    WMIN     = '1.01E-05-dxw' WMAX     = 0.000101
+NLEV    = 3              AF       = 0.8256         KF       = 9.326E-25
+LEVEL   = 49             TNOM     = 25             VERSION  = 3.1
+TOX     = toxn           XJ       = 1.6E-07        NCH      = 3.9E+17
+LLN     = 1              LWN      = 1              WLN      = 1
+WWN     = 1              LINT     = 1E-08          LL       = 0
+LW      = 0              LWL      = 0              WINT     = 1E-08
+WL      = 0              WW       = 0              WWL      = 0
+MOBMOD  = 1              BINUNIT  = 2              XL       = '-2E-08+dxl'
+XW      = '0+dxw'        DWG      = 0              DWB      = 0
+ACM     = 12             LDIF     = 9E-08          HDIF     = hdifn
+RSH     = 6.8            RD       = 0              RS       = 0
+VTH0    = '0.489+dvthn'  LVTH0    = 4.03E-09       WVTH0    = -1.384E-07
+PVTH0   = 1.8E-14        K1       = 0.462          LK1      = 4.13E-08
+WK1     = -5.3E-07       PK1      = 7.8E-14        K2       = 0.041
+LK2     = -2.0E-08       WK2      = 1.8E-07        PK2      = -2.9E-14
+K3      = 0              DVT0     = 0              DVT1     = 0
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0
+DVT2W   = 0              NLX      = 0              W0       = 0
+PKT2    = 2.5E-14        AT       = 20004          LAT      = -2.1E-06
+WAT     = -4.7E-05       PAT      = 2.1E-11        UTE      = -1.4
+LUTE    = 1.0E-09        WUTE     = -6.2E-06       PUTE     = 6.9E-13
+UA1     = 1.2E-09        LUA1     = -9.0E-20       WUA1     = -6.4E-17
+PUA1    = 9.0E-24        UB1      = -8.0E-19       LUB1     = 1.1E-25
+WUB1    = -2.7E-23       PUB1     = 2.7E-30        UC1      = 9.0E-12
+LUC1    = 1.9E-17        WUC1     = -1.4E-15       PUC1     = 1.0E-22
+KT1L    = 0              PRT      = 0              CJ       = cjn
+PB      = 0.69           MJ       = 0.36           CJSW     = cjswn
+PBSW    = 0.69           MJSW     = 0.20           CJSWG    = cjswgn
+PBSWG   = 0.69           MJSWG    = 0.44           CGDO     = cgon
+CGSO    = cgon           CTA      = 0.001          CTP      = 0.0006
+PTA     = 0.0015         PTP      = 0.001          JS       = 8.3E-06
+JSW     = 1.6E-11        N        = 1              XTI      = 3
+CAPMOD  = 0              NQSMOD   = 0              XPART    = 1
+CF      = 0              TLEV     = 1              TLEVC    = 1
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+DLC     = 3E-9       )


.MODEL nch.2              NMOS   (                  LMIN     = 1.8E-07
+LMAX    = '5E-07-dxl'    WMIN     = '1.3E-06-dxw'  WMAX     = '1.01E-05-dxw'
+NLEV     = 3             AF       = 0.825          KF       = 9.3E-25
+LEVEL   = 49             TNOM     = 25             VERSION  = 3.1
+TOX     = toxn           XJ       = 1.6E-07        NCH      = 3.9E+17
+LLN     = 1              LWN      = 1              WLN      = 1
+WWN     = 1              LINT     = 1E-08          LL       = 0
+LW      = 0              LWL      = 0              WINT     = 1E-08
+WL      = 0              WW       = 0              WWL      = 0
+MOBMOD  = 1              BINUNIT  = 2              XL       = '-2E-08+dxl'
+XW      = '0+dxw'        DWG      = 0              DWB      = 0
+ACM     = 12             LDIF     = 9E-08          HDIF     = hdifn
+RSH     = 6.8            RD       = 0              RS       = 0
+VTH0    = '0.475+dvthn'  LVTH0    = 5.3E-09        WVTH0    = 1.0E-09
+PVTH0   = 5.1E-15        K1       = 0.39           LK1      = 4.9E-08
+WK1     = 9.7E-08        PK1      = -6.4E-15       K2       = 0.06
+LK2     = -2.3E-08       WK2      = -4.2E-08       PK2      = 5.4E-15
+K3      = 0              DVT0     = 0              DVT1     = 0
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0
+DVT2W   = 0              NLX      = 0              W0       = 0
+PKT2    = -3.9E-17       AT       = 20000          UTE      = -2.2
+LUTE    = 8.3E-08        WUTE     = 9.0E-07        PUTE     = -1.3E-13
+UA1     = 1.2E-09        LUA1     = 9.2E-19        WUA1     = 8.4E-18
+PUA1    = -1.1E-24       UB1      = -3.8E-18       LUB1     = 4.3E-25
+WUB1    = 3.2E-24        PUB1     = -4.8E-31       UC1      = -1.5E-10
+LUC1    = 3.2E-17        WUC1     = 1.8E-16        PUC1     = -3.2E-23
+KT1L    = 0              PRT      = 0              CJ       = cjn
+PB      = 0.69           MJ       = 0.35           CJSW     = cjswn
+PBSW    = 0.69           MJSW     = 0.20           CJSWG    = cjswgn
+PBSWG   = 0.69           MJSWG    = 0.44           CGDO     = cgon
+CGSO    = cgon           CTA      = 0.001          CTP      = 0.0006
+PTA     = 0.0015         PTP      = 0.0015         JS       = 8.3E-06
+JSW     = 1.6E-11        N        = 1              XTI      = 3
+CAPMOD  = 0              NQSMOD   = 0              XPART    = 1
+CF      = 0              TLEV     = 1              TLEVC    = 1
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+DLC     = 3E-9       )



.MODEL nch.3              NMOS   (                  LMIN     = 1.8E-07
+LMAX    = '5E-07-dxl'    WMIN     = '6E-07-dxw'    WMAX     = '1.3E-06-dxw'
+NLEV     = 3             AF       = 0.8256         KF       = 9.326E-25
+LEVEL   = 49             TNOM     = 25             VERSION  = 3.1
+TOX     = toxn           XJ       = 1.6E-07        NCH      = 3.9E+17
+LLN     = 1              LWN      = 1              WLN      = 1
+WWN     = 1              LINT     = 1E-08          LL       = 0
+LW      = 0              LWL      = 0              WINT     = 1E-08
+WL      = 0              WW       = 0              WWL      = 0
+MOBMOD  = 1              BINUNIT  = 2              XL       = '-2E-08+dxl'
+XW      = '0+dxw'        DWG      = 0              DWB      = 0
+ACM     = 12             LDIF     = 9E-08          HDIF     = hdifn
+RSH     = 6.8            RD       = 0              RS       = 0
+VTH0    = '0.48+dvthn'   LVTH0    = 1.1E-08        WVTH0    = -7.0E-09
+PVTH0   = -3.0E-15       K1       = 0.49           LK1      = 4.8E-08
+WK1     = -1.6E-08       PK1      = -4.5E-15       K2       = 0.03
+LK2     = -2.0E-08       WK2      = 6.0E-10        PK2      = 5.8E-16
+LKT2    = -3.8E-10       WKT2     = -5.1E-09       PKT2     = 1.2E-15
+AT      = 20000          UTE      = -1.1           LUTE     = -6.96E-08
+WUTE    = -4.7E-07       PUTE     = 6.1E-14        UA1      = 1.224E-09
+UB1     = -5.7E-20       LUB1     = -1.2E-25       WUB1     = -1.6E-24
+PUB1    = 2.3E-31        UC1      = 1.0E-10        LUC1     = -1.7E-17
+WUC1    = -1.5E-16       PUC1     = 3.1E-23        KT1L     = 0
+PRT     = 0              CJ       = cjn            PB       = 0.69
+MJ      = 0.35           CJSW     = cjswn          PBSW     = 0.69
+MJSW    = 0.20           CJSWG    = cjswgn         PBSWG    = 0.69
+MJSWG   = 0.44           CGDO     = cgon           CGSO     = cgon
+CTA     = 0.001          CTP      = 0.0006         PTA      = 0.001
+PTP     = 0.001554306    JS       = 8.3E-06        JSW      = 1.6E-11
+N       = 1              XTI      = 3              CAPMOD   = 0
+NQSMOD  = 0              XPART    = 1              CF       = 0
+TLEV    = 1              TLEVC    = 1              CALCACM  = 1
+SFVTFLAG= 0              VFBFLAG  = 1              DLC      = 3E-9  )


.MODEL nch.4              NMOS   (                  LMIN     = 1.8E-07
+LMAX    = '5E-07-dxl'    WMIN     = 2.2E-07        WMAX     = '6E-07-dxw'
+NLEV     = 3             AF       = 0.8256         KF       = 9.3E-25
+LEVEL   = 49             TNOM     = 25             VERSION  = 3.1
+TOX     = toxn           XJ       = 1.6E-07        NCH      = 3.9E+17
+LLN     = 1              LWN      = 1              WLN      = 1
+WWN     = 1              LINT     = 1E-08          LL       = 0
+LW      = 0              LWL      = 0              WINT     = 1E-08
+WL      = 0              WW       = 0              WWL      = 0
+MOBMOD  = 1              BINUNIT  = 2              XL       = '-2E-08+dxl'
+XW      = '0+dxw'        DWG      = 0              DWB      = 0
+ACM     = 12             LDIF     = 9E-08          HDIF     = hdifn
+RSH     = 6.8            RD       = 0              RS       = 0
+VTH0    = '0.47+dvthn'   LVTH0    = 5.1E-09        WVTH0    = -2.5E-09
+PVTH0   = 7.7E-16        K1       = 0.49           LK1      = 3.3E-08
+WK1     = -1.8E-08       PK1      = 4.1E-15        K2       = 0.02
+LK2     = -1.5E-08       WK2      = 4.1E-09        PK2      = -2.2E-15
+K3      = 0              DVT0     = 0              DVT1     = 0
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0
+DVT2W   = 0              NLX      = 0              W0       = 0
+WKT2    = 2.0E-09        PKT2     = -7.7E-17       AT       = 20000
+UTE     = -1.9           LUTE     = 4.8E-08        WUTE     = 1.3E-08
+PUTE    = -6.1E-15       UA1      = 1.2E-09        UB1      = -3.0E-18
+LUB1    = 3.2E-25        WUB1     = 1.4E-25        PUB1     = -2.8E-32
+UC1     = -2.3E-10       LUC1     = 5.5E-17        WUC1     = 4.9E-17
+PUC1    = -1.0E-23       KT1L     = 0              PRT      = 0
+CJ      = cjn            PB       = 0.69           MJ       = 0.36
+CJSW    = cjswn          PBSW     = 0.69           MJSW     = 0.20
+CJSWG   = cjswgn         PBSWG    = 0.69           MJSWG    = 0.43
+CGDO    = cgon           CGSO     = cgon           CTA      = 0.001040287
+CTP     = 0.0006         PTA      = 0.001          PTP      = 0.001
+JS      = 8.38E-06       JSW      = 1.6E-11        N        = 1
+XTI     = 3              CAPMOD   = 0              NQSMOD   = 0
+XPART   = 1              CF       = 0              TLEV     = 1
+TLEVC   = 1              CALCACM  = 1              SFVTFLAG = 0
+VFBFLAG = 1              DLC      = 3E-9   )


.MODEL pch.1              PMOS   (                  LMIN     = 1.8E-07
+LMAX    = '5E-07-dxl'    WMIN     = '1.01E-05-dxw' WMAX     = 0.000101
+NLEV    = 3              AF       = 1.252          KF       = 9.267E-24
+LEVEL   = 49             TNOM     = 25             VERSION  = 3.1
+TOX     = toxp           XJ       = 1.7E-07        NCH      = 3.9E+17
+LLN     = 1              LWN      = 1              WLN      = 1
+WWN     = 1              LINT     = 1.5E-08        LL       = 0
+LW      = 0              LWL      = 0              WINT     = 1.5E-08
+WL      = 0              WW       = 0              WWL      = 0
+MOBMOD  = 1              BINUNIT  = 2              XL       = '-2E-08+dxl'
+XW      = '0+dxw'        DWG      = 0              DWB      = 0
+ACM     = 12             LDIF     = 9E-08          HDIF     = hdifp
+RSH     = 7.2            RD       = 0              RS       = 0
+VTH0    = '-0.45+dvthp'  LVTH0    = -7.5E-09       WVTH0    = 6.8E-08
+PVTH0   = -6.7E-15       K1       = 0.507          LK1      = 1.8E-08
+WK1     = 2.4E-07        PK1      = -1.5E-14       K2       = 0.048
+LK2     = -6.7E-09       WK2      = -1.0E-07       PK2      = 8.7E-15
+K3      = 0              DVT0     = 0              DVT1     = 0
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0
+DVT2W   = 0              NLX      = 0              W0       = 0
+UTE     = -0.73          LUTE     = 3.2E-09        WUTE     = 2.6E-07
+PUTE    = -1.6E-14       UA1      = 1.2E-09        UB1      = -1.3E-18
+LUB1    = 2.8E-26        UC1      = 6.6E-11        LUC1     = -6.8E-18
+KT1L    = 0              PRT      = 0              CJ       = cjp
+PB      = 0.89           MJ       = 0.44           CJSW     = cjswp
+PBSW    = 0.89           MJSW     = 0.36           CJSWG    = cjswgp
+PBSWG   = 0.89           MJSWG    = 0.36           CGDO     = cgop
+CGSO    = cgop           CTA      = 0.0009         CTP      = 0.0004
+PTA     = 0.0015         PTP      = 0.0015         JS       = 4.9E-06
+JSW     = 9E-10          N        = 1              XTI      = 3
+CAPMOD  = 0              NQSMOD   = 0              XPART    = 1
+CF      = 0              TLEV     = 1              TLEVC    = 1
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+DLC     = 2E-9             )


.MODEL pch.2              PMOS   (                  LMIN     = 1.8E-07
+LMAX    = '5E-07-dxl'    WMIN     = '1.3E-06-dxw'  WMAX     = '1.01E-05-dxw'
+NLEV    = 3              AF       = 1.252          KF       = 9.2E-24
+LEVEL   = 49             TNOM     = 25             VERSION  = 3.1
+TOX     = toxp           XJ       = 1.7E-07        NCH      = 3.9E+17
+LLN     = 1              LWN      = 1              WLN      = 1
+WWN     = 1              LINT     = 1.5E-08        LL       = 0
+LW      = 0              LWL      = 0              WINT     = 1.5E-08
+WL      = 0              WW       = 0              WWL      = 0
+MOBMOD  = 1              BINUNIT  = 2              XL       = '-2E-08+dxl'
+XW      = '0+dxw'        DWG      = 0              DWB      = 0
+ACM     = 12             LDIF     = 9E-08          HDIF     = hdifp
+RSH     = 7.2            RD       = 0              RS       = 0
+VTH0    = '-0.451+dvthp' LVTH0    = -8.0E-09       WVTH0    = 1.0E-08
+PVTH0   = -1.7E-15       K1       = 0.52           LK1      = 1.8E-08
+WK1     = 1.4E-07        PK1      = -2.0E-14       K2       = 0.04
+LK2     = -6.7E-09       WK2      = -5.2E-08       PK2      = 8.7E-15
+K3      = 0              DVT0     = 0              DVT1     = 0
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0
+DVT2W   = 0              NLX      = 0              W0       = 0
+LKT2    = -7.6E-11       WKT2     = 8.0E-09        PKT2     = -1.5E-15
+AT      = 10000          UTE      = -0.72          LUTE     = 5.3E-10
+WUTE    = 1.2E-07        PUTE     = 1.0E-14        UA1      = 1.24E-09
+UB1     = -1.3E-18       LUB1     = 2.5E-26        WUB1     = -2.5E-25
+PUB1    = 3.3E-32        UC1      = 7.1E-11        LUC1     = -7.8E-18
+WUC1    = -4.9E-17       PUC1     = 1.0E-23        KT1L     = 0
+PRT     = 0              CJ       = cjp            PB       = 0.9
+MJ      = 0.44           CJSW     = cjswp          PBSW     = 0.9
+MJSW    = 0.36           CJSWG    = cjswgp         PBSWG    = 0.9
+MJSWG   = 0.36           CGDO     = cgop           CGSO     = cgop
+CTA     = 0.0009         CTP      = 0.0004         PTA      = 0.0015
+PTP     = 0.0015         JS       = 4.9E-06        JSW      = 9E-10
+N       = 1              XTI      = 3              CAPMOD   = 0
+NQSMOD  = 0              XPART    = 1              CF       = 0
+TLEV    = 1              TLEVC    = 1              CALCACM  = 1
+SFVTFLAG= 0              VFBFLAG  = 1              DLC      = 2E-9   )


.MODEL pch.3              PMOS   (                  LMIN     = 1.8E-07
+LMAX    = '5E-07-dxl'    WMIN     = '6E-07-dxw'    WMAX     = '1.3E-06-dxw'
+NLEV    = 3              AF       = 1.252          KF       = 9.2E-24
+LEVEL   = 49             TNOM     = 25             VERSION  = 3.1
+TOX     = toxp           XJ       = 1.7E-07        NCH      = 3.9E+17
+LLN     = 1              LWN      = 1              WLN      = 1
+WWN     = 1              LINT     = 1.5E-08        LL       = 0
+LW      = 0              LWL      = 0              WINT     = 1.5E-08
+WL      = 0              WW       = 0              WWL      = 0
+MOBMOD  = 1              BINUNIT  = 2              XL       = '-2E-08+dxl'
+XW      = '0+dxw'        DWG      = 0              DWB      = 0
+ACM     = 12             LDIF     = 9E-08          HDIF     = hdifp
+RSH     = 7.2            RD       = 0              RS       = 0
+VTH0    = '-0.43+dvthp'  LVTH0    = -1.3E-08       WVTH0    = -8.4E-09
+PVTH0   = 5.4E-15        K1       = 0.75           LK1      = -1.2E-08
+WK1     = -1.5E-07       PK1      = 1.8E-14        K2       = -0.04
+LK2     = 6.0E-09        WK2      = 5.2E-08        PK2      = -7.4E-15
+K3      = 0              DVT0     = 0              DVT1     = 0
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0
+DVT2W   = 0              NLX      = 0              W0       = 0
+LKT2    = -3.2E-09       WKT2     = -9.6E-09       PKT2     = 2.4E-15
+AT      = 10000          UTE      = -0.58          LUTE     = 9.1E-09
+WUTE    = -5.5E-08       PUTE     = -3.9E-16       UA1      = 1.2E-09
+UB1     = -1.6E-18       LUB1     = 7.9E-26        WUB1     = 1.1E-25
+PUB1    = -3.5E-32       UC1      = -5.6E-11       LUC1     = 1.1E-17
+WUC1    = 1.1E-16        PUC1     = -1.4E-23       KT1L     = 0
+PRT     = 0              CJ       = cjp            PB       = 0.89
+MJ      = 0.44           CJSW     = cjswp          PBSW     = 0.89
+MJSW    = 0.36           CJSWG    = cjswgp         PBSWG    = 0.89
+MJSWG   = 0.36           CGDO     = cgop           CGSO     = cgop
+CTA     = 0.001          CTP      = 0.0004         PTA      = 0.0015
+PTP     = 0.0015         JS       = 4.9E-06        JSW      = 9E-10
+N       = 1              XTI      = 3              CAPMOD   = 0
+NQSMOD  = 0              XPART    = 1              CF       = 0
+TLEV    = 1              TLEVC    = 1              CALCACM  = 1
+SFVTFLAG= 0              VFBFLAG  = 1              DLC      = 2E-9  )

.MODEL pch.4              PMOS   (                  LMIN     = 1.8E-07
+LMAX    = '5E-07-dxl'    WMIN     = 2.2E-07        WMAX     = '6E-07-dxw'
+NLEV    = 3              AF       = 1.252          KF       = 9.2E-24
+LEVEL   = 49             TNOM     = 25             VERSION  = 3.1
+TOX     = toxp           XJ       = 1.7E-07        NCH      = 3.9E+17
+LLN     = 1              LWN      = 1              WLN      = 1
+WWN     = 1              LINT     = 1.5E-08        LL       = 0
+LW      = 0              LWL      = 0              WINT     = 1.5E-08
+WL      = 0              WW       = 0              WWL      = 0
+MOBMOD  = 1              BINUNIT  = 2              XL       = '-2E-08+dxl'
+XW      = '0+dxw'        DWG      = 0              DWB      = 0
+ACM     = 12             LDIF     = 9E-08          HDIF     = hdifp
+RSH     = 7.2            RD       = 0              RS       = 0
+VTH0    = '-0.463+dvthp' LVTH0    = 5.3E-10        WVTH0    = 8.4E-09
+PVTH0   = -2.6E-15       K1       = 0.467          LK1      = 1.4E-08
+WK1     = 8.0E-09        PK1      = 3.5E-15        K2       = 0.058
+LK2     = -3.5E-09       WK2      = -3.7E-09       PK2      = -2.0E-15
+K3      = 0              DVT0     = 0              DVT1     = 0
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0
+DVT2W   = 0              NLX      = 0              W0       = 0
+LKT2    = 2.6E-09        WKT2     = 3.6E-09        PKT2     = -9.2E-16
+AT      = 10000          UTE      = -0.6           LUTE     = -5.8E-10
+WUTE    = -4.5E-08       PUTE     = 5.1E-15        UA1      = 1.2E-09
+UB1     = -1.4E-18       LUB1     = -1.1E-26       WUB1     = -2.0E-27
+PUB1    = 1.6E-32        UC1      = 1.9E-10        LUC1     = -2.3E-17
+WUC1    = -3.1E-17       PUC1     = 5.3E-24        KT1L     = 0
+PRT     = 0              CJ       = cjp            PB       = 0.89
+MJ      = 0.44           CJSW     = cjswp          PBSW     = 0.89
+MJSW    = 0.36           CJSWG    = cjswgp         PBSWG    = 0.89
+MJSWG   = 0.36           CGDO     = cgop           CGSO     = cgop
+CTA     = 0.0009         CTP      = 0.0004         PTA      = 0.001 
+PTP     = 0.001          JS       = 4.9E-06        JSW      = 9E-10
+N       = 1              XTI      = 3              CAPMOD   = 0
+NQSMOD  = 0              XPART    = 1              CF       = 0
+TLEV    = 1              TLEVC    = 1              CALCACM  = 1
+SFVTFLAG= 0              VFBFLAG  = 1              DLC      = 2E-9  )

.ENDL MOS
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
