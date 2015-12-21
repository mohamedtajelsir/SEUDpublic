-----------------------------------------------------------------------------
--
--
--
-----------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /
-- \   \   \/    Core:          sem
--  \   \        Entity:        sem_core_sem_example
--  /   /        Filename:      sem_core_sem_example.vhd
-- /___/   /\    Purpose:       System level design example.
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
-- This entity is the system level design example, the top level of what is
-- intended for physical implementation.  This entity is essentially an HDL
-- netlist of sub-entities used to construct the solution.  The system level
-- design example is customized by the Vivado IP Catalog.
--
-----------------------------------------------------------------------------
--
-- Port Definition:
--
-- Name                          Type   Description
-- ============================= ====== ====================================
-- clk                           input  System clock; the entire system is
--                                      synchronized to this signal, which
--                                      is distributed on a global clock
--                                      buffer and referred to as icap_clk.
--
-- status_heartbeat              output Heartbeat signal for external watch
--                                      dog timer implementation; pulses
--                                      when readback runs.  Synchronous to
--                                      icap_clk.
--
-- status_initialization         output Indicates initialization is taking
--                                      place.  Synchronous to icap_clk.
--
-- status_observation            output Indicates observation is taking
--                                      place.  Synchronous to icap_clk.
--
-- status_correction             output Indicates correction is taking
--                                      place.  Synchronous to icap_clk.
--
-- status_classification         output Indicates classification is taking
--                                      place.  Synchronous to icap_clk.
--
-- status_injection              output Indicates injection is taking
--                                      place.  Synchronous to icap_clk.
--
-- status_essential              output Indicates essential error condition.
--                                      Qualified by de-assertion of the
--                                      status_classification signal, and
--                                      is synchronous to icap_clk.
--
-- status_uncorrectable          output Indicates uncorrectable error
--                                      condition. Qualified by de-assertion
--                                      of the status_correction signal, and
--                                      is synchronous to icap_clk.
--
-- monitor_tx                    output Serial status output.  Synchronous
--                                      to icap_clk, but received externally
--                                      by another device as an asynchronous
--                                      signal, perceived as lower bitrate.
--                                      Uses 8N1 protocol.
--
-- monitor_rx                    input  Serial command input.  Asynchronous
--                                      signal provided by another device at
--                                      a lower bitrate, synchronized to the
--                                      icap_clk and oversampled.  Uses 8N1
--                                      protocol.
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
-- sem_core_sem_example
-- |
-- +- sem_core (sem_controller)
-- |
-- +- sem_core_sem_cfg
-- |
-- +- sem_core_sem_mon
-- |
-- +- IBUF (unisim)
-- |
-- \- BUFGCE (unisim)
--
----------------------------------------------------------------------------
-- this was modfied on 09/12/2015
-- changes made by: Youssef Zaki
-- TMR implementation
-- triplicated sem_controler and uart module with voting logic
--------------------------------------------------------------------------
-- for a structural design, the vhdl code becomes less readable, and
-- it is recommended to generate as much of the vhdl code 
-- as possible via scripts.
-- For this work, some of the component instantiations and signal 
-- declarations were generated via a Python script.
--------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library unisim;
use unisim.vcomponents.all;

-----------------------------------------------------------------------------
-- Entity
-----------------------------------------------------------------------------

entity healing_core is
port (
  clk                           : in    std_logic;
  status_heartbeat              : out   std_logic;
  status_initialization         : out   std_logic;
  status_observation            : out   std_logic;
  status_correction             : out   std_logic;
  status_classification         : out   std_logic;
  status_injection              : out   std_logic;
  status_essential              : out   std_logic;
  status_uncorrectable          : out   std_logic;
  monitor_tx                    : out   std_logic;
  monitor_rx                    : in    std_logic
  );
end entity healing_core;

-----------------------------------------------------------------------------
-- Architecture
-----------------------------------------------------------------------------

