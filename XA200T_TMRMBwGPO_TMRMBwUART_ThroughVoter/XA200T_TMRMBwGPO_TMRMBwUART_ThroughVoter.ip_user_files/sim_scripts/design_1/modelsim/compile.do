vlib work
vlib msim

vlib msim/microblaze_v9_5_2
vlib msim/xil_defaultlib
vlib msim/axi_lite_ipif_v3_0_3
vlib msim/lib_cdc_v1_0_2
vlib msim/interrupt_control_v3_1_2
vlib msim/axi_gpio_v2_0_8
vlib msim/lib_pkg_v1_0_2
vlib msim/lib_srl_fifo_v1_0_2
vlib msim/axi_uartlite_v2_0_10
vlib msim/lmb_v10_v3_0_7
vlib msim/lmb_bram_if_cntlr_v4_0_7
vlib msim/blk_mem_gen_v8_3_0
vlib msim/axi_intc_v4_1_5
vlib msim/mdm_v3_2_4
vlib msim/generic_baseblocks_v2_1_0
vlib msim/axi_infrastructure_v1_1_0
vlib msim/axi_register_slice_v2_1_6
vlib msim/fifo_generator_v13_0_0
vlib msim/axi_data_fifo_v2_1_5
vlib msim/axi_crossbar_v2_1_7
vlib msim/proc_sys_reset_v5_0_8

vmap microblaze_v9_5_2 msim/microblaze_v9_5_2
vmap xil_defaultlib msim/xil_defaultlib
vmap axi_lite_ipif_v3_0_3 msim/axi_lite_ipif_v3_0_3
vmap lib_cdc_v1_0_2 msim/lib_cdc_v1_0_2
vmap interrupt_control_v3_1_2 msim/interrupt_control_v3_1_2
vmap axi_gpio_v2_0_8 msim/axi_gpio_v2_0_8
vmap lib_pkg_v1_0_2 msim/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 msim/lib_srl_fifo_v1_0_2
vmap axi_uartlite_v2_0_10 msim/axi_uartlite_v2_0_10
vmap lmb_v10_v3_0_7 msim/lmb_v10_v3_0_7
vmap lmb_bram_if_cntlr_v4_0_7 msim/lmb_bram_if_cntlr_v4_0_7
vmap blk_mem_gen_v8_3_0 msim/blk_mem_gen_v8_3_0
vmap axi_intc_v4_1_5 msim/axi_intc_v4_1_5
vmap mdm_v3_2_4 msim/mdm_v3_2_4
vmap generic_baseblocks_v2_1_0 msim/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 msim/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_6 msim/axi_register_slice_v2_1_6
vmap fifo_generator_v13_0_0 msim/fifo_generator_v13_0_0
vmap axi_data_fifo_v2_1_5 msim/axi_data_fifo_v2_1_5
vmap axi_crossbar_v2_1_7 msim/axi_crossbar_v2_1_7
vmap proc_sys_reset_v5_0_8 msim/proc_sys_reset_v5_0_8

vcom -work microblaze_v9_5_2 -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/microblaze_v9_5/hdl/microblaze_v9_5_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_0_0/sim/design_1_microblaze_0_0.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_0_1/sim/design_1_microblaze_0_1.vhd" \

vcom -work axi_lite_ipif_v3_0_3 -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_lite_ipif_v3_0/hdl/src/vhdl/ipif_pkg.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_lite_ipif_v3_0/hdl/src/vhdl/pselect_f.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_lite_ipif_v3_0/hdl/src/vhdl/address_decoder.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_lite_ipif_v3_0/hdl/src/vhdl/slave_attachment.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_lite_ipif_v3_0/hdl/src/vhdl/axi_lite_ipif.vhd" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lib_cdc_v1_0/hdl/src/vhdl/cdc_sync.vhd" \

vcom -work interrupt_control_v3_1_2 -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/interrupt_control_v3_1/hdl/src/vhdl/interrupt_control.vhd" \

vcom -work axi_gpio_v2_0_8 -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_gpio_v2_0/hdl/src/vhdl/gpio_core.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_gpio_v2_0/hdl/src/vhdl/axi_gpio.vhd" \

vcom -work xil_defaultlib -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_0_0/sim/design_1_axi_gpio_0_0.vhd" \

vcom -work lib_pkg_v1_0_2 -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lib_pkg_v1_0/hdl/src/vhdl/lib_pkg.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lib_srl_fifo_v1_0/hdl/src/vhdl/cntr_incr_decr_addn_f.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lib_srl_fifo_v1_0/hdl/src/vhdl/dynshreg_f.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lib_srl_fifo_v1_0/hdl/src/vhdl/srl_fifo_rbu_f.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lib_srl_fifo_v1_0/hdl/src/vhdl/srl_fifo_f.vhd" \

