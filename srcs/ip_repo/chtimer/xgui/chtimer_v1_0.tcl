# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ComputingCounterWidth" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HealingCounterWidth" -parent ${Page_0}


}

proc update_PARAM_VALUE.ComputingCounterWidth { PARAM_VALUE.ComputingCounterWidth } {
	# Procedure called to update ComputingCounterWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ComputingCounterWidth { PARAM_VALUE.ComputingCounterWidth } {
	# Procedure called to validate ComputingCounterWidth
	return true
}

proc update_PARAM_VALUE.HealingCounterWidth { PARAM_VALUE.HealingCounterWidth } {
	# Procedure called to update HealingCounterWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HealingCounterWidth { PARAM_VALUE.HealingCounterWidth } {
	# Procedure called to validate HealingCounterWidth
	return true
}


proc update_MODELPARAM_VALUE.ComputingCounterWidth { MODELPARAM_VALUE.ComputingCounterWidth PARAM_VALUE.ComputingCounterWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ComputingCounterWidth}] ${MODELPARAM_VALUE.ComputingCounterWidth}
}

proc update_MODELPARAM_VALUE.HealingCounterWidth { MODELPARAM_VALUE.HealingCounterWidth PARAM_VALUE.HealingCounterWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HealingCounterWidth}] ${MODELPARAM_VALUE.HealingCounterWidth}
}