architecture xilinx_yz of healing_core is

  ---------------------------------------------------------------------------
  -- Define local constants.
  ---------------------------------------------------------------------------

  constant TCQ : time := 1 ps;

  ---------------------------------------------------------------------------
  -- Declare non-library components.
  ---------------------------------------------------------------------------

  component sem_core
  port (
    status_heartbeat            : out   std_logic;
    status_initialization       : out   std_logic;
    status_observation          : out   std_logic;
    status_correction           : out   std_logic;
    status_classification       : out   std_logic;
    status_injection            : out   std_logic;
    status_essential            : out   std_logic;
    status_uncorrectable        : out   std_logic;
    monitor_txdata              : out   std_logic_vector(7 downto 0);
    monitor_txwrite             : out   std_logic;
    monitor_txfull              : in    std_logic;
    monitor_rxdata              : in    std_logic_vector(7 downto 0);
    monitor_rxread              : out   std_logic;
    monitor_rxempty             : in    std_logic;
    fecc_crcerr                 : in    std_logic;
    fecc_eccerr                 : in    std_logic;
    fecc_eccerrsingle           : in    std_logic;
    fecc_syndromevalid          : in    std_logic;
    fecc_syndrome               : in    std_logic_vector(12 downto 0);
    fecc_far                    : in    std_logic_vector(25 downto 0);
    fecc_synbit                 : in    std_logic_vector(4 downto 0);
    fecc_synword                : in    std_logic_vector(6 downto 0);
    icap_o                      : in    std_logic_vector(31 downto 0);
    icap_i                      : out   std_logic_vector(31 downto 0);
    icap_csib                   : out   std_logic;
    icap_rdwrb                  : out   std_logic;
    icap_clk                    : in    std_logic;
    icap_request                : out   std_logic;
    icap_grant                  : in    std_logic
    );
  end component;

  component sem_core_sem_cfg
  port (
    fecc_crcerr                 : out   std_logic;
    fecc_eccerr                 : out   std_logic;
    fecc_eccerrsingle           : out   std_logic;
    fecc_syndromevalid          : out   std_logic;
    fecc_syndrome               : out   std_logic_vector(12 downto 0);
    fecc_far                    : out   std_logic_vector(25 downto 0);
    fecc_synbit                 : out   std_logic_vector(4 downto 0);
    fecc_synword                : out   std_logic_vector(6 downto 0);
    icap_o                      : out   std_logic_vector(31 downto 0);
    icap_i                      : in    std_logic_vector(31 downto 0);
    icap_clk                    : in    std_logic;
    icap_csib                   : in    std_logic;
    icap_rdwrb                  : in    std_logic
    );
  end component;

  component sem_core_sem_mon
  port (
    icap_clk                    : in    std_logic;
    monitor_tx                  : out   std_logic;
    monitor_rx                  : in    std_logic;
    monitor_txdata              : in    std_logic_vector(7 downto 0);
    monitor_txwrite             : in    std_logic;
    monitor_txfull              : out   std_logic;
    monitor_rxdata              : out   std_logic_vector(7 downto 0);
    monitor_rxread              : in    std_logic;
    monitor_rxempty             : out   std_logic
    );
  end component;

  component voter
  Generic (BusWidth : Natural:=3);
  Port    (  
    Ins : in STD_LOGIC_VECTOR  ( (BusWidth*3) downto 1);
    --Ex of how Inputs are arranged for 3 redundancy and 2 bit buswidth 
    --Ins[6] is A2, Ins[5] is B2, Ins[4] is C2
    --Ins[3] is A1, Ins[2] is B1, Ins[1] is C1
    Outs : out STD_LOGIC_VECTOR ( (BusWidth) downto 1));
    --Ex of how Outputs are arranged for 3 redundancy and 2 bit buswidth
    --Outs[2] is majority voted for A2, B2 and C2
    --Outs[1] is majority voted for A1, B1 and C1
  end component;
  ---------------------------------------------------------------------------
  -- Declare signals.
  ---------------------------------------------------------------------------

  signal clk_ibufg : std_logic;

  signal status_heartbeat_internal  : std_logic;
  signal status_initialization_internal  : std_logic;
  signal status_observation_internal  : std_logic;
  signal status_correction_internal  : std_logic;
  signal status_classification_internal  : std_logic;
  signal status_injection_internal  : std_logic;
  signal status_essential_internal  : std_logic;
  signal status_uncorrectable_internal  : std_logic;

  --signal monitor_txdata0  : std_logic_vector(7 downto 0);
  --signal monitor_txwrite0  : std_logic;
  --signal monitor_txfull0  : std_logic;
  --signal monitor_rxdata0  : std_logic_vector(7 downto 0);
  --signal monitor_rxread0  : std_logic;
  --signal monitor_rxempty0  : std_logic;
  --signal fecc_crcerr0  : std_logic;
  --signal fecc_eccerr0  : std_logic;
  --signal fecc_eccerrsingle0  : std_logic;
  --signal fecc_syndromevalid0  : std_logic;
  --signal fecc_syndrome0  : std_logic_vector(12 downto 0);
  --signal fecc_far0  : std_logic_vector(25 downto 0);
  --signal fecc_synbit0  : std_logic_vector(4 downto 0);
  --signal fecc_synword0  : std_logic_vector(6 downto 0);
  --signal icap_o0  : std_logic_vector(31 downto 0);
  --signal icap_i0  : std_logic_vector(31 downto 0);
  --signal icap_csib0  : std_logic;
  --signal icap_rdwrb0  : std_logic;
  --signal icap_unused0  : std_logic;
  --signal icap_grant0  : std_logic;


  signal fecc_crcerr   : std_logic;
  signal fecc_eccerr   : std_logic;
  signal fecc_eccerrsingle   : std_logic;
  signal fecc_syndromevalid   : std_logic;
  signal fecc_syndrome   : std_logic_vector(12 downto 0);
  signal fecc_far   : std_logic_vector(25 downto 0);
  signal fecc_synbit   : std_logic_vector(4 downto 0);
  signal fecc_synword   : std_logic_vector(6 downto 0);
  signal icap_o   : std_logic_vector(31 downto 0);
  signal icap_i   : std_logic_vector(31 downto 0);
  signal icap_csib   : std_logic;
  signal icap_rdwrb   : std_logic;
  signal icap_unused   : std_logic;
  signal icap_grant   : std_logic;
  signal icap_clk  : std_logic;