vcom -work axi_uartlite_v2_0_10 -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_uartlite_v2_0/hdl/src/vhdl/dynshreg_i_f.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_uartlite_v2_0/hdl/src/vhdl/uartlite_tx.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_uartlite_v2_0/hdl/src/vhdl/uartlite_rx.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_uartlite_v2_0/hdl/src/vhdl/baudrate.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_uartlite_v2_0/hdl/src/vhdl/uartlite_core.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_uartlite_v2_0/hdl/src/vhdl/axi_uartlite.vhd" \

vcom -work xil_defaultlib -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_axi_uartlite_0_0/sim/design_1_axi_uartlite_0_0.vhd" \

vcom -work lmb_v10_v3_0_7 -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lmb_v10_v3_0/hdl/vhdl/lmb_v10.vhd" \

vcom -work xil_defaultlib -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_dlmb_v10_0/sim/design_1_dlmb_v10_0.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_ilmb_v10_0/sim/design_1_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_7 -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lmb_bram_if_cntlr_v4_0/hdl/vhdl/lmb_bram_if_funcs.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lmb_bram_if_cntlr_v4_0/hdl/vhdl/lmb_bram_if_primitives.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lmb_bram_if_cntlr_v4_0/hdl/vhdl/xor18.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lmb_bram_if_cntlr_v4_0/hdl/vhdl/parity.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lmb_bram_if_cntlr_v4_0/hdl/vhdl/parityenable.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lmb_bram_if_cntlr_v4_0/hdl/vhdl/checkbit_handler.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lmb_bram_if_cntlr_v4_0/hdl/vhdl/correct_one_bit.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lmb_bram_if_cntlr_v4_0/hdl/vhdl/pselect.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lmb_bram_if_cntlr_v4_0/hdl/vhdl/pselect_mask.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lmb_bram_if_cntlr_v4_0/hdl/vhdl/axi_interface.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lmb_bram_if_cntlr_v4_0/hdl/vhdl/lmb_mux.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lmb_bram_if_cntlr_v4_0/hdl/vhdl/lmb_bram_if_cntlr.vhd" \

vcom -work xil_defaultlib -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_dlmb_bram_if_cntlr_0/sim/design_1_dlmb_bram_if_cntlr_0.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_ilmb_bram_if_cntlr_0/sim/design_1_ilmb_bram_if_cntlr_0.vhd" \

vcom -work blk_mem_gen_v8_3_0 -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/blk_mem_gen_v8_3/simulation/blk_mem_gen_v8_3.vhd" \

vcom -work xil_defaultlib -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_lmb_bram_0/sim/design_1_lmb_bram_0.vhd" \

vcom -work axi_intc_v4_1_5 -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_intc_v4_1/hdl/src/vhdl/double_synchronizer.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_intc_v4_1/hdl/src/vhdl/shared_ram_ivar.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_intc_v4_1/hdl/src/vhdl/pulse_synchronizer.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_intc_v4_1/hdl/src/vhdl/intc_core.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_intc_v4_1/hdl/src/vhdl/axi_intc.vhd" \

vcom -work xil_defaultlib -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_0_axi_intc_0/sim/design_1_microblaze_0_axi_intc_0.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/xlconcat_v2_1/xlconcat.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_0_xlconcat_0/sim/design_1_microblaze_0_xlconcat_0.vhd" \

vcom -work mdm_v3_2_4 -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/mdm_v3_2/hdl/vhdl/mdm_primitives.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/mdm_v3_2/hdl/vhdl/arbiter.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/mdm_v3_2/hdl/vhdl/srl_fifo.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/mdm_v3_2/hdl/vhdl/bus_master.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/mdm_v3_2/hdl/vhdl/jtag_control.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/mdm_v3_2/hdl/vhdl/mdm_core.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/mdm_v3_2/hdl/vhdl/mdm.vhd" \

vcom -work xil_defaultlib -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_mdm_1_0/sim/design_1_mdm_1_0.vhd" \

vlog -work generic_baseblocks_v2_1_0 -64 -incr +incdir+"../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_carry_and.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_carry_latch_and.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_carry_latch_or.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_carry_or.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_carry.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_command_fifo.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_mask_static.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_mask.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_sel_mask_static.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_sel_mask.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_sel_static.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_sel.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_static.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_mux_enc.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_mux.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_nto1_mux.v" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr +incdir+"../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog/axi_infrastructure_v1_1_axi2vector.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog/axi_infrastructure_v1_1_axic_srl_fifo.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog/axi_infrastructure_v1_1_vector2axi.v" \

