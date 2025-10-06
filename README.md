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
* Speedup : (L_base*(T-WNS_base)) / (L_new*(T-WNS_new))

| Fixed-Point(scenario) | Dynamic Range | Values | Max. Operating Freq.| Energy-Delay-Product | Cell Area | Values with Max. Clock Freq. |
|:-----:|:------:|:------:|:------:|:------:|:------:|:------:|
| 8W4F(s1) | log10(127)=2.104 | T=10ns<br>WNS=8.101ns<br>P=0.0329mW<br>L=14 | 526.593 (MHz)<br>= 5.26593*1e8 (Hz) | 6.4484*1e-19 | 380.6 (um^2) | T=1.899ns<br>WNS=0.248ns<br>P=0.162mW<br>L=14<br>EDP=1.1454*1e-19<br>cell_area=380.8(um^2) |
| 8W4F(s2) | log10(127)=2.104 | T=10ns<br>WNS=8.755ns<br>P=0.0461mW<br>L=14 | 803.212 (MHz)<br>= 8.03212*1e8 (Hz) | 9.0356*1e-19 | 380.6 (um^2) | T=1.245ns<br>WNS=0.267ns<br>P=0.370mW<br>L=14<br>EDP=1.1241*1e-19<br>cell_area=380.8(um^2) |

| Floating-Point(scenario) | Dynamic Range | Values | Max. Operating Freq.| Energy-Delay-Product | Cell Area | Values with Max. Clock Freq. |
|:-----:|:------:|:------:|:------:|:------:|:------:|:------:|
| 8W4E3F(s1) | log10(122880)=5.089 | T=10ns<br>WNS=6.428ns<br>P=0.0648mW<br>L=19 | 279.955 (MHz)<br>= 2.79955*1e8 (Hz) | 23.3928*1e-19 | 994 (um^2) | T=3.572ns<br>WNS=0.432ns<br>P=0.160mW<br>L=19<br>EDP=7.369*1e-19 <br>cell_area=930.8(um^2) |
| 8W4E3F(s2) | log10(122880)=5.089 | T=10ns<br>WNS=7.783ns<br>P=0.0873mW<br>L=19 | 451.060 (MHz)<br>= 4.51060*1e8 (Hz) | 31.5153*1e-19 | 994 (um^2) | T=2.217ns<br>WNS=0.376ns<br>P=0.399mW<br>L=19<br>EDP=7.079*1e-19<br>cell_area=930.8(um^2) |
| 8W5E2F(s1) | log10(3758096384)=9.574 | T=10ns<br>WNS=4.679ns<br>P=0.0905mW<br>L=19 | 187.934 (MHz)<br>= 1.87934*1e8 (Hz) | 32.6705*1e-19 | 1574.3 (um^2) | T=5.321ns<br>WNS=0.256ns<br>P=0.157mW<br>L=19<br>EDP=16.0477*1e-19 <br>cell_area=1484.0(um^2) | 
| 8W5E2F(s2) | log10(3758096384)=9.574 | T=10ns<br>WNS=6.769ns<br>P=0.122mW<br>L=19 | 309.501 (MHz)<br>= 3.09501*1e8 (Hz) | 44.042*1e-19 | 1574.3 (um^2) | T=3.231ns<br>WNS=0.250ns<br>P=0.388mW<br>L=19<br>EDP=14.622*1e-19<br>cell_area=1484.0(um^2) |

* Compare the original posit MAC with the new one

