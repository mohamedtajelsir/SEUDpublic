set_property IOSTANDARD LVCMOS18 [get_ports reset_rtl]




set_property PACKAGE_PIN G4 [get_ports reset_rtl_0]
set_property IOSTANDARD LVCMOS18 [get_ports reset_rtl_0]


set_property PACKAGE_PIN R4 [get_ports clock_rtl]
set_property IOSTANDARD LVCMOS18 [get_ports clock_rtl]
set_property PACKAGE_PIN B22 [get_ports reset_rtl]
set_property IOSTANDARD LVCMOS18 [get_ports uart_rtl_rxd]
set_property IOSTANDARD LVCMOS18 [get_ports {uart_rtl_txd[1]}]
set_property PACKAGE_PIN V18 [get_ports uart_rtl_rxd]
set_property PACKAGE_PIN AA19 [get_ports {uart_rtl_txd[1]}]

set_property PACKAGE_PIN T14 [get_ports {gpio_rtl[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_rtl[1]}]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clock_rtl]
#set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets clock_rtl]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets design_1_i/clk_wiz_1/inst/clk_in1_design_1_clk_wiz_1_0]