vlog -work axi_register_slice_v2_1_6 -64 -incr +incdir+"../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_register_slice_v2_1/hdl/verilog/axi_register_slice_v2_1_axic_register_slice.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_register_slice_v2_1/hdl/verilog/axi_register_slice_v2_1_axi_register_slice.v" \

vcom -work fifo_generator_v13_0_0 -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/fifo_generator_v13_0/simulation/fifo_generator_vhdl_beh.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/fifo_generator_v13_0/hdl/fifo_generator_v13_0_rfs.vhd" \

vlog -work axi_data_fifo_v2_1_5 -64 -incr +incdir+"../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_axic_fifo.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_fifo_gen.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_axic_srl_fifo.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_axic_reg_srl_fifo.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_ndeep_srl.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_axi_data_fifo.v" \

vlog -work axi_crossbar_v2_1_7 -64 -incr +incdir+"../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_addr_arbiter_sasd.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_addr_arbiter.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_addr_decoder.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_arbiter_resp.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_crossbar_sasd.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_crossbar.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_decerr_slave.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_si_transactor.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_splitter.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_wdata_mux.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_wdata_router.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_axi_crossbar.v" \

vlog -work xil_defaultlib -64 -incr +incdir+"../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_xbar_0/sim/design_1_xbar_0.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_clk_wiz_1_0/design_1_clk_wiz_1_0_clk_wiz.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_clk_wiz_1_0/design_1_clk_wiz_1_0.v" \

vcom -work proc_sys_reset_v5_0_8 -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/proc_sys_reset_v5_0/hdl/src/vhdl/upcnt_n.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/proc_sys_reset_v5_0/hdl/src/vhdl/sequence_psr.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/proc_sys_reset_v5_0/hdl/src/vhdl/lpf.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/proc_sys_reset_v5_0/hdl/src/vhdl/proc_sys_reset.vhd" \

vcom -work xil_defaultlib -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_rst_clk_wiz_1_100M_0/sim/design_1_rst_clk_wiz_1_100M_0.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_dlmb_v10_1/sim/design_1_dlmb_v10_1.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_ilmb_v10_1/sim/design_1_ilmb_v10_1.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_dlmb_bram_if_cntlr_1/sim/design_1_dlmb_bram_if_cntlr_1.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_ilmb_bram_if_cntlr_1/sim/design_1_ilmb_bram_if_cntlr_1.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_lmb_bram_1/sim/design_1_lmb_bram_1.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_1_axi_intc_0/sim/design_1_microblaze_1_axi_intc_0.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_1_xlconcat_0/sim/design_1_microblaze_1_xlconcat_0.vhd" \

vlog -work xil_defaultlib -64 -incr +incdir+"../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_xbar_1/sim/design_1_xbar_1.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_1_clk_wiz_1_0/design_1_microblaze_1_clk_wiz_1_0_clk_wiz.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_1_clk_wiz_1_0/design_1_microblaze_1_clk_wiz_1_0.v" \

vcom -work xil_defaultlib -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_rst_microblaze_1_clk_wiz_1_100M_0/sim/design_1_rst_microblaze_1_clk_wiz_1_100M_0.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_axi_uartlite_0_1/sim/design_1_axi_uartlite_0_1.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_1_0/sim/design_1_microblaze_1_0.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_dlmb_v10_3/sim/design_1_dlmb_v10_3.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_ilmb_v10_3/sim/design_1_ilmb_v10_3.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_dlmb_bram_if_cntlr_3/sim/design_1_dlmb_bram_if_cntlr_3.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_ilmb_bram_if_cntlr_3/sim/design_1_ilmb_bram_if_cntlr_3.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_lmb_bram_3/sim/design_1_lmb_bram_3.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_2_axi_intc_0/sim/design_1_microblaze_2_axi_intc_0.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_2_xlconcat_0/sim/design_1_microblaze_2_xlconcat_0.vhd" \

vlog -work xil_defaultlib -64 -incr +incdir+"../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_xbar_2/sim/design_1_xbar_2.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_2_clk_wiz_1_0/design_1_microblaze_2_clk_wiz_1_0_clk_wiz.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_2_clk_wiz_1_0/design_1_microblaze_2_clk_wiz_1_0.v" \