-----------------------------------------------------------
-- signals associated with voters
-----------------------------------------------------------
  --signal sig_in_bw1,: std_logic_vector(38 downto 0);

  signal status_sig_in_bw8: std_logic_vector(23 downto 0);
  signal status_sig_in_bw8_0: std_logic_vector(7 downto 0);
  signal status_sig_in_bw8_1: std_logic_vector(7 downto 0);
  signal status_sig_in_bw8_2: std_logic_vector(7 downto 0);
  signal status_sig_out_bw8: std_logic_vector(7 downto 0);

  signal cntrl_mon_sig_in_bw8: std_logic_vector(23 downto 0);
  signal cntrl_mon_sig_in_bw8_0: std_logic_vector(7 downto 0);
  signal cntrl_mon_sig_in_bw8_1: std_logic_vector(7 downto 0);
  signal cntrl_mon_sig_in_bw8_2: std_logic_vector(7 downto 0);
  signal cntrl_mon_sig_out_bw8_v0: std_logic_vector(7 downto 0);
  signal cntrl_mon_sig_out_bw8_v1: std_logic_vector(7 downto 0);
  signal cntrl_mon_sig_out_bw8_v2: std_logic_vector(7 downto 0);

 -- alias cntrl_mon_sig_in_bw1_0 :std_logic_vector(7 downto 0) is cntrl_mon_sig_in_bw1(7 downto 0);
 -- alias cntrl_mon_sig_in_bw1_1 : std_logic_vector(7 downto 0) is cntrl_mon_sig_in_bw1(15 downto 8);
 -- alias cntrl_mon_sig_in_bw1_2 : std_logic_vector(7 downto 0) is cntrl_mon_sig_in_bw1(23 downto 16);

  signal mon_cntrl_sig_in_bw8: std_logic_vector(23 downto 0);
  signal mon_cntrl_sig_in_bw8_0: std_logic_vector(7 downto 0);
  signal mon_cntrl_sig_in_bw8_1: std_logic_vector(7 downto 0);
  signal mon_cntrl_sig_in_bw8_2: std_logic_vector(7 downto 0);
  signal mon_cntrl_sig_out_bw8_v0: std_logic_vector(7 downto 0);
  signal mon_cntrl_sig_out_bw8_v1: std_logic_vector(7 downto 0);
  signal mon_cntrl_sig_out_bw8_v2: std_logic_vector(7 downto 0);


  signal mon_cntrl_sig_in_bw1: std_logic_vector(5 downto 0);
  signal mon_cntrl_sig_in_bw1_0: std_logic_vector(1 downto 0);
  signal mon_cntrl_sig_in_bw1_1: std_logic_vector(1 downto 0);
  signal mon_cntrl_sig_in_bw1_2: std_logic_vector(1 downto 0);
  signal mon_cntrl_sig_out_bw1_v0: std_logic_vector(1 downto 0);
  signal mon_cntrl_sig_out_bw1_v1: std_logic_vector(1 downto 0);
  signal mon_cntrl_sig_out_bw1_v2: std_logic_vector(1 downto 0);

 -- alias cntrl_mon_sig_out_bw1_0 :std_logic_vector(7 downto 0) is cntrl_mon_sig_out_bw1(7 downto 0);
 -- alias cntrl_mon_sig_out_bw1_1 : std_logic_vector(7 downto 0) is cntrl_mon_sig_out_bw1(15 downto 8);
 -- alias cntrl_mon_sig_out_bw1_2 : std_logic_vector(7 downto 0) is cntrl_mon_sig_out_bw1(23 downto 16);

  signal icap_sig_in_bw32: std_logic_vector(95 downto 0);
  signal icap_sig_in_bw32_0: std_logic_vector(31 downto 0);
  signal icap_sig_in_bw32_1: std_logic_vector(31 downto 0);
  signal icap_sig_in_bw32_2: std_logic_vector(31 downto 0);
  signal icap_sig_out_bw32: std_logic_vector(31 downto 0);
 -- alias icap_sig_in_bw32_0 :std_logic_vector(31 downto 0) is icap_sig_in_bw32(31 downto 0);
 -- alias icap_sig_in_bw32_1 : std_logic_vector(31 downto 0) is icap_sig_in_bw32(63 downto 32);
 -- alias icap_sig_in_bw32_2 : std_logic_vector(31 downto 0) is icap_sig_in_bw32(95 downto 64);

  signal cntrl_mon_sig_in_bw1: std_logic_vector(5 downto 0);
  signal cntrl_mon_sig_in_bw1_0: std_logic_vector(1 downto 0);
  signal cntrl_mon_sig_in_bw1_1: std_logic_vector(1 downto 0);
  signal cntrl_mon_sig_in_bw1_2: std_logic_vector(1 downto 0);
  signal cntrl_mon_sig_out_bw1_v0: std_logic_vector(1 downto 0);
  signal cntrl_mon_sig_out_bw1_v1: std_logic_vector(1 downto 0);
  signal cntrl_mon_sig_out_bw1_v2: std_logic_vector(1 downto 0);

  signal icap_sig_in_bw1: std_logic_vector(8 downto 0);
  signal icap_sig_out_bw1: std_logic_vector(2 downto 0);

  signal mon_tx_sig_in_bw1: std_logic_vector(2 downto 0);
  signal mon_tx_sig_out_bw1: std_logic_vector(0 downto 0);

  ---------------------------------------------------------------------------
  --
  ---------------------------------------------------------------------------

  begin

  STATUS_VOTER_INPUT : for index in 8 downto 1 GENERATE
  status_sig_in_bw8(3*index-1 downto 3*(index-1)) 
          <= status_sig_in_bw8_0(index-1) 
          &  status_sig_in_bw8_1(index-1) 
          &  status_sig_in_bw8_2(index-1);
  end GENERATE STATUS_VOTER_INPUT;

  TXDATA_VOTER_INPUT : for index in 8 downto 1 GENERATE
  cntrl_mon_sig_in_bw8(3*index-1 downto 3*(index-1)) 
          <= cntrl_mon_sig_in_bw8_0(index-1) 
          &  cntrl_mon_sig_in_bw8_1(index-1) 
          &  cntrl_mon_sig_in_bw8_2(index-1);
  end GENERATE TXDATA_VOTER_INPUT;

  RXDATA_VOTER_INPUT : for index in 8 downto 1 GENERATE
  mon_cntrl_sig_in_bw8(3*index-1 downto 3*(index-1)) 
          <= mon_cntrl_sig_in_bw8_0(index-1) 
          &  mon_cntrl_sig_in_bw8_1(index-1) 
          &  mon_cntrl_sig_in_bw8_2(index-1);
  end GENERATE RXDATA_VOTER_INPUT;

  ICAP_VOTER_INPUT : for index in 32 downto 1 GENERATE
  icap_sig_in_bw32(3*index-1 downto 3*(index-1)) 
          <=icap_sig_in_bw32_0(index-1) 
          & icap_sig_in_bw32_1(index-1) 
          & icap_sig_in_bw32_2(index-1);
  end GENERATE ICAP_VOTER_INPUT;

  RXREAD_TXWRITE_VOTER_INPUT : for index in 2 downto 1 GENERATE
  cntrl_mon_sig_in_bw1(3*index-1 downto 3*(index-1)) 
          <= cntrl_mon_sig_in_bw1_0(index-1) 
          &  cntrl_mon_sig_in_bw1_1(index-1) 
          &  cntrl_mon_sig_in_bw1_2(index-1);
  end GENERATE RXREAD_TXWRITE_VOTER_INPUT;

  RXTXEMPTY_VOTER_INPUT : for index in 2 downto 1 GENERATE
  mon_cntrl_sig_in_bw1(3*index-1 downto 3*(index-1)) 
          <= mon_cntrl_sig_in_bw1_0(index-1) 
          &  mon_cntrl_sig_in_bw1_1(index-1) 
          &  mon_cntrl_sig_in_bw1_2(index-1);
  end GENERATE RXTXEMPTY_VOTER_INPUT;

  ---------------------------------------------------------------------------
  -- This design (the example, including the controller itself) is fully
  -- synchronous; the global clock buffer is instantiated here to drive
  -- the icap_clk signal.
  ---------------------------------------------------------------------------
  example_ibuf : IBUF
  port map (
    I => clk,
    O => clk_ibufg
    );

  example_bufg : BUFGCE
  port map (
    I => clk_ibufg,
    O => icap_clk,
    CE => '1'
    );
  -------------------------------------------------------------------
  -- voters: 
  -------------------------------------------------------------------
 voters_status_bw1: voter
	  generic map(8)
	  Port Map  (  
	    Ins  => status_sig_in_bw8, 
	    Outs => status_sig_out_bw8
	  );
    
