
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2015.3
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7a200tsbg484-1

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: microblaze_5_local_memory
proc create_hier_cell_microblaze_5_local_memory { parentCell nameHier } {

  if { $parentCell eq "" || $nameHier eq "" } {
     puts "ERROR: create_hier_cell_microblaze_5_local_memory() - Empty argument(s)!"
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL1

  # Create pins
  create_bd_pin -dir O -type intr DLMB_Interrupt
  create_bd_pin -dir O -type intr ILMB_Interrupt
  create_bd_pin -dir I -type clk LMB_Clk
  create_bd_pin -dir I -from 0 -to 0 -type rst SYS_Rst
  create_bd_pin -dir I -from 0 -to 0 -type rst S_AXI_CTRL_ARESETN

  # Create instance: dlmb_bram_if_cntlr, and set properties
  set dlmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr ]
  set_property -dict [ list \
CONFIG.C_CE_COUNTER_WIDTH {20} \
CONFIG.C_CE_FAILING_REGISTERS {1} \
CONFIG.C_ECC {1} \
CONFIG.C_ECC_ONOFF_REGISTER {1} \
CONFIG.C_ECC_STATUS_REGISTERS {1} \
CONFIG.C_FAULT_INJECT {1} \
CONFIG.C_INTERCONNECT {2} \
CONFIG.C_UE_FAILING_REGISTERS {1} \
 ] $dlmb_bram_if_cntlr

  # Create instance: dlmb_v10, and set properties
  set dlmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10 ]

  # Create instance: ilmb_bram_if_cntlr, and set properties
  set ilmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr ]
  set_property -dict [ list \
CONFIG.C_CE_COUNTER_WIDTH {20} \
CONFIG.C_CE_FAILING_REGISTERS {1} \
CONFIG.C_ECC {1} \
CONFIG.C_ECC_ONOFF_REGISTER {1} \
CONFIG.C_ECC_STATUS_REGISTERS {1} \
CONFIG.C_INTERCONNECT {2} \
CONFIG.C_UE_FAILING_REGISTERS {1} \
CONFIG.C_WRITE_ACCESS {0} \
 ] $ilmb_bram_if_cntlr

  # Create instance: ilmb_v10, and set properties
  set ilmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10 ]

  # Create instance: lmb_bram, and set properties
  set lmb_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 lmb_bram ]
  set_property -dict [ list \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.use_bram_block {BRAM_Controller} \
 ] $lmb_bram

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_5_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_5_dlmb_axi [get_bd_intf_pins S_AXI_CTRL] [get_bd_intf_pins dlmb_bram_if_cntlr/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_5_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_5_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_5_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_5_ilmb_axi [get_bd_intf_pins S_AXI_CTRL1] [get_bd_intf_pins ilmb_bram_if_cntlr/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_5_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_5_ilmb_cntlr [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]

  # Create port connections
  connect_bd_net -net SYS_Rst_1 [get_bd_pins SYS_Rst] [get_bd_pins dlmb_bram_if_cntlr/LMB_Rst] [get_bd_pins dlmb_v10/SYS_Rst] [get_bd_pins ilmb_bram_if_cntlr/LMB_Rst] [get_bd_pins ilmb_v10/SYS_Rst]
  connect_bd_net -net S_AXI_CTRL_ARESETN_1 [get_bd_pins S_AXI_CTRL_ARESETN] [get_bd_pins dlmb_bram_if_cntlr/S_AXI_CTRL_ARESETN] [get_bd_pins ilmb_bram_if_cntlr/S_AXI_CTRL_ARESETN]
  connect_bd_net -net microblaze_5_Clk [get_bd_pins LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/S_AXI_CTRL_ACLK] [get_bd_pins dlmb_v10/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/S_AXI_CTRL_ACLK] [get_bd_pins ilmb_v10/LMB_Clk]
  connect_bd_net -net microblaze_5_dlmb_int [get_bd_pins DLMB_Interrupt] [get_bd_pins dlmb_bram_if_cntlr/Interrupt]
  connect_bd_net -net microblaze_5_ilmb_int [get_bd_pins ILMB_Interrupt] [get_bd_pins ilmb_bram_if_cntlr/Interrupt]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: microblaze_4_local_memory
proc create_hier_cell_microblaze_4_local_memory { parentCell nameHier } {

  if { $parentCell eq "" || $nameHier eq "" } {
     puts "ERROR: create_hier_cell_microblaze_4_local_memory() - Empty argument(s)!"
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL1

  # Create pins
  create_bd_pin -dir O -type intr DLMB_Interrupt
  create_bd_pin -dir O -type intr ILMB_Interrupt
  create_bd_pin -dir I -type clk LMB_Clk
  create_bd_pin -dir I -from 0 -to 0 -type rst SYS_Rst
  create_bd_pin -dir I -from 0 -to 0 -type rst S_AXI_CTRL_ARESETN

  # Create instance: dlmb_bram_if_cntlr, and set properties
  set dlmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr ]
  set_property -dict [ list \
CONFIG.C_CE_COUNTER_WIDTH {20} \
CONFIG.C_CE_FAILING_REGISTERS {1} \
CONFIG.C_ECC {1} \
CONFIG.C_ECC_ONOFF_REGISTER {1} \
CONFIG.C_ECC_STATUS_REGISTERS {1} \
CONFIG.C_FAULT_INJECT {1} \
CONFIG.C_INTERCONNECT {2} \
CONFIG.C_UE_FAILING_REGISTERS {1} \
 ] $dlmb_bram_if_cntlr

  # Create instance: dlmb_v10, and set properties
  set dlmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10 ]

  # Create instance: ilmb_bram_if_cntlr, and set properties
  set ilmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr ]
  set_property -dict [ list \
CONFIG.C_CE_COUNTER_WIDTH {20} \
CONFIG.C_CE_FAILING_REGISTERS {1} \
CONFIG.C_ECC {1} \
CONFIG.C_ECC_ONOFF_REGISTER {1} \
CONFIG.C_ECC_STATUS_REGISTERS {1} \
CONFIG.C_INTERCONNECT {2} \
CONFIG.C_UE_FAILING_REGISTERS {1} \
CONFIG.C_WRITE_ACCESS {0} \
 ] $ilmb_bram_if_cntlr

  # Create instance: ilmb_v10, and set properties
  set ilmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10 ]

  # Create instance: lmb_bram, and set properties
  set lmb_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 lmb_bram ]
  set_property -dict [ list \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.use_bram_block {BRAM_Controller} \
 ] $lmb_bram

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_4_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_4_dlmb_axi [get_bd_intf_pins S_AXI_CTRL] [get_bd_intf_pins dlmb_bram_if_cntlr/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_4_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_4_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_4_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_4_ilmb_axi [get_bd_intf_pins S_AXI_CTRL1] [get_bd_intf_pins ilmb_bram_if_cntlr/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_4_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_4_ilmb_cntlr [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]

  # Create port connections
  connect_bd_net -net SYS_Rst_1 [get_bd_pins SYS_Rst] [get_bd_pins dlmb_bram_if_cntlr/LMB_Rst] [get_bd_pins dlmb_v10/SYS_Rst] [get_bd_pins ilmb_bram_if_cntlr/LMB_Rst] [get_bd_pins ilmb_v10/SYS_Rst]
  connect_bd_net -net S_AXI_CTRL_ARESETN_1 [get_bd_pins S_AXI_CTRL_ARESETN] [get_bd_pins dlmb_bram_if_cntlr/S_AXI_CTRL_ARESETN] [get_bd_pins ilmb_bram_if_cntlr/S_AXI_CTRL_ARESETN]
  connect_bd_net -net microblaze_4_Clk [get_bd_pins LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/S_AXI_CTRL_ACLK] [get_bd_pins dlmb_v10/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/S_AXI_CTRL_ACLK] [get_bd_pins ilmb_v10/LMB_Clk]
  connect_bd_net -net microblaze_4_dlmb_int [get_bd_pins DLMB_Interrupt] [get_bd_pins dlmb_bram_if_cntlr/Interrupt]
  connect_bd_net -net microblaze_4_ilmb_int [get_bd_pins ILMB_Interrupt] [get_bd_pins ilmb_bram_if_cntlr/Interrupt]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: microblaze_3_local_memory
proc create_hier_cell_microblaze_3_local_memory { parentCell nameHier } {

  if { $parentCell eq "" || $nameHier eq "" } {
     puts "ERROR: create_hier_cell_microblaze_3_local_memory() - Empty argument(s)!"
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL1

  # Create pins
  create_bd_pin -dir O -type intr DLMB_Interrupt
  create_bd_pin -dir O -type intr ILMB_Interrupt
  create_bd_pin -dir I -type clk LMB_Clk
  create_bd_pin -dir I -from 0 -to 0 -type rst SYS_Rst
  create_bd_pin -dir I -from 0 -to 0 -type rst S_AXI_CTRL_ARESETN

  # Create instance: dlmb_bram_if_cntlr, and set properties
  set dlmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr ]
  set_property -dict [ list \
CONFIG.C_CE_COUNTER_WIDTH {20} \
CONFIG.C_CE_FAILING_REGISTERS {1} \
CONFIG.C_ECC {1} \
CONFIG.C_ECC_ONOFF_REGISTER {1} \
CONFIG.C_ECC_STATUS_REGISTERS {1} \
CONFIG.C_FAULT_INJECT {1} \
CONFIG.C_INTERCONNECT {2} \
CONFIG.C_UE_FAILING_REGISTERS {1} \
 ] $dlmb_bram_if_cntlr

  # Create instance: dlmb_v10, and set properties
  set dlmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10 ]

  # Create instance: ilmb_bram_if_cntlr, and set properties
  set ilmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr ]
  set_property -dict [ list \
CONFIG.C_CE_COUNTER_WIDTH {20} \
CONFIG.C_CE_FAILING_REGISTERS {1} \
CONFIG.C_ECC {1} \
CONFIG.C_ECC_ONOFF_REGISTER {1} \
CONFIG.C_ECC_STATUS_REGISTERS {1} \
CONFIG.C_INTERCONNECT {2} \
CONFIG.C_UE_FAILING_REGISTERS {1} \
CONFIG.C_WRITE_ACCESS {0} \
 ] $ilmb_bram_if_cntlr

  # Create instance: ilmb_v10, and set properties
  set ilmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10 ]

  # Create instance: lmb_bram, and set properties
  set lmb_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 lmb_bram ]
  set_property -dict [ list \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.use_bram_block {BRAM_Controller} \
 ] $lmb_bram

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_3_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_3_dlmb_axi [get_bd_intf_pins S_AXI_CTRL] [get_bd_intf_pins dlmb_bram_if_cntlr/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_3_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_3_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_3_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_3_ilmb_axi [get_bd_intf_pins S_AXI_CTRL1] [get_bd_intf_pins ilmb_bram_if_cntlr/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_3_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_3_ilmb_cntlr [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]

  # Create port connections
  connect_bd_net -net SYS_Rst_1 [get_bd_pins SYS_Rst] [get_bd_pins dlmb_bram_if_cntlr/LMB_Rst] [get_bd_pins dlmb_v10/SYS_Rst] [get_bd_pins ilmb_bram_if_cntlr/LMB_Rst] [get_bd_pins ilmb_v10/SYS_Rst]
  connect_bd_net -net S_AXI_CTRL_ARESETN_1 [get_bd_pins S_AXI_CTRL_ARESETN] [get_bd_pins dlmb_bram_if_cntlr/S_AXI_CTRL_ARESETN] [get_bd_pins ilmb_bram_if_cntlr/S_AXI_CTRL_ARESETN]
  connect_bd_net -net microblaze_3_Clk [get_bd_pins LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/S_AXI_CTRL_ACLK] [get_bd_pins dlmb_v10/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/S_AXI_CTRL_ACLK] [get_bd_pins ilmb_v10/LMB_Clk]
  connect_bd_net -net microblaze_3_dlmb_int [get_bd_pins DLMB_Interrupt] [get_bd_pins dlmb_bram_if_cntlr/Interrupt]
  connect_bd_net -net microblaze_3_ilmb_int [get_bd_pins ILMB_Interrupt] [get_bd_pins ilmb_bram_if_cntlr/Interrupt]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: microblaze_2_local_memory
proc create_hier_cell_microblaze_2_local_memory { parentCell nameHier } {

  if { $parentCell eq "" || $nameHier eq "" } {
     puts "ERROR: create_hier_cell_microblaze_2_local_memory() - Empty argument(s)!"
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL1

  # Create pins
  create_bd_pin -dir O -type intr DLMB_Interrupt
  create_bd_pin -dir O -type intr ILMB_Interrupt
  create_bd_pin -dir I -type clk LMB_Clk
  create_bd_pin -dir I -from 0 -to 0 -type rst SYS_Rst
  create_bd_pin -dir I -from 0 -to 0 -type rst S_AXI_CTRL_ARESETN

  # Create instance: dlmb_bram_if_cntlr, and set properties
  set dlmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr ]
  set_property -dict [ list \
CONFIG.C_CE_COUNTER_WIDTH {20} \
CONFIG.C_CE_FAILING_REGISTERS {1} \
CONFIG.C_ECC {1} \
CONFIG.C_ECC_ONOFF_REGISTER {1} \
CONFIG.C_ECC_STATUS_REGISTERS {1} \
CONFIG.C_FAULT_INJECT {1} \
CONFIG.C_INTERCONNECT {2} \
CONFIG.C_UE_FAILING_REGISTERS {1} \
 ] $dlmb_bram_if_cntlr

  # Create instance: dlmb_v10, and set properties
  set dlmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10 ]

  # Create instance: ilmb_bram_if_cntlr, and set properties
  set ilmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr ]
  set_property -dict [ list \
CONFIG.C_CE_COUNTER_WIDTH {20} \
CONFIG.C_CE_FAILING_REGISTERS {1} \
CONFIG.C_ECC {1} \
CONFIG.C_ECC_ONOFF_REGISTER {1} \
CONFIG.C_ECC_STATUS_REGISTERS {1} \
CONFIG.C_INTERCONNECT {2} \
CONFIG.C_UE_FAILING_REGISTERS {1} \
CONFIG.C_WRITE_ACCESS {0} \
 ] $ilmb_bram_if_cntlr

  # Create instance: ilmb_v10, and set properties
  set ilmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10 ]

  # Create instance: lmb_bram, and set properties
  set lmb_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 lmb_bram ]
  set_property -dict [ list \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.use_bram_block {BRAM_Controller} \
 ] $lmb_bram

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_2_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_2_dlmb_axi [get_bd_intf_pins S_AXI_CTRL] [get_bd_intf_pins dlmb_bram_if_cntlr/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_2_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_2_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_2_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_2_ilmb_axi [get_bd_intf_pins S_AXI_CTRL1] [get_bd_intf_pins ilmb_bram_if_cntlr/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_2_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_2_ilmb_cntlr [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]

  # Create port connections
  connect_bd_net -net SYS_Rst_1 [get_bd_pins SYS_Rst] [get_bd_pins dlmb_bram_if_cntlr/LMB_Rst] [get_bd_pins dlmb_v10/SYS_Rst] [get_bd_pins ilmb_bram_if_cntlr/LMB_Rst] [get_bd_pins ilmb_v10/SYS_Rst]
  connect_bd_net -net S_AXI_CTRL_ARESETN_1 [get_bd_pins S_AXI_CTRL_ARESETN] [get_bd_pins dlmb_bram_if_cntlr/S_AXI_CTRL_ARESETN] [get_bd_pins ilmb_bram_if_cntlr/S_AXI_CTRL_ARESETN]
  connect_bd_net -net microblaze_2_Clk [get_bd_pins LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/S_AXI_CTRL_ACLK] [get_bd_pins dlmb_v10/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/S_AXI_CTRL_ACLK] [get_bd_pins ilmb_v10/LMB_Clk]
  connect_bd_net -net microblaze_2_dlmb_int [get_bd_pins DLMB_Interrupt] [get_bd_pins dlmb_bram_if_cntlr/Interrupt]
  connect_bd_net -net microblaze_2_ilmb_int [get_bd_pins ILMB_Interrupt] [get_bd_pins ilmb_bram_if_cntlr/Interrupt]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: microblaze_1_local_memory
proc create_hier_cell_microblaze_1_local_memory { parentCell nameHier } {

  if { $parentCell eq "" || $nameHier eq "" } {
     puts "ERROR: create_hier_cell_microblaze_1_local_memory() - Empty argument(s)!"
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL1

  # Create pins
  create_bd_pin -dir O -type intr DLMB_Interrupt
  create_bd_pin -dir O -type intr ILMB_Interrupt
  create_bd_pin -dir I -type clk LMB_Clk
  create_bd_pin -dir I -from 0 -to 0 -type rst SYS_Rst
  create_bd_pin -dir I -from 0 -to 0 -type rst S_AXI_CTRL_ARESETN

  # Create instance: dlmb_bram_if_cntlr, and set properties
  set dlmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr ]
  set_property -dict [ list \
CONFIG.C_CE_COUNTER_WIDTH {20} \
CONFIG.C_CE_FAILING_REGISTERS {1} \
CONFIG.C_ECC {1} \
CONFIG.C_ECC_ONOFF_REGISTER {1} \
CONFIG.C_ECC_STATUS_REGISTERS {1} \
CONFIG.C_FAULT_INJECT {1} \
CONFIG.C_INTERCONNECT {2} \
CONFIG.C_UE_FAILING_REGISTERS {1} \
 ] $dlmb_bram_if_cntlr

  # Create instance: dlmb_v10, and set properties
  set dlmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10 ]

  # Create instance: ilmb_bram_if_cntlr, and set properties
  set ilmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr ]
  set_property -dict [ list \
CONFIG.C_CE_COUNTER_WIDTH {20} \
CONFIG.C_CE_FAILING_REGISTERS {1} \
CONFIG.C_ECC {1} \
CONFIG.C_ECC_ONOFF_REGISTER {1} \
CONFIG.C_ECC_STATUS_REGISTERS {1} \
CONFIG.C_INTERCONNECT {2} \
CONFIG.C_UE_FAILING_REGISTERS {1} \
CONFIG.C_WRITE_ACCESS {0} \
 ] $ilmb_bram_if_cntlr

  # Create instance: ilmb_v10, and set properties
  set ilmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10 ]

  # Create instance: lmb_bram, and set properties
  set lmb_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 lmb_bram ]
  set_property -dict [ list \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.use_bram_block {BRAM_Controller} \
 ] $lmb_bram

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_1_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_1_dlmb_axi [get_bd_intf_pins S_AXI_CTRL] [get_bd_intf_pins dlmb_bram_if_cntlr/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_1_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_1_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_1_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_1_ilmb_axi [get_bd_intf_pins S_AXI_CTRL1] [get_bd_intf_pins ilmb_bram_if_cntlr/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_1_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_1_ilmb_cntlr [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]

  # Create port connections
  connect_bd_net -net SYS_Rst_1 [get_bd_pins SYS_Rst] [get_bd_pins dlmb_bram_if_cntlr/LMB_Rst] [get_bd_pins dlmb_v10/SYS_Rst] [get_bd_pins ilmb_bram_if_cntlr/LMB_Rst] [get_bd_pins ilmb_v10/SYS_Rst]
  connect_bd_net -net S_AXI_CTRL_ARESETN_1 [get_bd_pins S_AXI_CTRL_ARESETN] [get_bd_pins dlmb_bram_if_cntlr/S_AXI_CTRL_ARESETN] [get_bd_pins ilmb_bram_if_cntlr/S_AXI_CTRL_ARESETN]
  connect_bd_net -net microblaze_1_Clk [get_bd_pins LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/S_AXI_CTRL_ACLK] [get_bd_pins dlmb_v10/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/S_AXI_CTRL_ACLK] [get_bd_pins ilmb_v10/LMB_Clk]
  connect_bd_net -net microblaze_1_dlmb_int [get_bd_pins DLMB_Interrupt] [get_bd_pins dlmb_bram_if_cntlr/Interrupt]
  connect_bd_net -net microblaze_1_ilmb_int [get_bd_pins ILMB_Interrupt] [get_bd_pins ilmb_bram_if_cntlr/Interrupt]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: microblaze_0_local_memory
proc create_hier_cell_microblaze_0_local_memory { parentCell nameHier } {

  if { $parentCell eq "" || $nameHier eq "" } {
     puts "ERROR: create_hier_cell_microblaze_0_local_memory() - Empty argument(s)!"
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL1

  # Create pins
  create_bd_pin -dir O -type intr DLMB_Interrupt
  create_bd_pin -dir O -type intr ILMB_Interrupt
  create_bd_pin -dir I -type clk LMB_Clk
  create_bd_pin -dir I -from 0 -to 0 -type rst SYS_Rst
  create_bd_pin -dir I -from 0 -to 0 -type rst S_AXI_CTRL_ARESETN

  # Create instance: dlmb_bram_if_cntlr, and set properties
  set dlmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr ]
  set_property -dict [ list \
CONFIG.C_CE_COUNTER_WIDTH {20} \
CONFIG.C_CE_FAILING_REGISTERS {1} \
CONFIG.C_ECC {1} \
CONFIG.C_ECC_ONOFF_REGISTER {1} \
CONFIG.C_ECC_STATUS_REGISTERS {1} \
CONFIG.C_FAULT_INJECT {1} \
CONFIG.C_INTERCONNECT {2} \
CONFIG.C_UE_FAILING_REGISTERS {1} \
 ] $dlmb_bram_if_cntlr

  # Create instance: dlmb_v10, and set properties
  set dlmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10 ]

  # Create instance: ilmb_bram_if_cntlr, and set properties
  set ilmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr ]
  set_property -dict [ list \
CONFIG.C_CE_COUNTER_WIDTH {20} \
CONFIG.C_CE_FAILING_REGISTERS {1} \
CONFIG.C_ECC {1} \
CONFIG.C_ECC_ONOFF_REGISTER {1} \
CONFIG.C_ECC_STATUS_REGISTERS {1} \
CONFIG.C_INTERCONNECT {2} \
CONFIG.C_UE_FAILING_REGISTERS {1} \
CONFIG.C_WRITE_ACCESS {0} \
 ] $ilmb_bram_if_cntlr

  # Create instance: ilmb_v10, and set properties
  set ilmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10 ]

  # Create instance: lmb_bram, and set properties
  set lmb_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 lmb_bram ]
  set_property -dict [ list \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.use_bram_block {BRAM_Controller} \
 ] $lmb_bram

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_0_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_axi [get_bd_intf_pins S_AXI_CTRL] [get_bd_intf_pins dlmb_bram_if_cntlr/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_0_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_axi [get_bd_intf_pins S_AXI_CTRL1] [get_bd_intf_pins ilmb_bram_if_cntlr/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_cntlr [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]

  # Create port connections
  connect_bd_net -net SYS_Rst_1 [get_bd_pins SYS_Rst] [get_bd_pins dlmb_bram_if_cntlr/LMB_Rst] [get_bd_pins dlmb_v10/SYS_Rst] [get_bd_pins ilmb_bram_if_cntlr/LMB_Rst] [get_bd_pins ilmb_v10/SYS_Rst]
  connect_bd_net -net S_AXI_CTRL_ARESETN_1 [get_bd_pins S_AXI_CTRL_ARESETN] [get_bd_pins dlmb_bram_if_cntlr/S_AXI_CTRL_ARESETN] [get_bd_pins ilmb_bram_if_cntlr/S_AXI_CTRL_ARESETN]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/S_AXI_CTRL_ACLK] [get_bd_pins dlmb_v10/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/S_AXI_CTRL_ACLK] [get_bd_pins ilmb_v10/LMB_Clk]
  connect_bd_net -net microblaze_0_dlmb_int [get_bd_pins DLMB_Interrupt] [get_bd_pins dlmb_bram_if_cntlr/Interrupt]
  connect_bd_net -net microblaze_0_ilmb_int [get_bd_pins ILMB_Interrupt] [get_bd_pins ilmb_bram_if_cntlr/Interrupt]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set clock_rtl [ create_bd_port -dir I -type clk clock_rtl ]
  set_property -dict [ list \
CONFIG.FREQ_HZ {100000000} \
CONFIG.PHASE {0.000} \
 ] $clock_rtl
  set gpio_rtl [ create_bd_port -dir O -from 1 -to 1 gpio_rtl ]
  set reset_rtl [ create_bd_port -dir I -type rst reset_rtl ]
  set_property -dict [ list \
CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $reset_rtl
  set reset_rtl_0 [ create_bd_port -dir I -type rst reset_rtl_0 ]
  set_property -dict [ list \
CONFIG.POLARITY {ACTIVE_LOW} \
 ] $reset_rtl_0
  set uart_rtl_rxd [ create_bd_port -dir I uart_rtl_rxd ]
  set uart_rtl_txd [ create_bd_port -dir O -from 1 -to 1 uart_rtl_txd ]

  # Create instance: axi_gpio_0, and set properties
  set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0 ]
  set_property -dict [ list \
CONFIG.C_ALL_OUTPUTS {1} \
CONFIG.C_GPIO_WIDTH {1} \
 ] $axi_gpio_0

  # Create instance: axi_gpio_1, and set properties
  set axi_gpio_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_1 ]
  set_property -dict [ list \
CONFIG.C_ALL_OUTPUTS {1} \
CONFIG.C_GPIO_WIDTH {1} \
 ] $axi_gpio_1

  # Create instance: axi_gpio_2, and set properties
  set axi_gpio_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_2 ]
  set_property -dict [ list \
CONFIG.C_ALL_OUTPUTS {1} \
CONFIG.C_GPIO_WIDTH {1} \
 ] $axi_gpio_2

  # Create instance: axi_uartlite_0, and set properties
  set axi_uartlite_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0 ]

  # Create instance: axi_uartlite_1, and set properties
  set axi_uartlite_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_1 ]

  # Create instance: axi_uartlite_2, and set properties
  set axi_uartlite_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_2 ]

  # Create instance: clk_wiz_1, and set properties
  set clk_wiz_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.2 clk_wiz_1 ]
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER {193.154} \
CONFIG.CLKOUT1_PHASE_ERROR {109.126} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {20} \
CONFIG.MMCM_CLKFBOUT_MULT_F {8.500} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {42.500} \
CONFIG.MMCM_DIVCLK_DIVIDE {1} \
CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} \
 ] $clk_wiz_1

  # Create instance: mdm_1, and set properties
  set mdm_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 mdm_1 ]
  set_property -dict [ list \
CONFIG.C_MB_DBG_PORTS {6} \
 ] $mdm_1

  # Create instance: microblaze_0, and set properties
  set microblaze_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:9.5 microblaze_0 ]
  set_property -dict [ list \
CONFIG.C_DEBUG_ENABLED {1} \
CONFIG.C_D_AXI {1} \
CONFIG.C_D_LMB {1} \
CONFIG.C_FAULT_TOLERANT {1} \
CONFIG.C_I_LMB {1} \
 ] $microblaze_0

  # Create instance: microblaze_0_axi_intc, and set properties
  set microblaze_0_axi_intc [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 microblaze_0_axi_intc ]
  set_property -dict [ list \
CONFIG.C_HAS_FAST {1} \
 ] $microblaze_0_axi_intc

  # Create instance: microblaze_0_axi_periph, and set properties
  set microblaze_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 microblaze_0_axi_periph ]
  set_property -dict [ list \
CONFIG.NUM_MI {4} \
 ] $microblaze_0_axi_periph

  # Create instance: microblaze_0_local_memory
  create_hier_cell_microblaze_0_local_memory [current_bd_instance .] microblaze_0_local_memory

  # Create instance: microblaze_0_xlconcat, and set properties
  set microblaze_0_xlconcat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 microblaze_0_xlconcat ]

  # Create instance: microblaze_1, and set properties
  set microblaze_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:9.5 microblaze_1 ]
  set_property -dict [ list \
CONFIG.C_DEBUG_ENABLED {1} \
CONFIG.C_D_AXI {1} \
CONFIG.C_D_LMB {1} \
CONFIG.C_FAULT_TOLERANT {1} \
CONFIG.C_I_LMB {1} \
 ] $microblaze_1

  # Create instance: microblaze_1_axi_intc, and set properties
  set microblaze_1_axi_intc [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 microblaze_1_axi_intc ]
  set_property -dict [ list \
CONFIG.C_HAS_FAST {1} \
 ] $microblaze_1_axi_intc

  # Create instance: microblaze_1_axi_periph, and set properties
  set microblaze_1_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 microblaze_1_axi_periph ]
  set_property -dict [ list \
CONFIG.NUM_MI {4} \
 ] $microblaze_1_axi_periph

  # Create instance: microblaze_1_clk_wiz_1, and set properties
  set microblaze_1_clk_wiz_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.2 microblaze_1_clk_wiz_1 ]
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER {193.154} \
CONFIG.CLKOUT1_PHASE_ERROR {109.126} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {20} \
CONFIG.MMCM_CLKFBOUT_MULT_F {8.500} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {42.500} \
CONFIG.MMCM_DIVCLK_DIVIDE {1} \
CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} \
 ] $microblaze_1_clk_wiz_1

  # Create instance: microblaze_1_local_memory
  create_hier_cell_microblaze_1_local_memory [current_bd_instance .] microblaze_1_local_memory

  # Create instance: microblaze_1_xlconcat, and set properties
  set microblaze_1_xlconcat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 microblaze_1_xlconcat ]

  # Create instance: microblaze_2, and set properties
  set microblaze_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:9.5 microblaze_2 ]
  set_property -dict [ list \
CONFIG.C_DEBUG_ENABLED {1} \
CONFIG.C_D_AXI {1} \
CONFIG.C_D_LMB {1} \
CONFIG.C_FAULT_TOLERANT {1} \
CONFIG.C_I_LMB {1} \
 ] $microblaze_2

  # Create instance: microblaze_2_axi_intc, and set properties
  set microblaze_2_axi_intc [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 microblaze_2_axi_intc ]
  set_property -dict [ list \
CONFIG.C_HAS_FAST {1} \
 ] $microblaze_2_axi_intc

  # Create instance: microblaze_2_axi_periph, and set properties
  set microblaze_2_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 microblaze_2_axi_periph ]
  set_property -dict [ list \
CONFIG.NUM_MI {4} \
 ] $microblaze_2_axi_periph

  # Create instance: microblaze_2_clk_wiz_1, and set properties
  set microblaze_2_clk_wiz_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.2 microblaze_2_clk_wiz_1 ]
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER {193.154} \
CONFIG.CLKOUT1_PHASE_ERROR {109.126} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {20} \
CONFIG.MMCM_CLKFBOUT_MULT_F {8.500} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {42.500} \
CONFIG.MMCM_DIVCLK_DIVIDE {1} \
CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} \
 ] $microblaze_2_clk_wiz_1

  # Create instance: microblaze_2_local_memory
  create_hier_cell_microblaze_2_local_memory [current_bd_instance .] microblaze_2_local_memory

  # Create instance: microblaze_2_xlconcat, and set properties
  set microblaze_2_xlconcat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 microblaze_2_xlconcat ]

  # Create instance: microblaze_3, and set properties
  set microblaze_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:9.5 microblaze_3 ]
  set_property -dict [ list \
CONFIG.C_DEBUG_ENABLED {1} \
CONFIG.C_D_AXI {1} \
CONFIG.C_D_LMB {1} \
CONFIG.C_FAULT_TOLERANT {1} \
CONFIG.C_I_LMB {1} \
 ] $microblaze_3

  # Create instance: microblaze_3_axi_intc, and set properties
  set microblaze_3_axi_intc [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 microblaze_3_axi_intc ]
  set_property -dict [ list \
CONFIG.C_HAS_FAST {1} \
 ] $microblaze_3_axi_intc

  # Create instance: microblaze_3_axi_periph, and set properties
  set microblaze_3_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 microblaze_3_axi_periph ]
  set_property -dict [ list \
CONFIG.NUM_MI {4} \
 ] $microblaze_3_axi_periph

  # Create instance: microblaze_3_clk_wiz_1, and set properties
  set microblaze_3_clk_wiz_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.2 microblaze_3_clk_wiz_1 ]
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER {193.154} \
CONFIG.CLKOUT1_PHASE_ERROR {109.126} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {20} \
CONFIG.MMCM_CLKFBOUT_MULT_F {8.500} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {42.500} \
CONFIG.MMCM_DIVCLK_DIVIDE {1} \
CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} \
 ] $microblaze_3_clk_wiz_1

  # Create instance: microblaze_3_local_memory
  create_hier_cell_microblaze_3_local_memory [current_bd_instance .] microblaze_3_local_memory

  # Create instance: microblaze_3_xlconcat, and set properties
  set microblaze_3_xlconcat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 microblaze_3_xlconcat ]

  # Create instance: microblaze_4, and set properties
  set microblaze_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:9.5 microblaze_4 ]
  set_property -dict [ list \
CONFIG.C_DEBUG_ENABLED {1} \
CONFIG.C_D_AXI {1} \
CONFIG.C_D_LMB {1} \
CONFIG.C_FAULT_TOLERANT {1} \
CONFIG.C_I_LMB {1} \
 ] $microblaze_4

  # Create instance: microblaze_4_axi_intc, and set properties
  set microblaze_4_axi_intc [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 microblaze_4_axi_intc ]
  set_property -dict [ list \
CONFIG.C_HAS_FAST {1} \
 ] $microblaze_4_axi_intc

  # Create instance: microblaze_4_axi_periph, and set properties
  set microblaze_4_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 microblaze_4_axi_periph ]
  set_property -dict [ list \
CONFIG.NUM_MI {4} \
 ] $microblaze_4_axi_periph

  # Create instance: microblaze_4_clk_wiz_1, and set properties
  set microblaze_4_clk_wiz_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.2 microblaze_4_clk_wiz_1 ]
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER {193.154} \
CONFIG.CLKOUT1_PHASE_ERROR {109.126} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {20} \
CONFIG.MMCM_CLKFBOUT_MULT_F {8.500} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {42.500} \
CONFIG.MMCM_DIVCLK_DIVIDE {1} \
CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} \
 ] $microblaze_4_clk_wiz_1

  # Create instance: microblaze_4_local_memory
  create_hier_cell_microblaze_4_local_memory [current_bd_instance .] microblaze_4_local_memory

  # Create instance: microblaze_4_xlconcat, and set properties
  set microblaze_4_xlconcat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 microblaze_4_xlconcat ]

  # Create instance: microblaze_5, and set properties
  set microblaze_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:9.5 microblaze_5 ]
  set_property -dict [ list \
CONFIG.C_DEBUG_ENABLED {1} \
CONFIG.C_D_AXI {1} \
CONFIG.C_D_LMB {1} \
CONFIG.C_FAULT_TOLERANT {1} \
CONFIG.C_I_LMB {1} \
 ] $microblaze_5

  # Create instance: microblaze_5_axi_intc, and set properties
  set microblaze_5_axi_intc [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 microblaze_5_axi_intc ]
  set_property -dict [ list \
CONFIG.C_HAS_FAST {1} \
 ] $microblaze_5_axi_intc

  # Create instance: microblaze_5_axi_periph, and set properties
  set microblaze_5_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 microblaze_5_axi_periph ]
  set_property -dict [ list \
CONFIG.NUM_MI {4} \
 ] $microblaze_5_axi_periph

  # Create instance: microblaze_5_clk_wiz_1, and set properties
  set microblaze_5_clk_wiz_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.2 microblaze_5_clk_wiz_1 ]
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER {193.154} \
CONFIG.CLKOUT1_PHASE_ERROR {109.126} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {20} \
CONFIG.MMCM_CLKFBOUT_MULT_F {8.500} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {42.500} \
CONFIG.MMCM_DIVCLK_DIVIDE {1} \
CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} \
 ] $microblaze_5_clk_wiz_1

  # Create instance: microblaze_5_local_memory
  create_hier_cell_microblaze_5_local_memory [current_bd_instance .] microblaze_5_local_memory

  # Create instance: microblaze_5_xlconcat, and set properties
  set microblaze_5_xlconcat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 microblaze_5_xlconcat ]

  # Create instance: rst_clk_wiz_1_100M, and set properties
  set rst_clk_wiz_1_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_clk_wiz_1_100M ]

  # Create instance: rst_microblaze_1_clk_wiz_1_100M, and set properties
  set rst_microblaze_1_clk_wiz_1_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_microblaze_1_clk_wiz_1_100M ]

  # Create instance: rst_microblaze_2_clk_wiz_1_100M, and set properties
  set rst_microblaze_2_clk_wiz_1_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_microblaze_2_clk_wiz_1_100M ]

  # Create instance: rst_microblaze_3_clk_wiz_1_100M, and set properties
  set rst_microblaze_3_clk_wiz_1_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_microblaze_3_clk_wiz_1_100M ]

  # Create instance: rst_microblaze_4_clk_wiz_1_100M, and set properties
  set rst_microblaze_4_clk_wiz_1_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_microblaze_4_clk_wiz_1_100M ]

  # Create instance: rst_microblaze_5_clk_wiz_1_100M, and set properties
  set rst_microblaze_5_clk_wiz_1_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_microblaze_5_clk_wiz_1_100M ]

  # Create instance: tmrmvoter_0, and set properties
  set tmrmvoter_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:tmrmvoter:1.0 tmrmvoter_0 ]
  set_property -dict [ list \
CONFIG.BusWidth {1} \
 ] $tmrmvoter_0

  # Create instance: tmrmvoter_1, and set properties
  set tmrmvoter_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:tmrmvoter:1.0 tmrmvoter_1 ]
  set_property -dict [ list \
CONFIG.BusWidth {1} \
 ] $tmrmvoter_1

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
CONFIG.IN0_WIDTH {1} \
CONFIG.IN1_WIDTH {1} \
CONFIG.IN2_WIDTH {1} \
CONFIG.NUM_PORTS {3} \
 ] $xlconcat_0

  # Create instance: xlconcat_1, and set properties
  set xlconcat_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_1 ]
  set_property -dict [ list \
CONFIG.IN0_WIDTH {1} \
CONFIG.IN1_WIDTH {1} \
CONFIG.IN2_WIDTH {1} \
CONFIG.NUM_PORTS {3} \
 ] $xlconcat_1

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_0_axi_dp [get_bd_intf_pins microblaze_0/M_AXI_DP] [get_bd_intf_pins microblaze_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M03_AXI [get_bd_intf_pins axi_gpio_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net microblaze_0_debug [get_bd_intf_pins mdm_1/MBDEBUG_0] [get_bd_intf_pins microblaze_0/DEBUG]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_1 [get_bd_intf_pins microblaze_0/DLMB] [get_bd_intf_pins microblaze_0_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_axi [get_bd_intf_pins microblaze_0_axi_periph/M01_AXI] [get_bd_intf_pins microblaze_0_local_memory/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_1 [get_bd_intf_pins microblaze_0/ILMB] [get_bd_intf_pins microblaze_0_local_memory/ILMB]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_axi [get_bd_intf_pins microblaze_0_axi_periph/M02_AXI] [get_bd_intf_pins microblaze_0_local_memory/S_AXI_CTRL1]
  connect_bd_intf_net -intf_net microblaze_0_intc_axi [get_bd_intf_pins microblaze_0_axi_intc/s_axi] [get_bd_intf_pins microblaze_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_interrupt [get_bd_intf_pins microblaze_0/INTERRUPT] [get_bd_intf_pins microblaze_0_axi_intc/interrupt]
  connect_bd_intf_net -intf_net microblaze_1_axi_dp [get_bd_intf_pins microblaze_1/M_AXI_DP] [get_bd_intf_pins microblaze_1_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_1_axi_periph_M03_AXI [get_bd_intf_pins axi_uartlite_0/S_AXI] [get_bd_intf_pins microblaze_1_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net microblaze_1_debug [get_bd_intf_pins mdm_1/MBDEBUG_1] [get_bd_intf_pins microblaze_1/DEBUG]
  connect_bd_intf_net -intf_net microblaze_1_dlmb_1 [get_bd_intf_pins microblaze_1/DLMB] [get_bd_intf_pins microblaze_1_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_1_dlmb_axi [get_bd_intf_pins microblaze_1_axi_periph/M01_AXI] [get_bd_intf_pins microblaze_1_local_memory/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_1_ilmb_1 [get_bd_intf_pins microblaze_1/ILMB] [get_bd_intf_pins microblaze_1_local_memory/ILMB]
  connect_bd_intf_net -intf_net microblaze_1_ilmb_axi [get_bd_intf_pins microblaze_1_axi_periph/M02_AXI] [get_bd_intf_pins microblaze_1_local_memory/S_AXI_CTRL1]
  connect_bd_intf_net -intf_net microblaze_1_intc_axi [get_bd_intf_pins microblaze_1_axi_intc/s_axi] [get_bd_intf_pins microblaze_1_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net microblaze_1_interrupt [get_bd_intf_pins microblaze_1/INTERRUPT] [get_bd_intf_pins microblaze_1_axi_intc/interrupt]
  connect_bd_intf_net -intf_net microblaze_2_axi_dp [get_bd_intf_pins microblaze_2/M_AXI_DP] [get_bd_intf_pins microblaze_2_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_2_axi_periph_M03_AXI [get_bd_intf_pins axi_uartlite_1/S_AXI] [get_bd_intf_pins microblaze_2_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net microblaze_2_debug [get_bd_intf_pins mdm_1/MBDEBUG_2] [get_bd_intf_pins microblaze_2/DEBUG]
  connect_bd_intf_net -intf_net microblaze_2_dlmb_1 [get_bd_intf_pins microblaze_2/DLMB] [get_bd_intf_pins microblaze_2_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_2_dlmb_axi [get_bd_intf_pins microblaze_2_axi_periph/M01_AXI] [get_bd_intf_pins microblaze_2_local_memory/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_2_ilmb_1 [get_bd_intf_pins microblaze_2/ILMB] [get_bd_intf_pins microblaze_2_local_memory/ILMB]
  connect_bd_intf_net -intf_net microblaze_2_ilmb_axi [get_bd_intf_pins microblaze_2_axi_periph/M02_AXI] [get_bd_intf_pins microblaze_2_local_memory/S_AXI_CTRL1]
  connect_bd_intf_net -intf_net microblaze_2_intc_axi [get_bd_intf_pins microblaze_2_axi_intc/s_axi] [get_bd_intf_pins microblaze_2_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net microblaze_2_interrupt [get_bd_intf_pins microblaze_2/INTERRUPT] [get_bd_intf_pins microblaze_2_axi_intc/interrupt]
  connect_bd_intf_net -intf_net microblaze_3_axi_dp [get_bd_intf_pins microblaze_3/M_AXI_DP] [get_bd_intf_pins microblaze_3_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_3_axi_periph_M03_AXI [get_bd_intf_pins axi_uartlite_2/S_AXI] [get_bd_intf_pins microblaze_3_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net microblaze_3_debug [get_bd_intf_pins mdm_1/MBDEBUG_3] [get_bd_intf_pins microblaze_3/DEBUG]
  connect_bd_intf_net -intf_net microblaze_3_dlmb_1 [get_bd_intf_pins microblaze_3/DLMB] [get_bd_intf_pins microblaze_3_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_3_dlmb_axi [get_bd_intf_pins microblaze_3_axi_periph/M01_AXI] [get_bd_intf_pins microblaze_3_local_memory/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_3_ilmb_1 [get_bd_intf_pins microblaze_3/ILMB] [get_bd_intf_pins microblaze_3_local_memory/ILMB]
  connect_bd_intf_net -intf_net microblaze_3_ilmb_axi [get_bd_intf_pins microblaze_3_axi_periph/M02_AXI] [get_bd_intf_pins microblaze_3_local_memory/S_AXI_CTRL1]
  connect_bd_intf_net -intf_net microblaze_3_intc_axi [get_bd_intf_pins microblaze_3_axi_intc/s_axi] [get_bd_intf_pins microblaze_3_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net microblaze_3_interrupt [get_bd_intf_pins microblaze_3/INTERRUPT] [get_bd_intf_pins microblaze_3_axi_intc/interrupt]
  connect_bd_intf_net -intf_net microblaze_4_axi_dp [get_bd_intf_pins microblaze_4/M_AXI_DP] [get_bd_intf_pins microblaze_4_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_4_axi_periph_M03_AXI [get_bd_intf_pins axi_gpio_1/S_AXI] [get_bd_intf_pins microblaze_4_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net microblaze_4_debug [get_bd_intf_pins mdm_1/MBDEBUG_4] [get_bd_intf_pins microblaze_4/DEBUG]
  connect_bd_intf_net -intf_net microblaze_4_dlmb_1 [get_bd_intf_pins microblaze_4/DLMB] [get_bd_intf_pins microblaze_4_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_4_dlmb_axi [get_bd_intf_pins microblaze_4_axi_periph/M01_AXI] [get_bd_intf_pins microblaze_4_local_memory/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_4_ilmb_1 [get_bd_intf_pins microblaze_4/ILMB] [get_bd_intf_pins microblaze_4_local_memory/ILMB]
  connect_bd_intf_net -intf_net microblaze_4_ilmb_axi [get_bd_intf_pins microblaze_4_axi_periph/M02_AXI] [get_bd_intf_pins microblaze_4_local_memory/S_AXI_CTRL1]
  connect_bd_intf_net -intf_net microblaze_4_intc_axi [get_bd_intf_pins microblaze_4_axi_intc/s_axi] [get_bd_intf_pins microblaze_4_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net microblaze_4_interrupt [get_bd_intf_pins microblaze_4/INTERRUPT] [get_bd_intf_pins microblaze_4_axi_intc/interrupt]
  connect_bd_intf_net -intf_net microblaze_5_axi_dp [get_bd_intf_pins microblaze_5/M_AXI_DP] [get_bd_intf_pins microblaze_5_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_5_axi_periph_M03_AXI [get_bd_intf_pins axi_gpio_2/S_AXI] [get_bd_intf_pins microblaze_5_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net microblaze_5_debug [get_bd_intf_pins mdm_1/MBDEBUG_5] [get_bd_intf_pins microblaze_5/DEBUG]
  connect_bd_intf_net -intf_net microblaze_5_dlmb_1 [get_bd_intf_pins microblaze_5/DLMB] [get_bd_intf_pins microblaze_5_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_5_dlmb_axi [get_bd_intf_pins microblaze_5_axi_periph/M01_AXI] [get_bd_intf_pins microblaze_5_local_memory/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_5_ilmb_1 [get_bd_intf_pins microblaze_5/ILMB] [get_bd_intf_pins microblaze_5_local_memory/ILMB]
  connect_bd_intf_net -intf_net microblaze_5_ilmb_axi [get_bd_intf_pins microblaze_5_axi_periph/M02_AXI] [get_bd_intf_pins microblaze_5_local_memory/S_AXI_CTRL1]
  connect_bd_intf_net -intf_net microblaze_5_intc_axi [get_bd_intf_pins microblaze_5_axi_intc/s_axi] [get_bd_intf_pins microblaze_5_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net microblaze_5_interrupt [get_bd_intf_pins microblaze_5/INTERRUPT] [get_bd_intf_pins microblaze_5_axi_intc/interrupt]

  # Create port connections
  connect_bd_net -net axi_gpio_0_gpio_io_o [get_bd_pins axi_gpio_0/gpio_io_o] [get_bd_pins xlconcat_1/In0]
  connect_bd_net -net axi_gpio_1_gpio_io_o [get_bd_pins axi_gpio_1/gpio_io_o] [get_bd_pins xlconcat_1/In1]
  connect_bd_net -net axi_gpio_2_gpio_io_o [get_bd_pins axi_gpio_2/gpio_io_o] [get_bd_pins xlconcat_1/In2]
  connect_bd_net -net axi_uartlite_0_tx [get_bd_pins axi_uartlite_0/tx] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net axi_uartlite_1_tx [get_bd_pins axi_uartlite_1/tx] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net axi_uartlite_2_tx [get_bd_pins axi_uartlite_2/tx] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net clk_wiz_1_locked [get_bd_pins clk_wiz_1/locked] [get_bd_pins rst_clk_wiz_1_100M/dcm_locked]
  connect_bd_net -net clock_rtl_1 [get_bd_ports clock_rtl] [get_bd_pins clk_wiz_1/clk_in1] [get_bd_pins microblaze_1_clk_wiz_1/clk_in1] [get_bd_pins microblaze_2_clk_wiz_1/clk_in1] [get_bd_pins microblaze_3_clk_wiz_1/clk_in1] [get_bd_pins microblaze_4_clk_wiz_1/clk_in1] [get_bd_pins microblaze_5_clk_wiz_1/clk_in1]
  connect_bd_net -net mdm_1_debug_sys_rst [get_bd_pins mdm_1/Debug_SYS_Rst] [get_bd_pins rst_clk_wiz_1_100M/mb_debug_sys_rst] [get_bd_pins rst_microblaze_1_clk_wiz_1_100M/mb_debug_sys_rst] [get_bd_pins rst_microblaze_2_clk_wiz_1_100M/mb_debug_sys_rst] [get_bd_pins rst_microblaze_3_clk_wiz_1_100M/mb_debug_sys_rst] [get_bd_pins rst_microblaze_4_clk_wiz_1_100M/mb_debug_sys_rst] [get_bd_pins rst_microblaze_5_clk_wiz_1_100M/mb_debug_sys_rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins clk_wiz_1/clk_out1] [get_bd_pins microblaze_0/Clk] [get_bd_pins microblaze_0_axi_intc/processor_clk] [get_bd_pins microblaze_0_axi_intc/s_axi_aclk] [get_bd_pins microblaze_0_axi_periph/ACLK] [get_bd_pins microblaze_0_axi_periph/M00_ACLK] [get_bd_pins microblaze_0_axi_periph/M01_ACLK] [get_bd_pins microblaze_0_axi_periph/M02_ACLK] [get_bd_pins microblaze_0_axi_periph/M03_ACLK] [get_bd_pins microblaze_0_axi_periph/S00_ACLK] [get_bd_pins microblaze_0_local_memory/LMB_Clk] [get_bd_pins rst_clk_wiz_1_100M/slowest_sync_clk]
  connect_bd_net -net microblaze_0_dlmb_int [get_bd_pins microblaze_0_local_memory/DLMB_Interrupt] [get_bd_pins microblaze_0_xlconcat/In0]
  connect_bd_net -net microblaze_0_ilmb_int [get_bd_pins microblaze_0_local_memory/ILMB_Interrupt] [get_bd_pins microblaze_0_xlconcat/In1]
  connect_bd_net -net microblaze_0_intr [get_bd_pins microblaze_0_axi_intc/intr] [get_bd_pins microblaze_0_xlconcat/dout]
  connect_bd_net -net microblaze_1_Clk [get_bd_pins axi_uartlite_0/s_axi_aclk] [get_bd_pins microblaze_1/Clk] [get_bd_pins microblaze_1_axi_intc/processor_clk] [get_bd_pins microblaze_1_axi_intc/s_axi_aclk] [get_bd_pins microblaze_1_axi_periph/ACLK] [get_bd_pins microblaze_1_axi_periph/M00_ACLK] [get_bd_pins microblaze_1_axi_periph/M01_ACLK] [get_bd_pins microblaze_1_axi_periph/M02_ACLK] [get_bd_pins microblaze_1_axi_periph/M03_ACLK] [get_bd_pins microblaze_1_axi_periph/S00_ACLK] [get_bd_pins microblaze_1_clk_wiz_1/clk_out1] [get_bd_pins microblaze_1_local_memory/LMB_Clk] [get_bd_pins rst_microblaze_1_clk_wiz_1_100M/slowest_sync_clk]
  connect_bd_net -net microblaze_1_clk_wiz_1_locked [get_bd_pins microblaze_1_clk_wiz_1/locked] [get_bd_pins rst_microblaze_1_clk_wiz_1_100M/dcm_locked]
  connect_bd_net -net microblaze_1_dlmb_int [get_bd_pins microblaze_1_local_memory/DLMB_Interrupt] [get_bd_pins microblaze_1_xlconcat/In0]
  connect_bd_net -net microblaze_1_ilmb_int [get_bd_pins microblaze_1_local_memory/ILMB_Interrupt] [get_bd_pins microblaze_1_xlconcat/In1]
  connect_bd_net -net microblaze_1_intr [get_bd_pins microblaze_1_axi_intc/intr] [get_bd_pins microblaze_1_xlconcat/dout]
  connect_bd_net -net microblaze_2_Clk [get_bd_pins axi_uartlite_1/s_axi_aclk] [get_bd_pins microblaze_2/Clk] [get_bd_pins microblaze_2_axi_intc/processor_clk] [get_bd_pins microblaze_2_axi_intc/s_axi_aclk] [get_bd_pins microblaze_2_axi_periph/ACLK] [get_bd_pins microblaze_2_axi_periph/M00_ACLK] [get_bd_pins microblaze_2_axi_periph/M01_ACLK] [get_bd_pins microblaze_2_axi_periph/M02_ACLK] [get_bd_pins microblaze_2_axi_periph/M03_ACLK] [get_bd_pins microblaze_2_axi_periph/S00_ACLK] [get_bd_pins microblaze_2_clk_wiz_1/clk_out1] [get_bd_pins microblaze_2_local_memory/LMB_Clk] [get_bd_pins rst_microblaze_2_clk_wiz_1_100M/slowest_sync_clk]
  connect_bd_net -net microblaze_2_clk_wiz_1_locked [get_bd_pins microblaze_2_clk_wiz_1/locked] [get_bd_pins rst_microblaze_2_clk_wiz_1_100M/dcm_locked]
  connect_bd_net -net microblaze_2_dlmb_int [get_bd_pins microblaze_2_local_memory/DLMB_Interrupt] [get_bd_pins microblaze_2_xlconcat/In0]
  connect_bd_net -net microblaze_2_ilmb_int [get_bd_pins microblaze_2_local_memory/ILMB_Interrupt] [get_bd_pins microblaze_2_xlconcat/In1]
  connect_bd_net -net microblaze_2_intr [get_bd_pins microblaze_2_axi_intc/intr] [get_bd_pins microblaze_2_xlconcat/dout]
  connect_bd_net -net microblaze_3_Clk [get_bd_pins axi_uartlite_2/s_axi_aclk] [get_bd_pins microblaze_3/Clk] [get_bd_pins microblaze_3_axi_intc/processor_clk] [get_bd_pins microblaze_3_axi_intc/s_axi_aclk] [get_bd_pins microblaze_3_axi_periph/ACLK] [get_bd_pins microblaze_3_axi_periph/M00_ACLK] [get_bd_pins microblaze_3_axi_periph/M01_ACLK] [get_bd_pins microblaze_3_axi_periph/M02_ACLK] [get_bd_pins microblaze_3_axi_periph/M03_ACLK] [get_bd_pins microblaze_3_axi_periph/S00_ACLK] [get_bd_pins microblaze_3_clk_wiz_1/clk_out1] [get_bd_pins microblaze_3_local_memory/LMB_Clk] [get_bd_pins rst_microblaze_3_clk_wiz_1_100M/slowest_sync_clk]
  connect_bd_net -net microblaze_3_clk_wiz_1_locked [get_bd_pins microblaze_3_clk_wiz_1/locked] [get_bd_pins rst_microblaze_3_clk_wiz_1_100M/dcm_locked]
  connect_bd_net -net microblaze_3_dlmb_int [get_bd_pins microblaze_3_local_memory/DLMB_Interrupt] [get_bd_pins microblaze_3_xlconcat/In0]
  connect_bd_net -net microblaze_3_ilmb_int [get_bd_pins microblaze_3_local_memory/ILMB_Interrupt] [get_bd_pins microblaze_3_xlconcat/In1]
  connect_bd_net -net microblaze_3_intr [get_bd_pins microblaze_3_axi_intc/intr] [get_bd_pins microblaze_3_xlconcat/dout]
  connect_bd_net -net microblaze_4_Clk [get_bd_pins axi_gpio_1/s_axi_aclk] [get_bd_pins microblaze_4/Clk] [get_bd_pins microblaze_4_axi_intc/processor_clk] [get_bd_pins microblaze_4_axi_intc/s_axi_aclk] [get_bd_pins microblaze_4_axi_periph/ACLK] [get_bd_pins microblaze_4_axi_periph/M00_ACLK] [get_bd_pins microblaze_4_axi_periph/M01_ACLK] [get_bd_pins microblaze_4_axi_periph/M02_ACLK] [get_bd_pins microblaze_4_axi_periph/M03_ACLK] [get_bd_pins microblaze_4_axi_periph/S00_ACLK] [get_bd_pins microblaze_4_clk_wiz_1/clk_out1] [get_bd_pins microblaze_4_local_memory/LMB_Clk] [get_bd_pins rst_microblaze_4_clk_wiz_1_100M/slowest_sync_clk]
  connect_bd_net -net microblaze_4_clk_wiz_1_locked [get_bd_pins microblaze_4_clk_wiz_1/locked] [get_bd_pins rst_microblaze_4_clk_wiz_1_100M/dcm_locked]
  connect_bd_net -net microblaze_4_dlmb_int [get_bd_pins microblaze_4_local_memory/DLMB_Interrupt] [get_bd_pins microblaze_4_xlconcat/In0]
  connect_bd_net -net microblaze_4_ilmb_int [get_bd_pins microblaze_4_local_memory/ILMB_Interrupt] [get_bd_pins microblaze_4_xlconcat/In1]
  connect_bd_net -net microblaze_4_intr [get_bd_pins microblaze_4_axi_intc/intr] [get_bd_pins microblaze_4_xlconcat/dout]
  connect_bd_net -net microblaze_5_Clk [get_bd_pins axi_gpio_2/s_axi_aclk] [get_bd_pins microblaze_5/Clk] [get_bd_pins microblaze_5_axi_intc/processor_clk] [get_bd_pins microblaze_5_axi_intc/s_axi_aclk] [get_bd_pins microblaze_5_axi_periph/ACLK] [get_bd_pins microblaze_5_axi_periph/M00_ACLK] [get_bd_pins microblaze_5_axi_periph/M01_ACLK] [get_bd_pins microblaze_5_axi_periph/M02_ACLK] [get_bd_pins microblaze_5_axi_periph/M03_ACLK] [get_bd_pins microblaze_5_axi_periph/S00_ACLK] [get_bd_pins microblaze_5_clk_wiz_1/clk_out1] [get_bd_pins microblaze_5_local_memory/LMB_Clk] [get_bd_pins rst_microblaze_5_clk_wiz_1_100M/slowest_sync_clk]
  connect_bd_net -net microblaze_5_clk_wiz_1_locked [get_bd_pins microblaze_5_clk_wiz_1/locked] [get_bd_pins rst_microblaze_5_clk_wiz_1_100M/dcm_locked]
  connect_bd_net -net microblaze_5_dlmb_int [get_bd_pins microblaze_5_local_memory/DLMB_Interrupt] [get_bd_pins microblaze_5_xlconcat/In0]
  connect_bd_net -net microblaze_5_ilmb_int [get_bd_pins microblaze_5_local_memory/ILMB_Interrupt] [get_bd_pins microblaze_5_xlconcat/In1]
  connect_bd_net -net microblaze_5_intr [get_bd_pins microblaze_5_axi_intc/intr] [get_bd_pins microblaze_5_xlconcat/dout]
  connect_bd_net -net reset_rtl_0_1 [get_bd_ports reset_rtl_0] [get_bd_pins rst_clk_wiz_1_100M/ext_reset_in] [get_bd_pins rst_microblaze_1_clk_wiz_1_100M/ext_reset_in] [get_bd_pins rst_microblaze_2_clk_wiz_1_100M/ext_reset_in] [get_bd_pins rst_microblaze_3_clk_wiz_1_100M/ext_reset_in] [get_bd_pins rst_microblaze_4_clk_wiz_1_100M/ext_reset_in] [get_bd_pins rst_microblaze_5_clk_wiz_1_100M/ext_reset_in]
  connect_bd_net -net reset_rtl_1 [get_bd_ports reset_rtl] [get_bd_pins clk_wiz_1/reset] [get_bd_pins microblaze_1_clk_wiz_1/reset] [get_bd_pins microblaze_2_clk_wiz_1/reset] [get_bd_pins microblaze_3_clk_wiz_1/reset] [get_bd_pins microblaze_4_clk_wiz_1/reset] [get_bd_pins microblaze_5_clk_wiz_1/reset]
  connect_bd_net -net rst_clk_wiz_1_100M_bus_struct_reset [get_bd_pins microblaze_0_local_memory/SYS_Rst] [get_bd_pins rst_clk_wiz_1_100M/bus_struct_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_interconnect_aresetn [get_bd_pins microblaze_0_axi_intc/s_axi_aresetn] [get_bd_pins microblaze_0_axi_periph/ARESETN] [get_bd_pins microblaze_0_axi_periph/M00_ARESETN] [get_bd_pins microblaze_0_axi_periph/M01_ARESETN] [get_bd_pins microblaze_0_axi_periph/M02_ARESETN] [get_bd_pins microblaze_0_axi_periph/M03_ARESETN] [get_bd_pins microblaze_0_axi_periph/S00_ARESETN] [get_bd_pins rst_clk_wiz_1_100M/interconnect_aresetn]
  connect_bd_net -net rst_clk_wiz_1_100M_mb_reset [get_bd_pins microblaze_0/Reset] [get_bd_pins microblaze_0_axi_intc/processor_rst] [get_bd_pins rst_clk_wiz_1_100M/mb_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins microblaze_0_local_memory/S_AXI_CTRL_ARESETN] [get_bd_pins rst_clk_wiz_1_100M/peripheral_aresetn]
  connect_bd_net -net rst_microblaze_1_clk_wiz_1_100M_bus_struct_reset [get_bd_pins microblaze_1_local_memory/SYS_Rst] [get_bd_pins rst_microblaze_1_clk_wiz_1_100M/bus_struct_reset]
  connect_bd_net -net rst_microblaze_1_clk_wiz_1_100M_interconnect_aresetn [get_bd_pins microblaze_1_axi_periph/ARESETN] [get_bd_pins rst_microblaze_1_clk_wiz_1_100M/interconnect_aresetn]
  connect_bd_net -net rst_microblaze_1_clk_wiz_1_100M_mb_reset [get_bd_pins microblaze_1/Reset] [get_bd_pins microblaze_1_axi_intc/processor_rst] [get_bd_pins rst_microblaze_1_clk_wiz_1_100M/mb_reset]
  connect_bd_net -net rst_microblaze_1_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins axi_uartlite_0/s_axi_aresetn] [get_bd_pins microblaze_1_axi_intc/s_axi_aresetn] [get_bd_pins microblaze_1_axi_periph/M00_ARESETN] [get_bd_pins microblaze_1_axi_periph/M01_ARESETN] [get_bd_pins microblaze_1_axi_periph/M02_ARESETN] [get_bd_pins microblaze_1_axi_periph/M03_ARESETN] [get_bd_pins microblaze_1_axi_periph/S00_ARESETN] [get_bd_pins microblaze_1_local_memory/S_AXI_CTRL_ARESETN] [get_bd_pins rst_microblaze_1_clk_wiz_1_100M/peripheral_aresetn]
  connect_bd_net -net rst_microblaze_2_clk_wiz_1_100M_bus_struct_reset [get_bd_pins microblaze_2_local_memory/SYS_Rst] [get_bd_pins rst_microblaze_2_clk_wiz_1_100M/bus_struct_reset]
  connect_bd_net -net rst_microblaze_2_clk_wiz_1_100M_interconnect_aresetn [get_bd_pins microblaze_2_axi_periph/ARESETN] [get_bd_pins rst_microblaze_2_clk_wiz_1_100M/interconnect_aresetn]
  connect_bd_net -net rst_microblaze_2_clk_wiz_1_100M_mb_reset [get_bd_pins microblaze_2/Reset] [get_bd_pins microblaze_2_axi_intc/processor_rst] [get_bd_pins rst_microblaze_2_clk_wiz_1_100M/mb_reset]
  connect_bd_net -net rst_microblaze_2_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins axi_uartlite_1/s_axi_aresetn] [get_bd_pins microblaze_2_axi_intc/s_axi_aresetn] [get_bd_pins microblaze_2_axi_periph/M00_ARESETN] [get_bd_pins microblaze_2_axi_periph/M01_ARESETN] [get_bd_pins microblaze_2_axi_periph/M02_ARESETN] [get_bd_pins microblaze_2_axi_periph/M03_ARESETN] [get_bd_pins microblaze_2_axi_periph/S00_ARESETN] [get_bd_pins microblaze_2_local_memory/S_AXI_CTRL_ARESETN] [get_bd_pins rst_microblaze_2_clk_wiz_1_100M/peripheral_aresetn]
  connect_bd_net -net rst_microblaze_3_clk_wiz_1_100M_bus_struct_reset [get_bd_pins microblaze_3_local_memory/SYS_Rst] [get_bd_pins rst_microblaze_3_clk_wiz_1_100M/bus_struct_reset]
  connect_bd_net -net rst_microblaze_3_clk_wiz_1_100M_interconnect_aresetn [get_bd_pins microblaze_3_axi_periph/ARESETN] [get_bd_pins rst_microblaze_3_clk_wiz_1_100M/interconnect_aresetn]
  connect_bd_net -net rst_microblaze_3_clk_wiz_1_100M_mb_reset [get_bd_pins microblaze_3/Reset] [get_bd_pins microblaze_3_axi_intc/processor_rst] [get_bd_pins rst_microblaze_3_clk_wiz_1_100M/mb_reset]
  connect_bd_net -net rst_microblaze_3_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins axi_uartlite_2/s_axi_aresetn] [get_bd_pins microblaze_3_axi_intc/s_axi_aresetn] [get_bd_pins microblaze_3_axi_periph/M00_ARESETN] [get_bd_pins microblaze_3_axi_periph/M01_ARESETN] [get_bd_pins microblaze_3_axi_periph/M02_ARESETN] [get_bd_pins microblaze_3_axi_periph/M03_ARESETN] [get_bd_pins microblaze_3_axi_periph/S00_ARESETN] [get_bd_pins microblaze_3_local_memory/S_AXI_CTRL_ARESETN] [get_bd_pins rst_microblaze_3_clk_wiz_1_100M/peripheral_aresetn]
  connect_bd_net -net rst_microblaze_4_clk_wiz_1_100M_bus_struct_reset [get_bd_pins microblaze_4_local_memory/SYS_Rst] [get_bd_pins rst_microblaze_4_clk_wiz_1_100M/bus_struct_reset]
  connect_bd_net -net rst_microblaze_4_clk_wiz_1_100M_interconnect_aresetn [get_bd_pins microblaze_4_axi_periph/ARESETN] [get_bd_pins rst_microblaze_4_clk_wiz_1_100M/interconnect_aresetn]
  connect_bd_net -net rst_microblaze_4_clk_wiz_1_100M_mb_reset [get_bd_pins microblaze_4/Reset] [get_bd_pins microblaze_4_axi_intc/processor_rst] [get_bd_pins rst_microblaze_4_clk_wiz_1_100M/mb_reset]
  connect_bd_net -net rst_microblaze_4_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins axi_gpio_1/s_axi_aresetn] [get_bd_pins microblaze_4_axi_intc/s_axi_aresetn] [get_bd_pins microblaze_4_axi_periph/M00_ARESETN] [get_bd_pins microblaze_4_axi_periph/M01_ARESETN] [get_bd_pins microblaze_4_axi_periph/M02_ARESETN] [get_bd_pins microblaze_4_axi_periph/M03_ARESETN] [get_bd_pins microblaze_4_axi_periph/S00_ARESETN] [get_bd_pins microblaze_4_local_memory/S_AXI_CTRL_ARESETN] [get_bd_pins rst_microblaze_4_clk_wiz_1_100M/peripheral_aresetn]
  connect_bd_net -net rst_microblaze_5_clk_wiz_1_100M_bus_struct_reset [get_bd_pins microblaze_5_local_memory/SYS_Rst] [get_bd_pins rst_microblaze_5_clk_wiz_1_100M/bus_struct_reset]
  connect_bd_net -net rst_microblaze_5_clk_wiz_1_100M_interconnect_aresetn [get_bd_pins microblaze_5_axi_periph/ARESETN] [get_bd_pins rst_microblaze_5_clk_wiz_1_100M/interconnect_aresetn]
  connect_bd_net -net rst_microblaze_5_clk_wiz_1_100M_mb_reset [get_bd_pins microblaze_5/Reset] [get_bd_pins microblaze_5_axi_intc/processor_rst] [get_bd_pins rst_microblaze_5_clk_wiz_1_100M/mb_reset]
  connect_bd_net -net rst_microblaze_5_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins axi_gpio_2/s_axi_aresetn] [get_bd_pins microblaze_5_axi_intc/s_axi_aresetn] [get_bd_pins microblaze_5_axi_periph/M00_ARESETN] [get_bd_pins microblaze_5_axi_periph/M01_ARESETN] [get_bd_pins microblaze_5_axi_periph/M02_ARESETN] [get_bd_pins microblaze_5_axi_periph/M03_ARESETN] [get_bd_pins microblaze_5_axi_periph/S00_ARESETN] [get_bd_pins microblaze_5_local_memory/S_AXI_CTRL_ARESETN] [get_bd_pins rst_microblaze_5_clk_wiz_1_100M/peripheral_aresetn]
  connect_bd_net -net tmrmvoter_0_Outs [get_bd_ports uart_rtl_txd] [get_bd_pins tmrmvoter_0/Outs]
  connect_bd_net -net tmrmvoter_1_Outs [get_bd_ports gpio_rtl] [get_bd_pins tmrmvoter_1/Outs]
  connect_bd_net -net uart_rtl_rxd_1 [get_bd_ports uart_rtl_rxd] [get_bd_pins axi_uartlite_0/rx] [get_bd_pins axi_uartlite_1/rx] [get_bd_pins axi_uartlite_2/rx]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins tmrmvoter_0/Ins] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconcat_1_dout [get_bd_pins tmrmvoter_1/Ins] [get_bd_pins xlconcat_1/dout]

  # Create address segments
  create_bd_addr_seg -range 0x10000 -offset 0x40000000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg] SEG_axi_gpio_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x0 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x10000 -offset 0x76000000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_local_memory/dlmb_bram_if_cntlr/S_AXI_CTRL/Reg] SEG_dlmb_bram_if_cntlr_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x0 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs microblaze_0_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x10000 -offset 0x76010000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_local_memory/ilmb_bram_if_cntlr/S_AXI_CTRL/Reg] SEG_ilmb_bram_if_cntlr_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x41200000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_axi_intc/s_axi/Reg] SEG_microblaze_0_axi_intc_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40600000 [get_bd_addr_spaces microblaze_1/Data] [get_bd_addr_segs axi_uartlite_0/S_AXI/Reg] SEG_axi_uartlite_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x0 [get_bd_addr_spaces microblaze_1/Data] [get_bd_addr_segs microblaze_1_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x10000 -offset 0x76000000 [get_bd_addr_spaces microblaze_1/Data] [get_bd_addr_segs microblaze_1_local_memory/dlmb_bram_if_cntlr/S_AXI_CTRL/Reg] SEG_dlmb_bram_if_cntlr_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x0 [get_bd_addr_spaces microblaze_1/Instruction] [get_bd_addr_segs microblaze_1_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x10000 -offset 0x76010000 [get_bd_addr_spaces microblaze_1/Data] [get_bd_addr_segs microblaze_1_local_memory/ilmb_bram_if_cntlr/S_AXI_CTRL/Reg] SEG_ilmb_bram_if_cntlr_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x41200000 [get_bd_addr_spaces microblaze_1/Data] [get_bd_addr_segs microblaze_1_axi_intc/s_axi/Reg] SEG_microblaze_1_axi_intc_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40600000 [get_bd_addr_spaces microblaze_2/Data] [get_bd_addr_segs axi_uartlite_1/S_AXI/Reg] SEG_axi_uartlite_1_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x0 [get_bd_addr_spaces microblaze_2/Data] [get_bd_addr_segs microblaze_2_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x10000 -offset 0x76000000 [get_bd_addr_spaces microblaze_2/Data] [get_bd_addr_segs microblaze_2_local_memory/dlmb_bram_if_cntlr/S_AXI_CTRL/Reg] SEG_dlmb_bram_if_cntlr_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x0 [get_bd_addr_spaces microblaze_2/Instruction] [get_bd_addr_segs microblaze_2_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x10000 -offset 0x76010000 [get_bd_addr_spaces microblaze_2/Data] [get_bd_addr_segs microblaze_2_local_memory/ilmb_bram_if_cntlr/S_AXI_CTRL/Reg] SEG_ilmb_bram_if_cntlr_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x41200000 [get_bd_addr_spaces microblaze_2/Data] [get_bd_addr_segs microblaze_2_axi_intc/s_axi/Reg] SEG_microblaze_2_axi_intc_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40600000 [get_bd_addr_spaces microblaze_3/Data] [get_bd_addr_segs axi_uartlite_2/S_AXI/Reg] SEG_axi_uartlite_2_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x0 [get_bd_addr_spaces microblaze_3/Data] [get_bd_addr_segs microblaze_3_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x10000 -offset 0x76000000 [get_bd_addr_spaces microblaze_3/Data] [get_bd_addr_segs microblaze_3_local_memory/dlmb_bram_if_cntlr/S_AXI_CTRL/Reg] SEG_dlmb_bram_if_cntlr_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x0 [get_bd_addr_spaces microblaze_3/Instruction] [get_bd_addr_segs microblaze_3_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x10000 -offset 0x76010000 [get_bd_addr_spaces microblaze_3/Data] [get_bd_addr_segs microblaze_3_local_memory/ilmb_bram_if_cntlr/S_AXI_CTRL/Reg] SEG_ilmb_bram_if_cntlr_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x41200000 [get_bd_addr_spaces microblaze_3/Data] [get_bd_addr_segs microblaze_3_axi_intc/s_axi/Reg] SEG_microblaze_3_axi_intc_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40000000 [get_bd_addr_spaces microblaze_4/Data] [get_bd_addr_segs axi_gpio_1/S_AXI/Reg] SEG_axi_gpio_1_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x0 [get_bd_addr_spaces microblaze_4/Data] [get_bd_addr_segs microblaze_4_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x10000 -offset 0x76000000 [get_bd_addr_spaces microblaze_4/Data] [get_bd_addr_segs microblaze_4_local_memory/dlmb_bram_if_cntlr/S_AXI_CTRL/Reg] SEG_dlmb_bram_if_cntlr_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x0 [get_bd_addr_spaces microblaze_4/Instruction] [get_bd_addr_segs microblaze_4_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x10000 -offset 0x76010000 [get_bd_addr_spaces microblaze_4/Data] [get_bd_addr_segs microblaze_4_local_memory/ilmb_bram_if_cntlr/S_AXI_CTRL/Reg] SEG_ilmb_bram_if_cntlr_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x41200000 [get_bd_addr_spaces microblaze_4/Data] [get_bd_addr_segs microblaze_4_axi_intc/s_axi/Reg] SEG_microblaze_4_axi_intc_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40000000 [get_bd_addr_spaces microblaze_5/Data] [get_bd_addr_segs axi_gpio_2/S_AXI/Reg] SEG_axi_gpio_2_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x0 [get_bd_addr_spaces microblaze_5/Data] [get_bd_addr_segs microblaze_5_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x10000 -offset 0x76000000 [get_bd_addr_spaces microblaze_5/Data] [get_bd_addr_segs microblaze_5_local_memory/dlmb_bram_if_cntlr/S_AXI_CTRL/Reg] SEG_dlmb_bram_if_cntlr_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x0 [get_bd_addr_spaces microblaze_5/Instruction] [get_bd_addr_segs microblaze_5_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x10000 -offset 0x76010000 [get_bd_addr_spaces microblaze_5/Data] [get_bd_addr_segs microblaze_5_local_memory/ilmb_bram_if_cntlr/S_AXI_CTRL/Reg] SEG_ilmb_bram_if_cntlr_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x41200000 [get_bd_addr_spaces microblaze_5/Data] [get_bd_addr_segs microblaze_5_axi_intc/s_axi/Reg] SEG_microblaze_5_axi_intc_Reg

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port reset_rtl -pg 1 -y 1900 -defaultsOSRD
preplace port uart_rtl_rxd -pg 1 -y 950 -defaultsOSRD -right
preplace port reset_rtl_0 -pg 1 -y 1990 -defaultsOSRD
preplace port clock_rtl -pg 1 -y 1880 -defaultsOSRD
preplace portBus gpio_rtl -pg 1 -y 3340 -defaultsOSRD
preplace portBus uart_rtl_txd -pg 1 -y 860 -defaultsOSRD
preplace inst microblaze_4_clk_wiz_1 -pg 1 -lvl 2 -y 3080 -defaultsOSRD
preplace inst microblaze_4 -pg 1 -lvl 4 -y 3060 -defaultsOSRD
preplace inst rst_microblaze_2_clk_wiz_1_100M -pg 1 -lvl 3 -y 790 -defaultsOSRD
preplace inst microblaze_2_axi_periph -pg 1 -lvl 5 -y 190 -defaultsOSRD
preplace inst microblaze_5_local_memory -pg 1 -lvl 4 -y 3380 -defaultsOSRD
preplace inst microblaze_5 -pg 1 -lvl 4 -y 3550 -defaultsOSRD
preplace inst microblaze_4_axi_intc -pg 1 -lvl 6 -y 3100 -defaultsOSRD
preplace inst microblaze_4_axi_periph -pg 1 -lvl 5 -y 3100 -defaultsOSRD
preplace inst microblaze_1_axi_periph -pg 1 -lvl 5 -y 780 -defaultsOSRD
preplace inst rst_microblaze_5_clk_wiz_1_100M -pg 1 -lvl 3 -y 3450 -defaultsOSRD
preplace inst microblaze_5_xlconcat -pg 1 -lvl 7 -y 3460 -defaultsOSRD
preplace inst microblaze_4_xlconcat -pg 1 -lvl 7 -y 3110 -defaultsOSRD
preplace inst microblaze_3_clk_wiz_1 -pg 1 -lvl 2 -y 290 -defaultsOSRD
preplace inst microblaze_3_axi_periph -pg 1 -lvl 5 -y 1360 -defaultsOSRD
preplace inst microblaze_3_xlconcat -pg 1 -lvl 5 -y 1790 -defaultsOSRD
preplace inst microblaze_2_xlconcat -pg 1 -lvl 5 -y 440 -defaultsOSRD
preplace inst microblaze_0_axi_periph -pg 1 -lvl 5 -y 2580 -defaultsOSRD
preplace inst xlconcat_0 -pg 1 -lvl 7 -y 860 -defaultsOSRD
preplace inst microblaze_2_local_memory -pg 1 -lvl 4 -y 270 -defaultsOSRD
preplace inst microblaze_0_xlconcat -pg 1 -lvl 7 -y 2700 -defaultsOSRD
preplace inst axi_gpio_0 -pg 1 -lvl 8 -y 3200 -defaultsOSRD
preplace inst xlconcat_1 -pg 1 -lvl 9 -y 3350 -defaultsOSRD
preplace inst axi_gpio_1 -pg 1 -lvl 8 -y 3360 -defaultsOSRD
preplace inst tmrmvoter_0 -pg 1 -lvl 8 -y 860 -defaultsOSRD
preplace inst microblaze_3_axi_intc -pg 1 -lvl 6 -y 1800 -defaultsOSRD
preplace inst microblaze_2_axi_intc -pg 1 -lvl 6 -y 480 -defaultsOSRD
preplace inst rst_microblaze_1_clk_wiz_1_100M -pg 1 -lvl 3 -y 1220 -defaultsOSRD
preplace inst axi_gpio_2 -pg 1 -lvl 8 -y 3530 -defaultsOSRD
preplace inst tmrmvoter_1 -pg 1 -lvl 10 -y 3340 -defaultsOSRD
preplace inst microblaze_3_local_memory -pg 1 -lvl 4 -y 1200 -defaultsOSRD
preplace inst microblaze_2_clk_wiz_1 -pg 1 -lvl 2 -y 760 -defaultsOSRD
preplace inst microblaze_1_xlconcat -pg 1 -lvl 5 -y 1090 -defaultsOSRD
preplace inst microblaze_1_axi_intc -pg 1 -lvl 6 -y 1250 -defaultsOSRD
preplace inst mdm_1 -pg 1 -lvl 1 -y 1950 -defaultsOSRD
preplace inst microblaze_0_axi_intc -pg 1 -lvl 6 -y 2680 -defaultsOSRD
preplace inst rst_microblaze_3_clk_wiz_1_100M -pg 1 -lvl 3 -y 260 -defaultsOSRD
preplace inst microblaze_1_local_memory -pg 1 -lvl 4 -y 690 -defaultsOSRD
preplace inst microblaze_5_clk_wiz_1 -pg 1 -lvl 2 -y 3440 -defaultsOSRD
preplace inst microblaze_4_local_memory -pg 1 -lvl 4 -y 2890 -defaultsOSRD
preplace inst axi_uartlite_0 -pg 1 -lvl 6 -y 830 -defaultsOSRD
preplace inst microblaze_0 -pg 1 -lvl 4 -y 2610 -defaultsOSRD
preplace inst rst_microblaze_4_clk_wiz_1_100M -pg 1 -lvl 3 -y 3050 -defaultsOSRD
preplace inst axi_uartlite_1 -pg 1 -lvl 6 -y 660 -defaultsOSRD
preplace inst microblaze_1_clk_wiz_1 -pg 1 -lvl 2 -y 1240 -defaultsOSRD
preplace inst rst_clk_wiz_1_100M -pg 1 -lvl 3 -y 2620 -defaultsOSRD
preplace inst microblaze_1 -pg 1 -lvl 4 -y 1390 -defaultsOSRD
preplace inst axi_uartlite_2 -pg 1 -lvl 6 -y 1410 -defaultsOSRD
preplace inst microblaze_2 -pg 1 -lvl 4 -y 860 -defaultsOSRD
preplace inst clk_wiz_1 -pg 1 -lvl 2 -y 2650 -defaultsOSRD
preplace inst microblaze_0_local_memory -pg 1 -lvl 4 -y 2440 -defaultsOSRD
preplace inst microblaze_5_axi_intc -pg 1 -lvl 6 -y 3500 -defaultsOSRD
preplace inst microblaze_5_axi_periph -pg 1 -lvl 5 -y 3480 -defaultsOSRD
preplace inst microblaze_3 -pg 1 -lvl 4 -y 440 -defaultsOSRD
preplace netloc microblaze_4_intc_axi 1 5 1 2720
preplace netloc microblaze_3_interrupt 1 3 4 NJ 960 NJ 960 NJ 960 3100
preplace netloc microblaze_2_axi_periph_M03_AXI 1 5 1 2810
preplace netloc rst_microblaze_5_clk_wiz_1_100M_bus_struct_reset 1 3 1 1620
preplace netloc tmrmvoter_1_Outs 1 10 1 NJ
preplace netloc microblaze_1_Clk 1 2 4 1010 1130 1600 80 2350 590 2760
preplace netloc microblaze_3_axi_dp 1 4 1 2320
preplace netloc rst_microblaze_4_clk_wiz_1_100M_interconnect_aresetn 1 3 2 1490 3150 NJ
preplace netloc microblaze_4_axi_periph_M03_AXI 1 5 3 NJ 3210 NJ 3210 NJ
preplace netloc microblaze_2_axi_dp 1 4 1 2210
preplace netloc microblaze_0_axi_periph_M03_AXI 1 5 3 NJ 2580 NJ 2580 3440
preplace netloc microblaze_3_ilmb_int 1 4 1 2240
preplace netloc axi_gpio_1_gpio_io_o 1 8 1 3690
preplace netloc microblaze_3_dlmb_axi 1 3 3 1690 1030 NJ 1030 2720
preplace netloc microblaze_3_ilmb_axi 1 3 3 1700 1080 2280 1170 2710
preplace netloc rst_microblaze_1_clk_wiz_1_100M_mb_reset 1 3 3 NJ 1070 NJ 1150 NJ
preplace netloc rst_microblaze_2_clk_wiz_1_100M_mb_reset 1 3 3 NJ 540 NJ 540 NJ
preplace netloc axi_uartlite_0_tx 1 6 1 N
preplace netloc xlconcat_1_dout 1 9 1 3880
preplace netloc microblaze_0_intc_axi 1 5 1 2780
preplace netloc microblaze_0_dlmb_1 1 3 2 1700 2320 NJ
preplace netloc rst_microblaze_3_clk_wiz_1_100M_peripheral_aresetn 1 3 3 1550 1310 2250 1540 2810
preplace netloc rst_microblaze_5_clk_wiz_1_100M_peripheral_aresetn 1 3 5 1620 3650 2380 3700 2780 3380 NJ 3380 NJ
preplace netloc microblaze_1_clk_wiz_1_locked 1 2 1 1010
preplace netloc xlconcat_0_dout 1 7 1 NJ
preplace netloc rst_microblaze_1_clk_wiz_1_100M_peripheral_aresetn 1 3 3 1540 940 2220 600 2780
preplace netloc microblaze_3_axi_periph_M03_AXI 1 5 1 N
preplace netloc microblaze_3_ilmb_1 1 3 2 1650 150 NJ
preplace netloc microblaze_1_axi_periph_M03_AXI 1 5 1 N
preplace netloc rst_clk_wiz_1_100M_mb_reset 1 3 3 NJ 2740 NJ 2800 2740
preplace netloc microblaze_4_clk_wiz_1_locked 1 2 1 N
preplace netloc microblaze_4_axi_dp 1 4 1 2230
preplace netloc clock_rtl_1 1 0 2 NJ 1830 -260
preplace netloc microblaze_3_clk_wiz_1_locked 1 2 1 N
preplace netloc microblaze_1_intr 1 5 1 2750
preplace netloc microblaze_5_Clk 1 2 6 1010 3360 1490 3640 2330 3710 2760 3350 NJ 3350 3400
preplace netloc microblaze_5_dlmb_1 1 3 2 1700 3260 2170
preplace netloc microblaze_2_intc_axi 1 5 1 2820
preplace netloc microblaze_2_interrupt 1 3 4 NJ 10 NJ 10 NJ 10 3100
preplace netloc microblaze_1_dlmb_axi 1 3 3 1670 530 NJ 530 2720
preplace netloc rst_microblaze_1_clk_wiz_1_100M_bus_struct_reset 1 3 1 NJ
preplace netloc rst_microblaze_5_clk_wiz_1_100M_mb_reset 1 3 3 NJ 3720 NJ 3720 2820
preplace netloc rst_clk_wiz_1_100M_bus_struct_reset 1 3 1 NJ
preplace netloc microblaze_4_interrupt 1 3 4 NJ 3140 NJ 2920 NJ 2920 3100
preplace netloc microblaze_3_dlmb_1 1 3 2 1640 140 NJ
preplace netloc rst_microblaze_1_clk_wiz_1_100M_interconnect_aresetn 1 3 2 1510 520 NJ
preplace netloc microblaze_5_ilmb_int 1 4 3 2210 3730 NJ 3730 NJ
preplace netloc microblaze_1_dlmb_int 1 4 1 2330
preplace netloc microblaze_5_intr 1 5 3 2810 3390 NJ 3390 3370
preplace netloc rst_microblaze_2_clk_wiz_1_100M_interconnect_aresetn 1 3 2 NJ 60 NJ
preplace netloc microblaze_4_debug 1 1 3 NJ 1970 NJ 1970 NJ
preplace netloc microblaze_1_ilmb_axi 1 3 3 1680 550 NJ 550 2710
preplace netloc microblaze_0_ilmb_1 1 3 2 1680 2690 NJ
preplace netloc rst_microblaze_4_clk_wiz_1_100M_peripheral_aresetn 1 3 5 1460 3160 2300 2910 2740 3000 NJ 3000 NJ
preplace netloc rst_microblaze_4_clk_wiz_1_100M_bus_struct_reset 1 3 1 1620
preplace netloc microblaze_5_intc_axi 1 5 1 NJ
preplace netloc microblaze_0_interrupt 1 3 4 1700 2730 2260 2780 NJ 2780 3100
preplace netloc microblaze_0_ilmb_int 1 4 3 NJ 2400 NJ 2400 3110
preplace netloc microblaze_2_clk_wiz_1_locked 1 2 1 1010
preplace netloc microblaze_5_clk_wiz_1_locked 1 2 1 1020
preplace netloc tmrmvoter_0_Outs 1 8 3 NJ 860 NJ 860 NJ
preplace netloc microblaze_4_intr 1 5 3 2820 3220 NJ 3220 3380
preplace netloc microblaze_3_intc_axi 1 5 1 2760
preplace netloc mdm_1_debug_sys_rst 1 1 2 NJ 2010 NJ
preplace netloc rst_microblaze_4_clk_wiz_1_100M_mb_reset 1 3 3 1470 3180 NJ 3300 2800
preplace netloc microblaze_4_dlmb_int 1 4 3 NJ 2870 NJ 2870 3130
preplace netloc microblaze_4_ilmb_axi 1 3 3 1690 3240 2190 3290 2710
preplace netloc microblaze_3_debug 1 1 3 NJ 430 NJ 430 NJ
preplace netloc microblaze_2_dlmb_axi 1 3 3 1670 0 NJ 0 2810
preplace netloc microblaze_1_dlmb_1 1 3 2 1690 560 NJ
preplace netloc microblaze_0_ilmb_axi 1 3 3 1690 2720 2280 2770 2710
preplace netloc microblaze_1_ilmb_int 1 4 1 2310
preplace netloc microblaze_5_axi_dp 1 4 1 2270
preplace netloc microblaze_4_dlmb_1 1 3 2 1700 2770 2170
preplace netloc reset_rtl_1 1 0 2 NJ 1840 -250
preplace netloc axi_uartlite_1_tx 1 6 1 3140
preplace netloc rst_microblaze_3_clk_wiz_1_100M_interconnect_aresetn 1 3 2 NJ 970 NJ
preplace netloc microblaze_1_axi_dp 1 4 1 2230
preplace netloc rst_microblaze_2_clk_wiz_1_100M_bus_struct_reset 1 3 1 NJ
preplace netloc microblaze_0_dlmb_int 1 4 3 NJ 2390 NJ 2390 3130
preplace netloc microblaze_0_Clk 1 2 6 1010 2530 1660 2700 2310 2810 2770 2810 NJ 2810 3430
preplace netloc microblaze_5_axi_periph_M03_AXI 1 5 3 NJ 3360 NJ 3360 3390
preplace netloc microblaze_5_dlmb_int 1 4 3 2240 3690 NJ 3400 NJ
preplace netloc microblaze_2_dlmb_1 1 3 2 1690 110 NJ
preplace netloc rst_microblaze_3_clk_wiz_1_100M_mb_reset 1 3 3 NJ 1850 NJ 1850 NJ
preplace netloc microblaze_5_ilmb_axi 1 3 3 1690 3670 NJ 3670 2710
preplace netloc microblaze_2_dlmb_int 1 4 1 2360
preplace netloc rst_microblaze_2_clk_wiz_1_100M_peripheral_aresetn 1 3 3 1500 90 2370 500 2820
preplace netloc microblaze_2_intr 1 5 1 2800
preplace netloc microblaze_5_debug 1 1 3 NJ 1990 NJ 1990 NJ
preplace netloc microblaze_2_ilmb_axi 1 3 3 1680 120 2380 370 2790
preplace netloc microblaze_2_debug 1 1 3 NJ 880 NJ 880 NJ
preplace netloc microblaze_4_Clk 1 2 6 1020 2960 1650 3170 2390 2900 2770 3200 NJ 3200 3410
preplace netloc clk_wiz_1_locked 1 2 1 N
preplace netloc microblaze_4_ilmb_1 1 3 2 1690 2760 2180
preplace netloc microblaze_2_ilmb_1 1 3 2 1700 130 NJ
preplace netloc microblaze_1_debug 1 1 3 -220 1380 NJ 1380 NJ
preplace netloc microblaze_0_debug 1 1 3 NJ 1890 NJ 1890 1610
preplace netloc microblaze_3_intr 1 5 1 2710
preplace netloc microblaze_0_axi_dp 1 4 1 2190
preplace netloc microblaze_4_ilmb_int 1 4 3 NJ 2880 NJ 2880 3110
preplace netloc microblaze_5_ilmb_1 1 3 2 1690 3250 2180
preplace netloc microblaze_0_dlmb_axi 1 3 3 1670 2750 2230 2760 2720
preplace netloc microblaze_2_ilmb_int 1 4 1 2320
preplace netloc microblaze_3_dlmb_int 1 4 1 2260
preplace netloc microblaze_1_ilmb_1 1 3 2 1700 570 NJ
preplace netloc rst_clk_wiz_1_100M_interconnect_aresetn 1 3 3 NJ 2710 2380 2790 2730
preplace netloc microblaze_4_dlmb_axi 1 3 3 1680 3230 2370 3280 2720
preplace netloc reset_rtl_0_1 1 0 3 NJ 2060 NJ 2060 1030
preplace netloc microblaze_1_intc_axi 1 5 1 2770
preplace netloc microblaze_2_Clk 1 2 4 1020 890 1470 50 2390 380 2790
preplace netloc microblaze_3_Clk 1 2 4 1040 450 1590 1050 2270 1180 2730
preplace netloc axi_uartlite_2_tx 1 6 1 3130
preplace netloc rst_microblaze_5_clk_wiz_1_100M_interconnect_aresetn 1 3 2 1470 3630 NJ
preplace netloc microblaze_5_dlmb_axi 1 3 3 1680 3660 NJ 3660 2720
preplace netloc microblaze_5_interrupt 1 3 4 NJ 3680 NJ 3680 NJ 3680 3100
preplace netloc axi_gpio_0_gpio_io_o 1 8 1 3690
preplace netloc rst_microblaze_3_clk_wiz_1_100M_bus_struct_reset 1 3 1 NJ
preplace netloc microblaze_0_intr 1 5 3 2810 2790 NJ 2790 3430
preplace netloc uart_rtl_rxd_1 1 6 5 3120 950 NJ 950 NJ 950 NJ 950 NJ
preplace netloc axi_gpio_2_gpio_io_o 1 8 1 3700
preplace netloc microblaze_1_interrupt 1 3 4 NJ -10 NJ -10 NJ -10 3110
preplace netloc rst_clk_wiz_1_100M_peripheral_aresetn 1 3 1 1650
levelinfo -pg 1 -500 -360 920 1300 1950 2560 2990 3280 3570 3790 3980 4090 -top -20 -bot 3830
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