vcom -work xil_defaultlib -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_rst_microblaze_2_clk_wiz_1_100M_0/sim/design_1_rst_microblaze_2_clk_wiz_1_100M_0.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_2_0/sim/design_1_microblaze_2_0.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_dlmb_v10_2/sim/design_1_dlmb_v10_2.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_ilmb_v10_2/sim/design_1_ilmb_v10_2.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_dlmb_bram_if_cntlr_2/sim/design_1_dlmb_bram_if_cntlr_2.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_ilmb_bram_if_cntlr_2/sim/design_1_ilmb_bram_if_cntlr_2.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_lmb_bram_2/sim/design_1_lmb_bram_2.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_3_axi_intc_0/sim/design_1_microblaze_3_axi_intc_0.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_3_xlconcat_0/sim/design_1_microblaze_3_xlconcat_0.vhd" \

vlog -work xil_defaultlib -64 -incr +incdir+"../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_xbar_3/sim/design_1_xbar_3.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_3_clk_wiz_1_0/design_1_microblaze_3_clk_wiz_1_0_clk_wiz.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_3_clk_wiz_1_0/design_1_microblaze_3_clk_wiz_1_0.v" \

vcom -work xil_defaultlib -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_rst_microblaze_3_clk_wiz_1_100M_0/sim/design_1_rst_microblaze_3_clk_wiz_1_100M_0.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_axi_uartlite_2_0/sim/design_1_axi_uartlite_2_0.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/tmrmvoter_v1_0/sources_1/new/tmrmvoter.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_tmrmvoter_0_0/sim/design_1_tmrmvoter_0_0.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_xlconcat_0_0/sim/design_1_xlconcat_0_0.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_0_2/sim/design_1_microblaze_0_2.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_0_1/sim/design_1_axi_gpio_0_1.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_dlmb_v10_4/sim/design_1_dlmb_v10_4.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_ilmb_v10_4/sim/design_1_ilmb_v10_4.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_dlmb_bram_if_cntlr_4/sim/design_1_dlmb_bram_if_cntlr_4.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_ilmb_bram_if_cntlr_4/sim/design_1_ilmb_bram_if_cntlr_4.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_lmb_bram_4/sim/design_1_lmb_bram_4.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_4_axi_intc_0/sim/design_1_microblaze_4_axi_intc_0.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_4_xlconcat_0/sim/design_1_microblaze_4_xlconcat_0.vhd" \

vlog -work xil_defaultlib -64 -incr +incdir+"../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_xbar_4/sim/design_1_xbar_4.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_4_clk_wiz_1_0/design_1_microblaze_4_clk_wiz_1_0_clk_wiz.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_4_clk_wiz_1_0/design_1_microblaze_4_clk_wiz_1_0.v" \

vcom -work xil_defaultlib -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_rst_microblaze_4_clk_wiz_1_100M_0/sim/design_1_rst_microblaze_4_clk_wiz_1_100M_0.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_tmrmvoter_0_1/sim/design_1_tmrmvoter_0_1.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_xlconcat_0_1/sim/design_1_xlconcat_0_1.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_0_3/sim/design_1_axi_gpio_0_3.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_4_0/sim/design_1_microblaze_4_0.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_dlmb_v10_5/sim/design_1_dlmb_v10_5.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_ilmb_v10_5/sim/design_1_ilmb_v10_5.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_dlmb_bram_if_cntlr_5/sim/design_1_dlmb_bram_if_cntlr_5.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_ilmb_bram_if_cntlr_5/sim/design_1_ilmb_bram_if_cntlr_5.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_lmb_bram_5/sim/design_1_lmb_bram_5.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_5_axi_intc_0/sim/design_1_microblaze_5_axi_intc_0.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_5_xlconcat_0/sim/design_1_microblaze_5_xlconcat_0.vhd" \

vlog -work xil_defaultlib -64 -incr +incdir+"../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" +incdir+"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_infrastructure_v1_1/hdl/verilog" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_xbar_5/sim/design_1_xbar_5.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_5_clk_wiz_1_0/design_1_microblaze_5_clk_wiz_1_0_clk_wiz.v" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_microblaze_5_clk_wiz_1_0/design_1_microblaze_5_clk_wiz_1_0.v" \

vcom -work xil_defaultlib -64 -93 \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/ip/design_1_rst_microblaze_5_clk_wiz_1_100M_0/sim/design_1_rst_microblaze_5_clk_wiz_1_100M_0.vhd" \
"./../../../../XA200T_TMRMBwGPO_TMRMBwUART_ThroughVoter.srcs/sources_1/bd/design_1/hdl/design_1.vhd" \

vlog -work xil_defaultlib "glbl.v"

quit -f

