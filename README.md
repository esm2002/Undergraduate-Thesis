# Undergraduate-Thesis

## 1. Repository

```bash
Undergraduate-Thesis/
├── README.md                 
├── fixed_point/                    
│   ├── src/               
│   └── reports_FPGA/           
├── floating_point/                       
│   ├── src/
│   └── reports_FPGA/        
├── posit/                      
│   ├── src/
│   └── reports_FPGA/
├── Test_Modules/  
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

| Fixed-Point(scenario) | Dynamic Range | Values | Max. Operating Freq.| Energy-Delay-Product | Cell Area | Values with Max. Clock Freq. |
|:-----:|:------:|:------:|:------:|:------:|:------:|:------:|
| 8W4F(s1) | log10(127)=2.104 | T=10ns<br>WNS=8.101ns<br>P=0.0329W<br>L=14 | 526.593 (MHz)<br>= 5.26593*1e8 (Hz) | 6.4484*1e-16 | 380.6 (um^2) | T=1.899ns<br>WNS=0.248ns<br>P=0.162W<br>L=14<br>EDP=1.1454*1e-16<br>cell_area=380.8(um^2) |
| 8W4F(s2) | log10(127)=2.104 | T=10ns<br>WNS=8.755ns<br>P=0.0461W<br>L=14 | 803.212 (MHz)<br>= 8.03212*1e8 (Hz) | 9.0356*1e-16 | 380.6 (um^2) | T=1.245ns<br>WNS=0.267ns<br>P=0.370W<br>L=14<br>EDP=1.1241*1e-16<br>cell_area=380.8(um^2) |

| Floating-Point(scenario) | Dynamic Range | Values | Max. Operating Freq.| Energy-Delay-Product | Cell Area | Values with Max. Clock Freq. |
|:-----:|:------:|:------:|:------:|:------:|:------:|:------:|
| 8W4E3F(s1) | log10(122880)=5.089 | T=10ns<br>WNS=6.428ns<br>P=0.0648W<br>L=19 | 279.955 (MHz)<br>= 2.79955*1e8 (Hz) | 23.3928*1e-16 | 994 (um^2) | T=3.572ns<br>WNS=0.432ns<br>P=0.160W<br>L=19<br>EDP=7.369*1e-16 <br>cell_area=930.8(um^2) |
| 8W4E3F(s2) | log10(122880)=5.089 | T=10ns<br>WNS=7.783ns<br>P=0.0873W<br>L=19 | 451.060 (MHz)<br>= 4.51060*1e8 (Hz) | 31.5153*1e-16 | 994 (um^2) | T=2.217ns<br>WNS=0.376ns<br>P=0.399W<br>L=19<br>EDP=7.079*1e-16<br>cell_area=930.8(um^2) |
| 8W5E2F(s1) | log10(3758096384)=9.574 | T=10ns<br>WNS=4.679ns<br>P=0.0905W<br>L=19 | 187.934 (MHz)<br>= 1.87934*1e8 (Hz) | 32.6705*1e-16 | 1574.3 (um^2) | T=5.321ns<br>WNS=0.256ns<br>P=0.157W<br>L=19<br>EDP=16.0477*1e-16 <br>cell_area=1484.0(um^2) | 
| 8W5E2F(s2) | log10(3758096384)=9.574 | T=10ns<br>WNS=6.769ns<br>P=0.122W<br>L=19 | 309.501 (MHz)<br>= 3.09501*1e8 (Hz) | 44.042*1e-16 | 1574.3 (um^2) | T=3.231ns<br>WNS=0.250ns<br>P=0.388W<br>L=19<br>EDP=14.622*1e-16<br>cell_area=1484.0(um^2) |

* Compare the original posit MAC with the new one

| Posit(scenario) | Dynamic Range | Values | Max. Operating Freq.| Energy-Delay-Product | Cell Area | Values with Max. Clock Freq. |
|:-----:|:------:|:------:|:------:|:------:|:------:|:------:|
| 8W2E(s1) | log10(16^12)=14.449 | T=10ns<br>WNS=2.613ns<br>P=0.13894W<br>L=24 | 135.373 (MHz)<br>= 1.35373*1e8 (Hz) | 80.02944*1e-16 | 2442.7 (um^2) | T=7.387ns<br>WNS=0.396ns<br>P=0.1814W<br>L=24<br>EDP=57.018*1e-16<br>cell_area=2491.0 (um^2) |
| **NEW** 8W2E(s1) | log10(16^12)=14.449 | T=10ns<br>WNS=6.280ns<br>P=0.0787W<br>L=21 | 268.817 (MHz)<br>= 2.68817*1e8 (Hz) | 34.7067*1e-16 | 2097.3 (um^2) | T=ns<br>WNS=ns<br>P=W<br>L=21<br>EDP=*1e-16<br>cell_area= (um^2) |
| 8W2E(s2) | log10(16^12)=14.449 | T=10ns<br>WNS=5.551ns<br>P=0.1924W<br>L=24 | 224.770 (MHz)<br>= 2.24770*1e8 (Hz) | 110.8224*1e-16 | 2442.7 (um^2) | T=4.449ns<br>WNS=0.284ns<br>P=0.4284W<br>L=24<br>EDP=48.846*1e-16<br>cell_area=2491.0 (um^2) |
| **NEW** 8W2E(s2) | log10(16^12)=14.449 | T=10ns<br>WNS=7.713ns<br>P=0.0987W<br>L=21 | 437.254 (MHz)<br>= 4.37254*1e8 (Hz) | 43.5267*1e-16 | 2097.3 (um^2) | T=ns<br>WNS=ns<br>P=W<br>L=21<br>EDP=*1e-16<br>cell_area= (um^2) |
| 8W1E(s1) | log10(4^12)=7.224 | T=10ns<br>WNS=5.844ns<br>P=0.1098W<br>L=24 | 240.615 (MHz)<br>= 2.40615*1e8 (Hz) | 63.2448*1e-16 | 1781.3 (um^2) | T=4.156ns<br>WNS=0.168ns<br>P=0.245W<br>L=24<br>EDP=24.375*1e-16<br>cell_area=1780.7 (um^2) |
| 8W1E(s2) | log10(4^12)=7.224 | T=10ns<br>WNS=7.444ns<br>P=0.1556W<br>L=24 | 391.236 (MHz)<br>= 3.91236*1e8 (Hz) | 89.6256*1e-16 | 1781.3 (um^2) | T=2.556ns<br>WNS=0.221ns<br>P=0.6032W<br>L=24<br>EDP=22.699*1e-16<br>cell_area=1780.7 (um^2) |

## 3. Original Posit MAC Report
<img width="1280" height="720" alt="image" src="https://github.com/user-attachments/assets/098f2c48-bbc2-4a6b-87f0-2c3002223cc5" />

## 4. New Posit MAC Report
<img width="1124" height="1352" alt="image" src="https://github.com/user-attachments/assets/18cfc62e-3570-498e-9c4a-1b8083883e3b" />
<img width="1066" height="1160" alt="image" src="https://github.com/user-attachments/assets/dfb42bcb-6ebb-4a67-a8c0-672c23f238be" />

## 5. Problems to Solve
* The Decode & Multiplication stage of the new posit MAC has no advantage (test_01: original, test_02: new)
<img width="940" height="293" alt="image" src="https://github.com/user-attachments/assets/eeee2d94-4ec7-4762-bbc3-889c7d232231" />
test_02 Total Power: 1.73e-02(W), 2.67e-02(W)

<img width="940" height="338" alt="image" src="https://github.com/user-attachments/assets/69e6c55d-5896-46c5-8f39-f554954a055d" />
test_01 Total Power: 1.99e-02(W), 2.85e-02(W)
* Writing the testbench and debugging detailed operations
* Optimization to minimize hardware resource usage

## 6. Experimental Results (Basys-3 FPGA) (# of multiplication = 1)

| Fixed-Point | Values | Dynamic Range | Max. Operating Freq.| Energy-Delay-Product | #LUTs |
|:-----:|:------:|:------:|:------:|:------:|:------:|
| 8W4F | T=10ns<br>WNS=0.410ns<br>P=0.084W<br>L=5 | log10(127)=2.104 | 104.275 (MHz)<br>= 1.04275*1e8 (Hz) | 2.1*1e-16 | 19 |

| Floating-Point | Values | Dynamic Range | Max. Operating Freq.| Energy-Delay-Product | #LUTs |
|:-----:|:------:|:------:|:------:|:------:|:------:|
| 8W4E3F | T=10ns<br>WNS=0.410ns<br>P=0.089W<br>L=11 | log10(122880)=5.089 | 104.275 (MHz)<br>= 1.04275*1e8 (Hz) | 10.769*1e-16 | 228 |

| Posit | Values | Dynamic Range | Max. Operating Freq.| Energy-Delay-Product | #LUTs |
|:-----:|:------:|:------:|:------:|:------:|:------:|
| 8W2E | T=10ns<br>WNS=0.301ns<br>P=0.105W<br>L=16 | log10(16^12)=14.449 | 103.103 (MHz)<br>= 1.03103*1e8 (Hz) | 26.88*1e-16 | 548 |

