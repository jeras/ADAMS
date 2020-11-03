# ADAMS

All digital implementation of classic analog mixed signal VLSI blocks like
[PLL](https://en.wikipedia.org/wiki/Phase-locked_loop) and
[TRNG](https://en.wikipedia.org/wiki/Hardware_random_number_generator).

# References

## All digital PLL

1. Adrian Freed [A Synthesizable Hybrid VCO using Standard-Cell Multiplexers](http://diychip.org/ringoscillator.html)
2. Saichandrateja Radhapuram,Takuya Yoshihara andToshimasa Matsuoka [Design and Emulation of All-Digital Phase-Locked Loop on FPGA](https://res.mdpi.com/d_attachment/electronics/electronics-08-01307/article_deploy/electronics-08-01307-v2.pdf)
3. O V Shumkin, V A Butuzov, D D Normanov and P Yu Ivanov [A low jitter all – digital phase – locked loop in 180 nm CMOS technology](https://iopscience.iop.org/article/10.1088/1742-6596/675/4/042042/pdf)
4. Akila Gothandaraman [Design and Implementation of an All Digital Phase Locked Loop using a Pulse Output Direct Digital Frequency Synthesizer](https://trace.tennessee.edu/cgi/viewcontent.cgi?referer=https://www.google.com/&httpsredir=1&article=4030&context=utk_gradthes)
5. Volodymyr Kratyuk, Pavan Kumar Hanumolu, Un-Ku Moon, and Kartikeya Mayaram [A Design Procedure for All-Digital Phase-Locked Loops Based on a Charge-Pump Phase-Locked-Loop Analogy](https://web.engr.oregonstate.edu/~moon/research/files/cas2_mar_07_dpll.pdf)
6. P.E. Allen [LECTURE 080 – ALL DIGITAL PHASE LOCK LOOPS (ADPLL)](http://pallen.ece.gatech.edu/Academic/ECE_6440/Summer_2003/L080-ADPLL(2UP).pdf)
7. Bo Jiang [A Wide Band Adaptive All Digital Phase Locked Loop With Self Jitter Measurement And Calibration](https://scholarworks.uvm.edu/cgi/viewcontent.cgi?article=1561&context=graddis)

## All digital TRNG

1. Kaiyuan Yang, David Blaauw, Dennis Sylvester [A Robust -40 to 120°C All-Digital True Random Number Generator in 40nm CMOS](https://psylab.ece.uw.edu/documents/trng_vlsi.pdf)
2. V. Rajesh Pamula, Xun Sun, Sung Kim, Fahim ur Rahman, Baosen Zhang, and Visvesh S. Sathe [An All-Digital True-Random-Number Generator with Integrated De-correlation and Bias Correction at 3.2-to-86 Mb/s, 2.58 pJ/bit in 65-nm CMOS](https://psylab.ece.uw.edu/documents/trng_vlsi.pdf)
3. Ihor Vasyltsov, Eduard Hambardzumyan, Young-Sik Kim, and Bohdan Karpinskyy [Fast Digital TRNG Based on Metastable Ring Oscillator](https://iacr.org/archive/ches2008/51540162/51540162.pdf) [alternate](https://link.springer.com/content/pdf/10.1007%2F978-3-540-85053-3_11.pdf)
4. Sha Tao and Elena Dubrova [TVL-TRNG: Sub-microwatt True Random Number Generator
Exploiting Metastability in Ternary Valued Latches](https://www.computer.org/csdl/pds/api/csdl/proceedings/download-article/12OmNCd2rEO/pdf)
5. [open**titan**](https://opentitan.org/)
   * [ENTROPY_SRC HWIP Technical Specification](https://docs.opentitan.org/hw/ip/entropy_src/doc/index.html)
   * [CSRNG HWIP Technical Specification](https://docs.opentitan.org/hw/ip/csrng/doc/)
