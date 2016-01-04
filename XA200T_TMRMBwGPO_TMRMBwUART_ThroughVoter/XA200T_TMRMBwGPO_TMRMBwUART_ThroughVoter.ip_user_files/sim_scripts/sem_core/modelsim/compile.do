vlib work
vlib msim

vlib msim/sem_v4_1_5
vlib msim/xil_defaultlib

vmap sem_v4_1_5 msim/sem_v4_1_5
vmap xil_defaultlib msim/xil_defaultlib

vlog -work sem_v4_1_5 -64 -incr \
"../../../ipstatic/sem_v4_1_5/hdl/sem_v4_1_vl_rfs.v" \
"../../../ipstatic/sem_v4_1_5/hdl/xilinx7/sem_v4_1_x7_sem_controller.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/ip/sem_core/sim/sem_core.v" \

vlog -work xil_defaultlib "glbl.v"

