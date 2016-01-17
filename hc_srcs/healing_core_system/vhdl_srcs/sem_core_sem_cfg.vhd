-----------------------------------------------------------------------------
--
--
--
-----------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /
-- \   \   \/    Core:          sem
--  \   \        Entity:        sem_core_sem_cfg
--  /   /        Filename:      sem_core_sem_cfg.vhd
-- /___/   /\    Purpose:       Wrapper file for configuration logic.
-- \   \  /  \
--  \___\/\___\
--
-----------------------------------------------------------------------------
--
-- (c) Copyright 2010 - 2014 Xilinx, Inc. All rights reserved.
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
-----------------------------------------------------------------------------
--
-- Entity Description:
--
-- This entity is a wrapper to encapsulate the FRAME_ECC and ICAP primitives.
--
-----------------------------------------------------------------------------
--
-- Port Definition:
--
-- Name                          Type   Description
-- ============================= ====== ====================================
-- icap_clk                      input  The controller clock, used to clock
--                                      the configuration logic as well.
--
-- icap_o[31:0]                  output ICAP data output.  Synchronous to
--                                      icap_clk.
--
-- icap_csib                     input  ICAP chip select, active low.  Used
--                                      to enable the ICAP for read or write.
--                                      Synchronous to icap_clk.
--
-- icap_rdwrb                    input  ICAP write select, active low.  Used
--                                      to select between read or write.
--                                      Synchronous to icap_clk.
--
-- icap_i[31:0]                  input  ICAP data input.  Synchronous to
--                                      icap_clk.
--
-- fecc_crcerr                   output FRAME_ECC status indicating a device
--                                      CRC check at end of readback cycle
--                                      has failed.  Synchronous to icap_clk.
--
-- fecc_eccerr                   output FRAME_ECC status indicating a frame
--                                      ECC check at end of frame readback
--                                      has failed.  Synchronous to icap_clk.
--
-- fecc_eccerrsingle             output FRAME_ECC status indicating syndrome
--                                      appears to be for a single bit error.
--                                      Synchronous to icap_clk.
--
-- fecc_syndromevalid            output FRAME_ECC status indicating syndrome
--                                      is valid in this cycle.  Synchronous
--                                      to icap_clk.
--
-- fecc_syndrome[12:0]           output FRAME_ECC syndrome.  Synchronous to
--                                      icap_clk.
--
-- fecc_far[25:0]                output FRAME_ECC status showing FAR or EFAR.
--                                      Synchronous to icap_clk.
--
-- fecc_synbit[4:0]              output FRAME_ECC status indicating location
--                                      of error in a word.  Synchronous to
--                                      icap_clk.
--
-- fecc_synword[6:0]             output FRAME_ECC status indicating location
--                                      of error word in a frame.  Synchronous
--                                      to icap_clk.
--
-----------------------------------------------------------------------------
--
-- Generic and Constant Definition:
--
-- Name                          Type   Description
-- ============================= ====== ====================================
-- TCQ                           int    Sets the clock-to-out for behavioral
--                                      descriptions of sequential logic.
--
-----------------------------------------------------------------------------
--
-- Entity Dependencies:
--
-- sem_core_sem_cfg
-- |
-- +- ICAPE2 (unisim)
-- |
-- \- FRAME_ECCE2 (unisim)
--
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library unisim;
use unisim.vcomponents.all;

-----------------------------------------------------------------------------
-- Entity
-----------------------------------------------------------------------------

entity sem_core_sem_cfg is
port (
  icap_clk                      : in    std_logic;
  icap_o                        : out   std_logic_vector(31 downto 0);
  icap_csib                     : in    std_logic;
  icap_rdwrb                    : in    std_logic;
  icap_i                        : in    std_logic_vector(31 downto 0);
  fecc_crcerr                   : out   std_logic;
  fecc_eccerr                   : out   std_logic;
  fecc_eccerrsingle             : out   std_logic;
  fecc_syndromevalid            : out   std_logic;
  fecc_syndrome                 : out   std_logic_vector(12 downto 0);
  fecc_far                      : out   std_logic_vector(25 downto 0);
  fecc_synbit                   : out   std_logic_vector(4 downto 0);
  fecc_synword                  : out   std_logic_vector(6 downto 0)
  );
end entity sem_core_sem_cfg;

-----------------------------------------------------------------------------
-- Architecture
-----------------------------------------------------------------------------

architecture xilinx of sem_core_sem_cfg is

  ---------------------------------------------------------------------------
  -- Define local constants.
  ---------------------------------------------------------------------------

  constant TCQ : time := 1 ps;

  ---------------------------------------------------------------------------
  -- Declare non-library components.
  ---------------------------------------------------------------------------

  -- None

  ---------------------------------------------------------------------------
  -- Declare signals.
  ---------------------------------------------------------------------------

  -- None

  ---------------------------------------------------------------------------
  --
  ---------------------------------------------------------------------------

  begin

  ---------------------------------------------------------------------------
  -- Instantiate the FRAME_ECC primitive.
  ---------------------------------------------------------------------------

  example_frame_ecc : FRAME_ECCE2
  generic map (
    FRAME_RBT_IN_FILENAME => "NONE",
    FARSRC => "EFAR"
    )
  port map (
    CRCERROR => fecc_crcerr,
    ECCERROR => fecc_eccerr,
    ECCERRORSINGLE => fecc_eccerrsingle,
    FAR => fecc_far,
    SYNBIT => fecc_synbit,
    SYNDROME => fecc_syndrome,
    SYNDROMEVALID => fecc_syndromevalid,
    SYNWORD => fecc_synword
    );

  ---------------------------------------------------------------------------
  -- Instantiate the ICAP primitive.
  ---------------------------------------------------------------------------

  example_icap : ICAPE2
  generic map (
    SIM_CFG_FILE_NAME => "NONE",
    DEVICE_ID => X"FFFFFFFF",
    ICAP_WIDTH => "X32"
    )
  port map (
    O => icap_o,
    CLK => icap_clk,
    CSIB => icap_csib,
    I => icap_i,
    RDWRB => icap_rdwrb
    );

  ---------------------------------------------------------------------------
  --
  ---------------------------------------------------------------------------

end architecture xilinx;

-----------------------------------------------------------------------------
--
-----------------------------------------------------------------------------