---------------------------------------
-- monitor_rxread monitor_rxrite voters
---------------------------------------
 voters_cntrl_mon_bw1_0: voter
	  generic map(2)
	  Port Map  (  
	    Ins  => cntrl_mon_sig_in_bw1, 
	    Outs => cntrl_mon_sig_out_bw1_v0
	  );

 voters_cntrl_mon_bw1_1: voter
	  generic map(2)
	  Port Map  (  
	    Ins  => cntrl_mon_sig_in_bw1, 
	    Outs => cntrl_mon_sig_out_bw1_v1
	  );
 voters_cntrl_mon_bw1_2: voter
	  generic map(2)
	  Port Map  (  
	    Ins  => cntrl_mon_sig_in_bw1, 
	    Outs => cntrl_mon_sig_out_bw1_v2
	  );
---------------------------------------
-- monitor_rx/tx empty
---------------------------------------
 voters_mon_cntrl_bw1_0: voter
	  generic map(2)
	  Port Map  (  
	    Ins  => mon_cntrl_sig_in_bw1, 
	    Outs => mon_cntrl_sig_out_bw1_v0
	  );

 voters_mon_cntrl_bw1_1: voter
	  generic map(2)
	  Port Map  (  
	    Ins  => mon_cntrl_sig_in_bw1, 
	    Outs => mon_cntrl_sig_out_bw1_v1
	  );
 voters_mon_cntrl_bw1_2: voter
	  generic map(2)
	  Port Map  (  
	    Ins  => mon_cntrl_sig_in_bw1, 
	    Outs => mon_cntrl_sig_out_bw1_v2
	  );
