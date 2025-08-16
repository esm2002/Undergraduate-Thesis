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

## 3. Experimental Results (Basys-3 FPGA) (# of multiplication = 1)
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

| Fixed-Point | Values | Dynamic Range | Max. Operating Freq.| Energy-Delay-Product | #LUTs |
|:-----:|:------:|:------:|:------:|:------:|:------:|
| 8W4F | T=10ns<br>WNS=0.410ns<br>P=0.084W<br>L=6 | log10(127)=2.104 | 104.275 (MHz)<br>= 1.04275*1e8 (Hz) | 3.024*1e-16 | 19 |

| Floating-Point | Values | Dynamic Range | Max. Operating Freq.| Energy-Delay-Product | #LUTs |
|:-----:|:------:|:------:|:------:|:------:|:------:|
| 8W4E3F | T=10ns<br>WNS=0.410ns<br>P=0.089W<br>L=11 | log10(122880)=5.089 | 104.275 (MHz)<br>= 1.04275*1e8 (Hz) | 10.769*1e-16 | 228 |

| Posit | Values | Dynamic Range | Max. Operating Freq.| Energy-Delay-Product | #LUTs |
|:-----:|:------:|:------:|:------:|:------:|:------:|
| 8W2E | T=10ns<br>WNS=0.301ns<br>P=0.105W<br>L=16 | log10(16^12)=14.449 | 103.103 (MHz)<br>= 1.03103*1e8 (Hz) | 26.88*1e-16 | 548 |

