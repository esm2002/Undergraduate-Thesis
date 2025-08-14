# Undergraduate-Thesis

## 1. Repository

```bash
Undergraduate-Thesis/
├── README.md                 
├── fixed_point/                    
│   ├── src/                   
│   ├── constraints/
│   └── reports/           
├── floating_point/                       
│   ├── src/
│   ├── constraints/
│   └── reports/           
├── posit/                      
│   ├── src/
│   ├── constraints/
│   └── reports/  
└── references.txt/                      
```

## 2. Experimental Results (Basys-3 FPGA) (# of multiplication = 1)
* T (ns) = target clock period, WNS (ns) = worst negative slack, L (cycle) = latency
  W = total bits, E = exponential part bits, F = fraction part bits
* Dynamic Range: log10​(max/min)
  * Fixed-Point:
    max = (2^(W−1)−1)/2^F​, min = 1/2^F
  * Floating-Point:
    bias = 2^(E-1)-1, expmax = 2*bias
    max = 2^(expmax-bias) * (2-2^(-F))
    min = 2^(1-bias) * 2^(-F)
  * Posit:
    useed = 2^(2^E)
    max = useed^(W-2)
    min = useed^(-W+2)
* Max. Operating Freq. (MHz): max(1000/(T - WNS))
* Energy-Delay-Product (J*s): Power * (L * T)^2

| Fixed-Point | Dynamic Range | Max. Operating Freq.| Energy-Delay-Product | #LUTs |
|:-----:|:------:|:------:|:------:|:------:|
| 8W4F | log10(127)=2.104 | 104.275 (MHz)<br>= 1.04275*1e8 (Hz) | 3.024*1e-16 | 19 |

| Floating-Point | Dynamic Range | Max. Operating Freq.| Energy-Delay-Product | #LUTs |
|:-----:|:------:|:------:|:------:|:------:|
| 8W4E3F | log10(122880)=5.089 | 104.275 (MHz)<br>= 1.04275*1e8 (Hz) | 10.769*1e-16 | 228 |

| Posit | Dynamic Range | Max. Operating Freq.| Energy-Delay-Product | #LUTs |
|:-----:|:------:|:------:|:------:|:------:|
| 8W2E | log10(16^12)=14.449 | 103.103 (MHz)<br>= 1.03103*1e8 (Hz) | 26.88*1e-16 | 548 |

