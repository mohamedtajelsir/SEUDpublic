vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/ip/clk_wiz/clk_wiz_clk_wiz.v" \
"../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/ip/clk_wiz/clk_wiz.v" \


vlog -work xil_defaultlib "glbl.v"

