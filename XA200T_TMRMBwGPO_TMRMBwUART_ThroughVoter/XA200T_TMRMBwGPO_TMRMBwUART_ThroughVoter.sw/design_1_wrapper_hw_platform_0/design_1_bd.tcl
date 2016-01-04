
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
set scripts_vivado_version 2015.4
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
  connect_bd_intf_net -intf_net ilmb_bram_if_cntlr_BRAM_PORT [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]
  connect_bd_intf_net -intf_net microblaze_5_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_5_dlmb_axi [get_bd_intf_pins S_AXI_CTRL] [get_bd_intf_pins dlmb_bram_if_cntlr/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_5_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_5_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_5_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_5_ilmb_axi [get_bd_intf_pins S_AXI_CTRL1] [get_bd_intf_pins ilmb_bram_if_cntlr/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_5_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]

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
  connect_bd_intf_net -intf_net ilmb_bram_if_cntlr_BRAM_PORT [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]
  connect_bd_intf_net -intf_net microblaze_4_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_4_dlmb_axi [get_bd_intf_pins S_AXI_CTRL] [get_bd_intf_pins dlmb_bram_if_cntlr/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_4_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_4_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_4_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_4_ilmb_axi [get_bd_intf_pins S_AXI_CTRL1] [get_bd_intf_pins ilmb_bram_if_cntlr/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_4_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]

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
  connect_bd_intf_net -intf_net ilmb_bram_if_cntlr_BRAM_PORT [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]
  connect_bd_intf_net -intf_net microblaze_3_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_3_dlmb_axi [get_bd_intf_pins S_AXI_CTRL] [get_bd_intf_pins dlmb_bram_if_cntlr/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_3_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_3_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_3_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_3_ilmb_axi [get_bd_intf_pins S_AXI_CTRL1] [get_bd_intf_pins ilmb_bram_if_cntlr/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_3_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]

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
  connect_bd_intf_net -intf_net ilmb_bram_if_cntlr_BRAM_PORT [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]
  connect_bd_intf_net -intf_net microblaze_2_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_2_dlmb_axi [get_bd_intf_pins S_AXI_CTRL] [get_bd_intf_pins dlmb_bram_if_cntlr/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_2_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_2_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_2_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_2_ilmb_axi [get_bd_intf_pins S_AXI_CTRL1] [get_bd_intf_pins ilmb_bram_if_cntlr/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_2_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]

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
  connect_bd_intf_net -intf_net ilmb_bram_if_cntlr_BRAM_PORT [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]
  connect_bd_intf_net -intf_net microblaze_1_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_1_dlmb_axi [get_bd_intf_pins S_AXI_CTRL] [get_bd_intf_pins dlmb_bram_if_cntlr/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_1_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_1_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_1_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_1_ilmb_axi [get_bd_intf_pins S_AXI_CTRL1] [get_bd_intf_pins ilmb_bram_if_cntlr/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_1_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]

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
  connect_bd_intf_net -intf_net ilmb_bram_if_cntlr_BRAM_PORT [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]
  connect_bd_intf_net -intf_net microblaze_0_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_axi [get_bd_intf_pins S_AXI_CTRL] [get_bd_intf_pins dlmb_bram_if_cntlr/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_0_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_axi [get_bd_intf_pins S_AXI_CTRL1] [get_bd_intf_pins ilmb_bram_if_cntlr/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]

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
  set gpio_rtl1 [ create_bd_port -dir O -from 1 -to 1 gpio_rtl1 ]
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

  # Create instance: AXItmrmvoter_0, and set properties
  set AXItmrmvoter_0 [ create_bd_cell -type ip -vlnv KTH_SEUD:user:AXItmrmvoter:1.0 AXItmrmvoter_0 ]

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

  # Create instance: axi_gpio_3, and set properties
  set axi_gpio_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_3 ]
  set_property -dict [ list \
CONFIG.C_ALL_OUTPUTS {1} \
CONFIG.C_GPIO_WIDTH {1} \
 ] $axi_gpio_3

  # Create instance: axi_gpio_4, and set properties
  set axi_gpio_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_4 ]
  set_property -dict [ list \
CONFIG.C_ALL_OUTPUTS {1} \
CONFIG.C_GPIO_WIDTH {1} \
 ] $axi_gpio_4

  # Create instance: axi_gpio_5, and set properties
  set axi_gpio_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_5 ]
  set_property -dict [ list \
CONFIG.C_ALL_OUTPUTS {1} \
CONFIG.C_GPIO_WIDTH {1} \
 ] $axi_gpio_5

  # Create instance: axi_uartlite_0, and set properties
  set axi_uartlite_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0 ]

  # Create instance: axi_uartlite_1, and set properties
  set axi_uartlite_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_1 ]

  # Create instance: axi_uartlite_2, and set properties
  set axi_uartlite_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_2 ]

  # Create instance: clk_wiz_1, and set properties
  set clk_wiz_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.2 clk_wiz_1 ]
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER {884.502} \
CONFIG.CLKOUT1_PHASE_ERROR {871.302} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {10} \
CONFIG.JITTER_SEL {No_Jitter} \
CONFIG.MMCM_CLKFBOUT_MULT_F {60.125} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {60.125} \
CONFIG.MMCM_CLKOUT0_DUTY_CYCLE {0.5} \
CONFIG.MMCM_DIVCLK_DIVIDE {10} \
CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} \
CONFIG.USE_MIN_POWER {true} \
 ] $clk_wiz_1

  # Create instance: lmb_bram2, and set properties
  set lmb_bram2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 lmb_bram2 ]
  set_property -dict [ list \
CONFIG.Algorithm {Minimum_Area} \
CONFIG.Byte_Size {8} \
CONFIG.Enable_32bit_Address {true} \
CONFIG.Enable_B {Always_Enabled} \
CONFIG.Memory_Type {Single_Port_RAM} \
CONFIG.Port_B_Clock {0} \
CONFIG.Port_B_Enable_Rate {0} \
CONFIG.Port_B_Write_Rate {0} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {true} \
CONFIG.Use_RSTA_Pin {true} \
CONFIG.Use_RSTB_Pin {false} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $lmb_bram2

  # Create instance: lmb_bram3, and set properties
  set lmb_bram3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 lmb_bram3 ]
  set_property -dict [ list \
CONFIG.Algorithm {Minimum_Area} \
CONFIG.Byte_Size {8} \
CONFIG.Enable_32bit_Address {true} \
CONFIG.Enable_B {Always_Enabled} \
CONFIG.Memory_Type {Single_Port_RAM} \
CONFIG.Port_B_Clock {0} \
CONFIG.Port_B_Enable_Rate {0} \
CONFIG.Port_B_Write_Rate {0} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {true} \
CONFIG.Use_RSTA_Pin {true} \
CONFIG.Use_RSTB_Pin {false} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $lmb_bram3

  # Create instance: lmb_bram4, and set properties
  set lmb_bram4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 lmb_bram4 ]
  set_property -dict [ list \
CONFIG.Algorithm {Minimum_Area} \
CONFIG.Byte_Size {8} \
CONFIG.Enable_32bit_Address {true} \
CONFIG.Enable_B {Always_Enabled} \
CONFIG.Memory_Type {Single_Port_RAM} \
CONFIG.Port_B_Clock {0} \
CONFIG.Port_B_Enable_Rate {0} \
CONFIG.Port_B_Write_Rate {0} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {true} \
CONFIG.Use_RSTA_Pin {true} \
CONFIG.Use_RSTB_Pin {false} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $lmb_bram4

  # Create instance: mdm_1, and set properties
  set mdm_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 mdm_1 ]
  set_property -dict [ list \
CONFIG.C_MB_DBG_PORTS {6} \
 ] $mdm_1

  # Create instance: memconformitymodule_0, and set properties
  set memconformitymodule_0 [ create_bd_cell -type ip -vlnv kth.se:user:memconformitymodule:1.0 memconformitymodule_0 ]

  # Create instance: memconformitymodule_1, and set properties
  set memconformitymodule_1 [ create_bd_cell -type ip -vlnv kth.se:user:memconformitymodule:1.0 memconformitymodule_1 ]

  # Create instance: memconformitymodule_2, and set properties
  set memconformitymodule_2 [ create_bd_cell -type ip -vlnv kth.se:user:memconformitymodule:1.0 memconformitymodule_2 ]

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
CONFIG.NUM_MI {6} \
 ] $microblaze_1_axi_periph

  # Create instance: microblaze_1_clk_wiz_1, and set properties
  set microblaze_1_clk_wiz_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.2 microblaze_1_clk_wiz_1 ]
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER {884.502} \
CONFIG.CLKOUT1_PHASE_ERROR {871.302} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {10} \
CONFIG.JITTER_SEL {No_Jitter} \
CONFIG.MMCM_CLKFBOUT_MULT_F {60.125} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {60.125} \
CONFIG.MMCM_CLKOUT0_DUTY_CYCLE {0.5} \
CONFIG.MMCM_DIVCLK_DIVIDE {10} \
CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} \
CONFIG.USE_MIN_POWER {true} \
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
CONFIG.NUM_MI {6} \
 ] $microblaze_2_axi_periph

  # Create instance: microblaze_2_clk_wiz_1, and set properties
  set microblaze_2_clk_wiz_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.2 microblaze_2_clk_wiz_1 ]
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER {884.502} \
CONFIG.CLKOUT1_PHASE_ERROR {871.302} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {10} \
CONFIG.JITTER_SEL {No_Jitter} \
CONFIG.MMCM_CLKFBOUT_MULT_F {60.125} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {60.125} \
CONFIG.MMCM_CLKOUT0_DUTY_CYCLE {0.5} \
CONFIG.MMCM_DIVCLK_DIVIDE {10} \
CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} \
CONFIG.USE_MIN_POWER {true} \
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
CONFIG.NUM_MI {6} \
 ] $microblaze_3_axi_periph

  # Create instance: microblaze_3_clk_wiz_1, and set properties
  set microblaze_3_clk_wiz_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.2 microblaze_3_clk_wiz_1 ]
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER {884.502} \
CONFIG.CLKOUT1_PHASE_ERROR {871.302} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {10} \
CONFIG.JITTER_SEL {No_Jitter} \
CONFIG.MMCM_CLKFBOUT_MULT_F {60.125} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {60.125} \
CONFIG.MMCM_CLKOUT0_DUTY_CYCLE {0.5} \
CONFIG.MMCM_DIVCLK_DIVIDE {10} \
CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} \
CONFIG.USE_MIN_POWER {true} \
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
CONFIG.CLKOUT1_JITTER {884.502} \
CONFIG.CLKOUT1_PHASE_ERROR {871.302} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {10} \
CONFIG.JITTER_SEL {No_Jitter} \
CONFIG.MMCM_CLKFBOUT_MULT_F {60.125} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {60.125} \
CONFIG.MMCM_CLKOUT0_DUTY_CYCLE {0.5} \
CONFIG.MMCM_DIVCLK_DIVIDE {10} \
CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} \
CONFIG.USE_MIN_POWER {true} \
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
CONFIG.CLKOUT1_JITTER {884.502} \
CONFIG.CLKOUT1_PHASE_ERROR {871.302} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {10} \
CONFIG.JITTER_SEL {No_Jitter} \
CONFIG.MMCM_CLKFBOUT_MULT_F {60.125} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {60.125} \
CONFIG.MMCM_CLKOUT0_DUTY_CYCLE {0.5} \
CONFIG.MMCM_DIVCLK_DIVIDE {10} \
CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} \
CONFIG.USE_MIN_POWER {true} \
 ] $microblaze_5_clk_wiz_1

  # Create instance: microblaze_5_local_memory
  create_hier_cell_microblaze_5_local_memory [current_bd_instance .] microblaze_5_local_memory

  # Create instance: microblaze_5_xlconcat, and set properties
  set microblaze_5_xlconcat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 microblaze_5_xlconcat ]

  # Create instance: rst_clk_wiz_1_100M, and set properties
  set rst_clk_wiz_1_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_clk_wiz_1_100M ]
  set_property -dict [ list \
CONFIG.C_AUX_RESET_HIGH {1} \
CONFIG.C_AUX_RST_WIDTH {1} \
 ] $rst_clk_wiz_1_100M

  # Create instance: rst_microblaze_1_clk_wiz_1_100M, and set properties
  set rst_microblaze_1_clk_wiz_1_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_microblaze_1_clk_wiz_1_100M ]
  set_property -dict [ list \
CONFIG.C_AUX_RESET_HIGH {1} \
CONFIG.C_AUX_RST_WIDTH {1} \
 ] $rst_microblaze_1_clk_wiz_1_100M

  # Create instance: rst_microblaze_2_clk_wiz_1_100M, and set properties
  set rst_microblaze_2_clk_wiz_1_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_microblaze_2_clk_wiz_1_100M ]
  set_property -dict [ list \
CONFIG.C_AUX_RESET_HIGH {1} \
CONFIG.C_AUX_RST_WIDTH {1} \
 ] $rst_microblaze_2_clk_wiz_1_100M

  # Create instance: rst_microblaze_3_clk_wiz_1_100M, and set properties
  set rst_microblaze_3_clk_wiz_1_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_microblaze_3_clk_wiz_1_100M ]
  set_property -dict [ list \
CONFIG.C_AUX_RESET_HIGH {1} \
CONFIG.C_AUX_RST_WIDTH {1} \
 ] $rst_microblaze_3_clk_wiz_1_100M

  # Create instance: rst_microblaze_4_clk_wiz_1_100M, and set properties
  set rst_microblaze_4_clk_wiz_1_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_microblaze_4_clk_wiz_1_100M ]
  set_property -dict [ list \
CONFIG.C_AUX_RESET_HIGH {1} \
CONFIG.C_AUX_RST_WIDTH {1} \
 ] $rst_microblaze_4_clk_wiz_1_100M

  # Create instance: rst_microblaze_5_clk_wiz_1_100M, and set properties
  set rst_microblaze_5_clk_wiz_1_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_microblaze_5_clk_wiz_1_100M ]
  set_property -dict [ list \
CONFIG.C_AUX_RESET_HIGH {1} \
CONFIG.C_AUX_RST_WIDTH {1} \
 ] $rst_microblaze_5_clk_wiz_1_100M

  # Create instance: tmrit_0, and set properties
  set tmrit_0 [ create_bd_cell -type ip -vlnv kth.se:user:tmrit:1.0 tmrit_0 ]
  set_property -dict [ list \
CONFIG.ComputingCounterWidth {34} \
CONFIG.HealingCounterWidth {4} \
 ] $tmrit_0

  # Create instance: tmrit_1, and set properties
  set tmrit_1 [ create_bd_cell -type ip -vlnv kth.se:user:tmrit:1.0 tmrit_1 ]
  set_property -dict [ list \
CONFIG.ComputingCounterWidth {34} \
CONFIG.HealingCounterWidth {4} \
 ] $tmrit_1

  # Create instance: tmrmvoter_3, and set properties
  set tmrmvoter_3 [ create_bd_cell -type ip -vlnv kth.se:user:tmrmvoter:2.0 tmrmvoter_3 ]

  # Create instance: tmrmvoter_4, and set properties
  set tmrmvoter_4 [ create_bd_cell -type ip -vlnv kth.se:user:tmrmvoter:2.0 tmrmvoter_4 ]

  # Create instance: tmrmvoter_5, and set properties
  set tmrmvoter_5 [ create_bd_cell -type ip -vlnv kth.se:user:tmrmvoter:2.0 tmrmvoter_5 ]

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

  # Create instance: xlconcat_2, and set properties
  set xlconcat_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_2 ]
  set_property -dict [ list \
CONFIG.IN0_WIDTH {1} \
CONFIG.IN1_WIDTH {1} \
CONFIG.IN2_WIDTH {1} \
CONFIG.NUM_PORTS {3} \
 ] $xlconcat_2

  # Create instance: xlconcat_3, and set properties
  set xlconcat_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_3 ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {3} \
 ] $xlconcat_3

  # Create instance: xlconcat_4, and set properties
  set xlconcat_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_4 ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {3} \
 ] $xlconcat_4

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
  connect_bd_intf_net -intf_net microblaze_1_axi_periph_M04_AXI [get_bd_intf_pins AXItmrmvoter_0/S00_AXI] [get_bd_intf_pins microblaze_1_axi_periph/M04_AXI]
  connect_bd_intf_net -intf_net microblaze_1_axi_periph_M05_AXI [get_bd_intf_pins axi_gpio_3/S_AXI] [get_bd_intf_pins microblaze_1_axi_periph/M05_AXI]
  connect_bd_intf_net -intf_net microblaze_1_debug [get_bd_intf_pins mdm_1/MBDEBUG_1] [get_bd_intf_pins microblaze_1/DEBUG]
  connect_bd_intf_net -intf_net microblaze_1_dlmb_1 [get_bd_intf_pins microblaze_1/DLMB] [get_bd_intf_pins microblaze_1_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_1_dlmb_axi [get_bd_intf_pins microblaze_1_axi_periph/M01_AXI] [get_bd_intf_pins microblaze_1_local_memory/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_1_ilmb_1 [get_bd_intf_pins microblaze_1/ILMB] [get_bd_intf_pins microblaze_1_local_memory/ILMB]
  connect_bd_intf_net -intf_net microblaze_1_ilmb_axi [get_bd_intf_pins microblaze_1_axi_periph/M02_AXI] [get_bd_intf_pins microblaze_1_local_memory/S_AXI_CTRL1]
  connect_bd_intf_net -intf_net microblaze_1_intc_axi [get_bd_intf_pins microblaze_1_axi_intc/s_axi] [get_bd_intf_pins microblaze_1_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net microblaze_1_interrupt [get_bd_intf_pins microblaze_1/INTERRUPT] [get_bd_intf_pins microblaze_1_axi_intc/interrupt]
  connect_bd_intf_net -intf_net microblaze_2_axi_dp [get_bd_intf_pins microblaze_2/M_AXI_DP] [get_bd_intf_pins microblaze_2_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_2_axi_periph_M03_AXI [get_bd_intf_pins axi_uartlite_1/S_AXI] [get_bd_intf_pins microblaze_2_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net microblaze_2_axi_periph_M04_AXI [get_bd_intf_pins AXItmrmvoter_0/S01_AXI] [get_bd_intf_pins microblaze_2_axi_periph/M04_AXI]
  connect_bd_intf_net -intf_net microblaze_2_axi_periph_M05_AXI [get_bd_intf_pins axi_gpio_4/S_AXI] [get_bd_intf_pins microblaze_2_axi_periph/M05_AXI]
  connect_bd_intf_net -intf_net microblaze_2_debug [get_bd_intf_pins mdm_1/MBDEBUG_2] [get_bd_intf_pins microblaze_2/DEBUG]
  connect_bd_intf_net -intf_net microblaze_2_dlmb_1 [get_bd_intf_pins microblaze_2/DLMB] [get_bd_intf_pins microblaze_2_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_2_dlmb_axi [get_bd_intf_pins microblaze_2_axi_periph/M01_AXI] [get_bd_intf_pins microblaze_2_local_memory/S_AXI_CTRL]
  connect_bd_intf_net -intf_net microblaze_2_ilmb_1 [get_bd_intf_pins microblaze_2/ILMB] [get_bd_intf_pins microblaze_2_local_memory/ILMB]
  connect_bd_intf_net -intf_net microblaze_2_ilmb_axi [get_bd_intf_pins microblaze_2_axi_periph/M02_AXI] [get_bd_intf_pins microblaze_2_local_memory/S_AXI_CTRL1]
  connect_bd_intf_net -intf_net microblaze_2_intc_axi [get_bd_intf_pins microblaze_2_axi_intc/s_axi] [get_bd_intf_pins microblaze_2_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net microblaze_2_interrupt [get_bd_intf_pins microblaze_2/INTERRUPT] [get_bd_intf_pins microblaze_2_axi_intc/interrupt]
  connect_bd_intf_net -intf_net microblaze_3_axi_dp [get_bd_intf_pins microblaze_3/M_AXI_DP] [get_bd_intf_pins microblaze_3_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_3_axi_periph_M03_AXI [get_bd_intf_pins axi_uartlite_2/S_AXI] [get_bd_intf_pins microblaze_3_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net microblaze_3_axi_periph_M04_AXI [get_bd_intf_pins AXItmrmvoter_0/S02_AXI] [get_bd_intf_pins microblaze_3_axi_periph/M04_AXI]
  connect_bd_intf_net -intf_net microblaze_3_axi_periph_M05_AXI [get_bd_intf_pins axi_gpio_5/S_AXI] [get_bd_intf_pins microblaze_3_axi_periph/M05_AXI]
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
  connect_bd_net -net axi_gpio_0_gpio_io_o1 [get_bd_pins axi_gpio_3/gpio_io_o] [get_bd_pins xlconcat_2/In0]
  connect_bd_net -net axi_gpio_1_gpio_io_o [get_bd_pins axi_gpio_1/gpio_io_o] [get_bd_pins xlconcat_1/In1]
  connect_bd_net -net axi_gpio_1_gpio_io_o1 [get_bd_pins axi_gpio_4/gpio_io_o] [get_bd_pins xlconcat_2/In1]
  connect_bd_net -net axi_gpio_2_gpio_io_o [get_bd_pins axi_gpio_2/gpio_io_o] [get_bd_pins xlconcat_1/In2]
  connect_bd_net -net axi_gpio_2_gpio_io_o1 [get_bd_pins axi_gpio_5/gpio_io_o] [get_bd_pins xlconcat_2/In2]
  connect_bd_net -net axi_uartlite_0_tx [get_bd_pins axi_uartlite_0/tx] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net axi_uartlite_1_tx [get_bd_pins axi_uartlite_1/tx] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net axi_uartlite_2_tx [get_bd_pins axi_uartlite_2/tx] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net clk_wiz_1_locked [get_bd_pins clk_wiz_1/locked] [get_bd_pins rst_clk_wiz_1_100M/dcm_locked]
  connect_bd_net -net clock_rtl_1 [get_bd_ports clock_rtl] [get_bd_pins clk_wiz_1/clk_in1] [get_bd_pins microblaze_1_clk_wiz_1/clk_in1] [get_bd_pins microblaze_2_clk_wiz_1/clk_in1] [get_bd_pins microblaze_3_clk_wiz_1/clk_in1] [get_bd_pins microblaze_4_clk_wiz_1/clk_in1] [get_bd_pins microblaze_5_clk_wiz_1/clk_in1]
  connect_bd_net -net lmb_bram2_douta [get_bd_pins lmb_bram2/douta] [get_bd_pins memconformitymodule_0/datai1] [get_bd_pins memconformitymodule_1/datai1] [get_bd_pins memconformitymodule_2/datai1]
  connect_bd_net -net lmb_bram3_douta [get_bd_pins lmb_bram3/douta] [get_bd_pins memconformitymodule_0/datai3] [get_bd_pins memconformitymodule_1/datai3] [get_bd_pins memconformitymodule_2/datai3]
  connect_bd_net -net lmb_bram4_douta [get_bd_pins lmb_bram4/douta] [get_bd_pins memconformitymodule_0/datai2] [get_bd_pins memconformitymodule_1/datai2] [get_bd_pins memconformitymodule_2/datai2]
  connect_bd_net -net mdm_1_debug_sys_rst [get_bd_pins mdm_1/Debug_SYS_Rst] [get_bd_pins rst_clk_wiz_1_100M/mb_debug_sys_rst] [get_bd_pins rst_microblaze_1_clk_wiz_1_100M/mb_debug_sys_rst] [get_bd_pins rst_microblaze_2_clk_wiz_1_100M/mb_debug_sys_rst] [get_bd_pins rst_microblaze_3_clk_wiz_1_100M/mb_debug_sys_rst] [get_bd_pins rst_microblaze_4_clk_wiz_1_100M/mb_debug_sys_rst] [get_bd_pins rst_microblaze_5_clk_wiz_1_100M/mb_debug_sys_rst]
  connect_bd_net -net memconformitymodule_0_add [get_bd_pins lmb_bram2/addra] [get_bd_pins memconformitymodule_0/add]
  connect_bd_net -net memconformitymodule_0_datao [get_bd_pins lmb_bram2/dina] [get_bd_pins memconformitymodule_0/datao]
  connect_bd_net -net memconformitymodule_0_rw [get_bd_pins lmb_bram2/wea] [get_bd_pins memconformitymodule_0/rw]
  connect_bd_net -net memconformitymodule_1_add [get_bd_pins lmb_bram4/addra] [get_bd_pins memconformitymodule_1/add]
  connect_bd_net -net memconformitymodule_1_datao [get_bd_pins lmb_bram4/dina] [get_bd_pins memconformitymodule_1/datao]
  connect_bd_net -net memconformitymodule_1_rw [get_bd_pins lmb_bram4/wea] [get_bd_pins memconformitymodule_1/rw]
  connect_bd_net -net memconformitymodule_2_add [get_bd_pins lmb_bram3/addra] [get_bd_pins memconformitymodule_2/add]
  connect_bd_net -net memconformitymodule_2_datao [get_bd_pins lmb_bram3/dina] [get_bd_pins memconformitymodule_2/datao]
  connect_bd_net -net memconformitymodule_2_rw [get_bd_pins lmb_bram3/wea] [get_bd_pins memconformitymodule_2/rw]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins clk_wiz_1/clk_out1] [get_bd_pins microblaze_0/Clk] [get_bd_pins microblaze_0_axi_intc/processor_clk] [get_bd_pins microblaze_0_axi_intc/s_axi_aclk] [get_bd_pins microblaze_0_axi_periph/ACLK] [get_bd_pins microblaze_0_axi_periph/M00_ACLK] [get_bd_pins microblaze_0_axi_periph/M01_ACLK] [get_bd_pins microblaze_0_axi_periph/M02_ACLK] [get_bd_pins microblaze_0_axi_periph/M03_ACLK] [get_bd_pins microblaze_0_axi_periph/S00_ACLK] [get_bd_pins microblaze_0_local_memory/LMB_Clk] [get_bd_pins rst_clk_wiz_1_100M/slowest_sync_clk] [get_bd_pins xlconcat_4/In0]
  connect_bd_net -net microblaze_0_dlmb_int [get_bd_pins microblaze_0_local_memory/DLMB_Interrupt] [get_bd_pins microblaze_0_xlconcat/In0]
  connect_bd_net -net microblaze_0_ilmb_int [get_bd_pins microblaze_0_local_memory/ILMB_Interrupt] [get_bd_pins microblaze_0_xlconcat/In1]
  connect_bd_net -net microblaze_0_intr [get_bd_pins microblaze_0_axi_intc/intr] [get_bd_pins microblaze_0_xlconcat/dout]
  connect_bd_net -net microblaze_1_Clk [get_bd_pins AXItmrmvoter_0/s00_axi_aclk] [get_bd_pins axi_gpio_3/s_axi_aclk] [get_bd_pins axi_uartlite_0/s_axi_aclk] [get_bd_pins lmb_bram3/clka] [get_bd_pins memconformitymodule_2/clk] [get_bd_pins microblaze_1/Clk] [get_bd_pins microblaze_1_axi_intc/processor_clk] [get_bd_pins microblaze_1_axi_intc/s_axi_aclk] [get_bd_pins microblaze_1_axi_periph/ACLK] [get_bd_pins microblaze_1_axi_periph/M00_ACLK] [get_bd_pins microblaze_1_axi_periph/M01_ACLK] [get_bd_pins microblaze_1_axi_periph/M02_ACLK] [get_bd_pins microblaze_1_axi_periph/M03_ACLK] [get_bd_pins microblaze_1_axi_periph/M04_ACLK] [get_bd_pins microblaze_1_axi_periph/M05_ACLK] [get_bd_pins microblaze_1_axi_periph/S00_ACLK] [get_bd_pins microblaze_1_clk_wiz_1/clk_out1] [get_bd_pins microblaze_1_local_memory/LMB_Clk] [get_bd_pins rst_microblaze_1_clk_wiz_1_100M/slowest_sync_clk] [get_bd_pins xlconcat_3/In2]
  connect_bd_net -net microblaze_1_clk_wiz_1_locked [get_bd_pins microblaze_1_clk_wiz_1/locked] [get_bd_pins rst_microblaze_1_clk_wiz_1_100M/dcm_locked]
  connect_bd_net -net microblaze_1_dlmb_int [get_bd_pins microblaze_1_local_memory/DLMB_Interrupt] [get_bd_pins microblaze_1_xlconcat/In0]
  connect_bd_net -net microblaze_1_ilmb_int [get_bd_pins microblaze_1_local_memory/ILMB_Interrupt] [get_bd_pins microblaze_1_xlconcat/In1]
  connect_bd_net -net microblaze_1_intr [get_bd_pins microblaze_1_axi_intc/intr] [get_bd_pins microblaze_1_xlconcat/dout]
  connect_bd_net -net microblaze_2_Clk [get_bd_pins AXItmrmvoter_0/s01_axi_aclk] [get_bd_pins axi_gpio_4/s_axi_aclk] [get_bd_pins axi_uartlite_1/s_axi_aclk] [get_bd_pins lmb_bram4/clka] [get_bd_pins memconformitymodule_1/clk] [get_bd_pins microblaze_2/Clk] [get_bd_pins microblaze_2_axi_intc/processor_clk] [get_bd_pins microblaze_2_axi_intc/s_axi_aclk] [get_bd_pins microblaze_2_axi_periph/ACLK] [get_bd_pins microblaze_2_axi_periph/M00_ACLK] [get_bd_pins microblaze_2_axi_periph/M01_ACLK] [get_bd_pins microblaze_2_axi_periph/M02_ACLK] [get_bd_pins microblaze_2_axi_periph/M03_ACLK] [get_bd_pins microblaze_2_axi_periph/M04_ACLK] [get_bd_pins microblaze_2_axi_periph/M05_ACLK] [get_bd_pins microblaze_2_axi_periph/S00_ACLK] [get_bd_pins microblaze_2_clk_wiz_1/clk_out1] [get_bd_pins microblaze_2_local_memory/LMB_Clk] [get_bd_pins rst_microblaze_2_clk_wiz_1_100M/slowest_sync_clk] [get_bd_pins xlconcat_3/In1]
  connect_bd_net -net microblaze_2_clk_wiz_1_locked [get_bd_pins microblaze_2_clk_wiz_1/locked] [get_bd_pins rst_microblaze_2_clk_wiz_1_100M/dcm_locked]
  connect_bd_net -net microblaze_2_dlmb_int [get_bd_pins microblaze_2_local_memory/DLMB_Interrupt] [get_bd_pins microblaze_2_xlconcat/In0]
  connect_bd_net -net microblaze_2_ilmb_int [get_bd_pins microblaze_2_local_memory/ILMB_Interrupt] [get_bd_pins microblaze_2_xlconcat/In1]
  connect_bd_net -net microblaze_2_intr [get_bd_pins microblaze_2_axi_intc/intr] [get_bd_pins microblaze_2_xlconcat/dout]
  connect_bd_net -net microblaze_3_Clk [get_bd_pins AXItmrmvoter_0/s02_axi_aclk] [get_bd_pins axi_gpio_5/s_axi_aclk] [get_bd_pins axi_uartlite_2/s_axi_aclk] [get_bd_pins lmb_bram2/clka] [get_bd_pins memconformitymodule_0/clk] [get_bd_pins microblaze_3/Clk] [get_bd_pins microblaze_3_axi_intc/processor_clk] [get_bd_pins microblaze_3_axi_intc/s_axi_aclk] [get_bd_pins microblaze_3_axi_periph/ACLK] [get_bd_pins microblaze_3_axi_periph/M00_ACLK] [get_bd_pins microblaze_3_axi_periph/M01_ACLK] [get_bd_pins microblaze_3_axi_periph/M02_ACLK] [get_bd_pins microblaze_3_axi_periph/M03_ACLK] [get_bd_pins microblaze_3_axi_periph/M04_ACLK] [get_bd_pins microblaze_3_axi_periph/M05_ACLK] [get_bd_pins microblaze_3_axi_periph/S00_ACLK] [get_bd_pins microblaze_3_clk_wiz_1/clk_out1] [get_bd_pins microblaze_3_local_memory/LMB_Clk] [get_bd_pins rst_microblaze_3_clk_wiz_1_100M/slowest_sync_clk] [get_bd_pins xlconcat_3/In0]
  connect_bd_net -net microblaze_3_clk_wiz_1_locked [get_bd_pins microblaze_3_clk_wiz_1/locked] [get_bd_pins rst_microblaze_3_clk_wiz_1_100M/dcm_locked]
  connect_bd_net -net microblaze_3_dlmb_int [get_bd_pins microblaze_3_local_memory/DLMB_Interrupt] [get_bd_pins microblaze_3_xlconcat/In0]
  connect_bd_net -net microblaze_3_ilmb_int [get_bd_pins microblaze_3_local_memory/ILMB_Interrupt] [get_bd_pins microblaze_3_xlconcat/In1]
  connect_bd_net -net microblaze_3_intr [get_bd_pins microblaze_3_axi_intc/intr] [get_bd_pins microblaze_3_xlconcat/dout]
  connect_bd_net -net microblaze_4_Clk [get_bd_pins axi_gpio_1/s_axi_aclk] [get_bd_pins microblaze_4/Clk] [get_bd_pins microblaze_4_axi_intc/processor_clk] [get_bd_pins microblaze_4_axi_intc/s_axi_aclk] [get_bd_pins microblaze_4_axi_periph/ACLK] [get_bd_pins microblaze_4_axi_periph/M00_ACLK] [get_bd_pins microblaze_4_axi_periph/M01_ACLK] [get_bd_pins microblaze_4_axi_periph/M02_ACLK] [get_bd_pins microblaze_4_axi_periph/M03_ACLK] [get_bd_pins microblaze_4_axi_periph/S00_ACLK] [get_bd_pins microblaze_4_clk_wiz_1/clk_out1] [get_bd_pins microblaze_4_local_memory/LMB_Clk] [get_bd_pins rst_microblaze_4_clk_wiz_1_100M/slowest_sync_clk] [get_bd_pins xlconcat_4/In1]
  connect_bd_net -net microblaze_4_clk_wiz_1_locked [get_bd_pins microblaze_4_clk_wiz_1/locked] [get_bd_pins rst_microblaze_4_clk_wiz_1_100M/dcm_locked]
  connect_bd_net -net microblaze_4_dlmb_int [get_bd_pins microblaze_4_local_memory/DLMB_Interrupt] [get_bd_pins microblaze_4_xlconcat/In0]
  connect_bd_net -net microblaze_4_ilmb_int [get_bd_pins microblaze_4_local_memory/ILMB_Interrupt] [get_bd_pins microblaze_4_xlconcat/In1]
  connect_bd_net -net microblaze_4_intr [get_bd_pins microblaze_4_axi_intc/intr] [get_bd_pins microblaze_4_xlconcat/dout]
  connect_bd_net -net microblaze_5_Clk [get_bd_pins axi_gpio_2/s_axi_aclk] [get_bd_pins microblaze_5/Clk] [get_bd_pins microblaze_5_axi_intc/processor_clk] [get_bd_pins microblaze_5_axi_intc/s_axi_aclk] [get_bd_pins microblaze_5_axi_periph/ACLK] [get_bd_pins microblaze_5_axi_periph/M00_ACLK] [get_bd_pins microblaze_5_axi_periph/M01_ACLK] [get_bd_pins microblaze_5_axi_periph/M02_ACLK] [get_bd_pins microblaze_5_axi_periph/M03_ACLK] [get_bd_pins microblaze_5_axi_periph/S00_ACLK] [get_bd_pins microblaze_5_clk_wiz_1/clk_out1] [get_bd_pins microblaze_5_local_memory/LMB_Clk] [get_bd_pins rst_microblaze_5_clk_wiz_1_100M/slowest_sync_clk] [get_bd_pins xlconcat_4/In2]
  connect_bd_net -net microblaze_5_clk_wiz_1_locked [get_bd_pins microblaze_5_clk_wiz_1/locked] [get_bd_pins rst_microblaze_5_clk_wiz_1_100M/dcm_locked]
  connect_bd_net -net microblaze_5_dlmb_int [get_bd_pins microblaze_5_local_memory/DLMB_Interrupt] [get_bd_pins microblaze_5_xlconcat/In0]
  connect_bd_net -net microblaze_5_ilmb_int [get_bd_pins microblaze_5_local_memory/ILMB_Interrupt] [get_bd_pins microblaze_5_xlconcat/In1]
  connect_bd_net -net microblaze_5_intr [get_bd_pins microblaze_5_axi_intc/intr] [get_bd_pins microblaze_5_xlconcat/dout]
  connect_bd_net -net reset_rtl_0_1 [get_bd_ports reset_rtl_0] [get_bd_pins rst_clk_wiz_1_100M/ext_reset_in] [get_bd_pins rst_microblaze_1_clk_wiz_1_100M/ext_reset_in] [get_bd_pins rst_microblaze_2_clk_wiz_1_100M/ext_reset_in] [get_bd_pins rst_microblaze_3_clk_wiz_1_100M/ext_reset_in] [get_bd_pins rst_microblaze_4_clk_wiz_1_100M/ext_reset_in] [get_bd_pins rst_microblaze_5_clk_wiz_1_100M/ext_reset_in]
  connect_bd_net -net reset_rtl_1 [get_bd_ports reset_rtl] [get_bd_pins clk_wiz_1/reset] [get_bd_pins microblaze_1_clk_wiz_1/reset] [get_bd_pins microblaze_2_clk_wiz_1/reset] [get_bd_pins microblaze_3_clk_wiz_1/reset] [get_bd_pins microblaze_4_clk_wiz_1/reset] [get_bd_pins microblaze_5_clk_wiz_1/reset] [get_bd_pins tmrit_0/rst]
  connect_bd_net -net rst_clk_wiz_1_100M_bus_struct_reset [get_bd_pins microblaze_0_local_memory/SYS_Rst] [get_bd_pins rst_clk_wiz_1_100M/bus_struct_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_interconnect_aresetn [get_bd_pins microblaze_0_axi_intc/s_axi_aresetn] [get_bd_pins microblaze_0_axi_periph/ARESETN] [get_bd_pins microblaze_0_axi_periph/M00_ARESETN] [get_bd_pins microblaze_0_axi_periph/M01_ARESETN] [get_bd_pins microblaze_0_axi_periph/M02_ARESETN] [get_bd_pins microblaze_0_axi_periph/M03_ARESETN] [get_bd_pins microblaze_0_axi_periph/S00_ARESETN] [get_bd_pins rst_clk_wiz_1_100M/interconnect_aresetn]
  connect_bd_net -net rst_clk_wiz_1_100M_mb_reset [get_bd_pins microblaze_0/Reset] [get_bd_pins microblaze_0_axi_intc/processor_rst] [get_bd_pins rst_clk_wiz_1_100M/mb_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins axi_gpio_0/s_axi_aresetn] [get_bd_pins microblaze_0_local_memory/S_AXI_CTRL_ARESETN] [get_bd_pins rst_clk_wiz_1_100M/peripheral_aresetn]
  connect_bd_net -net rst_microblaze_1_clk_wiz_1_100M_bus_struct_reset [get_bd_pins microblaze_1_local_memory/SYS_Rst] [get_bd_pins rst_microblaze_1_clk_wiz_1_100M/bus_struct_reset]
  connect_bd_net -net rst_microblaze_1_clk_wiz_1_100M_interconnect_aresetn [get_bd_pins microblaze_1_axi_periph/ARESETN] [get_bd_pins rst_microblaze_1_clk_wiz_1_100M/interconnect_aresetn]
  connect_bd_net -net rst_microblaze_1_clk_wiz_1_100M_mb_reset [get_bd_pins lmb_bram3/rsta] [get_bd_pins memconformitymodule_2/rst] [get_bd_pins microblaze_1/Reset] [get_bd_pins microblaze_1_axi_intc/processor_rst] [get_bd_pins rst_microblaze_1_clk_wiz_1_100M/mb_reset]
  connect_bd_net -net rst_microblaze_1_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins AXItmrmvoter_0/s00_axi_aresetn] [get_bd_pins axi_gpio_3/s_axi_aresetn] [get_bd_pins axi_uartlite_0/s_axi_aresetn] [get_bd_pins microblaze_1_axi_intc/s_axi_aresetn] [get_bd_pins microblaze_1_axi_periph/M00_ARESETN] [get_bd_pins microblaze_1_axi_periph/M01_ARESETN] [get_bd_pins microblaze_1_axi_periph/M02_ARESETN] [get_bd_pins microblaze_1_axi_periph/M03_ARESETN] [get_bd_pins microblaze_1_axi_periph/M04_ARESETN] [get_bd_pins microblaze_1_axi_periph/M05_ARESETN] [get_bd_pins microblaze_1_axi_periph/S00_ARESETN] [get_bd_pins microblaze_1_local_memory/S_AXI_CTRL_ARESETN] [get_bd_pins rst_microblaze_1_clk_wiz_1_100M/peripheral_aresetn]
  connect_bd_net -net rst_microblaze_2_clk_wiz_1_100M_bus_struct_reset [get_bd_pins microblaze_2_local_memory/SYS_Rst] [get_bd_pins rst_microblaze_2_clk_wiz_1_100M/bus_struct_reset]
  connect_bd_net -net rst_microblaze_2_clk_wiz_1_100M_interconnect_aresetn [get_bd_pins microblaze_2_axi_periph/ARESETN] [get_bd_pins rst_microblaze_2_clk_wiz_1_100M/interconnect_aresetn]
  connect_bd_net -net rst_microblaze_2_clk_wiz_1_100M_mb_reset [get_bd_pins lmb_bram4/rsta] [get_bd_pins memconformitymodule_1/rst] [get_bd_pins microblaze_2/Reset] [get_bd_pins microblaze_2_axi_intc/processor_rst] [get_bd_pins rst_microblaze_2_clk_wiz_1_100M/mb_reset]
  connect_bd_net -net rst_microblaze_2_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins AXItmrmvoter_0/s01_axi_aresetn] [get_bd_pins axi_gpio_4/s_axi_aresetn] [get_bd_pins axi_uartlite_1/s_axi_aresetn] [get_bd_pins microblaze_2_axi_intc/s_axi_aresetn] [get_bd_pins microblaze_2_axi_periph/M00_ARESETN] [get_bd_pins microblaze_2_axi_periph/M01_ARESETN] [get_bd_pins microblaze_2_axi_periph/M02_ARESETN] [get_bd_pins microblaze_2_axi_periph/M03_ARESETN] [get_bd_pins microblaze_2_axi_periph/M04_ARESETN] [get_bd_pins microblaze_2_axi_periph/M05_ARESETN] [get_bd_pins microblaze_2_axi_periph/S00_ARESETN] [get_bd_pins microblaze_2_local_memory/S_AXI_CTRL_ARESETN] [get_bd_pins rst_microblaze_2_clk_wiz_1_100M/peripheral_aresetn]
  connect_bd_net -net rst_microblaze_3_clk_wiz_1_100M_bus_struct_reset [get_bd_pins microblaze_3_local_memory/SYS_Rst] [get_bd_pins rst_microblaze_3_clk_wiz_1_100M/bus_struct_reset]
  connect_bd_net -net rst_microblaze_3_clk_wiz_1_100M_interconnect_aresetn [get_bd_pins microblaze_3_axi_periph/ARESETN] [get_bd_pins rst_microblaze_3_clk_wiz_1_100M/interconnect_aresetn]
  connect_bd_net -net rst_microblaze_3_clk_wiz_1_100M_mb_reset [get_bd_pins lmb_bram2/rsta] [get_bd_pins memconformitymodule_0/rst] [get_bd_pins microblaze_3/Reset] [get_bd_pins microblaze_3_axi_intc/processor_rst] [get_bd_pins rst_microblaze_3_clk_wiz_1_100M/mb_reset]
  connect_bd_net -net rst_microblaze_3_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins AXItmrmvoter_0/s02_axi_aresetn] [get_bd_pins axi_gpio_5/s_axi_aresetn] [get_bd_pins axi_uartlite_2/s_axi_aresetn] [get_bd_pins microblaze_3_axi_intc/s_axi_aresetn] [get_bd_pins microblaze_3_axi_periph/M00_ARESETN] [get_bd_pins microblaze_3_axi_periph/M01_ARESETN] [get_bd_pins microblaze_3_axi_periph/M02_ARESETN] [get_bd_pins microblaze_3_axi_periph/M03_ARESETN] [get_bd_pins microblaze_3_axi_periph/M04_ARESETN] [get_bd_pins microblaze_3_axi_periph/M05_ARESETN] [get_bd_pins microblaze_3_axi_periph/S00_ARESETN] [get_bd_pins microblaze_3_local_memory/S_AXI_CTRL_ARESETN] [get_bd_pins rst_microblaze_3_clk_wiz_1_100M/peripheral_aresetn]
  connect_bd_net -net rst_microblaze_4_clk_wiz_1_100M_bus_struct_reset [get_bd_pins microblaze_4_local_memory/SYS_Rst] [get_bd_pins rst_microblaze_4_clk_wiz_1_100M/bus_struct_reset]
  connect_bd_net -net rst_microblaze_4_clk_wiz_1_100M_interconnect_aresetn [get_bd_pins microblaze_4_axi_periph/ARESETN] [get_bd_pins rst_microblaze_4_clk_wiz_1_100M/interconnect_aresetn]
  connect_bd_net -net rst_microblaze_4_clk_wiz_1_100M_mb_reset [get_bd_pins microblaze_4/Reset] [get_bd_pins microblaze_4_axi_intc/processor_rst] [get_bd_pins rst_microblaze_4_clk_wiz_1_100M/mb_reset]
  connect_bd_net -net rst_microblaze_4_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins axi_gpio_1/s_axi_aresetn] [get_bd_pins microblaze_4_axi_intc/s_axi_aresetn] [get_bd_pins microblaze_4_axi_periph/M00_ARESETN] [get_bd_pins microblaze_4_axi_periph/M01_ARESETN] [get_bd_pins microblaze_4_axi_periph/M02_ARESETN] [get_bd_pins microblaze_4_axi_periph/M03_ARESETN] [get_bd_pins microblaze_4_axi_periph/S00_ARESETN] [get_bd_pins microblaze_4_local_memory/S_AXI_CTRL_ARESETN] [get_bd_pins rst_microblaze_4_clk_wiz_1_100M/peripheral_aresetn]
  connect_bd_net -net rst_microblaze_5_clk_wiz_1_100M_bus_struct_reset [get_bd_pins microblaze_5_local_memory/SYS_Rst] [get_bd_pins rst_microblaze_5_clk_wiz_1_100M/bus_struct_reset]
  connect_bd_net -net rst_microblaze_5_clk_wiz_1_100M_interconnect_aresetn [get_bd_pins microblaze_5_axi_periph/ARESETN] [get_bd_pins rst_microblaze_5_clk_wiz_1_100M/interconnect_aresetn]
  connect_bd_net -net rst_microblaze_5_clk_wiz_1_100M_mb_reset [get_bd_pins microblaze_5/Reset] [get_bd_pins microblaze_5_axi_intc/processor_rst] [get_bd_pins rst_microblaze_5_clk_wiz_1_100M/mb_reset]
  connect_bd_net -net rst_microblaze_5_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins axi_gpio_2/s_axi_aresetn] [get_bd_pins microblaze_5_axi_intc/s_axi_aresetn] [get_bd_pins microblaze_5_axi_periph/M00_ARESETN] [get_bd_pins microblaze_5_axi_periph/M01_ARESETN] [get_bd_pins microblaze_5_axi_periph/M02_ARESETN] [get_bd_pins microblaze_5_axi_periph/M03_ARESETN] [get_bd_pins microblaze_5_axi_periph/S00_ARESETN] [get_bd_pins microblaze_5_local_memory/S_AXI_CTRL_ARESETN] [get_bd_pins rst_microblaze_5_clk_wiz_1_100M/peripheral_aresetn]
  connect_bd_net -net tmrit_0_heal_s [get_bd_pins memconformitymodule_0/en] [get_bd_pins memconformitymodule_1/en] [get_bd_pins memconformitymodule_2/en] [get_bd_pins rst_microblaze_1_clk_wiz_1_100M/aux_reset_in] [get_bd_pins rst_microblaze_2_clk_wiz_1_100M/aux_reset_in] [get_bd_pins rst_microblaze_3_clk_wiz_1_100M/aux_reset_in] [get_bd_pins tmrit_0/heal_s] [get_bd_pins tmrit_1/rst]
  connect_bd_net -net tmrit_1_heal_s [get_bd_pins rst_clk_wiz_1_100M/aux_reset_in] [get_bd_pins rst_microblaze_4_clk_wiz_1_100M/aux_reset_in] [get_bd_pins rst_microblaze_5_clk_wiz_1_100M/aux_reset_in] [get_bd_pins tmrit_1/heal_s]
  connect_bd_net -net tmrmvoter_3_Outs [get_bd_ports uart_rtl_txd] [get_bd_pins tmrmvoter_3/Outs]
  connect_bd_net -net tmrmvoter_4_Outs [get_bd_ports gpio_rtl1] [get_bd_pins tmrmvoter_4/Outs]
  connect_bd_net -net tmrmvoter_5_Outs [get_bd_ports gpio_rtl] [get_bd_pins tmrmvoter_5/Outs]
  connect_bd_net -net uart_rtl_rxd_1 [get_bd_ports uart_rtl_rxd] [get_bd_pins axi_uartlite_0/rx] [get_bd_pins axi_uartlite_1/rx] [get_bd_pins axi_uartlite_2/rx]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins tmrmvoter_3/Ins] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconcat_1_dout [get_bd_pins tmrmvoter_5/Ins] [get_bd_pins xlconcat_1/dout]
  connect_bd_net -net xlconcat_2_dout [get_bd_pins tmrmvoter_4/Ins] [get_bd_pins xlconcat_2/dout]
  connect_bd_net -net xlconcat_3_dout [get_bd_pins tmrit_0/clk] [get_bd_pins xlconcat_3/dout]
  connect_bd_net -net xlconcat_3_dout1 [get_bd_pins tmrit_1/clk] [get_bd_pins xlconcat_4/dout]

  # Create address segments
  create_bd_addr_seg -range 0x10000 -offset 0x40000000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg] SEG_axi_gpio_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x0 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x10000 -offset 0x76000000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_local_memory/dlmb_bram_if_cntlr/S_AXI_CTRL/Reg] SEG_dlmb_bram_if_cntlr_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x0 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs microblaze_0_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x10000 -offset 0x76010000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_local_memory/ilmb_bram_if_cntlr/S_AXI_CTRL/Reg] SEG_ilmb_bram_if_cntlr_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x41200000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_axi_intc/s_axi/Reg] SEG_microblaze_0_axi_intc_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x44A00000 [get_bd_addr_spaces microblaze_1/Data] [get_bd_addr_segs AXItmrmvoter_0/S00_AXI/S00_AXI_reg] SEG_AXItmrmvoter_0_S00_AXI_reg
  create_bd_addr_seg -range 0x10000 -offset 0x40000000 [get_bd_addr_spaces microblaze_1/Data] [get_bd_addr_segs axi_gpio_3/S_AXI/Reg] SEG_axi_gpio_3_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40600000 [get_bd_addr_spaces microblaze_1/Data] [get_bd_addr_segs axi_uartlite_0/S_AXI/Reg] SEG_axi_uartlite_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x0 [get_bd_addr_spaces microblaze_1/Data] [get_bd_addr_segs microblaze_1_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x10000 -offset 0x76000000 [get_bd_addr_spaces microblaze_1/Data] [get_bd_addr_segs microblaze_1_local_memory/dlmb_bram_if_cntlr/S_AXI_CTRL/Reg] SEG_dlmb_bram_if_cntlr_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x0 [get_bd_addr_spaces microblaze_1/Instruction] [get_bd_addr_segs microblaze_1_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x10000 -offset 0x76010000 [get_bd_addr_spaces microblaze_1/Data] [get_bd_addr_segs microblaze_1_local_memory/ilmb_bram_if_cntlr/S_AXI_CTRL/Reg] SEG_ilmb_bram_if_cntlr_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x41200000 [get_bd_addr_spaces microblaze_1/Data] [get_bd_addr_segs microblaze_1_axi_intc/s_axi/Reg] SEG_microblaze_1_axi_intc_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x44A00000 [get_bd_addr_spaces microblaze_2/Data] [get_bd_addr_segs AXItmrmvoter_0/S01_AXI/S01_AXI_reg] SEG_AXItmrmvoter_0_S01_AXI_reg
  create_bd_addr_seg -range 0x10000 -offset 0x40000000 [get_bd_addr_spaces microblaze_2/Data] [get_bd_addr_segs axi_gpio_4/S_AXI/Reg] SEG_axi_gpio_4_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40600000 [get_bd_addr_spaces microblaze_2/Data] [get_bd_addr_segs axi_uartlite_1/S_AXI/Reg] SEG_axi_uartlite_1_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x0 [get_bd_addr_spaces microblaze_2/Data] [get_bd_addr_segs microblaze_2_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x10000 -offset 0x76000000 [get_bd_addr_spaces microblaze_2/Data] [get_bd_addr_segs microblaze_2_local_memory/dlmb_bram_if_cntlr/S_AXI_CTRL/Reg] SEG_dlmb_bram_if_cntlr_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x0 [get_bd_addr_spaces microblaze_2/Instruction] [get_bd_addr_segs microblaze_2_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x10000 -offset 0x76010000 [get_bd_addr_spaces microblaze_2/Data] [get_bd_addr_segs microblaze_2_local_memory/ilmb_bram_if_cntlr/S_AXI_CTRL/Reg] SEG_ilmb_bram_if_cntlr_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x41200000 [get_bd_addr_spaces microblaze_2/Data] [get_bd_addr_segs microblaze_2_axi_intc/s_axi/Reg] SEG_microblaze_2_axi_intc_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x44A00000 [get_bd_addr_spaces microblaze_3/Data] [get_bd_addr_segs AXItmrmvoter_0/S02_AXI/S02_AXI_reg] SEG_AXItmrmvoter_0_S02_AXI_reg
  create_bd_addr_seg -range 0x10000 -offset 0x40000000 [get_bd_addr_spaces microblaze_3/Data] [get_bd_addr_segs axi_gpio_5/S_AXI/Reg] SEG_axi_gpio_5_Reg
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
preplace portBus gpio_rtl1 -pg 1 -y 40 -defaultsOSRD
preplace inst microblaze_2_clk_wiz_1 -pg 1 -lvl 4 -y 760 -defaultsOSRD
preplace inst tmrit_0 -pg 1 -lvl 3 -y -470 -defaultsOSRD
preplace inst microblaze_2_axi_periph -pg 1 -lvl 8 -y 190 -defaultsOSRD
preplace inst tmrit_1 -pg 1 -lvl 5 -y 2370 -defaultsOSRD
preplace inst microblaze_0_axi_periph -pg 1 -lvl 8 -y 2580 -defaultsOSRD
preplace inst lmb_bram2 -pg 1 -lvl 7 -y -980 -defaultsOSRD
preplace inst microblaze_5_axi_periph -pg 1 -lvl 8 -y 3480 -defaultsOSRD
preplace inst microblaze_5_clk_wiz_1 -pg 1 -lvl 4 -y 3440 -defaultsOSRD
preplace inst microblaze_2_xlconcat -pg 1 -lvl 8 -y 490 -defaultsOSRD
preplace inst microblaze_4_xlconcat -pg 1 -lvl 10 -y 3110 -defaultsOSRD
preplace inst lmb_bram3 -pg 1 -lvl 7 -y -460 -defaultsOSRD
preplace inst clk_wiz_1 -pg 1 -lvl 4 -y 2650 -defaultsOSRD
preplace inst lmb_bram4 -pg 1 -lvl 7 -y -750 -defaultsOSRD
preplace inst microblaze_4_axi_periph -pg 1 -lvl 8 -y 3100 -defaultsOSRD
preplace inst microblaze_4_clk_wiz_1 -pg 1 -lvl 4 -y 3080 -defaultsOSRD
preplace inst microblaze_0_local_memory -pg 1 -lvl 7 -y 2830 -defaultsOSRD
preplace inst rst_microblaze_4_clk_wiz_1_100M -pg 1 -lvl 5 -y 3050 -defaultsOSRD
preplace inst microblaze_0 -pg 1 -lvl 7 -y 3050 -defaultsOSRD
preplace inst microblaze_1 -pg 1 -lvl 7 -y 1830 -defaultsOSRD
preplace inst microblaze_5_local_memory -pg 1 -lvl 7 -y 3820 -defaultsOSRD
preplace inst microblaze_2 -pg 1 -lvl 7 -y 1300 -defaultsOSRD
preplace inst microblaze_3 -pg 1 -lvl 7 -y 860 -defaultsOSRD
preplace inst tmrmvoter_3 -pg 1 -lvl 11 -y 870 -defaultsOSRD
preplace inst tmrmvoter_4 -pg 1 -lvl 13 -y 40 -defaultsOSRD
preplace inst microblaze_1_local_memory -pg 1 -lvl 7 -y 1130 -defaultsOSRD
preplace inst axi_gpio_0 -pg 1 -lvl 11 -y 3200 -defaultsOSRD
preplace inst microblaze_4 -pg 1 -lvl 7 -y 3500 -defaultsOSRD
preplace inst tmrmvoter_5 -pg 1 -lvl 13 -y 3350 -defaultsOSRD
preplace inst axi_uartlite_0 -pg 1 -lvl 9 -y 830 -defaultsOSRD
preplace inst axi_gpio_1 -pg 1 -lvl 11 -y 3360 -defaultsOSRD
preplace inst microblaze_5 -pg 1 -lvl 7 -y 3990 -defaultsOSRD
preplace inst microblaze_1_clk_wiz_1 -pg 1 -lvl 4 -y 1240 -defaultsOSRD
preplace inst axi_uartlite_1 -pg 1 -lvl 9 -y 660 -defaultsOSRD
preplace inst AXItmrmvoter_0 -pg 1 -lvl 1 -y 970 -defaultsOSRD
preplace inst axi_gpio_2 -pg 1 -lvl 11 -y 3530 -defaultsOSRD
preplace inst axi_uartlite_2 -pg 1 -lvl 9 -y 1410 -defaultsOSRD
preplace inst axi_gpio_3 -pg 1 -lvl 11 -y 10 -defaultsOSRD
preplace inst microblaze_3_clk_wiz_1 -pg 1 -lvl 4 -y 290 -defaultsOSRD
preplace inst axi_gpio_4 -pg 1 -lvl 11 -y 130 -defaultsOSRD
preplace inst memconformitymodule_0 -pg 1 -lvl 6 -y -950 -defaultsOSRD
preplace inst axi_gpio_5 -pg 1 -lvl 11 -y 250 -defaultsOSRD
preplace inst microblaze_3_axi_periph -pg 1 -lvl 8 -y 1400 -defaultsOSRD
preplace inst memconformitymodule_1 -pg 1 -lvl 6 -y -680 -defaultsOSRD
preplace inst microblaze_5_axi_intc -pg 1 -lvl 9 -y 3500 -defaultsOSRD
preplace inst microblaze_3_xlconcat -pg 1 -lvl 8 -y 1680 -defaultsOSRD
preplace inst microblaze_4_local_memory -pg 1 -lvl 7 -y 3330 -defaultsOSRD
preplace inst microblaze_1_xlconcat -pg 1 -lvl 8 -y 1090 -defaultsOSRD
preplace inst memconformitymodule_2 -pg 1 -lvl 6 -y -420 -defaultsOSRD
preplace inst rst_microblaze_5_clk_wiz_1_100M -pg 1 -lvl 5 -y 3450 -defaultsOSRD
preplace inst microblaze_1_axi_periph -pg 1 -lvl 8 -y 790 -defaultsOSRD
preplace inst microblaze_5_xlconcat -pg 1 -lvl 10 -y 3460 -defaultsOSRD
preplace inst rst_clk_wiz_1_100M -pg 1 -lvl 5 -y 2630 -defaultsOSRD
preplace inst xlconcat_0 -pg 1 -lvl 10 -y 860 -defaultsOSRD
preplace inst microblaze_0_xlconcat -pg 1 -lvl 10 -y 2700 -defaultsOSRD
preplace inst microblaze_0_axi_intc -pg 1 -lvl 9 -y 2680 -defaultsOSRD
preplace inst xlconcat_1 -pg 1 -lvl 12 -y 3350 -defaultsOSRD
preplace inst microblaze_2_axi_intc -pg 1 -lvl 9 -y 480 -defaultsOSRD
preplace inst xlconcat_2 -pg 1 -lvl 12 -y 40 -defaultsOSRD
preplace inst rst_microblaze_2_clk_wiz_1_100M -pg 1 -lvl 5 -y 790 -defaultsOSRD
preplace inst xlconcat_3 -pg 1 -lvl 2 -y -490 -defaultsOSRD
preplace inst microblaze_3_local_memory -pg 1 -lvl 7 -y 1640 -defaultsOSRD
preplace inst microblaze_1_axi_intc -pg 1 -lvl 9 -y 1250 -defaultsOSRD
preplace inst microblaze_4_axi_intc -pg 1 -lvl 9 -y 3100 -defaultsOSRD
preplace inst xlconcat_4 -pg 1 -lvl 4 -y 2360 -defaultsOSRD
preplace inst microblaze_2_local_memory -pg 1 -lvl 7 -y 690 -defaultsOSRD
preplace inst rst_microblaze_3_clk_wiz_1_100M -pg 1 -lvl 5 -y 260 -defaultsOSRD
preplace inst mdm_1 -pg 1 -lvl 1 -y 1950 -defaultsOSRD
preplace inst microblaze_3_axi_intc -pg 1 -lvl 9 -y 1800 -defaultsOSRD
preplace inst rst_microblaze_1_clk_wiz_1_100M -pg 1 -lvl 5 -y 1220 -defaultsOSRD
preplace netloc microblaze_4_intc_axi 1 8 1 3860
preplace netloc microblaze_3_interrupt 1 6 4 NJ 430 NJ 430 NJ 380 4550
preplace netloc microblaze_2_axi_periph_M03_AXI 1 8 1 4000
preplace netloc rst_microblaze_5_clk_wiz_1_100M_bus_struct_reset 1 5 2 NJ 3430 2030
preplace netloc memconformitymodule_2_datao 1 6 1 2000
preplace netloc memconformitymodule_2_add 1 6 1 1990
preplace netloc microblaze_1_Clk 1 0 11 NJ -310 NJ -310 NJ -310 NJ -310 1010 -310 1520 -310 2070 -40 3100 -40 3980 10 NJ 10 NJ
preplace netloc microblaze_3_axi_dp 1 7 1 3050
preplace netloc axi_gpio_2_gpio_io_o1 1 11 1 NJ
preplace netloc rst_microblaze_4_clk_wiz_1_100M_interconnect_aresetn 1 5 3 NJ 3070 NJ 3140 NJ
preplace netloc microblaze_4_axi_periph_M03_AXI 1 8 3 NJ 3250 NJ 3250 NJ
preplace netloc microblaze_2_axi_dp 1 7 1 2970
preplace netloc microblaze_0_axi_periph_M03_AXI 1 8 3 NJ 2550 NJ 2550 4830
preplace netloc memconformitymodule_1_datao 1 6 1 2000
preplace netloc microblaze_3_ilmb_int 1 7 1 3060
preplace netloc axi_gpio_1_gpio_io_o 1 11 1 5100
preplace netloc microblaze_3_dlmb_axi 1 6 3 NJ 990 NJ 1030 3840
preplace netloc xlconcat_2_dout 1 12 1 N
preplace netloc microblaze_3_ilmb_axi 1 6 3 NJ 1010 NJ 1020 3860
preplace netloc memconformitymodule_1_rw 1 6 1 2020
preplace netloc rst_microblaze_1_clk_wiz_1_100M_mb_reset 1 5 4 NJ -300 NJ -120 NJ -120 NJ
preplace netloc rst_microblaze_2_clk_wiz_1_100M_mb_reset 1 5 4 NJ -560 NJ -110 NJ -110 NJ
preplace netloc xlconcat_1_dout 1 12 1 N
preplace netloc memconformitymodule_0_add 1 6 1 1990
preplace netloc axi_uartlite_0_tx 1 9 1 N
preplace netloc microblaze_1_axi_periph_M05_AXI 1 8 3 NJ -10 NJ -10 NJ
preplace netloc microblaze_0_intc_axi 1 8 1 3870
preplace netloc microblaze_0_dlmb_1 1 6 2 NJ 2710 NJ
preplace netloc rst_microblaze_3_clk_wiz_1_100M_peripheral_aresetn 1 0 11 NJ 1120 NJ 1120 NJ 1120 NJ 1120 NJ 1120 1480 1120 1990 1400 3100 1180 4050 270 NJ 270 NJ
preplace netloc microblaze_3_axi_periph_M04_AXI 1 0 9 NJ 1110 NJ 1110 NJ 1110 NJ 1110 NJ 1110 NJ 1110 NJ 980 NJ 1150 3850
preplace netloc xlconcat_0_dout 1 10 1 4840
preplace netloc microblaze_1_clk_wiz_1_locked 1 4 1 1020
preplace netloc rst_microblaze_1_clk_wiz_1_100M_peripheral_aresetn 1 0 11 NJ 1320 NJ 1320 NJ 1320 NJ 1320 NJ 1320 1470 1260 2100 1380 3020 1160 4060 30 NJ 30 NJ
preplace netloc rst_microblaze_5_clk_wiz_1_100M_peripheral_aresetn 1 5 6 NJ 3490 1990 3610 3100 3710 3960 3630 NJ 3550 NJ
preplace netloc microblaze_2_axi_periph_M05_AXI 1 8 3 3880 110 NJ 110 NJ
preplace netloc microblaze_3_axi_periph_M03_AXI 1 8 1 3930
preplace netloc microblaze_3_ilmb_1 1 6 2 NJ 940 NJ
preplace netloc microblaze_1_axi_periph_M03_AXI 1 8 1 3960
preplace netloc memconformitymodule_0_rw 1 6 1 2040
preplace netloc rst_clk_wiz_1_100M_mb_reset 1 5 4 NJ 2590 NJ 2380 NJ 2380 NJ
preplace netloc microblaze_4_clk_wiz_1_locked 1 4 1 N
preplace netloc microblaze_4_axi_dp 1 7 1 3060
preplace netloc clock_rtl_1 1 0 4 NJ 1840 NJ 1840 NJ 1840 570
preplace netloc microblaze_3_clk_wiz_1_locked 1 4 1 N
preplace netloc microblaze_1_intr 1 8 1 3940
preplace netloc microblaze_5_Clk 1 3 8 600 3360 1030 3360 NJ 3360 2010 3690 3090 3690 3910 3620 NJ 3530 NJ
preplace netloc microblaze_2_axi_periph_M04_AXI 1 0 9 NJ 1100 NJ 950 NJ 950 NJ 950 NJ 950 NJ 950 NJ 950 NJ 1010 3870
preplace netloc microblaze_5_dlmb_1 1 6 2 2170 4070 2920
preplace netloc microblaze_2_intc_axi 1 8 1 4030
preplace netloc microblaze_2_interrupt 1 6 4 NJ 420 NJ 420 NJ 350 4600
preplace netloc microblaze_1_dlmb_axi 1 6 3 NJ 530 NJ 560 3840
preplace netloc rst_microblaze_1_clk_wiz_1_100M_bus_struct_reset 1 5 2 NJ 1170 NJ
preplace netloc rst_microblaze_5_clk_wiz_1_100M_mb_reset 1 5 4 NJ 3410 NJ 3700 NJ 3700 4030
preplace netloc rst_clk_wiz_1_100M_bus_struct_reset 1 5 2 NJ 2610 2140
preplace netloc microblaze_4_interrupt 1 6 4 NJ 3680 NJ 3680 NJ 3680 4550
preplace netloc microblaze_3_dlmb_1 1 6 2 NJ 540 NJ
preplace netloc lmb_bram2_douta 1 5 2 1500 -1060 NJ
preplace netloc rst_microblaze_1_clk_wiz_1_100M_interconnect_aresetn 1 5 3 1520 510 NJ 510 NJ
preplace netloc microblaze_5_ilmb_int 1 7 3 NJ 3730 NJ 3730 NJ
preplace netloc microblaze_1_dlmb_int 1 7 1 2980
preplace netloc microblaze_5_intr 1 8 3 4070 3610 NJ 3610 4800
preplace netloc rst_microblaze_2_clk_wiz_1_100M_interconnect_aresetn 1 5 3 NJ 70 NJ 70 NJ
preplace netloc microblaze_4_debug 1 1 6 NJ 1970 NJ 1970 NJ 1970 NJ 1970 NJ 1970 NJ
preplace netloc microblaze_1_ilmb_axi 1 6 3 NJ 550 NJ 550 3860
preplace netloc microblaze_0_ilmb_1 1 6 2 NJ 2960 NJ
preplace netloc rst_microblaze_4_clk_wiz_1_100M_peripheral_aresetn 1 5 6 NJ 3090 2020 3170 3100 2900 3890 3000 NJ 3000 NJ
preplace netloc rst_microblaze_4_clk_wiz_1_100M_bus_struct_reset 1 5 2 NJ 3030 2090
preplace netloc microblaze_5_intc_axi 1 8 1 NJ
preplace netloc microblaze_0_interrupt 1 6 4 2220 2970 2990 2810 NJ 2810 4550
preplace netloc microblaze_0_ilmb_int 1 7 3 NJ 2770 NJ 2580 NJ
preplace netloc microblaze_2_clk_wiz_1_locked 1 4 1 1020
preplace netloc microblaze_5_clk_wiz_1_locked 1 4 1 1030
preplace netloc microblaze_4_intr 1 8 3 4070 3200 NJ 3200 4790
preplace netloc microblaze_3_intc_axi 1 8 1 3940
preplace netloc lmb_bram4_douta 1 5 2 1520 -580 NJ
preplace netloc mdm_1_debug_sys_rst 1 1 4 NJ 2010 NJ 2010 NJ 2010 NJ
preplace netloc rst_microblaze_4_clk_wiz_1_100M_mb_reset 1 5 4 NJ 3010 NJ 3200 NJ 3290 NJ
preplace netloc microblaze_4_dlmb_int 1 7 3 NJ 2870 NJ 2870 NJ
preplace netloc microblaze_4_ilmb_axi 1 6 3 2150 3210 2910 3280 3840
preplace netloc microblaze_3_debug 1 1 6 NJ 880 NJ 880 NJ 880 NJ 880 NJ 850 NJ
preplace netloc tmrmvoter_5_Outs 1 13 1 5490
preplace netloc microblaze_2_dlmb_axi 1 6 3 NJ -70 NJ -70 3870
preplace netloc microblaze_1_dlmb_1 1 6 2 NJ 970 NJ
preplace netloc microblaze_0_ilmb_axi 1 6 3 2220 2950 2970 2790 3840
preplace netloc microblaze_1_ilmb_int 1 7 1 3030
preplace netloc microblaze_1_axi_periph_M04_AXI 1 0 9 NJ 490 NJ 490 NJ 490 NJ 490 NJ 490 NJ 490 NJ 490 NJ 570 3850
preplace netloc microblaze_5_axi_dp 1 7 1 3080
preplace netloc microblaze_4_dlmb_1 1 6 2 2160 3580 2920
preplace netloc axi_gpio_0_gpio_io_o1 1 11 1 NJ
preplace netloc reset_rtl_1 1 0 4 NJ 280 NJ 280 160 280 560
preplace netloc axi_uartlite_1_tx 1 9 1 4600
preplace netloc rst_microblaze_3_clk_wiz_1_100M_interconnect_aresetn 1 5 3 NJ 280 NJ 280 NJ
preplace netloc microblaze_1_axi_dp 1 7 1 2990
preplace netloc memconformitymodule_2_rw 1 6 1 2040
preplace netloc rst_microblaze_2_clk_wiz_1_100M_bus_struct_reset 1 5 2 NJ 730 NJ
preplace netloc microblaze_0_dlmb_int 1 7 3 NJ 2780 NJ 2780 NJ
preplace netloc microblaze_0_Clk 1 3 8 580 2590 1030 2720 NJ 2720 2190 2700 3050 2760 4040 2540 NJ 2540 4840
preplace netloc microblaze_5_axi_periph_M03_AXI 1 8 3 NJ 3600 NJ 3520 NJ
preplace netloc microblaze_5_dlmb_int 1 7 3 NJ 3720 NJ 3720 NJ
preplace netloc microblaze_2_dlmb_1 1 6 2 NJ 560 NJ
preplace netloc rst_microblaze_3_clk_wiz_1_100M_mb_reset 1 5 4 NJ -850 NJ -100 NJ -100 NJ
preplace netloc microblaze_5_ilmb_axi 1 6 3 NJ 3660 NJ 3670 3840
preplace netloc tmrmvoter_3_Outs 1 11 3 NJ 860 NJ 860 N
preplace netloc microblaze_2_dlmb_int 1 7 1 2950
preplace netloc rst_microblaze_2_clk_wiz_1_100M_peripheral_aresetn 1 0 11 NJ 700 NJ 700 NJ 700 NJ 700 NJ 700 1450 700 2100 350 2990 -30 4010 150 NJ 150 NJ
preplace netloc microblaze_2_intr 1 8 1 N
preplace netloc microblaze_5_debug 1 1 6 NJ 1990 NJ 1990 NJ 1990 NJ 1990 NJ 1990 NJ
preplace netloc microblaze_2_ilmb_axi 1 6 3 NJ -60 NJ -60 3840
preplace netloc microblaze_2_debug 1 1 6 NJ 1310 NJ 1310 NJ 1310 NJ 1310 NJ 1290 NJ
preplace netloc microblaze_4_Clk 1 3 8 590 2960 1020 2960 NJ 2960 2070 3150 3090 2890 4000 3230 NJ 3230 NJ
preplace netloc clk_wiz_1_locked 1 4 1 1010
preplace netloc microblaze_4_ilmb_1 1 6 2 2170 3590 2910
preplace netloc microblaze_2_ilmb_1 1 6 2 NJ 570 NJ
preplace netloc microblaze_1_debug 1 1 6 -120 1820 NJ 1820 NJ 1820 NJ 1820 NJ 1820 NJ
preplace netloc microblaze_0_debug 1 1 6 NJ 1890 NJ 1890 NJ 1890 NJ 1890 NJ 1890 2150
preplace netloc microblaze_3_intr 1 8 1 3850
preplace netloc microblaze_0_axi_dp 1 7 1 2960
preplace netloc microblaze_4_ilmb_int 1 7 3 NJ 3300 NJ 3260 4590
preplace netloc microblaze_3_axi_periph_M05_AXI 1 8 3 3920 230 NJ 230 NJ
preplace netloc microblaze_5_ilmb_1 1 6 2 2200 4080 2910
preplace netloc microblaze_0_dlmb_axi 1 6 3 NJ 2940 NJ 2820 3850
preplace netloc tmrit_1_heal_s 1 4 2 1070 2730 1490
preplace netloc microblaze_2_ilmb_int 1 7 1 2960
preplace netloc microblaze_3_dlmb_int 1 7 1 3090
preplace netloc microblaze_1_ilmb_1 1 6 2 NJ 960 NJ
preplace netloc tmrmvoter_4_Outs 1 13 1 N
preplace netloc rst_clk_wiz_1_100M_interconnect_aresetn 1 5 4 NJ 2650 NJ 2650 3090 2400 NJ
preplace netloc microblaze_4_dlmb_axi 1 6 3 2140 3160 3040 2920 3840
preplace netloc memconformitymodule_0_datao 1 6 1 2000
preplace netloc reset_rtl_0_1 1 0 5 NJ 2060 NJ 2060 NJ 2060 NJ 2060 1050
preplace netloc microblaze_1_intc_axi 1 8 1 3970
preplace netloc memconformitymodule_1_add 1 6 1 1990
preplace netloc microblaze_2_Clk 1 0 11 NJ -490 NJ -580 NJ -570 NJ -570 1030 -570 1470 -570 2060 -30 2940 -80 4040 130 NJ 130 NJ
preplace netloc microblaze_3_Clk 1 0 11 NJ -510 NJ -560 NJ -560 NJ -560 1020 -940 1450 -1050 2030 1390 3090 1170 4020 250 NJ 250 NJ
preplace netloc xlconcat_3_dout 1 2 1 160
preplace netloc lmb_bram3_douta 1 5 2 1530 -320 NJ
preplace netloc axi_gpio_1_gpio_io_o1 1 11 1 NJ
preplace netloc axi_uartlite_2_tx 1 9 1 4590
preplace netloc tmrit_0_heal_s 1 3 3 NJ -460 NJ -460 1480
preplace netloc rst_microblaze_5_clk_wiz_1_100M_interconnect_aresetn 1 5 3 NJ 3470 NJ 3600 NJ
preplace netloc microblaze_5_dlmb_axi 1 6 3 NJ 3640 NJ 3660 3850
preplace netloc microblaze_5_interrupt 1 6 4 NJ 3190 NJ 2910 NJ 2910 4560
preplace netloc axi_gpio_0_gpio_io_o 1 11 1 5110
preplace netloc xlconcat_3_dout1 1 4 1 N
preplace netloc rst_microblaze_3_clk_wiz_1_100M_bus_struct_reset 1 5 2 NJ 240 2010
preplace netloc microblaze_0_intr 1 8 3 4070 2560 NJ 2560 4820
preplace netloc uart_rtl_rxd_1 1 9 5 4570 950 NJ 950 NJ 950 NJ 950 NJ
preplace netloc axi_gpio_2_gpio_io_o 1 11 1 5110
preplace netloc microblaze_1_interrupt 1 6 4 NJ 410 NJ 410 NJ 370 4560
preplace netloc rst_clk_wiz_1_100M_peripheral_aresetn 1 5 6 NJ 2670 NJ 3130 NJ 2880 NJ 2880 NJ 2880 4820
levelinfo -pg 1 -640 -250 70 470 920 1290 1890 2690 3690 4437 4700 4980 5210 5400 5510 -top -1090 -bot 4090
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


