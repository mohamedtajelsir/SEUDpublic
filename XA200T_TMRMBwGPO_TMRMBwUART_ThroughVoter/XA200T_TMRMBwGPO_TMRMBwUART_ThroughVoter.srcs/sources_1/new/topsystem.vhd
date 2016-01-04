----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.12.2015 18:43:04
-- Design Name: 
-- Module Name: topsystem - Behavioral
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

entity topsystem is
--  Port ( )
port (
    clock_rtl : in STD_LOGIC;
    gpio_rtl : out STD_LOGIC_VECTOR ( 1 to 1 );
    gpio_rtl1 : out STD_LOGIC_VECTOR ( 1 to 1 );
    reset_rtl : in STD_LOGIC;
    reset_rtl_0 : in STD_LOGIC;
    uart_rtl_rxd : in STD_LOGIC;
    uart_rtl_txd : out STD_LOGIC_VECTOR ( 1 to 1 );
    status_heartbeat              : out   std_logic;
    status_initialization         : out   std_logic;
    status_observation            : out   std_logic;
    uart_tx_out                   : out   std_logic;
    uart_rx_in                    : in    std_logic );
end topsystem;

architecture Behavioral of topsystem is
component design_1_wrapper is
  port (
    clock_rtl : in STD_LOGIC;
    gpio_rtl : out STD_LOGIC_VECTOR ( 1 to 1 );
    gpio_rtl1 : out STD_LOGIC_VECTOR ( 1 to 1 );
    reset_rtl : in STD_LOGIC;
    reset_rtl_0 : in STD_LOGIC;
    uart_rtl_rxd : in STD_LOGIC;
    uart_rtl_txd : out STD_LOGIC_VECTOR ( 1 to 1 )
  );
end component design_1_wrapper;

component healing_core is
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

end component healing_core;
begin
CC: design_1_wrapper 
  port map(
    clock_rtl =>clock_rtl ,
    gpio_rtl =>gpio_rtl ,
    gpio_rtl1 =>gpio_rtl1 ,
    reset_rtl =>reset_rtl ,
    reset_rtl_0 =>reset_rtl_0 ,
    uart_rtl_rxd =>uart_rtl_rxd ,
    uart_rtl_txd =>uart_rtl_txd 
  );
HC: healing_core
      Port map ( 
                clk                           =>clock_rtl, 
                status_heartbeat              =>status_heartbeat,              
                status_initialization         =>status_initialization,         
                status_observation            =>status_observation,           
                status_correction             =>open,          
                status_classification         =>open,         
                status_injection              =>open,        
                status_essential              =>open,       
                status_uncorrectable          =>open,      
                uart_tx_out                   =>uart_tx_out,     
                uart_rx_in                    =>uart_rx_in,    
                rst                           => reset_rtl
      );

end Behavioral;
