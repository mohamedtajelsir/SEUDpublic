# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  ipgui::add_page $IPINST -name "Page 0"

  ipgui::add_param $IPINST -name "AddBusWidth"
  ipgui::add_param $IPINST -name "DataBusWidth"

}

proc update_PARAM_VALUE.AddBusWidth { PARAM_VALUE.AddBusWidth } {
	# Procedure called to update AddBusWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AddBusWidth { PARAM_VALUE.AddBusWidth } {
	# Procedure called to validate AddBusWidth
	return true
}

proc update_PARAM_VALUE.DataBusWidth { PARAM_VALUE.DataBusWidth } {
	# Procedure called to update DataBusWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DataBusWidth { PARAM_VALUE.DataBusWidth } {
	# Procedure called to validate DataBusWidth
	return true
}


proc update_MODELPARAM_VALUE.AddBusWidth { MODELPARAM_VALUE.AddBusWidth PARAM_VALUE.AddBusWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AddBusWidth}] ${MODELPARAM_VALUE.AddBusWidth}
}

proc update_MODELPARAM_VALUE.DataBusWidth { MODELPARAM_VALUE.DataBusWidth PARAM_VALUE.DataBusWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DataBusWidth}] ${MODELPARAM_VALUE.DataBusWidth}
}

