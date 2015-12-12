----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/28/2015 06:28:51 PM
-- Design Name: 
-- Module Name: sem_single_core - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sem_single_core is
    Port ( 
              clk                           : in    STD_LOGIC;
              status_heartbeat              : out   std_logic;
              status_initialization         : out   std_logic;
              status_observation            : out   std_logic;
              status_correction             : out   std_logic;
              status_classification         : out   std_logic;
              status_injection              : out   std_logic;
              status_essential              : out   std_logic;
              status_uncorrectable          : out   std_logic;
              uart_tx_out                   : out   std_logic;
              uart_rx_in                    : in    std_logic;
              rst                           : in    STD_LOGIC
	);
end sem_single_core;

architecture Behavioral of sem_single_core is
component clk_wiz 
    port
     (
      clk_in1           : in  	 std_logic;
      clk_out1          : out    std_logic;
      reset             : in     std_logic;
      locked            : out    std_logic
     );
end component;

component sem_core_sem_example
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
end component;

signal clk_intern, uart_tx_intern, uart_rx_intern : std_logic;

begin

clk0: clk_wiz 
    port map
     (
      clk_in1           => clk, 
      clk_out1          => clk_intern,
      reset             => rst,
      locked            => open
     );

sem0: sem_core_sem_example
port map(
  clk                           => clk_intern,
  status_heartbeat              => status_heartbeat,
  status_initialization         => status_initialization,
  status_observation            => status_observation,
  status_correction             => status_correction,
  status_classification         => status_classification,
  status_injection              => status_injection,
  status_essential              => status_essential,
  status_uncorrectable          => status_uncorrectable,
  monitor_tx                    => uart_tx_intern,
  monitor_rx                    => uart_rx_intern
  );

  uart_tx_out <= uart_tx_intern;
  uart_rx_intern <= uart_rx_in;

end Behavioral;