| Posit(scenario) | Dynamic Range | Values | Max. Operating Freq.| Energy-Delay-Product | Cell Area | Values with Max. Clock Freq. |
|:-----:|:------:|:------:|:------:|:------:|:------:|:------:|
| 8W2E(s1) | log10(16^12)=14.449 | T=10ns<br>WNS=2.613ns<br>P=0.13894mW<br>L=24 | 135.373 (MHz)<br>= 1.35373*1e8 (Hz) | 80.02944*1e-19 | 2442.7 (um^2) | T=7.387ns<br>WNS=0.396ns<br>P=0.1814mW<br>L=24<br>EDP=57.018*1e-19<br>cell_area=2491.0 (um^2) |
| 8W2E(s2) | log10(16^12)=14.449 | T=10ns<br>WNS=5.551ns<br>P=0.1924mW<br>L=24 | 224.770 (MHz)<br>= 2.24770*1e8 (Hz) | 110.8224*1e-19 | 2442.7 (um^2) | T=4.449ns<br>WNS=0.284ns<br>P=0.4284mW<br>L=24<br>EDP=48.846*1e-19<br>cell_area=2491.0 (um^2) |
| 8W1E(s1) | log10(4^12)=7.224 | T=10ns<br>WNS=5.831ns<br>P=0.0956mW<br>L=24 | 239.865 (MHz)<br>= 2.39865*1e8 (Hz) | 55.0656*1e-19 | 1784.1 (um^2) | T=4.156ns<br>WNS=0.168ns<br>P=0.245mW<br>L=24<br>EDP=24.375*1e-19<br>cell_area=1780.7 (um^2) |
| 8W1E(s2) | log10(4^12)=7.224 | T=10ns<br>WNS=7.436ns<br>P=0.138mW<br>L=24 | 390.015 (MHz)<br>= 3.90015*1e8 (Hz) | 79.488*1e-19 | 1784.1 (um^2) | T=2.556ns<br>WNS=0.221ns<br>P=0.6032mW<br>L=24<br>EDP=22.699*1e-19<br>cell_area=1780.7 (um^2) |

* Posit MAC Modularization

| 8W2E | Original Posit MAC (s1) | New Posit MAC (s1) | Original Posit MAC (s2) | New Posit MAC (s2) |
|---------|-------------------------------|--------------------------|------------------------------|--------------------------|
| WNS(ns) | 2.613 |  4.763  | 5.551 |  6.822  |
| Power(mW) | Total=0.129<br>Decode=1.982e-02<br>Mult=1.69e-03<br>Acc=4.90e-02<br>Extract=3.50e-02<br>Encode=1.67e-02 | Total=9.12e-02<br>Decode=2.03e-02<br>Mult=9.23e-03<br>Acc=3.44e-02<br>Extract=1.33e-02<br>Encode=9.22e-03 | Total=0.186<br>Decode=2.83e-02<br>Mult=4.65e-03<br>Acc=7.35e-02<br>Extract=4.68e-02<br>Encode=2.33e-02 | Total=0.129<br>Decode=3.08e-02<br>Mult=1.42e-02<br>Acc=4.81e-02<br>Extract=1.60e-02<br>Encode=1.22e-02 |
| Latency(cycle) | 24 | 21 | 24 | 21 |
| Area(um^2) | Total=2474.0033<br>Decode=257.4208<br>Mult=83.2320<br>Acc=916.4224<br>Extract=901.7344<br>Encode=277.8752 | Total=1952.4160<br>Decode=215.3152<br>Mult=164.3968<br>Acc=903.9104<br>Extract=419.7504<br>Encode=219.5584 | - | - |
| Speedup | - | 1.612x | - | 1.599x |