-------------------------------------
-- monitor_txdata voters
--------------------------------------
 voters_cntrl_txdata_bw8_0: voter
	  generic map(8)
	  Port Map  (  
	    Ins  => cntrl_mon_sig_in_bw8, 
	    Outs => cntrl_mon_sig_out_bw8_v0
	  );

 voters_cntrl_txdata_bw8_1: voter
	  generic map(8)
	  Port Map  (  
	    Ins  => cntrl_mon_sig_in_bw8, 
	    Outs => cntrl_mon_sig_out_bw8_v1
	  );
 voters_cntrl_txdata_bw8_2: voter
	  generic map(8)
	  Port Map  (  
	    Ins  => cntrl_mon_sig_in_bw8, 
	    Outs => cntrl_mon_sig_out_bw8_v2
	  );
-------------------------------------
-------------------------------------
-- monitor_rxdata voters
--------------------------------------
 voters_cntrl_rxdata_bw8_0: voter
	  generic map(8)
	  Port Map  (  
	    Ins  => mon_cntrl_sig_in_bw8, 
	    Outs => mon_cntrl_sig_out_bw8_v0
	  );

 voters_cntrl_rxdata_bw8_1: voter
	  generic map(8)
	  Port Map  (  
	    Ins  => mon_cntrl_sig_in_bw8, 
	    Outs => mon_cntrl_sig_out_bw8_v1
	  );
 voters_cntrl_rxdata_bw8_2: voter
	  generic map(8)
	  Port Map  (  
	    Ins  => mon_cntrl_sig_in_bw8, 
	    Outs => mon_cntrl_sig_out_bw8_v2
	  );
