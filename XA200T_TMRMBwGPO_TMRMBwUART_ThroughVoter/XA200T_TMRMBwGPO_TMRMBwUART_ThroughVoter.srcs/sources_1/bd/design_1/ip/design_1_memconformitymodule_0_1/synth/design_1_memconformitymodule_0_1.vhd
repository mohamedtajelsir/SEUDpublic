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

-- IP VLNV: kth.se:user:memconformitymodule:1.0
-- IP Revision: 3

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_memconformitymodule_0_1 IS
  PORT (
    add : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    rw : OUT STD_LOGIC;
    datao : OUT STD_LOGIC_VECTOR(39 DOWNTO 0);
    datai1 : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
    datai2 : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
    datai3 : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
    clk : IN STD_LOGIC;
    en : IN STD_LOGIC;
    rst : IN STD_LOGIC
  );
END design_1_memconformitymodule_0_1;

ARCHITECTURE design_1_memconformitymodule_0_1_arch OF design_1_memconformitymodule_0_1 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : string;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_memconformitymodule_0_1_arch: ARCHITECTURE IS "yes";

  COMPONENT memconformitymodule IS
    GENERIC (
      AddBusWidth : INTEGER;
      DataBusWidth : INTEGER
    );
    PORT (
      add : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      rw : OUT STD_LOGIC;
      datao : OUT STD_LOGIC_VECTOR(39 DOWNTO 0);
      datai1 : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
      datai2 : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
      datai3 : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
      clk : IN STD_LOGIC;
      en : IN STD_LOGIC;
      rst : IN STD_LOGIC
    );
  END COMPONENT memconformitymodule;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF design_1_memconformitymodule_0_1_arch: ARCHITECTURE IS "memconformitymodule,Vivado 2015.4";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF design_1_memconformitymodule_0_1_arch : ARCHITECTURE IS "design_1_memconformitymodule_0_1,memconformitymodule,{}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF rst: SIGNAL IS "xilinx.com:signal:reset:1.0 rst RST";
BEGIN
  U0 : memconformitymodule
    GENERIC MAP (
      AddBusWidth => 32,
      DataBusWidth => 40
    )
    PORT MAP (
      add => add,
      rw => rw,
      datao => datao,
      datai1 => datai1,
      datai2 => datai2,
      datai3 => datai3,
      clk => clk,
      en => en,
      rst => rst
    );
END design_1_memconformitymodule_0_1_arch;
