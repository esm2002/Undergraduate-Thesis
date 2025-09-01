# Undergraduate-Thesis

## 1. Repository

```bash
Undergraduate-Thesis/
├── README.md                 
├── fixed_point/                    
│   ├── src/                   
│   ├── reports_FPGA/
│   └── reports/           
├── floating_point/                       
│   ├── src/
│   ├── reports_FPGA/
│   └── reports/           
├── posit/                      
│   ├── src/
│   ├── reports_FPGA/
│   └── reports/  
└── 8bit_FPGA_CONSTR.xdc/                      
```

## 2. Experimental Results (ASIC) (# of multiplication = 9)
* scenario 1: mode_norm.OC_rvt_ss28_0.90V_0.00V_0.90V_0.00V_125C
* scenario 2: mode_norm.OC_rvt_ff28_1.10V_0.00V_1.10V_0.00V_m40C
* T (ns) = target clock period, WNS (ns) = worst negative slack, L (cycle) = latency,
  W = total bits, E = exponential part bits, F = fraction part bits
* Dynamic Range: log10​(max/min)
  * Fixed-Point:
    max = (2^(W−1)−1)/2^F​, min = 1/2^F
  * Floating-Point:
    bias = 2^(E-1)-1, expmax = 2*bias,
    max = 2^(expmax-bias) * (2-2^(-F)),
    min = 2^(1-bias) * 2^(-F)
  * Posit:
    useed = 2^(2^E),
    max = useed^(W-2),
    min = useed^(-W+2)
* Max. Operating Freq. (MHz): max(1000/(T - WNS))
* Energy-Delay-Product (J*s): Power * (L * T)^2

| Fixed-Point(scenario) | Values | Dynamic Range | Max. Operating Freq.| Energy-Delay-Product | Cell Area |
|:-----:|:------:|:------:|:------:|:------:|:------:|
| 8W4F(s1) | T=10ns<br>WNS=8.101ns<br>P=0.0329W<br>L=14 | log10(127)=2.104 | 526.593 (MHz)<br>= 5.26593*1e8 (Hz) | 6.4484*1e-16 | 380.6 (um^2) |
| 8W4F(s2) | T=10ns<br>WNS=8.755ns<br>P=0.0461W<br>L=14 | log10(127)=2.104 | 803.212 (MHz)<br>= 8.03212*1e8 (Hz) | 9.0356*1e-16 | 380.6 (um^2) |

| Floating-Point(scenario) | Values | Dynamic Range | Max. Operating Freq.| Energy-Delay-Product | Cell Count |
|:-----:|:------:|:------:|:------:|:------:|:------:|
| 8W4E3F(s1) | T=10ns<br>WNS=6.428ns<br>P=0.0648W<br>L=19 | log10(122880)=5.089 | 279.955 (MHz)<br>= 2.79955*1e8 (Hz) | 23.3928*1e-16 | 994 (um^2) |
| 8W4E3F(s2) | T=10ns<br>WNS=7.783ns<br>P=0.0873W<br>L=19 | log10(122880)=5.089 | 451.060 (MHz)<br>= 4.51060*1e8 (Hz) | 31.5153*1e-16 | 994 (um^2) |
| 8W3E4F(s1) | T=10ns<br>WNS=7.679ns<br>P=0.0469W<br>L=19 | log10(992)=0.954 | 430.848 (MHz)<br>= 4.30848*1e8 (Hz) | 16.9309*1e-16 | 747 |
| 8W3E4F(s2) | T=10ns<br>WNS=8.518ns<br>P=0.0683W<br>L=19 | log10(992)=0.954 | 674.763 (MHz)<br>= 6.74763*1e8 (Hz) | 24.6563*1e-16 | 747 |

| Posit(scenario) | Values | Dynamic Range | Max. Operating Freq.| Energy-Delay-Product | Cell Count |
|:-----:|:------:|:------:|:------:|:------:|:------:|
| 8W2E(s1) | T=10ns<br>WNS=2.613ns<br>P=0.13894W<br>L=24 | log10(16^12)=14.449 | 135.373 (MHz)<br>= 1.35373*1e8 (Hz) | 80.02944*1e-16 | 2442.7 (um^2) |
| 8W2E(s2) | T=10ns<br>WNS=5.551ns<br>P=0.1924W<br>L=24 | log10(16^12)=14.449 | 224.770 (MHz)<br>= 2.24770*1e8 (Hz) | 110.8224*1e-16 | 2442.7 (um^2) |
| 8W1E(s1) | T=10ns<br>WNS=5.844ns<br>P=0.1098W<br>L=24 | log10(4^12)=7.224 | 240.615 (MHz)<br>= 2.40615*1e8 (Hz) | 63.2448*1e-16 | 1867 |
| 8W1E(s2) | T=10ns<br>WNS=7.444ns<br>P=0.1556W<br>L=24 | log10(4^12)=7.224 | 391.236 (MHz)<br>= 3.91236*1e8 (Hz) | 89.6256*1e-16 | 1867 |

## 3. Schematic
1. Posit Decoder (8W2E)
<img width="2306" height="1022" alt="image" src="https://github.com/user-attachments/assets/c709456f-76cb-455d-8e8d-e3ba2a09b705" />


## 4. Experimental Results (Basys-3 FPGA) (# of multiplication = 1)

| Fixed-Point | Values | Dynamic Range | Max. Operating Freq.| Energy-Delay-Product | #LUTs |
|:-----:|:------:|:------:|:------:|:------:|:------:|
| 8W4F | T=10ns<br>WNS=0.410ns<br>P=0.084W<br>L=5 | log10(127)=2.104 | 104.275 (MHz)<br>= 1.04275*1e8 (Hz) | 2.1*1e-16 | 19 |

| Floating-Point | Values | Dynamic Range | Max. Operating Freq.| Energy-Delay-Product | #LUTs |
|:-----:|:------:|:------:|:------:|:------:|:------:|
| 8W4E3F | T=10ns<br>WNS=0.410ns<br>P=0.089W<br>L=11 | log10(122880)=5.089 | 104.275 (MHz)<br>= 1.04275*1e8 (Hz) | 10.769*1e-16 | 228 |

| Posit | Values | Dynamic Range | Max. Operating Freq.| Energy-Delay-Product | #LUTs |
|:-----:|:------:|:------:|:------:|:------:|:------:|
| 8W2E | T=10ns<br>WNS=0.301ns<br>P=0.105W<br>L=16 | log10(16^12)=14.449 | 103.103 (MHz)<br>= 1.03103*1e8 (Hz) | 26.88*1e-16 | 548 |