| 8W1E | Original Posit MAC (s1) | New Posit MAC (s1) | Original Posit MAC (s2) | New Posit MAC (s2) |
|---------|-------------------------------|--------------------------|------------------------------|--------------------------|
| WNS(ns) | 5.831  | 6.317 | 7.436 | 7.709 |
| Power(mW) | Total=9.56e-02<br>Decode=2.02e-02<br>Mult=2.19e-03<br>Acc=2.82e-02<br>Extract=2.22e-02<br>Encode=1.67e-02 | Total=7.79e-02<br>Decode=1.97e-02<br>Mult=1.04e-02<br>Acc=2.31e-02<br>Extract=1.02e-02<br>Encode=1.00e-02 | Total=0.138<br>Decode=2.89e-02<br>Mult=5.11e-03<br>Acc=4.25e-02<br>Extract=2.94e-02<br>Encode=2.26e-02 | Total=0.113<br>Decode=2.68e-02<br>Mult=2.08e-02<br>Acc=3.03e-02<br>Extract=1.47e-02<br>Encode=1.33e-02 |
| Latency(cycle) | 24 | 21 | 24 | 21 |
| Area(um^2) | Total=1784.1024<br>Decode=256.3328<br>Mult=104.1216<br>Acc=563.9104<br>Extract=543.2384<br>Encode=279.6160 | Total=1527.6608<br>Decode=185.0688<br>Mult=179.6288<br>Acc=598.9440<br>Extract=309.9712<br>Encode=225.3248 | - | - |
| Speedup | - |  | - |  |


## 3. Original Posit MAC Report
<img width="1280" height="720" alt="image" src="https://github.com/user-attachments/assets/098f2c48-bbc2-4a6b-87f0-2c3002223cc5" />

## 4. New Posit MAC Report
<div>
<img width="1117" height="1393" alt="image" src="https://github.com/user-attachments/assets/4d87ae65-d61a-462a-bb86-5ef229f98360" />
<img width="940" height="849" alt="image" src="https://github.com/user-attachments/assets/61a42421-7dfd-4953-a12f-0afa9f0b8c17" />
</div>

## 5. Problems to Solve

## 6. Experimental Results (Basys-3 FPGA) (# of multiplication = 9)

| Fixed-Point | Values | Dynamic Range | Max. Operating Freq.| Energy-Delay-Product | #LUTs/#FFs |
|:-----:|:------:|:------:|:------:|:------:|:------:|
| 8W4F | T=10ns<br>WNS=0.ns<br>P=0.W<br>L=14 | log10(127)=2.104 |   (MHz)<br>= *1e8 (Hz) | *1e-16 |  |

| Floating-Point | Values | Dynamic Range | Max. Operating Freq.| Energy-Delay-Product | #LUTs/#FFs |
|:-----:|:------:|:------:|:------:|:------:|:------:|
| 8W4E3F | T=10ns<br>WNS=0.410ns<br>P=0.074W<br>L=19 | log10(122880)=5.089 |   (MHz)<br>= *1e8 (Hz) | *1e-16 | 358/177 |
| 8W5E2F | T=10ns<br>WNS=0.ns<br>P=0.W<br>L=19 | log10(3758096384)=9.574 |   (MHz)<br>= *1e8 (Hz) | *1e-16 |  |

| Posit | Values | Dynamic Range | Max. Operating Freq.| Energy-Delay-Product | #LUTs/#FFs |
|:-----:|:------:|:------:|:------:|:------:|:------:|
| 8W2E | T=10ns<br>WNS=0.410ns<br>P=0.082W<br>L=24 | log10(16^12)=14.449 |  (MHz)<br>= *1e8 (Hz) | *1e-16 | 950/511 |
| 8W1E | T=10ns<br>WNS=0.410ns<br>P=0.079W<br>L=24 | log10(4^12)=7.224 |  (MHz)<br>= *1e8 (Hz) | *1e-16 | 647/371 |

| NEW Posit | Values | Dynamic Range | Max. Operating Freq.| Energy-Delay-Product | #LUTs/#FFs |
|:-----:|:------:|:------:|:------:|:------:|:------:|
| 8W2E | T=10ns<br>WNS=0.066ns<br>P=0.090W<br>L=21 | log10(16^12)=14.449 |  (MHz)<br>= *1e8 (Hz) | *1e-16 | 1060/396 |
| 8W1E | T=10ns<br>WNS=0.388ns<br>P=0.086W<br>L=21 | log10(4^12)=7.224 |  (MHz)<br>= *1e8 (Hz) | *1e-16 | 746/296 |
