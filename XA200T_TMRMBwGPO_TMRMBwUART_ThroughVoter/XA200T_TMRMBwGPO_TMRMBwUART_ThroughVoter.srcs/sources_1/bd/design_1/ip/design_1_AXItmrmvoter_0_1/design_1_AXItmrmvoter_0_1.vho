-- (c) Copyright 1995-2015 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: KTH_SEUD:user:AXItmrmvoter:1.0
-- IP Revision: 4

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT design_1_AXItmrmvoter_0_1
  PORT (
    s02_axi_awaddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s02_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s02_axi_awvalid : IN STD_LOGIC;
    s02_axi_awready : OUT STD_LOGIC;
    s02_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s02_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s02_axi_wvalid : IN STD_LOGIC;
    s02_axi_wready : OUT STD_LOGIC;
    s02_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s02_axi_bvalid : OUT STD_LOGIC;
    s02_axi_bready : IN STD_LOGIC;
    s02_axi_araddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s02_axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s02_axi_arvalid : IN STD_LOGIC;
    s02_axi_arready : OUT STD_LOGIC;
    s02_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s02_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s02_axi_rvalid : OUT STD_LOGIC;
    s02_axi_rready : IN STD_LOGIC;
    s02_axi_aclk : IN STD_LOGIC;
    s02_axi_aresetn : IN STD_LOGIC;
    s01_axi_awaddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s01_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s01_axi_awvalid : IN STD_LOGIC;
    s01_axi_awready : OUT STD_LOGIC;
    s01_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s01_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s01_axi_wvalid : IN STD_LOGIC;
    s01_axi_wready : OUT STD_LOGIC;
    s01_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s01_axi_bvalid : OUT STD_LOGIC;
    s01_axi_bready : IN STD_LOGIC;
    s01_axi_araddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s01_axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s01_axi_arvalid : IN STD_LOGIC;
    s01_axi_arready : OUT STD_LOGIC;
    s01_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s01_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s01_axi_rvalid : OUT STD_LOGIC;
    s01_axi_rready : IN STD_LOGIC;
    s01_axi_aclk : IN STD_LOGIC;
    s01_axi_aresetn : IN STD_LOGIC;
    s00_axi_awaddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s00_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s00_axi_awvalid : IN STD_LOGIC;
    s00_axi_awready : OUT STD_LOGIC;
    s00_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s00_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s00_axi_wvalid : IN STD_LOGIC;
    s00_axi_wready : OUT STD_LOGIC;
    s00_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s00_axi_bvalid : OUT STD_LOGIC;
    s00_axi_bready : IN STD_LOGIC;
    s00_axi_araddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s00_axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s00_axi_arvalid : IN STD_LOGIC;
    s00_axi_arready : OUT STD_LOGIC;
    s00_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s00_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s00_axi_rvalid : OUT STD_LOGIC;
    s00_axi_rready : IN STD_LOGIC;
    s00_axi_aclk : IN STD_LOGIC;
    s00_axi_aresetn : IN STD_LOGIC
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : design_1_AXItmrmvoter_0_1
  PORT MAP (
    s02_axi_awaddr => s02_axi_awaddr,
    s02_axi_awprot => s02_axi_awprot,
    s02_axi_awvalid => s02_axi_awvalid,
    s02_axi_awready => s02_axi_awready,
    s02_axi_wdata => s02_axi_wdata,
    s02_axi_wstrb => s02_axi_wstrb,
    s02_axi_wvalid => s02_axi_wvalid,
    s02_axi_wready => s02_axi_wready,
    s02_axi_bresp => s02_axi_bresp,
    s02_axi_bvalid => s02_axi_bvalid,
    s02_axi_bready => s02_axi_bready,
    s02_axi_araddr => s02_axi_araddr,
    s02_axi_arprot => s02_axi_arprot,
    s02_axi_arvalid => s02_axi_arvalid,
    s02_axi_arready => s02_axi_arready,
    s02_axi_rdata => s02_axi_rdata,
    s02_axi_rresp => s02_axi_rresp,
    s02_axi_rvalid => s02_axi_rvalid,
    s02_axi_rready => s02_axi_rready,
    s02_axi_aclk => s02_axi_aclk,
    s02_axi_aresetn => s02_axi_aresetn,
    s01_axi_awaddr => s01_axi_awaddr,
    s01_axi_awprot => s01_axi_awprot,
    s01_axi_awvalid => s01_axi_awvalid,
    s01_axi_awready => s01_axi_awready,
    s01_axi_wdata => s01_axi_wdata,
    s01_axi_wstrb => s01_axi_wstrb,
    s01_axi_wvalid => s01_axi_wvalid,
    s01_axi_wready => s01_axi_wready,
    s01_axi_bresp => s01_axi_bresp,
    s01_axi_bvalid => s01_axi_bvalid,
    s01_axi_bready => s01_axi_bready,
    s01_axi_araddr => s01_axi_araddr,
    s01_axi_arprot => s01_axi_arprot,
    s01_axi_arvalid => s01_axi_arvalid,
    s01_axi_arready => s01_axi_arready,
    s01_axi_rdata => s01_axi_rdata,
    s01_axi_rresp => s01_axi_rresp,
    s01_axi_rvalid => s01_axi_rvalid,
    s01_axi_rready => s01_axi_rready,
    s01_axi_aclk => s01_axi_aclk,
    s01_axi_aresetn => s01_axi_aresetn,
    s00_axi_awaddr => s00_axi_awaddr,
    s00_axi_awprot => s00_axi_awprot,
    s00_axi_awvalid => s00_axi_awvalid,
    s00_axi_awready => s00_axi_awready,
    s00_axi_wdata => s00_axi_wdata,
    s00_axi_wstrb => s00_axi_wstrb,
    s00_axi_wvalid => s00_axi_wvalid,
    s00_axi_wready => s00_axi_wready,
    s00_axi_bresp => s00_axi_bresp,
    s00_axi_bvalid => s00_axi_bvalid,
    s00_axi_bready => s00_axi_bready,
    s00_axi_araddr => s00_axi_araddr,
    s00_axi_arprot => s00_axi_arprot,
    s00_axi_arvalid => s00_axi_arvalid,
    s00_axi_arready => s00_axi_arready,
    s00_axi_rdata => s00_axi_rdata,
    s00_axi_rresp => s00_axi_rresp,
    s00_axi_rvalid => s00_axi_rvalid,
    s00_axi_rready => s00_axi_rready,
    s00_axi_aclk => s00_axi_aclk,
    s00_axi_aresetn => s00_axi_aresetn
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

