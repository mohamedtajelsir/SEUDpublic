--Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
--Date        : Tue Dec 15 06:53:57 2015
--Host        : MTMohammadat-PC running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    clock_rtl : in STD_LOGIC;
    gpio_rtl : out STD_LOGIC_VECTOR ( 1 to 1 );
    gpio_rtl1 : out STD_LOGIC_VECTOR ( 1 to 1 );
    reset_rtl : in STD_LOGIC;
    reset_rtl_0 : in STD_LOGIC;
    uart_rtl_rxd : in STD_LOGIC;
    uart_rtl_txd : out STD_LOGIC_VECTOR ( 1 to 1 )
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    clock_rtl : in STD_LOGIC;
    reset_rtl_0 : in STD_LOGIC;
    reset_rtl : in STD_LOGIC;
    uart_rtl_rxd : in STD_LOGIC;
    uart_rtl_txd : out STD_LOGIC_VECTOR ( 1 to 1 );
    gpio_rtl1 : out STD_LOGIC_VECTOR ( 1 to 1 );
    gpio_rtl : out STD_LOGIC_VECTOR ( 1 to 1 )
  );
  end component design_1;
begin
design_1_i: component design_1
     port map (
      clock_rtl => clock_rtl,
      gpio_rtl(1) => gpio_rtl(1),
      gpio_rtl1(1) => gpio_rtl1(1),
      reset_rtl => reset_rtl,
      reset_rtl_0 => reset_rtl_0,
      uart_rtl_rxd => uart_rtl_rxd,
      uart_rtl_txd(1) => uart_rtl_txd(1)
    );
end STRUCTURE;
