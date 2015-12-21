
set_property PACKAGE_PIN G4 [get_ports rst]
set_property IOSTANDARD LVCMOS18 [get_ports rst]

set_property IOSTANDARD LVCMOS18 [get_ports clk]
set_property PACKAGE_PIN R4 [get_ports clk]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk]

set_property SEVERITY {Warning} [get_drc_checks LUTLP-1]

set_property PACKAGE_PIN Y13 [get_ports comp_s]
set_property IOSTANDARD LVCMOS18 [get_ports comp_s]


set_property IOSTANDARD LVCMOS18 [get_ports heal_s]
set_property PACKAGE_PIN T14 [get_ports heal_s]
