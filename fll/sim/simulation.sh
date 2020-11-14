#!/bin/sh

export PRJ=fll_tb
export TOP=fll_tb

# compile Verilog and SystemVerilog sources
xvlog --incr --relax -L axi_vip_v1_1_7 -L xilinx_vip -prj ${PRJ}.prj

# elaborate design
xelab -wto b3ce32971b074427ad53c722ac80f042 --incr --debug typical --relax --mt 8 \
--snapshot ${TOP}_behav xil_defaultlib.${TOP} xil_defaultlib.glbl \
-log elaborate.log

# simulate design
xsim ${TOP}_behav \
-key Behavioral:sim_all_config:Functional:${TOP} \
-tclbatch ${PRJ}.tcl \
-sv_seed 0 \
-log simulate.log \
-gui
