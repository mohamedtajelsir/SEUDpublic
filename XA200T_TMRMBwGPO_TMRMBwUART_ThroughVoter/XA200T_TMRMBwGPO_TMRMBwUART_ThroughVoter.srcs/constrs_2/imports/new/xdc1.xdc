set_property PACKAGE_PIN T14 [get_ports {gpio_rtl[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_rtl[1]}]
set_property PACKAGE_PIN T15 [get_ports {gpio_rtl1[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_rtl1[1]}]

set_property IOSTANDARD LVCMOS18 [get_ports reset_rtl]




set_property PACKAGE_PIN G4 [get_ports reset_rtl_0]
set_property IOSTANDARD LVCMOS18 [get_ports reset_rtl_0]


set_property PACKAGE_PIN R4 [get_ports clock_rtl]
set_property IOSTANDARD LVCMOS18 [get_ports clock_rtl]
set_property PACKAGE_PIN B22 [get_ports reset_rtl]
set_property IOSTANDARD LVCMOS18 [get_ports uart_rtl_rxd]
set_property IOSTANDARD LVCMOS18 [get_ports {uart_rtl_txd[1]}]
set_property PACKAGE_PIN AB22 [get_ports uart_rtl_rxd]
set_property PACKAGE_PIN AB21 [get_ports {uart_rtl_txd[1]}]

set_property PACKAGE_PIN T14 [get_ports {gpio_rtl[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_rtl[1]}]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clock_rtl]
#set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets clock_rtl]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets design_1_i/clk_wiz_1/inst/clk_in1_design_1_clk_wiz_1_0]


## UART
set_property -dict { PACKAGE_PIN AA19  IOSTANDARD LVCMOS18 } [get_ports { uart_tx_out }]; #IO_L15P_T2_DQS_RDWR_B_14 Sch=uart_rx_out
set_property -dict { PACKAGE_PIN V18   IOSTANDARD LVCMOS18 } [get_ports { uart_rx_in }]; #IO_L14P_T2_SRCC_14 Sch=uart_tx_in

## LEDs
set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS18 } [get_ports { status_heartbeat }]; #IO_L15P_T2_DQS_13 Sch=led[0]
set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS18 } [get_ports { status_initialization }]; #IO_L15N_T2_DQS_13 Sch=led[1]
set_property -dict { PACKAGE_PIN Y13   IOSTANDARD LVCMOS18 } [get_ports { status_observation }]; #IO_L17P_T2_13 Sch=led[2]

