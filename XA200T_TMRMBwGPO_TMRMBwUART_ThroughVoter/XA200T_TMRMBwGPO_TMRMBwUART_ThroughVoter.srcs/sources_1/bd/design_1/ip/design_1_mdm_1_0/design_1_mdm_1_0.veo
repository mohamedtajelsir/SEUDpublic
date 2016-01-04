// (c) Copyright 1995-2015 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

// IP VLNV: xilinx.com:ip:mdm:3.2
// IP Revision: 4

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
design_1_mdm_1_0 your_instance_name (
  .Debug_SYS_Rst(Debug_SYS_Rst),  // output wire Debug_SYS_Rst
  .Dbg_Clk_0(Dbg_Clk_0),          // output wire Dbg_Clk_0
  .Dbg_TDI_0(Dbg_TDI_0),          // output wire Dbg_TDI_0
  .Dbg_TDO_0(Dbg_TDO_0),          // input wire Dbg_TDO_0
  .Dbg_Reg_En_0(Dbg_Reg_En_0),    // output wire [0 : 7] Dbg_Reg_En_0
  .Dbg_Capture_0(Dbg_Capture_0),  // output wire Dbg_Capture_0
  .Dbg_Shift_0(Dbg_Shift_0),      // output wire Dbg_Shift_0
  .Dbg_Update_0(Dbg_Update_0),    // output wire Dbg_Update_0
  .Dbg_Rst_0(Dbg_Rst_0),          // output wire Dbg_Rst_0
  .Dbg_Clk_1(Dbg_Clk_1),          // output wire Dbg_Clk_1
  .Dbg_TDI_1(Dbg_TDI_1),          // output wire Dbg_TDI_1
  .Dbg_TDO_1(Dbg_TDO_1),          // input wire Dbg_TDO_1
  .Dbg_Reg_En_1(Dbg_Reg_En_1),    // output wire [0 : 7] Dbg_Reg_En_1
  .Dbg_Capture_1(Dbg_Capture_1),  // output wire Dbg_Capture_1
  .Dbg_Shift_1(Dbg_Shift_1),      // output wire Dbg_Shift_1
  .Dbg_Update_1(Dbg_Update_1),    // output wire Dbg_Update_1
  .Dbg_Rst_1(Dbg_Rst_1),          // output wire Dbg_Rst_1
  .Dbg_Clk_2(Dbg_Clk_2),          // output wire Dbg_Clk_2
  .Dbg_TDI_2(Dbg_TDI_2),          // output wire Dbg_TDI_2
  .Dbg_TDO_2(Dbg_TDO_2),          // input wire Dbg_TDO_2
  .Dbg_Reg_En_2(Dbg_Reg_En_2),    // output wire [0 : 7] Dbg_Reg_En_2
  .Dbg_Capture_2(Dbg_Capture_2),  // output wire Dbg_Capture_2
  .Dbg_Shift_2(Dbg_Shift_2),      // output wire Dbg_Shift_2
  .Dbg_Update_2(Dbg_Update_2),    // output wire Dbg_Update_2
  .Dbg_Rst_2(Dbg_Rst_2),          // output wire Dbg_Rst_2
  .Dbg_Clk_3(Dbg_Clk_3),          // output wire Dbg_Clk_3
  .Dbg_TDI_3(Dbg_TDI_3),          // output wire Dbg_TDI_3
  .Dbg_TDO_3(Dbg_TDO_3),          // input wire Dbg_TDO_3
  .Dbg_Reg_En_3(Dbg_Reg_En_3),    // output wire [0 : 7] Dbg_Reg_En_3
  .Dbg_Capture_3(Dbg_Capture_3),  // output wire Dbg_Capture_3
  .Dbg_Shift_3(Dbg_Shift_3),      // output wire Dbg_Shift_3
  .Dbg_Update_3(Dbg_Update_3),    // output wire Dbg_Update_3
  .Dbg_Rst_3(Dbg_Rst_3),          // output wire Dbg_Rst_3
  .Dbg_Clk_4(Dbg_Clk_4),          // output wire Dbg_Clk_4
  .Dbg_TDI_4(Dbg_TDI_4),          // output wire Dbg_TDI_4
  .Dbg_TDO_4(Dbg_TDO_4),          // input wire Dbg_TDO_4
  .Dbg_Reg_En_4(Dbg_Reg_En_4),    // output wire [0 : 7] Dbg_Reg_En_4
  .Dbg_Capture_4(Dbg_Capture_4),  // output wire Dbg_Capture_4
  .Dbg_Shift_4(Dbg_Shift_4),      // output wire Dbg_Shift_4
  .Dbg_Update_4(Dbg_Update_4),    // output wire Dbg_Update_4
  .Dbg_Rst_4(Dbg_Rst_4),          // output wire Dbg_Rst_4
  .Dbg_Clk_5(Dbg_Clk_5),          // output wire Dbg_Clk_5
  .Dbg_TDI_5(Dbg_TDI_5),          // output wire Dbg_TDI_5
  .Dbg_TDO_5(Dbg_TDO_5),          // input wire Dbg_TDO_5
  .Dbg_Reg_En_5(Dbg_Reg_En_5),    // output wire [0 : 7] Dbg_Reg_En_5
  .Dbg_Capture_5(Dbg_Capture_5),  // output wire Dbg_Capture_5
  .Dbg_Shift_5(Dbg_Shift_5),      // output wire Dbg_Shift_5
  .Dbg_Update_5(Dbg_Update_5),    // output wire Dbg_Update_5
  .Dbg_Rst_5(Dbg_Rst_5)          // output wire Dbg_Rst_5
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file design_1_mdm_1_0.v when simulating
// the core, design_1_mdm_1_0. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.