-------------------------------------
-- icap voter
-----------------------------------------------
 voters_icap_bw1: voter
	  generic map(3)
	  Port Map  (  
	    Ins  => icap_sig_in_bw1, 
	    Outs => icap_sig_out_bw1
	  );
 voters_icap_bw32: voter
	  generic map(32)
	  Port Map  (  
	    Ins  => icap_sig_in_bw32, 
	    Outs => icap_sig_out_bw32
	  );
---------------------------------------------
 voters_mon_tx: voter
	  generic map(1)
	  Port Map  (  
	    Ins  => mon_tx_sig_in_bw1, 
	    Outs => mon_tx_sig_out_bw1
	  );
  ---------------------------------------------------------------------------
  -- The controller sub-entity is the kernel of the soft error mitigation
  -- solution.  The port list is dynamic based on the IP core options.
  ---------------------------------------------------------------------------
  -- TMR instatiation of SEM Controller


  example_controller0: sem_core
  port map(
    status_heartbeat => status_sig_in_bw8_0(0), --status_heartbeat_internal,
    status_initialization=> status_sig_in_bw8_0(1), --status_initialization_internal,
    status_observation=> status_sig_in_bw8_0(2), --status_observation_internal,
    status_correction=> status_sig_in_bw8_0(3), --status_correction_internal,
    status_classification=> status_sig_in_bw8_0(4), --status_classification_internal,
    status_injection=> status_sig_in_bw8_0(5), --status_injection_internal,
    status_essential=> status_sig_in_bw8_0(6), --status_essential_internal,
    status_uncorrectable=> status_sig_in_bw8_0(7), --status_uncorrectable_internal,
    monitor_txdata=> cntrl_mon_sig_in_bw8_0,--monitor_txdata,
    monitor_txwrite=> cntrl_mon_sig_in_bw1_0(0),--monitor_txwrite
    monitor_txfull=> mon_cntrl_sig_out_bw1_v0(0),--monitor_txfull,
    monitor_rxdata=> mon_cntrl_sig_out_bw8_v0,-- 0,1,2
    monitor_rxread=> cntrl_mon_sig_in_bw1_0(1),--monitor_rxread,
    monitor_rxempty=> mon_cntrl_sig_out_bw1_v0(1),--monitor_rxempty,
    fecc_crcerr=> fecc_crcerr,
    fecc_eccerr=> fecc_eccerr,
    fecc_eccerrsingle=> fecc_eccerrsingle,
    fecc_syndromevalid=> fecc_syndromevalid,
    fecc_syndrome=> fecc_syndrome,
    fecc_far=> fecc_far,
    fecc_synbit=> fecc_synbit,
    fecc_synword=> fecc_synword,
    icap_o=> icap_o,
    icap_i=> icap_sig_in_bw32_0,--icap_i,
    icap_csib=> icap_sig_in_bw1(0),--icap_csib,
    icap_rdwrb=> icap_sig_in_bw1(3),--icap_rdwrb,
    icap_clk=> icap_clk,
    icap_request=> icap_sig_in_bw1(6),--icap_unused,
    icap_grant=> icap_grant
  );

  example_controller1: sem_core
  port map(
    status_heartbeat => status_sig_in_bw8_1(0), --status_heartbeat_internal,
    status_initialization=> status_sig_in_bw8_1(1), --status_initialization_internal,
    status_observation=> status_sig_in_bw8_1(2), --status_observation_internal,
    status_correction=> status_sig_in_bw8_1(3), --status_correction_internal,
    status_classification=> status_sig_in_bw8_1(4), --status_classification_internal,
    status_injection=> status_sig_in_bw8_1(5), --status_injection_internal,
    status_essential=> status_sig_in_bw8_1(6), --status_essential_internal,
    status_uncorrectable=> status_sig_in_bw8_1(7), --status_uncorrectable_internal,
    monitor_txdata=> cntrl_mon_sig_in_bw8_1,--monitor_txdata,
    monitor_txwrite=> cntrl_mon_sig_in_bw1_1(0),--monitor_txwrite
    monitor_txfull=> mon_cntrl_sig_out_bw1_v1(0),--monitor_txfull,
    monitor_rxdata=> mon_cntrl_sig_out_bw8_v1,-- 0,1,2
    monitor_rxread=> cntrl_mon_sig_in_bw1_1(1),--monitor_rxread,
    monitor_rxempty=> mon_cntrl_sig_out_bw1_v1(1),--monitor_rxempty,
    fecc_crcerr=> fecc_crcerr,
    fecc_eccerr=> fecc_eccerr,
    fecc_eccerrsingle=> fecc_eccerrsingle,
    fecc_syndromevalid=> fecc_syndromevalid,
    fecc_syndrome=> fecc_syndrome,
    fecc_far=> fecc_far,
    fecc_synbit=> fecc_synbit,
    fecc_synword=> fecc_synword,
    icap_o=> icap_o,
    icap_i=> icap_sig_in_bw32_1,--icap_i,
    icap_csib=> icap_sig_in_bw1(1),--icap_csib,
    icap_rdwrb=> icap_sig_in_bw1(4),--icap_rdwrb,
    icap_clk=> icap_clk,
    icap_request=> icap_sig_in_bw1(7),--icap_unused,
    icap_grant=> icap_grant
  );

  example_controller2: sem_core
  port map(
    status_heartbeat => status_sig_in_bw8_2(0), --status_heartbeat_internal,
    status_initialization=> status_sig_in_bw8_2(1), --status_initialization_internal,
    status_observation=> status_sig_in_bw8_2(2), --status_observation_internal,
    status_correction=> status_sig_in_bw8_2(3), --status_correction_internal,
    status_classification=> status_sig_in_bw8_2(4), --status_classification_internal,
    status_injection=> status_sig_in_bw8_2(5), --status_injection_internal,
    status_essential=> status_sig_in_bw8_2(6), --status_essential_internal,
    status_uncorrectable=> status_sig_in_bw8_2(7), --status_uncorrectable_internal,
    monitor_txdata=> cntrl_mon_sig_in_bw8_2,--monitor_txdata,
    monitor_txwrite=> cntrl_mon_sig_in_bw1_2(0),--monitor_txwrite
    monitor_txfull=> mon_cntrl_sig_out_bw1_v2(0),--monitor_txfull,
    monitor_rxdata=> mon_cntrl_sig_out_bw8_v2,-- 0,1,2
    monitor_rxread=> cntrl_mon_sig_in_bw1_2(1),--monitor_rxread,
    monitor_rxempty=> mon_cntrl_sig_out_bw1_v2(1),--monitor_rxempty,
    fecc_crcerr=> fecc_crcerr,
    fecc_eccerr=> fecc_eccerr,
    fecc_eccerrsingle=> fecc_eccerrsingle,
    fecc_syndromevalid=> fecc_syndromevalid,
    fecc_syndrome=> fecc_syndrome,
    fecc_far=> fecc_far,
    fecc_synbit=> fecc_synbit,
    fecc_synword=> fecc_synword,
    icap_o=> icap_o,
    icap_i=> icap_sig_in_bw32_2,--icap_i,
    icap_csib=> icap_sig_in_bw1(2),--icap_csib,
    icap_rdwrb=> icap_sig_in_bw1(5),--icap_rdwrb,
    icap_clk=> icap_clk,
    icap_request=> icap_sig_in_bw1(8),--icap_unused,
    icap_grant=> icap_grant
  );

  ------------------------------------------------------------------------
  -- post voter signals to ports
  ------------------------------------------------------------------------


    icap_grant <= '1';
    status_heartbeat <= status_sig_out_bw8(0);--status_heartbeat_internal;
    status_initialization <= status_sig_out_bw8(1);--status_initialization_internal;
    status_observation <= status_sig_out_bw8(2);--status_observation_internal;
    status_correction <= status_sig_out_bw8(3);--status_correction_internal;
    status_classification <= status_sig_out_bw8(4);--status_classification_internal;
    status_injection <= status_sig_out_bw8(5);--status_injection_internal;
    status_essential <= status_sig_out_bw8(6);--status_essential_internal;
    status_uncorrectable <= status_sig_out_bw8(7);--status_uncorrectable_internal;
    monitor_tx <= mon_tx_sig_out_bw1(0);

  ---------------------------------------------------------------------------
  -- The cfg sub-entity contains the device specific primitives to access
  -- the internal configuration port and the frame crc/ecc status signals.
  ---------------------------------------------------------------------------

  example_cfg : sem_core_sem_cfg
  port map (
    fecc_crcerr => fecc_crcerr,
    fecc_eccerr => fecc_eccerr,
    fecc_eccerrsingle => fecc_eccerrsingle,
    fecc_syndromevalid => fecc_syndromevalid,
    fecc_syndrome => fecc_syndrome,
    fecc_far => fecc_far,
    fecc_synbit => fecc_synbit,
    fecc_synword => fecc_synword,
    icap_o => icap_o,
    icap_i => icap_sig_out_bw32,
    icap_csib => icap_sig_out_bw1(0),
    icap_rdwrb => icap_sig_out_bw1(1),
    icap_clk => icap_clk
    );

  ---------------------------------------------------------------------------
  -- The mon sub-entity contains a UART for communication purposes.
  ---------------------------------------------------------------------------

  example_mon0: sem_core_sem_mon
  port map(
    icap_clk => icap_clk, -- no voter
    monitor_tx => mon_tx_sig_in_bw1(0),-- monitor_tx
    monitor_rx => monitor_rx, -- no voter
    monitor_txdata => cntrl_mon_sig_out_bw8_v0,--monitor_txdata
    monitor_txwrite => cntrl_mon_sig_out_bw1_v0(0), --monitor_txwrite,
    monitor_txfull => mon_cntrl_sig_in_bw1_0(0),--monitor_txfull,
    monitor_rxdata => mon_cntrl_sig_in_bw8_0,
    monitor_rxread => cntrl_mon_sig_out_bw1_v0(1),--monitor_rxread,
    monitor_rxempty => mon_cntrl_sig_in_bw1_0(1));--monitor_rxempty

  example_mon1: sem_core_sem_mon
  port map(
    icap_clk => icap_clk, -- no voter
    monitor_tx => mon_tx_sig_in_bw1(1),-- monitor_tx
    monitor_rx => monitor_rx, -- no voter
    monitor_txdata => cntrl_mon_sig_out_bw8_v1,--monitor_txdata
    monitor_txwrite => cntrl_mon_sig_out_bw1_v1(0), --monitor_txwrite,
    monitor_txfull => mon_cntrl_sig_in_bw1_1(0),--monitor_txfull,
    monitor_rxdata => mon_cntrl_sig_in_bw8_1,
    monitor_rxread => cntrl_mon_sig_out_bw1_v1(1),--monitor_rxread,
    monitor_rxempty => mon_cntrl_sig_in_bw1_1(1));--monitor_rxempty

  example_mon2: sem_core_sem_mon
  port map(
    icap_clk => icap_clk, -- no voter
    monitor_tx => mon_tx_sig_in_bw1(2),-- monitor_tx
    monitor_rx => monitor_rx, -- no voter
    monitor_txdata => cntrl_mon_sig_out_bw8_v2,--monitor_txdata
    monitor_txwrite => cntrl_mon_sig_out_bw1_v2(0), --monitor_txwrite,
    monitor_txfull => mon_cntrl_sig_in_bw1_2(0),--monitor_txfull,
    monitor_rxdata => mon_cntrl_sig_in_bw8_2,
    monitor_rxread => cntrl_mon_sig_out_bw1_v2(1),--monitor_rxread,
    monitor_rxempty => mon_cntrl_sig_in_bw1_2(1));--monitor_rxempty

  ---------------------------------------------------------------------------
  --
  ---------------------------------------------------------------------------
end architecture xilinx_yz;

-----------------------------------------------------------------------------
--
-----------------------------------------------------------------------------
